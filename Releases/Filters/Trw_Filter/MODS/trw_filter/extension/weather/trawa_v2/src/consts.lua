--------
-- Some general constant values, should not be changed real-time.
--------

SceneBrightnessMultNoPP = 1.5  -- without post-processing active: brightness multiplier for the whole scene
SceneBrightnessMultPP = 2.5  -- with post-processing active: brightness multiplier for the scene (in most cases, gets compensated by auto-exposure)
FilterBrightnessMultPP = 1 -- with post-processing active: brightness adjustment applied after auto-exposure

TimelapsyCloudSpeed = false -- change to false to stop clouds from moving all fast if time goes faster
SmoothTransition = true -- smooth transition between weather types (even if change was sudden)
BlurShadowsWhenSunIsLow = true -- reduce shadows resolution for when sun is low

SunIntensity = 20 -- how bright sun is in general
SunMieIntensity = 3 -- brightness of glow around sun on the sky 
SunLightIntensity = 1.20 -- brightness of sun light cast on the scene
AmbientLightIntensity = 10 -- brightness of ambient light on the scene
FogBacklitIntensity = 2 -- brightness of fog backlit
MoonLightMult = 0.750 -- how bright is moon light
SkyBrightness = 0.5 -- sky brightness multiplier

AdaptationSpeed = 10
SunRaysIntensity = 0.25 -- some good PP-filters expode with sun rays at full strength for some reason
SunRaysCustom = false -- use fully custom sun ray parameters instead of SunRaysIntensity
SunColor =  rgb(1, 1, 1) --rgb(1, 0.912, 0.696)
MoonColor = rgb(0.6, 0.8, 1):scale(2)
LightPollutionBrightness = 0.33

CloudUseAtlas = true
CloudSpawnScale = 0.8
CloudCellSize = 6000
CloudCellDistance = 5
CloudDistanceShiftStart = 2000
CloudDistanceShiftEnd = 20000
CloudFadeNearby = 4000

DynCloudsMinHeight = 3000
DynCloudsMaxHeight = 6000
DynCloudsDistantHeight = 0
HoveringMinHeight = 8000
HoveringMaxHeight = 12000

CloudFixedSpeed = 0.7
CloudShapeShiftingSpeed = 0.005
CloudShapeMovingSpeed = 0.2
