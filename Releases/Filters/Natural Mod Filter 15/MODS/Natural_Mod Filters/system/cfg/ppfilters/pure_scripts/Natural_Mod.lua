local _l_ambient_LUT = {
--  ambLum, dark_ambient, high_sun_comp
    { 0,  1,   0 },
    { 4,  1,   0 },
    { 6,  0.9, 0 },
    { 9,  0.6, 0 },
    { 17, 0.2, 0 },
    { 19, 0,   0 },
    { 20, 0,   1 },
    { 23, 0,   1 },
}
local _l_Ambient_lut
local _l_AmbientCPP = LUT:new(_l_ambient_LUT)

function init_pure_script()
	pure.exposure.useCBE(true)
	pure.exposure.cbe.setAdaptionSpeeds(3,4)--bigger=faster
	pure.exposure.cbe.setLimits(0.01,0.5)
	pure.light.setSpectrumAdaption(0.3)
	pure.light.setVAOAdaption(0.8)
	
	pure.script.weather.addVariable("cloud_brightness", 0)
	pure.script.weather.setVariable("cloud_brightness", "FewClouds", 0.27)
	pure.script.weather.setVariable("cloud_brightness", "ScatteredClouds", 0.33)
	pure.script.weather.setVariable("cloud_brightness", "Windy", 0.25)
	pure.script.weather.setVariable("cloud_brightness", "BrokenClouds", 0.2)
	pure.script.weather.setVariable("cloud_brightness", "Haze", 0.4)
	pure.script.weather.setVariable("cloud_brightness", "Mist", 0.5)
	pure.script.weather.setVariable("cloud_brightness", "Thunderstorm", -0.3)
	
	ac.setPpContrast(1)
	ac.setPpSaturation(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
end

local pureAE
local exp
local gamma
local cloud_bright
local night_compensate_alt
local sun_compensate_alt
local occlusion
local emissives
local high_sun_comp
local dark_ambient
local cloud_cover
local sun_lamp_diff
local _l_tmp_hsv = hsv(0,0,0)
local _l_tmp_rgb = rgb(0,0,0)

function update_pure_script(dt)
	pure.config.set("light.daylight_multiplier",2.1,true)
    sun_lamp_diff = pure.light.getSunLampDifference()
	occlusion = pure.camera.getOcclusion()
	night_compensate_alt = pure.mod.twilight(2) - 1
	sun_compensate_alt = pure.mod.sun(2) - 1
	cloud_bright = pure.script.weather.getVariable("cloud_brightness")
	pureAE = pure.exposure.getValue()
	cloud_cover = pure.world.getCloudCoverage()

	_l_Ambient_lut  = _l_AmbientCPP:get(pure.light.getAmbientLuminance()/sun_lamp_diff)
    dark_ambient = math.saturate(_l_Ambient_lut[1] * cloud_cover)--not factoring occlusion, don't think is required, else will get brightness increase when exit tunnel which looks bad
	high_sun_comp = occlusion * math.lerp(math.saturate(1.5*pure.mod.dayCurve(-1.5,_l_Ambient_lut[2],0.99)),0,cloud_cover)
	exp = (0.1 - high_sun_comp * 0.015 + dark_ambient * 0.15  * pure.mod.twilight(0) + night_compensate_alt * (0.07 + pureAE * 0.8))/ sun_lamp_diff 
	pure.exposure.setBypass(exp)
	gamma = pure.pp.getGammaModulator() * (1.25 + pure.mod.night(0) * 0.35) + pure.mod.sun(0) * (pureAE*1.1*(1-dark_ambient) + math.lerp(0.2,0,occlusion))--occlusion boost for tunnels to test further. potentially restrict to good weather. probably combine with pureAE adjustment rather than add
	ac.setPpTonemapGamma(gamma)
	ac.setPpTonemapFilmicContrast(math.lerp(math.lerp(0.32,0.18,pure.mod.sun(0))-0.04*math.saturate(cloud_cover*2),0.6,math.saturate(dark_ambient*0.5+pure.mod.night(0))))--cloud shadow would be better but function isn't very acccurate

	pure.config.set("clouds2D.brightness",1 - (pure.mod.twilight(0) * cloud_bright),true)
	pure.config.set("light.sun.level", pure.mod.dayCurve(1.05, 0.85, 0.67), true)
	pure.light.setLambertGamma(math.clamp(__IntD(2.8,0.5,0.6),1,2.2))

    pure.config.set("csp_lights.bounce", 1.6, true)
	pure.config.set("csp_lights.emissive",math.pow(sun_lamp_diff,0.5)*(0.8+1/(exp*10)), true)
	pure.config.set("csp_lights.displays",0.8,true)
	pure.config.set("reflections.level", 1.0 + night_compensate_alt * exp, true)
	
    pure.utils.RGBtoHSV(_l_tmp_hsv, pure.light.getLightsource())
    _l_tmp_hsv.h = _l_tmp_hsv.h + 12.5 * (1 - pure.mod.sun(0))
    _l_tmp_hsv.s = _l_tmp_hsv.s * pure.mod.dayCurve(1, 0.5, 0.35)
    _l_tmp_hsv.v = _l_tmp_hsv.v * pure.mod.sun(0.5)
    pure.utils.HSVtoRGB(_l_tmp_rgb, _l_tmp_hsv.h, _l_tmp_hsv.s, _l_tmp_hsv.v)
    ac.setGodraysCustomColor(_l_tmp_rgb)
	ac.setGodraysLength(__IntD(2,-0.6,0.4) * 4 * PURE__getGodraysModulator())-- 0 was -1

	--ac.debug("occlusion", string.format('%.3f', occlusion))
	ac.debug("getAmbientLuminance", string.format('%.3f', pure.light.getAmbientLuminance()))
	ac.debug("cloud_cover", string.format('%.3f', cloud_cover))
	ac.debug("dark_ambient", string.format('%.3f', dark_ambient))
	ac.debug("high_sun_comp", string.format('%.3f', high_sun_comp))
	ac.debug("gamma", string.format('%.3f', gamma))
	ac.debug("fc", string.format('%.3f', ac.getPpTonemapFilmicContrast()))
	ac.debug("exp", string.format('%.3f', exp))
	ac.debug("pureAE", string.format('%.3f', pureAE))
end


--stuff to work on VAO level, night brightness