function init_pure_script()
	PURE__use_ExpCalc(true)
	PURE__use_SpectrumAdaption(0.3)
	PURE__use_VAOAdaption(true)
	PURE__ExpCalc_set_AdaptionSpeeds(4,4)--bigger=faster
	PURE__ExpCalc_set_Limits(0.01,0.5)
	PURE__set_Lambert_Gamma(1.5)
	
	__PURE__add_weather_variable("cloud_brightness", 0.72)
	__PURE__set_weather_variable("cloud_brightness", "Squalls", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "HeavyThunderstorm", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "Thunderstorm", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "HeavyRain", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "Rain", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "HeavyDrizzle", 1.0)
	__PURE__set_weather_variable("cloud_brightness", "Drizzle", 1.0)
	
	ac.setPpContrast(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(80,80,80))--may be able to delete in future csp version
	ac.setGlareThreshold(4.6)
	ac.setPpSaturation(1)
end

local pureAE
local cbe_scaler
local exp
local gamma_min
local gamma
local cloud_bright
local night_compensate_alt

function update_pure_script(dt)
	night_compensate_alt = from_twilight_compensate(2) - 1
	cloud_bright = __PURE__get_weather_variable("cloud_brightness")
	__PURE__set_config("clouds2D.brightness",cloud_bright)
	__PURE__set_config("csp_lights.bounce", day_compensate(1.25))

	pureAE = PURE__ExpCalc_get_final_exposure()
	exp = 0.1 +  night_compensate_alt * (0.07 + pureAE * 0.8)
	PURE__ExpCalc_set_BypassExposure(exp)
	cbe_scaler = math.min(math.max(-0.1,((pureAE - 0.065) * 12)),1)--ideally set min to 0 but can't due to overbright mod tracks
	gamma_min = math.max(math.min(__IntD(1.8,1.2,0.95),1.45),1.2)--_min value adapts based on sunangle to normalise the perceived brightness level at different times of the year and allow fine tuning with respect to sun angle. outer values are the desired range, inner are wider to give more control
	gamma = math.min(math.lerp(gamma_min,1.9,from_twilight_compensate(0)*cbe_scaler),gamma_min+0.3)-- higher value than actual max used to widen curve. sun_compensate reduces boost range as sun goes down --+ (pureAE * 0.4 * night_compensate(0))
	ac.setPpTonemapGamma(gamma)
	ac.setPpTonemapFilmicContrast(0.15 + (0.25 * night_compensate_alt))--review. 0.5=none
	ac.setGlareBloomLuminanceGamma(math.lerp(1.9,1,math.min(exp+pureAE,1)))
	ac.setGodraysLength(__IntD(4,-1,0.4) * PURE__getGodraysModulator())

	ac.debug("night_compensate_alt", string.format('%.3f', night_compensate_alt))
	ac.debug("gamma", string.format('%.3f', gamma))
	ac.debug("gamma_min", string.format('%.3f', gamma_min))
	ac.debug("exp", string.format('%.3f', exp))
	ac.debug("cbe_scaler", string.format('%.3f', cbe_scaler))
	ac.debug("pureAE", string.format('%.3f', pureAE))
end