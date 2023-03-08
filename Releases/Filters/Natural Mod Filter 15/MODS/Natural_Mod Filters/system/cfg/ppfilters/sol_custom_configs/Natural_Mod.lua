function init_sol_custom_config()
	gamma_base = 1.42
	SOL__set_config("pp", "brightness_sun_link_only_interior", false)
	SOL__set_config("pp", "modify_glare", true)
	SOL__set_config("pp", "modify_godrays", false)
	SOL__set_config("csp_lights", "controlled_by_sol", true)
	SOL__set_config("sky", "smog", 0.2)
	SOL__set_config("moon", "casts_shadows", false)
	SOL__set_config("nerd__csp_lights_adjust", "emissive_day", 1.0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(20,20,20))
	ac.setPpContrast(1)
	ac.setPpSaturation(1)
end

function update_sol_custom_config(dt)
	ac.setPpTonemapExposure(0.36 + (0.09 *duskdawn_compensate(0)))
	ac.setPpTonemapGamma(gamma_base - (math.lerp(0, 0.15, weather__get_overcast()) * day_compensate(0)))--base - 0.15 if overcast daytime
	ac.setPpTonemapFilmicContrast(0.25 + (0.15 * night_compensate(0)))
	ac.setGodraysLength(__IntD(7,-2,0.4) * day_compensate(0))
	SOL__set_config("pp", "brightness_sun_link", (0.3 + (0.7 * night_compensate(0))))--0.3 day 1.0 night
	SOL__set_config("night", "brightness_adjust", 0.1, true)
	SOL__set_config("night", "moonlight_multiplier", 1.5, true)
	SOL__set_config("night", "starlight_multiplier", 0.25, true)
	SOL__set_config("nerd__stars_adjust", "Exponent", 0.8, true)
	SOL__set_config("nerd__csp_lights_adjust", "bounced_night", 1 + 0.6 * night_compensate(0), true)--adjust headlight brightness
end