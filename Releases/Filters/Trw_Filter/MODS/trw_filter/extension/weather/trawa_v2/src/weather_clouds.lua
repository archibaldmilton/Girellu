--------
-- Clouds: spawning dynamically in chunks, moving with the wind and what not. It’s a bit of a mess as I was trying to get it
-- working as fast as possible and produce as little garbage as possible. TODO: move algorithm to C++ side allowing to use 
-- several layers of clouds at once cheaper?
--------

-- Local state (will be updated with values from `conditions_converter.lua`)
local windDir = vec2(1, 0)
local windSpeed = 0

-- How many textures of different types are available, with sizes and offsets in the atlas
local CloudTextures = {
  Blurry = { group = 'b', count = 16, start = vec2(0, 0/8), size = vec2(2/16, 1/8) },
  Hovering = { group = 'h', count = 16, start = vec2(0, 2/8), size = vec2(2/16, 1/8) },
  Spread = { group = 's', count = 6, start = vec2(0, 4/8), size = vec2(2/16, 1/8) },
  Flat = { group = 'f', count = 5, start = vec2(0, 6/8), size = vec2(2/16, 1/8) },
  Bottoms = { group = 'd', count = 5, start = vec2(0, 7/8), size = vec2(1/16, 1/8) },
}

-- Calculates base Y coordinate of a cloud from a circle of clouds near horizon
require 'src/weather_clouds_pertrack'

-- Creates a new cloud and sets it using `fn`, which would be one of `CloudTypes` functions
local function createCloud(fn, arg1, arg2)
  local cloud = ac.SkyCloudV2()
  cloud.color = rgb(1, 1, 1)
  cloud.procMap = vec2(0.6, 0.65 + math.random() * 0.05) + math.random() * 0.1
  cloud.procNormalScale = vec2(0.9, 0.3)
  cloud.procShapeShifting = math.random()
  cloud.opacity = 0.9
  cloud.shadowOpacity = 1.0
  cloud.cutoff = 0
  cloud.occludeGodrays = false
  cloud.useNoise = true
  cloud.material = CloudMaterials.Main
  cloud.up = vec3(0, -1, 0)
  cloud.side = math.cross(-cloud.position, cloud.up):normalize()
  cloud.up = math.cross(cloud.side, -cloud.position):normalize()
  cloud.noiseOffset:set(math.random(), math.random()) 
  fn(cloud, arg1, arg2)
  return cloud
end

-- Various helper functions for clouds
local cloudutils = {}
function cloudutils.setPos(cloud, params)
  params = params or {}
  local height = params.height or 100 + math.random() * 200
  local sizeMult = params.size or 1
  local aspectRatio = params.aspectRatio or 0.5
  local distanceMult = params.distance or 10
  local pos = params.pos and params.pos:clone():normalize() or math.randomVec2():normalize()
  cloud.size = vec2(100, 100 * aspectRatio) * sizeMult * (1 + 0.5 * math.random()) * distanceMult
  cloud.position = vec3(400 * pos.x, height, 400 * pos.y) * distanceMult
  cloud.horizontal = params.horizontal or false
  cloud.customOrientation = params.customOrientation or false
  cloud.noTilt = params.noTilt or false
  cloud.procScale = vec2(1.0, (params.horizontal and 1 or 1.2) * aspectRatio) * (params.procScale or 1) * sizeMult
end
function cloudutils.setTexture(cloud, type)
  local index = math.floor(math.random() * type.count)
  if CloudUseAtlas then
    local start = type.start:clone()
    for i = 1, index do
      start.x = start.x + type.size.x
      if start.x >= 1 then
        start.x = start.x - 1
        start.y = start.y + type.size.y
      end
    end
    cloud.texStart:set(start)
    cloud.texSize:set(type.size)
    cloud:setTexture('clouds/atlas.dds')
  else 
    cloud:setTexture('clouds/' .. type.group .. index .. '.png')
  end
  cloud.flipHorizontal = math.random() > 0.5
  return index
end
function cloudutils.setProcNormalShare(cloud, globalShare, totalIntensity)
  globalShare = globalShare or 0.5
  totalIntensity = totalIntensity or 1
  cloud.procNormalScale = vec2((1 - globalShare) * totalIntensity, globalShare * totalIntensity)
