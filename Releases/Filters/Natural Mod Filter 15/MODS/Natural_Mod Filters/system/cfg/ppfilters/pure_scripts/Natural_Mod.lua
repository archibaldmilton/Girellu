local _l_ambient_LUT = {
--ambLum, dark_ambient
    { 0,  1 },
    { 2,  1 },
    { 5,  0.9},
    { 6,  0.9 },
    { 9,  0.2},
    { 17, 0 },
    { 23, 0 },
}
local _l_Ambient_lut
local _l_AmbientCPP = LUT:new(_l_ambient_LUT)

function init_pure_script()
	pure.script.tools.handleExposure(1, { autoexposure = 0.0 })--fixedmixmulti,fixedexposure
    pure.exposure.cbe.setAdaptionSpeeds(0.7, 1.5)
	pure.exposure.cbe.setLimits(0.001, 0.25)
	pure.light.setSpectrumAdaption(0.3)
	pure.light.setVAOAdaption(0.8)
	pure.script.weather.addVariable("cloud_brightness", 0)
	pure.script.weather.setVariable("cloud_brightness", "FewClouds", 0.27)
	pure.script.weather.setVariable("cloud_brightness", "ScatteredClouds", 0.22)
	pure.script.weather.setVariable("cloud_brightness", "Windy", 0.25)
	pure.script.weather.setVariable("cloud_brightness", "BrokenClouds", 0.2)
	pure.script.weather.setVariable("cloud_brightness", "Haze", 0.4)
	pure.script.weather.setVariable("cloud_brightness", "Mist", 0.5)
	pure.script.weather.setVariable("cloud_brightness", "Thunderstorm", -0.3)
	ac.setPpContrast(1)
	ac.setPpSaturation(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysDepthMapThreshold(0.999963)--tbd
end

local pureAE
local cloud_bright
local dark_ambient
local cloud_cover
local sun_lamp_diff
local occlusion

function update_pure_script(dt)
	occlusion = pure.camera.getOcclusion()
	cloud_cover = pure.world.getCloudCoverage()	
	sun_lamp_diff = pure.light.getSunLampDifference()
	cloud_bright = pure.script.weather.getVariable("cloud_brightness")
	pure.config.set("clouds2D.brightness",1 - (pure.mod.twilight(0) * cloud_bright),true)
	pure.config.set("light.daylight_multiplier",2.1,true)
	pure.config.set("light.sun.saturation", pure.mod.dayCurve(1.10,1.40,1.5), true)
	pure.light.setLambertGamma(math.clamp(__IntD(2.8,0.5,0.6),1,2.2))
	pure.script.tools.handleGodrays(pure.mod.dayCurve(3,0.2,0.4),1,30,0.01,1.5)

	_l_Ambient_lut  = _l_AmbientCPP:get(pure.light.getAmbientLuminance()/sun_lamp_diff)
	dark_ambient = math.saturate(_l_Ambient_lut[1] * cloud_cover) * pure.mod.twilight(0)
	
	pure.exposure.cbe.setSensitivity(pure.mod.night(0.4))--note that AE no longer responds to changing daylight mult
	pure.exposure.cbe.setTarget(1+dark_ambient*occlusion+0.5*pure.mod.night(0))
	pureAE = pure.exposure.getCalculatedValue()
	ac.setPpTonemapGamma(pure.pp.getGammaModulator() * (1.26 + (pure.mod.sun(2) -1)*0.31))
	ac.setPpTonemapFilmicContrast(math.clamp(pure.mod.dayCurve(0.55, 0, 0.5),0.18,0.5))--+0.1*dark_ambient

    pure.config.set("csp_lights.bounce", 1.6, true)	
	pure.config.set("csp_lights.emissive",2/(pure.exposure.cbe.getValue()*10), true)
	pure.config.set("reflections.level", 1.1 + math.clamp(pureAE*10-0.5,0,0.3), true)
end