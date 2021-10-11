--------
-- Reads and applies light pollution, taking camera position into account. Also, pushes a few values into
-- a global scope, for lighting to take light pollution into account (to hide stars or add extra ambient lighting).
-- Please note: because this module adds its own sky gradient, it should be included after other weather-doing stuff,
-- so light pollution on the sky would not be occluded by other gradients.
--------

-- Global light pollution values
LightPollutionValue = 0
LightPollutionSkyFeaturesMult = 1
LightPollutionExtraAmbient = rgb()

-- Read light pollution
local lightPolData = ac.getTrackLightPollution()

-- Light pollution relative to camera
local lightPolPos = vec3()

-- Create and add new sky gradient working in additive mode
local lightPolGradient = ac.SkyExtraGradient()
lightPolGradient.isAdditive = true
lightPolGradient.exponent = 0.5
ac.addSkyExtraGradient(lightPolGradient)

-- Distance coefficient: grows to 1 if camera is within light pollution area, slowly goes 
-- down to 0 if camera gets further away
local lightPolDistanceK = 0

-- Cached color for light pollution value for distant clouds (so it wouldn’t have to 
-- recalculate it each frame)
local remoteLightPollution = rgb()

-- This public function updates cloud downlit value depending on its position relative to light pollution
-- (cloud position is set relative to camera, so it uses lightPolPos)
function setLightPollution(cloud)
  if nightK > 0 then
    local distance = math.horizontalDistance(cloud.position, lightPolPos) + math.max((cloud.position.y - 5000) * 10, 0)
    local distanceK = math.saturate(lightPolData.radius / math.max(distance - lightPolData.radius, 1))
    cloud.extraDownlit:set(lightPolData.tint)
      :scale(math.max(lightPolDistanceK + distanceK * 0.5, distanceK) * nightK * lightPolData.density * LightPollutionBrightness * 0.25)
  else
    cloud.extraDownlit.r = 0
    cloud.extraDownlit.g = 0
    cloud.extraDownlit.b = 0
  end
end

-- Returns remote light pollution for distant clouds
function getRemoteLightPollution()
  return remoteLightPollution
end

-- Simple trick to reduce garbage for GC, having a single vector and reusing it
-- instead of recreating it each frame
local cameraPosition = vec3()

-- Update light pollution position, gradient, global variables
function updateLightPollution()  
  ac.getCameraPositionTo(cameraPosition)

  -- Could use `lightPolPos = lightPolData.position - cameraPosition`, but this way, there is no
  -- garbage generated
  lightPolPos:set(lightPolData.position):sub(cameraPosition)

  -- Final brightness is scaled based on conditions
  local cc = CurrentConditions
  local polBrightness = LightPollutionBrightness * math.lerp(math.lerp(0.1, 0.3, math.max(cc.clouds * 0.5, 1 - cc.clear)), 1, cc.fog)

  -- Distance from camera to pollution center
  local polDistance = #lightPolPos

  -- Multiplying is cheaper than dividing — yes, I’m getting that desperate with this LuaJIT thing
  local polDistanceInv = 1 / polDistance

  -- If distance is the same or smaller than radius, it’ll be 1 (because of `math.saturate(…)` clamping result between 0 and 1),
  -- if distance is higher, it’ll slowly go down to zero
  local distanceK = math.saturate(lightPolData.radius * polDistanceInv) 

  -- Set gradient color: use pollution tint scaled by density and brightness in settings, plus multiplied by distance 
  -- coefficient in 0.25 power. why that? looks better like that to me, that’s all
  lightPolGradient.color:set(lightPolData.tint):scale(lightPolData.density * (distanceK ^ 0.25) * polBrightness)

  -- Calculating light pollution direction and size: for distant pollution (with lower distance coefficient),
  -- gradient will be at the direction towards the pollution, but direction to closer gradient moves down 
  -- below the horizon while pollution itself glows in size, covering more and more sky
  local lightPollutionDir = lightPolPos * polDistanceInv
  lightPolGradient.sizeFull = -1 + distanceK * 2
  lightPolGradient.sizeStart = 1 + distanceK * 2
  lightPolGradient.direction:setLerp(lightPollutionDir, lightPollutionDir + vec3(0, -8, 0), distanceK)
  lightPolDistanceK = distanceK

  -- Updating those public cached values
  LightPollutionValue = lightPolData.density * distanceK
  LightPollutionSkyFeaturesMult = 1 - LightPollutionValue * 0.9
  LightPollutionExtraAmbient:set(lightPolData.tint):scale(LightPollutionValue * polBrightness)
  remoteLightPollution:set(lightPolData.tint):scale(distanceK * nightK * lightPolData.density * polBrightness)
end