end

-- Different types of clouds
local CloudTypes = {}
function CloudTypes.Basic (cloud, pos)
  cloudutils.setTexture(cloud, CloudTextures.Blurry)
  cloud.procMap = vec2(0.6, 0.85) + math.random() * 0.15
  cloud.procSharpnessMult = math.random()
  cloudutils.setProcNormalShare(cloud, 0.6)
  cloudutils.setPos(cloud, { 
    pos = pos, 
    size = (1 + math.random()) * 2, 
    procScale = 0.45 
  })
end
function CloudTypes.Dynamic(cloud, pos)
  local typeRandom = math.random()
  if typeRandom > 0.98 then
    -- Let’s increase variety some more
    cloudutils.setTexture(cloud, CloudTextures.Hovering)
  elseif typeRandom > 0.97 then
    -- Let’s increase variety some more
    cloudutils.setTexture(cloud, CloudTextures.Spread)
  else
    cloudutils.setTexture(cloud, CloudTextures.Blurry)
  end
  cloud.occludeGodrays = true
  if math.random() > 0.8 then 
    cloud.procMap = vec2(0.5, 0.75) + math.random() * 0.15
    cloud.procSharpnessMult = 0.8
    cloud.extraFidelity = cloud.procSharpnessMult * 1.4
    cloudutils.setProcNormalShare(cloud, 0.6, 1.8)
    cloudutils.setPos(cloud, { 
      pos = pos, 
      size = (1 + math.random()) * 1.5 * CloudSpawnScale, 
      procScale = 0.8 * (0.8 + 0.2 * math.random()) / CloudSpawnScale
    })
  else
    cloud.procMap = vec2(0.7, 0.88) + math.random() * 0.08
    cloud.procSharpnessMult = 0.8 * math.random() ^ 2
    cloud.extraFidelity = cloud.procSharpnessMult
    cloudutils.setProcNormalShare(cloud, 0.6, 1.8)
    cloudutils.setPos(cloud, { 
      pos = pos, 
      size = (1 + math.random()) * 2.2 * CloudSpawnScale, 
      procScale = 0.8 * (0.5 + 0.5 * math.random()) / CloudSpawnScale
    })
  end
end
function CloudTypes.Bottom(cloud, mainCloud)
  cloudutils.setTexture(cloud, CloudTextures.Bottoms)
  cloud.occludeGodrays = true
  cloud.horizontal = true
  cloud.horizontalHeading = math.random() * 360
  cloud.procScale:set(1, 1)
  cloud.procMap = mainCloud.procMap * vec2(0.8, 1)
  cloud.procSharpnessMult = mainCloud.procSharpnessMult
  cloud.extraFidelity = mainCloud.extraFidelity
  local size = (mainCloud.size.x + mainCloud.size.y) / 2
  cloud.size:set(size, size)
  cloudutils.setProcNormalShare(cloud, 0.6, 1.8)
  cloud.material = CloudMaterials.Bottom
end
function CloudTypes.Hovering(cloud, pos)
  cloudutils.setTexture(cloud, CloudTextures.Hovering)
  cloud.procMap = vec2(0.7, 0.9) + math.random() * 0.15
  cloud.procSharpnessMult = math.random() ^ 2
  cloud.extraFidelity = cloud.procSharpnessMult
  cloudutils.setProcNormalShare(cloud, 0.75)
  cloudutils.setPos(cloud, { 
    pos = pos, 
    horizontal = true,
    size = (1 + math.random()) * 6 * CloudSpawnScale, 
    procScale = 0.1 / CloudSpawnScale
  })
  cloud.horizontalHeading = math.atan2(windDir.y, -windDir.x) * 180 / math.pi + math.random() * 30 - 15
  cloud.material = CloudMaterials.Hovering
