function init_pure_script()
	__SCRIPT__setVersion(7.4)
	__SCRIPT__UI_SliderFloat("Contrast Day", 0.975, 0.96, 1.0)---maybe increase this or filmic a touch
	__SCRIPT__UI_SliderFloat("Gamma Day", 1.58, 1, 1.8)
	PURE__ExpCalc_set_Limits(.07,.5)
	PURE__use_SpectrumAdaption(true)
	PURE__use_VAOAdaption(true)
	PURE__ExpCalc_set_Target(1.3)--1.9
	--PURE__ExpCalc_set_Multiplier(1.2)--1
end

function update_pure_script(dt)
	ac.setPpTonemapFilmicContrast(0.25 + (0.25 * night_compensate(0)))
	PURE__ExpCalc_set_Sensitivity(1.5 + -1 * (from_twilight_compensate(0.5)))
	contrast_day = __SCRIPT__UI_getValue("Contrast Day")
	gamma_day = __SCRIPT__UI_getValue("Gamma Day")
	--ac.setPpContrast(1 - ((1-contrast_day) * from_twilight_compensate(0)))
	--ac.setPpContrast(1 - ((1-contrast_day) * sun_compensate(0)))
	ac.setPpContrast(1 - ((1-contrast_day) * day_compensate(0)))
	--ac.setPpTonemapGamma(1 + (gamma_day - 1	) * from_twilight_compensate(0))------------- get gamma to reduce a bit at night but not fully	
	ac.setPpTonemapGamma(gamma_day)	
	ac.setGlareBloomLuminanceGamma(0.85 + (0.75 * from_twilight_compensate(0)))----------refine depending on night exp value
	ac.debug("contrast", string.format('%.3f', ac.getPpContrast()))
	ac.debug("gamma", string.format('%.3f', ac.getPpTonemapGamma()))
	ac.debug("exp", string.format('%.3f', PURE__ExpCalc_get_final_exposure()))
end