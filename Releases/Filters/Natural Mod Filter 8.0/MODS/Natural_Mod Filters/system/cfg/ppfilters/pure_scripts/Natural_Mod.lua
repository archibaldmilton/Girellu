function init_pure_script()
	PURE__use_ExpCalc(true)
	PURE__use_SpectrumAdaption(0.5)
	PURE__use_VAOAdaption(true)
	ac.setPpContrast(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(70,70,70))--may be able to delete in future csp version
	PURE__ExpCalc_set_AdaptionSpeeds(3,4)--bigger=faster
	PURE__ExpCalc_set_Limits(0.01,0.5)
	ac.setGlareThreshold(4.6)
	ac.setPpSaturation(1.0)
	__PURE__add_weather_variable("weatherFix", 0)
	__PURE__set_weather_variable("weatherFix", "Mist", 0.05)
	__PURE__set_weather_variable("weatherFix", "Haze", 0.02)
end

local weatherFix
local overcast
local pureAE
local cbe_scaler
local exp
local gamma_min
local gamma
local gamma_max = 1.55
--local night_compensate_alt
--local contrast_min = 0.985

function update_pure_script(dt)
    overcast  = Pure_get_Overcast() * from_twilight_compensate(0)
	--night_compensate_alt = sun_compensate(2) - 1
	weatherFix = __IntD(0, __PURE__get_weather_variable("weatherFix"), 1)
	__PURE__set_config("clouds2D.brightness",math.min(1,overcast * 2 + 0.8*sun_compensate(0.9)))
	__PURE__set_config("csp_lights.bounce", day_compensate(1.25))

	pureAE = PURE__ExpCalc_get_final_exposure()
	cbe_scaler = math.min(math.max(0,((pureAE - 0.065) * 11)),1)
	gamma_min = math.max(math.min(__IntD(1.8,1.2,0.95),1.45),1.2)--_min value adapts based on sunangle to normalise the perceived brightness level at different times of the year and allow fine tuning with respect to sun angle.outer values are the desired range, inner are wider to give more control
	gamma = math.min(math.lerp(gamma_min + (0.1 * overcast),1.7,sun_compensate(0)*cbe_scaler),gamma_max)-- higher value than actual max used to widen curve. sun_compensate reduces boost range as sun goes down --+ (pureAE * 0.4 * night_compensate(0))
	ac.setPpTonemapGamma(gamma)
	--ac.setPpContrast(night_compensate(math.min(1,math.max(contrast_min,math.lerp(0.94,0.996,gamma*0.61)))))
	ac.setPpTonemapFilmicContrast(0.1 + (0.3 * night_compensate(0)))--review. 0.5=none
	--ac.setPpTonemapFilmicContrast(0.1 + night_compensate_alt * 0.3)--review. 0.5=none
	ac.setPpColorGradingIntensity(math.max(0.01, 0.5 * sun_compensate(0.75) * from_twilight_compensate(0)))--may adjust
	exp = 0.1 - weatherFix +  night_compensate(0) * (0.07 + pureAE * 0.8) --+ 0.12 
	PURE__ExpCalc_set_BypassExposure(exp)

	ac.setGlareBloomLuminanceGamma(math.lerp(1.7,1.1,exp*2))
	ac.setGodraysLength(__IntD(4,-2,0.4) * PURE__getGodraysModulator())

	--ac.debug("overcast", string.format('%.3f', overcast))
	ac.debug("gamma", string.format('%.3f', gamma))
	--ac.debug("contrast", string.format('%.3f', ac.getPpContrast()))
	ac.debug("gamma_min", string.format('%.3f', gamma_min))
	ac.debug("exp", string.format('%.3f', exp))
	--ac.debug("weatherFix", string.format('%.3f', weatherFix))
	ac.debug("cbe_scaler", string.format('%.3f', cbe_scaler))
	--ac.debug("pureAE", string.format('%.3f', pureAE))
end