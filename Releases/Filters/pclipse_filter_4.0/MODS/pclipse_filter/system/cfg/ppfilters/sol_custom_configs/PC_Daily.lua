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
	ac.setAutoExposureLimits(0.25, 0.45)

	
	ac.setPpColorTemperatureK(5550)
	-- whitebalance is modulated by Sol if "ppfilter__modify_spectrum" is activated
	ac.setPpWhiteBalanceK(7050)
	ac.setPpSaturation(0.94)
	ac.setPpHue(362)
	ac.setPpSepia(0.04)
	ac.setPpTonemapGamma(1.10)
	ac.setPpTonemapFilmicContrast(0.60)
	--ac.setPpSaturation(0.98)
	ac.setPpContrast(0.97)
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

		SOL__set_config("nerd__csp_lights_adjust", "bounced_day", 0.3)
		SOL__set_config("nerd__csp_lights_adjust", "bounced_night", 0.5)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_night", 2.1)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_day", 0.7)

	--garbage
		SOL__set_config("sun", "sky_bloom", 0.33)
		SOL__set_config("sun", "size", 1.7)
		SOL__set_config("nerd__clouds_adjust", "Saturation", 0.9, true)
		SOL__set_config("nerd__clouds_adjust", "Lit", 1.5, true)
		SOL__set_config("night", "effects_multiplier", 1.0)

		if ac.isInteriorView() == true then 
		--interior
		
		--better brightness adaption for better driving visibility
		--ppfilter__brightness_sun_link = sun_link * 1.25
		SOL__set_config("pp", "brightness_sun_link", 1.45, true)

		--more contrast to prevent an overbright cockpit
		ac.setPpTonemapFilmicContrast(0.00 + 0.65*from_twilight_compensate(0))
		--more gamma for a better driving visibility
		ac.setPpTonemapGamma(1.25)

		--reduce brightness a bit for nighttimes
		--mainly to prevent too bright HUD and instruments, gamma is enough to compensate it.
		ac.setPpBrightness(0.76*day_compensate(1.3))

		ac.setPpContrast(0.97)
	else
		--exterior

		--set to normal brightness adaption
		SOL__set_config("pp", "brightness_sun_link", 1.00, true)

		--set a moderate contrast
		ac.setPpTonemapFilmicContrast(0.00 + 0.3*from_twilight_compensate(0))
		--set a moderate gamma, but not for nighttimes
		ac.setPpTonemapGamma(night_compensate(1.30))

		--do more brightness in nighttimes
		ac.setPpBrightness( 1.0 * day_compensate(1.5) )

		ac.setPpContrast(0.98 + 0.04 * from_twilight_compensate(0))
	end
end
