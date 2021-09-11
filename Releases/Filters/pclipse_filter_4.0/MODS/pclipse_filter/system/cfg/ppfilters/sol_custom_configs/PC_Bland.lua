function init_sol_custom_config()

	-- reset customs to default
	ac.resetGodraysCustomColor()
	ac.resetGodraysCustomDirection()
	ac.resetWeatherStaticAmbient()
	ac.resetShadowsResolution()
	ac.resetShadowsSplits()
	ac.resetSpecularColor()
	ac.resetHorizonFogMultiplier()
	ac.resetGlowBrightness()
	ac.resetWeatherLightsMultiplier()
	ac.resetEmissiveMultiplier()

	ac.setCarExposureActive(false)
	ac.setAutoExposureLimits(0.35, 0.55)

	
	ac.setPpColorTemperatureK(7150)
	-- whitebalance is modulated by Sol if "ppfilter__modify_spectrum" is activated
	ac.setPpWhiteBalanceK(7050)
	ac.setPpSaturation(0.90)
	ac.setPpHue(362)
	ac.setPpSepia(0.04)
	ac.setPpTonemapGamma(0.85)
	ac.setPpTonemapFilmicContrast(0.60)
	--ac.setPpSaturation(0.98)
	ac.setPpContrast(0.96)
	ac.setPpBrightness( 1.0 * day_compensate(1.0) )

	ac.setWeatherFakeShadowOpacity(0.85)
	ac.setWeatherFakeShadowConcentrarion(0.65)

end
function update_sol_custom_config(dt)
		
--chad sky
	SOL__set_config("sky", "blue_preset", 8)
	SOL__set_config("nerd__sky_adjust", "Density", 0.95, true)
	SOL__set_config("sky", "blue_strength", 1.2)
	SOL__set_config("sky", "smog", 0.9)
	SOL__set_config("sky", "night__horizon_glow", 4.35)
	SOL__set_config("sky", "day__horizon_glow", 0.85)

	--graphics/reflections
	SOL__set_config("gfx", "reflections_saturation", 0.3)
	SOL__set_config("gfx", "reflections_brightness", 0.8)

	--garbage
		SOL__set_config("sun", "sky_bloom", 0.33)
		SOL__set_config("sun", "size", 1.7)
		SOL__set_config("nerd__clouds_adjust", "Saturation", 0.9, true)
		SOL__set_config("nerd__clouds_adjust", "Lit", 1.5, true)
		SOL__set_config("night", "effects_multiplier", 1.0)

		SOL__set_config("nerd__csp_lights_adjust", "bounced_day", 0.3)
		SOL__set_config("nerd__csp_lights_adjust", "bounced_night", 0.5)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_night", 2.1)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_day", 0.7)

end