end
function CloudTypes.Spread(cloud, pos)
  cloudutils.setTexture(cloud, CloudTextures.Spread)
  cloud.procMap = vec2(0.7, 0.9) + math.random() * 0.15
  cloud.procSharpnessMult = math.random() ^ 2
  cloud.extraFidelity = 1
  cloudutils.setProcNormalShare(cloud, 0.75)

  local isSpread = math.random() > 0.5
  cloudutils.setPos(cloud, { 
    pos = pos, 
    horizontal = true,
    size = (1 + math.random() * 2.5) * 3 * CloudSpawnScale, 
    procScale = 0.1 / CloudSpawnScale,
    aspectRatio = 0.33
  })
  cloud.horizontalHeading = math.atan2(windDir.y, -windDir.x) * 180 / math.pi + math.random() * 20 - 10
  cloud.material = CloudMaterials.Hovering
  cloud.procScale:mul(vec2(0.2, 2))
  cloud.procMap = vec2(0.6, 0.99)
  cloud.opacity = 0.3
end
function CloudTypes.Low(cloud, pos, distance)
  local index = cloudutils.setTexture(cloud, CloudTextures.Flat)
  local heightFixes = { 0, 4, -13 }
  cloud.occludeGodrays = true
  cloud.procMap = vec2(0.35, 0.75)
  cloud.procSharpnessMult = 0.8
  cloud.extraFidelity = 1.2
  cloud.color = rgb(0.85,0.85,0.85) * (1 - distance * 0.3)
  cloud.opacity = 0.6 * (1 - distance * 0.8)
  cloud.orderBy = 1e12 + distance * 1e10
  cloud.extras.opacity = cloud.opacity
  cloudutils.setProcNormalShare(cloud, 0.7, 1.4)
  cloudutils.setPos(cloud, { 
    pos = pos, 
    height = 50 - 30 * distance + (heightFixes[index + 1] or 0), 
    distance = 50 + distance, 
    size = 1.6, 
    aspectRatio = 0.3 
  })
end

local CloudsCell = {}
function CloudsCell:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.initialized = false
  o.clouds = {}
  o.cloudsCount = 0
  o.hoveringClouds = {}
  o.hoveringCloudsCount = 0
  o.lastActive = 0
  o:reuse(o.index)
  return o
end
function CloudsCell:reuse(index)
  self.index = index
  self.pointA = CloudsCell.getCellCenter(self.index)
  self.pointB = self.pointA + vec3(CloudCellSize, 0, CloudCellSize)
  self.center = (self.pointA + self.pointB) / 2
  if self.initialized then
    for i = 1, self.cloudsCount do
      self.clouds[i].pos = self:getPos()
    end
  end
end
function CloudsCell:addCloud(cloudInfo)
  if cloudInfo.hovering then
    self.hoveringCloudsCount = self.hoveringCloudsCount + 1
    self.hoveringClouds[self.hoveringCloudsCount] = cloudInfo
  else
    self.cloudsCount = self.cloudsCount + 1
    self.clouds[self.cloudsCount] = cloudInfo
  end
end
function CloudsCell:getPos(hovering)
  return vec3(
    math.lerp(self.pointA.x, self.pointB.x, math.random()), 
    hovering 
      and math.lerp(HoveringMinHeight, HoveringMaxHeight, math.random())
      or math.lerp(DynCloudsMinHeight, DynCloudsMaxHeight, math.random()),
    math.lerp(self.pointA.z, self.pointB.z, math.random()))
end
function CloudsCell:initialize()
  self.initialized = true
  local DynamicClouds = 8
  local HoveringClouds = 2
  for i = 1, DynamicClouds + HoveringClouds do
    local hovering = i > DynamicClouds
    local pos = self:getPos(hovering)
    local cloud = createCloud(hovering 
      and (math.random() > 0.3 and CloudTypes.Spread or CloudTypes.Hovering) 
      or CloudTypes.Dynamic, pos)
    local weatherThreshold = math.random() * 0.95
    self:addCloud({
      cloud = cloud,
      pos = pos,
      size = cloud.size:clone(),
      procMap = cloud.procMap:clone(),
      procScale = cloud.procScale:clone(),
      opacity = cloud.opacity,
      flatCloud = nil,
      visibilityOffset = 1 + (hovering and 0.5 or math.random()),
      weatherThreshold0 = weatherThreshold,
      weatherThreshold1 = 0.05 + weatherThreshold,
      weatherScale = 1,
      hovering = hovering,
      cloudAdded = false,
      flatCloudAdded = false
    })
  end
