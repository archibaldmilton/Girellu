function init_pure_script()
	PURE__use_ExpCalc(true)
	PURE__use_SpectrumAdaption(0.3)
	PURE__use_VAOAdaption(true)
	ac.setPpContrast(1)
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(70,70,70))--may be able to delete in future csp version
	PURE__ExpCalc_set_AdaptionSpeeds(4,4)--bigger=faster
	PURE__ExpCalc_set_Limits(0.01,0.5)
	ac.setGlareThreshold(4.6)
	ac.setPpSaturation(1.0)
	--__PURE__add_weather_variable("weatherFix", 0)
	--__PURE__set_weather_variable("weatherFix", "Haze", 0.02)
	--__SCRIPT__UI_SliderFloat("gamma lambert", 1.7, 0, 3)

end

--local weatherFix
local pureAE
local cbe_scaler
local exp
local gamma_min
local gamma
local gamma_max = 1.55
--local night_compensate_alt

function update_pure_script(dt)
	--PURE__set_Lambert_Gamma(__SCRIPT__UI_getValue("gamma high sun"))
	--night_compensate_alt = from_twilight_compensate(2) - 1
	--weatherFix = __IntD(0, __PURE__get_weather_variable("weatherFix"), 1)
	__PURE__set_config("clouds2D.brightness",0.72)
	__PURE__set_config("csp_lights.bounce", day_compensate(1.25))

	pureAE = PURE__ExpCalc_get_final_exposure()
	--exptest = math.min(math.max(pureAE*1.6,0.09),0.1)--dont really want this but helps with tracks with different shaders to ks
	--exptest = 5 * (0.1 - math.min(math.max(pureAE*1.6,0.09),0.1))--dont really want this but helps with tracks with different shaders to ks
	exp = 0.1 +  night_compensate(0) * (0.07 + pureAE * 0.8) --+ 0.12 
	PURE__ExpCalc_set_BypassExposure(exp)
	cbe_scaler = math.min(math.max(0,((pureAE - 0.065) * 12)),1)
	gamma_min = math.max(math.min(__IntD(1.8,1.2,0.95),1.45),1.2)--_min value adapts based on sunangle to normalise the perceived brightness level at different times of the year and allow fine tuning with respect to sun angle. outer values are the desired range, inner are wider to give more control
	gamma = math.min(math.lerp(gamma_min,1.8,from_twilight_compensate(0)*cbe_scaler),gamma_max)-- higher value than actual max used to widen curve. sun_compensate reduces boost range as sun goes down --+ (pureAE * 0.4 * night_compensate(0))
	ac.setPpTonemapGamma(gamma)
	ac.setPpTonemapFilmicContrast(0.1 + (0.3 * night_compensate(0)))--review. 0.5=none
	--ac.setPpTonemapFilmicContrast(0.1 + night_compensate_alt * 0.3)--review. 0.5=none
	ac.setPpColorGradingIntensity(math.max(0.01, 0.5 * sun_compensate(0.75) * from_twilight_compensate(0)))--may adjust

	--ac.setGlareBloomLuminanceGamma(math.lerp(1.7,1.1,exp*2))
	ac.setGlareBloomLuminanceGamma(math.lerp(1.9,1.4,math.min(exp+pureAE,1)))
	ac.setGodraysLength(__IntD(4,-2,0.4) * PURE__getGodraysModulator())

	ac.debug("gamma", string.format('%.3f', gamma))
	ac.debug("contrast", string.format('%.3f', ac.getPpContrast()))
	ac.debug("gamma_min", string.format('%.3f', gamma_min))
	ac.debug("exp", string.format('%.3f', exp))
	--ac.debug("exptest", string.format('%.3f', exptest))
	--ac.debug("weatherFix", string.format('%.3f', weatherFix))
	ac.debug("cbe_scaler", string.format('%.3f', cbe_scaler))
	ac.debug("pureAE", string.format('%.3f', pureAE))
end