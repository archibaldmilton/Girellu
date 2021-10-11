--------
-- Basic WeatherFX implementation, this is the main file. Sets things up, includes a bunch of stuff and triggers updates.
--------
-- Please note: some of its parts work with vectors and colors. CSP defines its types for it, such as `vec3()` and `rgb()`.
-- The thing is though, each time a new vector, for example, is created, it’ll have to be picked by garbage collector
-- later. So to try and make it run as fast as possible, I tried to avoid creating new copies of vectors and instead
-- using functions like `ac.calculateSkyColorTo(value)` instead of `value = ac.calculateSkyColor()`. If you would want
-- to fork this script and make your own version of it, of course, feel free to use a more readable approach.
--------

require 'src/consts'                -- some general constant values
require 'src/utils'                 -- helpful functions
require 'src/conditions_converter'  -- thing to turn conditions (esp. weather type) info something usable: a few easy to use numbers
require 'src/weather_application'   -- most of weather stuff happens here
require 'src/light_pollution'       -- adds a sky gradient for light pollution and a few global variables like light pollution intensity
require 'src/weather_clouds'        -- clouds operating in chunks

-- We’re so sure everything is correct we’ll be skipping sane checks to speed things up
-- (do not do that if your code can divide by zero)
ac.skipSaneChecks()

-- Since we’re going to use v2 of clouds, here we can set cloud map parameters
local cloudMap = ac.SkyCloudMapParams.new()

cloudMap.perlinFrequency = 4.0
cloudMap.perlinOctaves = 7
cloudMap.worleyFrequency = 3.0
cloudMap.shapeMult = 20.0
cloudMap.shapeExp = 0.5
cloudMap.shape0Mip = 0
cloudMap.shape0Contribution = 0.2
cloudMap.shape1Mip = 2.2
cloudMap.shape1Contribution = 0.5
cloudMap.shape2Mip = 3.5
cloudMap.shape2Contribution = 1.0

ac.generateCloudMap(cloudMap)

-- Loading textures for sky stuff
ac.setSkyStarsMap('textures/weather_fx/starmap.dds')
ac.setSkyMoonTexture('textures/weather_fx/moon.dds')

-- Sun, moon and the planets look too tiny without an extra size boost. If you’re changing it, don’t forget to readjust stuff 
-- related to eclipses in `weather_application.lua`
ac.setSkySunMoonSizeMultiplier(3)

-- Use cloud shadow maps: in this mode, mirrors and reflections will use “ac.getCloudsShadow()” as light multiplier automatically
ac.setCloudShadowMaps(true)

-- Do not update cloud maps (like cloud shadows) without manual invalidation
ac.setManualCloudsInvalidation(true)

-- -- Ignore cloud.opacity and use only cloud.shadowOpacity for cloud shadows
-- ac.setCloudShadowIndependantOpacity(true)

-- Set cloud shadow map parameters
ac.setCloudShadowDistance(6e3)
ac.setCloudShadowScalingFactor(1)

-- Use v2 sky shader
ac.setSkyUseV2(true)
ac.setCloudArcMultiplier(1)

-- Use new fog formula (instead of original AC one)
ac.setFogAlgorithm(ac.FogAlgorithm.New)

-- As time goes on, some bugs on C++ side are found, in some cases to keep things compatible, fixes need to be enabled manually
ac.fixSkyColorCalculateResult(true)
ac.fixSkyColorCalculateOrder(true)
ac.fixSkyV2Fog(true)
ac.fixCloudsV2Fog(true)

-- Disable cars exposure values, reset camera exposure
-- ac.setCarExposureActive(false)
-- ac.setCameraExposure(33)

-- Called each 3rd frame or if sun moved
function rareUpdate1(dt)
  readConditions(dt)
  applySky()
  applyLight() 
  applyAmbient()
  applyFog(dt)
  applySkyFeatures()
  applyAdaptiveShadows()
end

-- Called each 3rd frame, but with an offset, to spread the load
function rareUpdate2(dt)
  applyHeatFactor()
  updateLightPollution(dt)
  updateCloudMaterials(dt)
end

local lastSunDir = vec3()
local lastCameraPos = vec3()
local lastGameTime = 0
local ruBase = RareUpdate:new{ callback = rareUpdate1 }
local ruCloudMaterials = RareUpdate:new{ callback = rareUpdate2, phase = 1 }
local ruClouds = RareUpdate:new{ callback = updateClouds, phase = 2 }

function getCloudsDeltaT(dt, gameDT)
  local gameTime = ac.getCurrentTime()
  local cloudsDeltaTime = gameTime - lastGameTime
  lastGameTime = gameTime
  local cloudsDeltaTimeAdj = math.sign(cloudsDeltaTime) * math.abs(cloudsDeltaTime) / (1 + math.abs(cloudsDeltaTime))
  return math.lerp(math.clamp(cloudsDeltaTimeAdj, -10, 10), gameDT, CloudFixedSpeed)
end

-- Called every frame
function update(dt)
  -- if true then
  --   -- ac.setLightDirection(vec3(0, 1, 1))
  --   -- ac.setLightColor(rgb(10, 10, 10))
  --   ruBase:update(gameDT, forceUpdate)
  --   return 0
  -- end

  -- This value is time passed in seconds (as dt), but taking into account pause, slow 
  -- motion or fast forward, but not time scale in conditions
  local gameDT = ac.getGameDeltaT()

  -- Clouds operate on actual passed time
  local cloudsDT = TimelapsyCloudSpeed and getCloudsDeltaT(dt, gameDT) or gameDT

  -- If sun moved too much, have to force update
  local currentSunDir = ac.getSunDirection()
  local currentCameraPos = ac.getCameraPosition()
  local forceUpdate = math.dot(lastSunDir, currentSunDir) < 0.999995 or math.squaredDistance(currentCameraPos, lastCameraPos) > 10
  if forceUpdate then
    lastSunDir:set(currentSunDir)
  end

  lastCameraPos:set(currentCameraPos)

  -- Actual update will happen only once in three frames, or if forceUpdate is true
  ruBase:update(gameDT, forceUpdate)
  ruCloudMaterials:update(gameDT, forceUpdate)

  -- Increasing refresh rate for faster moving clouds
  if math.abs(cloudsDT) > 0.5 then 
    ruClouds.skip = 0
  elseif math.abs(cloudsDT) > 0.05 then 
    ruClouds.skip = 1
  elseif math.abs(cloudsDT) < 0.03 then 
    ruClouds.skip = 2
  end

  ruClouds:update(cloudsDT, forceUpdate)

  -- Fake exposure aka eye adaptation needs to update each frame, with speed independant 
  -- from pause, slow motion and what not
  applyFakeExposure(dt)

  -- Uncomment to check how much garbage is generated each frame (slows things down)
  -- runGC()

  -- ac.setAutoExposureActive(false)
  -- ac.setAutoExposureMeasuringArea(vec2(0.5, 0.25), vec2(0.4, 0.4))
  -- ac.setAutoExposureTarget(100)
  -- ac.setAutoExposureInfluencedByGlare(false)
  -- ac.setAutoExposureLimits(0, 0.22)

  -- ac.setShadows(ac.ShadowsState.On)
  -- ac.setShadowsResolution(32)

  -- ac.debug('getCloudsShadow', ac.getCloudsShadow())

  -- ac.setShadowsResolution(512)
  -- ac.setShadowsResolution(2048)
  -- ac.setShadowsResolution(128)
end