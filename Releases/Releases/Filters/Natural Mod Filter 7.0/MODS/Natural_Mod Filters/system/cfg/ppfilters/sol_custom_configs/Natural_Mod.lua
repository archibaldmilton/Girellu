function init_sol_custom_config()
	gamma_base = 1.45
	ac.setPpTonemapExposure(0.36)
	contrast_day = 0.98--set value for day here. value at night will always be 1.0. Probably want to set this to 1.0 for displays with poor black level
	SOL__set_config("csp_lights", "controlled_by_sol", true)
	SOL__set_config("nerd__csp_lights_adjust", "emissive_day", 1.0)
	SOL__set_config("pp", "modify_glare", true)
	SOL__set_config("pp", "modify_godrays", true)
	SOL__set_config("sun", "dazzle_mix", 0.5)
	SOL__set_config("sky", "smog", 0.6)
	SOL__set_config("ambient", "sun_color_balance", 0.9)
	SOL__set_config("moon", "casts_shadows", false)
	SOL__set_config("pp", "brightness_sun_link_only_interior", false)
end

function update_sol_custom_config()
	ac.setPpTonemapGamma(gamma_base - (math.lerp(0, 0.15, weather__get_overcast()) * day_compensate(0)))--base - 0.15 if overcast daytime
	ac.setPpTonemapFilmicContrast(0.2 + (0.3 * night_compensate(0)))--0.2 day 0.5 night
	ac.setPpContrast(1 - ((1-contrast_day) * from_twilight_compensate(0)))
	SOL__set_config("nerd__sun_adjust", "ls_Level", 1 - (0.1 * sun_compensate(0)), true)--0.9 day, 1.0 sunset
	SOL__set_config("nerd__sun_adjust", "ls_Saturation", 1.2 - (0.2 * sun_compensate(0)), true)--1.0 day, 1.2 sunset
	SOL__set_config("pp", "brightness_sun_link", (0.3 + (0.7 * night_compensate(0))))--0.3 day 1.0 night
	SOL__set_config("night", "brightness_adjust", 0.3, true)
	SOL__set_config("night", "starlight_multiplier", 0.4, true)
	SOL__set_config("nerd__stars_adjust", "Exponent", 0.5, true)
end