end
function CloudsCell:updateHovering(cameraPos, cellDistance, dt)
  for i = 1, self.hoveringCloudsCount do
    local e = self.hoveringClouds[i]
    local c = e.cloud
    c.position:set(e.pos):sub(cameraPos)

    local d = math.horizontalLength(c.position)
    c.opacity = e.opacity * (1 - math.saturateN(e.visibilityOffset * d * 5 / (cellDistance * CloudCellSize) - 4)) * (1 - 0.2 * CurrentConditions.clouds)

    if c.opacity > 0.001 then
      local weatherCutoff = 1 - math.lerpInvSat(CurrentConditions.clouds, e.weatherThreshold0, e.weatherThreshold1)
      c.orderBy = math.dot(c.position, c.position) + 1e9
      c.opacity = c.opacity * (0.5 + 0.5 * CurrentConditions.clouds) * (1 - weatherCutoff)

      local up = windDir.x * c.up.x + windDir.y * c.up.z
      local side = windDir.x * c.side.x + windDir.y * c.side.z
      local windDeltaC = (0.15 * windSpeed * dt * CloudShapeMovingSpeed) / c.size.x
      c.noiseOffset.x = c.noiseOffset.x - windDeltaC * side
      c.noiseOffset.y = c.noiseOffset.y - windDeltaC * up
      if not e.cloudAdded then 
        e.cloudAdded = true
        ac.weatherClouds[#ac.weatherClouds + 1] = c
      end
    elseif e.cloudAdded then
      e.cloudAdded = false
      ac.weatherClouds:erase(c)
    end
  end
end
function CloudsCell:updateDynamic(cameraPos, cellDistance, dt)
  local distance = math.horizontalDistance(self.center, cameraPos)
  local distanceK = math.smoothstep(math.lerpInvSat(distance, CloudDistanceShiftEnd, CloudDistanceShiftStart) ^ 0.8)

  local windDelta = windSpeed * dt * CloudShapeMovingSpeed
  local shapeShiftingDelta = dt * CloudShapeShiftingSpeed
  local maxDistanceInv = 5 / (cellDistance * CloudCellSize)
  local fadeNearbyInv = 1 / CloudFadeNearby
  local ccClouds = CurrentConditions.clouds
  local opacityMult = (1 - 0.2 * ccClouds) * CurrentConditions.cloudsOpacity
  local sizeMult = math.lerp(1.5, 1, distanceK) * (1 + ccClouds * 0.5)
  local weatherScale = 0.5 + 0.5 * ccClouds
  local mapMultX = 1 - ccClouds * 0.8
  local mapMultY = 1 - ccClouds * 0.2
  
  for i = 1, self.cloudsCount do
    local e = self.clouds[i]
    local c = e.cloud
    c.position:set(e.pos):sub(cameraPos)

    local horDist = math.horizontalLength(c.position)
    local weatherCutoff = 0
    local nearbyCutoff = 0
    local windDeltaC = 0

    c.opacity = (1 - math.saturateN(e.visibilityOffset * horDist * maxDistanceInv - 4)) * e.opacity * opacityMult
    if c.opacity > 0.001 then
      c.orderBy = horDist + c.size.x
      setLightPollution(c)
      c.size:set(e.size):scale(sizeMult)

      windDeltaC = windDelta / c.size.x
      nearbyCutoff = math.saturateN(2 - horDist * fadeNearbyInv)
      weatherCutoff = 1 - math.lerpInvSat(ccClouds, e.weatherThreshold0, e.weatherThreshold1)
      c.cutoff = math.max(nearbyCutoff, weatherCutoff)
      c.position.y = math.lerp(DynCloudsDistantHeight + c.size.y * 0.4, c.position.y + c.size.y * 0.8, distanceK)
    end

    if c.cutoff < 0.999 and c.opacity > 0.001 then
      c.noiseOffset:scale(e.weatherScale / weatherScale)
      e.weatherScale = weatherScale
      c.procScale:set(e.procScale):scale(weatherScale)
      c.procMap.x = e.procMap.x * mapMultX
      c.procMap.y = e.procMap.y * mapMultY

      local fwd = windDir.x * c.position.x / horDist + windDir.y * c.position.z / horDist
      local side = windDir.x * c.position.z / horDist + windDir.y * -c.position.x / horDist
      c.noiseOffset.x = c.noiseOffset.x + windDeltaC * side
      c.procShapeShifting = c.procShapeShifting + shapeShiftingDelta + windDeltaC * fwd * 0.5
      if not e.cloudAdded then 
        e.cloudAdded = true
        ac.weatherClouds[#ac.weatherClouds + 1] = c
      end
    elseif e.cloudAdded then
      e.cloudAdded = false
      ac.weatherClouds:erase(c)
    end

    local flatCutoff = math.max(1 - nearbyCutoff, weatherCutoff)
    if flatCutoff < 0.999 and c.opacity > 0.001 then
      local f = e.flatCloud
      if f == nil then
        f = createCloud(CloudTypes.Bottom, c)
        e.flatCloud = f
      end
      f.cutoff = flatCutoff
      f.opacity = c.opacity
      if f.cutoff < 0.999 then
        f.position:set(c.position)
        f.extraDownlit = c.extraDownlit
        f.procMap:set(c.procMap)

        local up = windDir.x * f.up.x + windDir.y * f.up.z
        local side = windDir.x * f.side.x + windDir.y * f.side.z
        f.noiseOffset.x = f.noiseOffset.x - windDeltaC * side
        f.noiseOffset.y = f.noiseOffset.y - windDeltaC * up
        f.procShapeShifting = f.procShapeShifting + (shapeShiftingDelta + windDeltaC * 0.5) * 0.5
        local size = (c.size.x + c.size.y) / 2
        f.size:set(size, size)
        f.orderBy = c.orderBy + c.size.y

        if not e.flatCloudAdded then 
          e.flatCloudAdded = true
          ac.weatherClouds[#ac.weatherClouds + 1] = f
        end
      end
    elseif e.flatCloudAdded then
      e.flatCloudAdded = false
      ac.weatherClouds:erase(e.flatCloud)
    end
  end
end
function CloudsCell:update(cameraPos, cellDistance, dt)
  if not self.initialized then
    self:initialize()
  end
  
  self:updateHovering(cameraPos, cellDistance, dt)
  self:updateDynamic(cameraPos, cellDistance, dt)
end
function CloudsCell:deactivate() 
  for i = 1, self.cloudsCount do
    local e = self.clouds[i]
    if e.cloudAdded then 
      ac.weatherClouds:erase(e.cloud) 
      e.cloudAdded = false
    end
    if e.flatCloudAdded then 
      ac.weatherClouds:erase(e.flatCloud) 
      e.flatCloudAdded = false
    end
  end
end
function CloudsCell:destroy()
  for i = 1, self.cloudsCount do
    local e = self.clouds[i]
    ac.weatherClouds:erase(e.cloud)
    ac.weatherClouds:erase(e.flatCloud)
  end
end
function CloudsCell.getCellOrigin(pos)
  return vec3(math.floor(pos.x / CloudCellSize) * CloudCellSize, 0, math.floor(pos.z / CloudCellSize) * CloudCellSize)
end
function CloudsCell.getCellCenter(cellIndex)
  local x = math.floor(cellIndex / 1e5 - 100) * CloudCellSize
  local y = (math.fmod(cellIndex, 1e5) - 100) * CloudCellSize
  return vec3(x, 0, y)
end
function CloudsCell.getCellIndex(pos)
  return math.floor(100 + pos.x / CloudCellSize) * 1e5 + math.floor(100 + pos.z / CloudCellSize)
end
function CloudsCell.getCellNeighbour(cell, x, y)
  return cell + x + y * 1e5
end

local cloudCells = {}
local cloudCellsList = {}
local cellsTotal = 0
local activeIndex = 0
local windOffset = vec2()
local cellsPool = {}
local cellsPoolTotal = 0

local function createCloudCell(cellIndex)
  local c = nil
  if cellsPoolTotal > 0 then 
    c = cellsPool[cellsPoolTotal]
    table.remove(cellsPool, cellsPoolTotal)
    cellsPoolTotal = cellsPoolTotal - 1
    c:reuse(cellIndex)
  else
    c = CloudsCell:new{ index = cellIndex }
  end
  cloudCells[cellIndex] = c
  cloudCellsList[cellsTotal + 1] = c
  cellsTotal = cellsTotal + 1
  return c
end

local cameraPos = vec3()
local cleanUp = 0

local function updateCloudCells(dt)
  if CurrentConditions.clouds <= 0.0001 and (cellsPoolTotal > 1 or cellsTotal > 1) then 
    if activeIndex >= 0 then
      activeIndex = -1

      for i = cellsTotal, 1, -1 do
        local cell = cloudCellsList[i]
        cellsPoolTotal = cellsPoolTotal + 1
        cellsPool[cellsPoolTotal] = cell
        cell:deactivate()
      end
      cloudCellsList = {}
      cloudCells = {}
      cellsTotal = 0
    end
    return
  end

  activeIndex = activeIndex + 1
  if activeIndex > 1e6 then activeIndex = 0 end
  if activeIndex > 20 then pause = true end

  ac.getCameraPositionTo(cameraPos)
  ac.fixHeadingInvSelf(cameraPos)
  cameraPos.x = cameraPos.x + windOffset.x
  cameraPos.z = cameraPos.z + windOffset.y
  windOffset:add(windDir * (windSpeed * dt))

  local cellIndex = CloudsCell.getCellIndex(cameraPos)
  local cellDistance = math.ceil(CloudCellDistance * (1 - CurrentConditions.fog * 0.3))
  for x = -cellDistance, cellDistance do
    for y = -cellDistance, cellDistance do
      local n = CloudsCell.getCellNeighbour(cellIndex, x, y)
      local c = cloudCells[n]
      if c == nil then 
        c = createCloudCell(n)
      end
      if c then 
        c:update(cameraPos, cellDistance, dt) 
        c.lastActive = activeIndex
      end
    end
  end

  if cleanUp > 0 then
    cleanUp = cleanUp - 1
  else
    for i = cellsTotal, 1, -1 do
      local cell = cloudCellsList[i]
      if cell.lastActive ~= activeIndex then
        table.remove(cloudCellsList, i)
        cloudCells[cell.index] = nil
        cellsTotal = cellsTotal - 1
        cellsPoolTotal = cellsPoolTotal + 1
        cellsPool[cellsPoolTotal] = cell
        cell:deactivate()
      end
    end
    cleanUp = 20
  end
end

-- Static clouds
local staticClouds = {}
local staticCloudsCount = 0
local function addStaticCloud(cloud)
  staticCloudsCount = staticCloudsCount + 1
  staticClouds[staticCloudsCount] = cloud
  ac.weatherClouds[#ac.weatherClouds + 1] = cloud
end
local function updateStaticClouds(dt)
  local cutoff = math.saturate(1.1 - CurrentConditions.clouds * 1.5) ^ 2
  local lightPollution = getRemoteLightPollution()
  local dtLocal = math.min(dt, 0.05)
  for i = 1, staticCloudsCount do
    local c = staticClouds[i]
    local withWind = math.dot(vec2(c.side.x, c.side.z), windDir)
    c.noiseOffset.x = c.noiseOffset.x + (0.2 + math.saturate(windSpeed / 100)) * 0.02 * dtLocal * withWind
    c.procShapeShifting = c.procShapeShifting + (1 + math.saturate(windSpeed / 100) * (1 - withWind)) * 0.02 * dtLocal
    c.extraDownlit:set(lightPollution)
    c.cutoff = cutoff
    c.opacity = c.extras.opacity * CurrentConditions.cloudsOpacity
  end
end
for j = 1, 3 do
  local lowRow = (math.randomVec2()):normalize()
  local count = math.floor(math.random() * 3 + 3)
  for i = 1, count do
    addStaticCloud(createCloud(CloudTypes.Low, lowRow, 1 - i / count))
    lowRow = (lowRow + math.randomVec2():normalize() * 0.2):normalize()
  end
end

function updateClouds(dt)
  windDir = CurrentConditions.windDir
  windSpeed = CurrentConditions.windSpeed * 20 -- clouds move faster up there

  updateCloudCells(dt)
  updateStaticClouds(dt)
  ac.sortClouds()
  ac.invalidateCloudMaps()
end
