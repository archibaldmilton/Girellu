local _l_ambient_LUT = {
--  ambLum, dark_ambient, high_sun_comp, gamma_boost
    { 0,  1,   0, 0  },
    { 4,  1,   0, 0  },
    { 6,  0.9, 0, 0.2  },
    { 9,  0.6, 0, 0.5  },
    { 15, 0.2,   0, 1  },
    { 19, 0,   0, 1  },
    { 20, 0,   1, 1  },
}
local _l_Ambient_lut
local _l_AmbientCPP = LUT:new(_l_ambient_LUT)

function init_pure_script()
	PURE__use_ExpCalc(true)
	pure.exposure.cbe.setAdaptionSpeeds(2,3)--bigger=faster
	pure.exposure.cbe.setLimits(0.01,0.5)
	pure.light.setSpectrumAdaption(0.3)
	pure.light.setVAOAdaption(true)
	
	__PURE__add_weather_variable("cloud_brightness", 0)
	__PURE__set_weather_variable("cloud_brightness", "FewClouds", 0.25)
	__PURE__set_weather_variable("cloud_brightness", "ScatteredClouds", 0.33)
	__PURE__set_weather_variable("cloud_brightness", "Windy", 0.25)
	__PURE__set_weather_variable("cloud_brightness", "BrokenClouds", 0.3)
	__PURE__set_weather_variable("cloud_brightness", "Haze", 0.4)
	__PURE__set_weather_variable("cloud_brightness", "Mist", 0.5)
	__PURE__set_weather_variable("cloud_brightness", "Thunderstorm", -0.3)
	
	ac.setPpContrast(1)
	ac.setPpSaturation(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(80,80,80))--may be able to delete in future csp version
end

local pureAE
local exp
local gamma
local cloud_bright
local night_compensate_alt
local occlusion
local emissives
local high_sun_comp
local dark_ambient
local cloud_cover

function update_pure_script(dt)
    occlusion = pure.camera.getOcclusion()
	night_compensate_alt = from_twilight_compensate(2) - 1
	cloud_bright = __PURE__get_weather_variable("cloud_brightness")
	__PURE__set_config("clouds2D.brightness",1 - (sun_compensate(0) * cloud_bright),true)
	pureAE = PURE__ExpCalc_get_final_exposure()
	cloud_cover = Pure_get_CloudCoverage()
	
	_l_Ambient_lut  = _l_AmbientCPP:get(pure.light.getAmbientLuminance())
    dark_ambient = math.saturate(_l_Ambient_lut[1] * cloud_cover) * from_twilight_compensate(0)--not factoring occlusion, don't think is required, else will get brightness increase when exit tunnel which looks bad
	high_sun_comp = occlusion * math.lerp(math.clamp(__IntD(-2,_l_Ambient_lut[2],0.95),0,1),0,cloud_cover)

	exp = 0.1 - high_sun_comp * 0.015 + dark_ambient * 0.15 + night_compensate_alt * (0.07 + pureAE * 0.8)
	PURE__ExpCalc_set_BypassExposure(exp)
	gamma = pure.pp.getGammaModulator() * (1.295 + night_compensate(0) * 0.3) + sun_compensate(0) * (pureAE*1.2*(1-dark_ambient) + math.lerp(0.2,0,occlusion))
--occlusion boost for tunnels to test further. potentially restrict to good weather. probably combine with pureAE adjustment rather than add
	ac.setPpTonemapGamma(gamma)
	ac.setPpTonemapFilmicContrast(math.lerp(0.4,math.lerp(0.14,0.27,dark_ambient),day_compensate(0)))
--could use exp instead of dark_ambient?

	PURE__set_Lambert_Gamma(math.clamp(__IntD(2.8,0.5,0.6),1,2.2))
	pure.config.set("reflections.level", 1.0 + night_compensate_alt *  (0.5 * exp*2), true)
    pure.config.set("csp_lights.bounce", 1.0 + night_compensate_alt *  (0.5 * exp*2), true)
--better to use exp lut but using same sunangle function for exp. or use lerp?
    pure.config.set("csp_lights.emissive", 2.7 - night_compensate_alt *  (1.5 + exp/2), true)

	ac.setGodraysLength(__IntD(3,0,0.4) * PURE__getGodraysModulator())-- 0 was -1

	--ac.debug("pure.light.getAdaptedLambertGamma()", string.format('%.3f', pure.light.getAdaptedLambertGamma()))
	--ac.debug("occlusion", string.format('%.3f', occlusion))
	--ac.debug("getAmbientLuminance", string.format('%.3f', pure.light.getAmbientLuminance()))
	--ac.debug("cloud_cover", string.format('%.3f', cloud_cover))
	--ac.debug("dark_ambient", string.format('%.3f', dark_ambient))
	--ac.debug("high_sun_comp", string.format('%.3f', high_sun_comp))
	ac.debug("gamma", string.format('%.3f', gamma))
	ac.debug("fc", string.format('%.3f', ac.getPpTonemapFilmicContrast()))
	ac.debug("exp", string.format('%.3f', exp))
	ac.debug("pureAE", string.format('%.3f', pureAE))
end