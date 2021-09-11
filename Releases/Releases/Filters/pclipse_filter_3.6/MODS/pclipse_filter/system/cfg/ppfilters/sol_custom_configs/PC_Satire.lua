function init_sol_custom_config()
	SOL__set_config("pp", "modify_glare", true)
	SOL__set_config("pp", "modify_godrays", true)
	SOL__set_config("pp", "modify_spectrum", false)
	SOL__set_config("pp", "godrays_singlescreen", true)
	SOL__set_config("pp", "brightness_sun_link", 0.3)
	SOL__set_config("csp_lights", "controlled_by_sol", true)
	SOL__set_config("csp_lights", "multiplier", 1.50)

	-- Autoexposure
	SOL__set_config("ae", "use_self_calibrating", true)
	SOL__set_config("ae", "alternate_ae_mode", 1)

    -- Dazzle effect
	SOL__set_config("sun", "dazzle_mix", 1)
	SOL__set_config("sun", "dazzle_strength", 0.1)
	SOL__set_config("sun", "dazzle_zenith_multi", 1)

	--chad sky
	SOL__set_config("sky", "blue_preset", 8)
	SOL__set_config("nerd__sky_adjust", "Density", 0.95, true)
	SOL__set_config("sky", "blue_strength", 1.2)
	SOL__set_config("sky", "smog", 0.9)
	SOL__set_config("sky", "night__horizon_glow", 4.35)
	SOL__set_config("sky", "day__horizon_glow", 0.85)
	
	--clouds
	SOL__set_config("clouds", "movement_linked_to_time_progression", true)	

	--graphics/reflections
	SOL__set_config("gfx", "reflections_saturation", 0.3)
	SOL__set_config("gfx", "reflections_brightness", 0.7)

	--night
	SOL__set_config("night", "brightness_adjust", 1.0)
	SOL__set_config("night", "moonlight_multiplier", 0.525)
	SOL__set_config("moon", "casts_shadows", true)

	--ambient
	SOL__set_config("ambient", "sun_color_balance", 0.45)
	SOL__set_config("ambient", "AO_visibility", 0.8)

end
function update_sol_custom_config()
		--garbage
		SOL__set_config("sun", "sky_bloom", 0.33)
		SOL__set_config("sun", "size", 1.7)
		SOL__set_config("nerd__clouds_adjust", "Saturation", 0, true)
		SOL__set_config("nerd__clouds_adjust", "Lit", 1.6, true)
		SOL__set_config("night", "effects_multiplier", 1.2)
		--custom sky
		SOL__set_config("nerd__sky_adjust", "Hue", -0.395, true)
		SOL__set_config("nerd__sky_adjust", "Saturation", 1.2, true)
		SOL__set_config("nerd__sky_adjust", "Level", 0.95, true)
		SOL__custom_sky_preset.booster = sun_compensate(1) -- 1 while day / 0.5 with sunset
		SOL__set_config("clouds", "opacity_multiplier", 0.3)	
		SOL__set_config("clouds", "shadow_opacity_multiplier", 0.1)
		SOL__set_config("nerd__clouds_adjust", "Saturation", 0.5)
		SOL__set_config("nerd__clouds_adjust", "Saturation_limit", 1.0)

		SOL__set_config("nerd__csp_lights_adjust", "bounced_day", 0.2)
		SOL__set_config("nerd__csp_lights_adjust", "bounced_night", 1.3)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_night", 2.1)
		SOL__set_config("nerd__csp_lights_adjust", "emissive_day", 0.7)


		SOL__set_config("nerd__fog_custom_distant_fog", "use", true)
		SOL__set_config("nerd__fog_custom_distant_fog", "distance", 14000)
		SOL__set_config("nerd__fog_custom_distant_fog", "blend", 0.75+0.15*from_twilight_compensate(0))
		SOL__set_config("nerd__fog_custom_distant_fog", "density", 1.25)
		SOL__set_config("nerd__fog_custom_distant_fog", "exponent", 0.80+0.50*from_twilight_compensate(0))
		SOL__set_config("nerd__fog_custom_distant_fog", "backlit", 0.05)
		SOL__set_config("nerd__fog_custom_distant_fog", "sky", -0.5*from_twilight_compensate(0))
		SOL__set_config("nerd__fog_custom_distant_fog", "night", 0.00)
		SOL__set_config("nerd__fog_custom_distant_fog", "Hue", 230)
		SOL__set_config("nerd__fog_custom_distant_fog", "Saturation", 0.50+0.05*from_twilight_compensate(0))
		SOL__set_config("nerd__fog_custom_distant_fog", "Level", 2.5+0.2*from_twilight_compensate(0))
		

	if sol__debug__custom_config == true then


	end

local gamma = 1.1
		- (0.06 * weather__get_overcast())
		+ (0.075 * weather__get_cloud_shadow())
	ac.setPpTonemapGamma(gamma)


	--ppfilter + dynamics
	SOL__set_config("nerd__speculars_adjust","Level",1.2)
	SOL__set_config("pp", "brightness_sun_link", 0.3)
	ac.setPpTonemapFilmicContrast(0.90)
	SOL__set_config("pp", "contrast", 0.98)
	ac.setPpBrightness( 0.75 * day_compensate(2.6) )
	SOL__set_config("pp", "saturation", 0.92)
	ac.setExtraAsphaltReflectionsMultiplier(6.5)

end
