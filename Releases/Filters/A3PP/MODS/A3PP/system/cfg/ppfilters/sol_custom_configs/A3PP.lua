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
	
--
	-- Do not change
sol__debug__custom_config = true
ppfilter__modify_glare = false
ppfilter__modify_godrays = false
ppfilter__modify_spectrum = false
	ac.setPpWhiteBalanceK(6800)
	ac.setPpColorTemperatureK(6700)
	
	day_headlights=false
	-- Set this to false if you want headlights disabled at day
	if day__headlights == true then
		--headlights__if_ambient_light_is_under = 18.00
	end


	-- You can tweak these here. Use sliders in A3PP config app
	-- P.S: commented lines are disabled
	
ppfilter__brightness_sun_link = 0.00
global_CSP_lights_controlled_by_sol = true
bounced_light_occlusion = true

nerd__fog_use_custom_distant_fog = true

night__moonlight_multiplier = 0

gfx__reflections_saturation = 0.5

sky__blue_preset = 8

night__horizon_glow = 2.00


nerd__sky_adjust_Saturation = 1.02

nerd__sky_adjust_InputYOffset = 0.05

--
nerd__stars_adjust_Saturation = 2
nerd__stars_adjust_Exponent = 1.07
--

nerd__sun_adjust_ls_Level = 0.80

--
nerd__clouds_adjust_Lit = 0.9
--

--nerd__csp_lights_emissive_day = 0.6
--nerd__csp_lights_bounced_day = 1

----night__brightness_adjust = 1.00 
--
--pp_contrast_night = 1.0
pp_brightness_max = 1.89
pp_brightness_min = 0.75
pp_saturation_max = 0.85
pp_saturation_min = 0.8
nerd__ambient_adjust_level_max = 1.86
nerd__ambient_adjust_level_min = 1.8
nerd__ambient_adjust_saturation_max = 1 --1
nerd__ambient_adjust_saturation_min = 0.5 --0.85
--nerd__sky_adjust_saturation_max = 1.2
--nerd__sky_adjust_saturation_min = 0.2
--nerd__sky_adjust_hue_max = 1.5
--nerd__sky_adjust_hue_min = 1
--
SOL__set_config("debug", "custom_config", sol__debug__custom_config) 

SOL__set_config("pp", "modify_glare", ppfilter__modify_glare) 
SOL__set_config("pp", "modify_godrays", ppfilter__modify_godrays) 
SOL__set_config("pp", "modify_spectrum", ppfilter__modify_spectrum) 
SOL__set_config("pp", "brightness_sun_link", ppfilter__brightness_sun_link) 

SOL__set_config("csp_lights", "controlled_by_sol", global_CSP_lights_controlled_by_sol) 

SOL__set_config("night", "moonlight_multiplier", night__moonlight_multiplier) 

--SOL__set_config("nerd__ambient_adjust", "Level", nerd__ambient_adjust_Level) 

SOL__set_config("gfx", "reflections_saturation", gfx__reflections_saturation) 

SOL__set_config("sky", "blue_preset", sky__blue_preset) 
SOL__set_config("sky", "night__horizon_glow", night__horizon_glow) 

SOL__set_config("nerd__sky_adjust", "Saturation", nerd__sky_adjust_Saturation) 
SOL__set_config("nerd__sky_adjust", "InputYOffset", nerd__sky_adjust_InputYOffset) 

SOL__set_config("nerd__stars_adjust", "Saturation", nerd__stars_adjust_Saturation) 
SOL__set_config("nerd__stars_adjust", "Exponent", nerd__stars_adjust_Exponent)

SOL__set_config("nerd__sun_adjust", "ls_Level", nerd__sun_adjust_ls_Level) 

SOL__set_config("nerd__clouds_adjust", "Lit", nerd__clouds_adjust_Lit) 

--SOL__set_config("nerd__csp_lights_adjust", "emissive_day", nerd__csp_lights_emissive_day)
--SOL__set_config("nerd__csp_lights_adjust", "bounced_day", nerd__csp_lights_bounced_day)

SOL__set_config("nerd__fog_custom_distant_fog", "use", nerd__fog_use_custom_distant_fog) 
end

function update_sol_custom_config()
	-- This will be called every frame
	-- If you want to dynamically change value, do this here.

	-- Please, whatever you do here, do it advisedly. You can mess up everything here.

	--[[  You can use this weatherFX functions to set PP Filter values:

		ac.setGodraysLength(v)
		ac.setGodraysGlareRatio(v)
		ac.setGodraysAngleAttenuation(v)
		ac.setGodraysNoiseFrequency(v)
		ac.setGodraysNoiseMask(v)
		ac.setGodraysDepthMapThreshold(v)
		ac.setGlareThreshold(v)
		ac.setGlareBloomFilterThreshold(v)
		ac.setGlareStarFilterThreshold(v)
		ac.setPpColorTemperatureK(v)
		ac.setPpWhiteBalanceK(v)
		ac.setPpHue(v)
		ac.setPpSepia(v)
		ac.setPpSaturation(v)
		ac.setPpBrightness(v)
		ac.setPpContrast(v)
		ac.setPpTonemapFunction(int v)
		ac.setPpTonemapExposure(v)
		ac.setPpTonemapGamma(v)
		ac.setPpTonemapMappingFactor(v)
		ac.setPpTonemapFilmicContrast(v)
	]]
	--##############################################################################################
	--[[  This are some functions, to create dependencies to the sunangle
		
		The compensate function returning the given value or 1 (its mainly used as an multiplicator)

		- transition between v and 1 is with sunangles between -6° and -12°
		day_compensate(v)   - returns 1 while day | v while night
		night_compensate(v) - returns 1 while night | v while day

		- transition between v and 1 is with sunangles between +3° and -6°
		from_twilight_compensate(v)  - returns 1 while day | v while night

		- transition between v and 1 is with sunangles between +6° and 0°
		sun_compensate(v)   - returns 1 with sun | v when sun is < 0°

		- transition between v and 1 is with sunangles between +10° and -11°
		duskdawn_compensate(v)  - returns 1 while dusk or dawn


		E.g.
		"Boost PP Brightness in the night"

		1. Method:
		ac.setPpBrightness( 1.14 * day_compensate(1.1) )

		Brightness will then be 1.14 at day and 1.254 at night


		2. Method (using math.lerp):
		ac.setPpBrightness( math.lerp( 1.254, 1.14, day_compensate(0) ) )
	]]
	--##############################################################################################
	--[[  You can request the main weather modulators
		weather__get_fog_dense()
		weather__get_overcast() 
		weather__get_badness()

		E.g.
		"Boost PP Brightness with bad weather"

		1. Method (using math.lerp):
		ac.setPpBrightness( math.lerp( 1.0, 1.2, weather__get_badness() ) )
	]]

	-- These lines are too complex for daily tweaking. You can call this a NERDS section

	--__weather_defs[ac.getConditionsSet().currentType+1]["inair_material"]  = { color=hsv(205, 0.8, 0.00), dense=0.53, granulation = 0.3 }
	--if old ~= ac.getConditionsSet().currentType+1 then
	--	old = ac.getConditionsSet().currentType+1
	--	local sat = __weather_defs[ac.getConditionsSet().currentType+1]["inair_material"].color.s
	--	local dense = __weather_defs[ac.getConditionsSet().currentType+1]["inair_material"].dense
	--	__weather_defs[ac.getConditionsSet().currentType+1]["inair_material"].color.s = math.lerp(0.5, 0.8, 1+sat)
	--	--__weather_defs[ac.getConditionsSet().currentType+1]["inair_material"].color.v = 0
	--	__weather_defs[ac.getConditionsSet().currentType+1]["inair_material"].dense = math.lerp(0.1, 0.5, 1-dense)
	--end

	--exp = math.lerp(0.40, 0.55, day_compensate(0)) - (0.3 * math.pow(weather__get_ambient_brightness() / 20, 1.5))
	--ac.setPpTonemapExposure(exp)

	SOL__custom_sky_preset.hue = 0.4* sun_compensate(0)
	SOL__custom_sky_preset.booster = 0.1
	SOL__custom_sky_preset.saturation = 0.74+0.1*sun_compensate(0)+0.05*from_twilight_compensate(0)
	SOL__custom_sky_preset.level = 1.4-1.15*night_compensate(0)-0.15*duskdawn_compensate(0)
	SOL__custom_sky_preset.atmosphere_color= hsv(30+15*sun_compensate(0), 1.0-0.5*sun_compensate(0), __IntD(-0.2, 2.5, 0.5)):toRgb()*day_compensate(0)*0.1
	SOL__custom_sky_preset.cloud_adaption = 1 - 0.50 * sun_compensate(0)
	--SOL__custom_sky_preset.cloud_opacity = night_compensate(0.8) -- 0.8 while day / 1.0 for night
	SOL__custom_sky_preset.cloud_level = night_compensate(0.975)
	--SOL__custom_sky_preset.cloud_saturation = 1
	--SOL__custom_sky_preset.cloud_saturation_limit = 1
	
	SOL__set_config("nerd__fog_custom_distant_fog", "distance", 25000) 
	SOL__set_config("nerd__fog_custom_distant_fog", "blend", 0.85+0.15*from_twilight_compensate(0)) 
	SOL__set_config("nerd__fog_custom_distant_fog", "density", 1.75) 
	SOL__set_config("nerd__fog_custom_distant_fog", "exponent", 0.80+0.50*from_twilight_compensate(0)) 
	SOL__set_config("nerd__fog_custom_distant_fog", "backlit", 0.05) 
	SOL__set_config("nerd__fog_custom_distant_fog", "sky", -0.5*from_twilight_compensate(0)) 
	SOL__set_config("nerd__fog_custom_distant_fog", "night", 0.00) 
	SOL__set_config("nerd__fog_custom_distant_fog", "Hue", 230) 
	SOL__set_config("nerd__fog_custom_distant_fog", "Saturation", 0.50+0.05*from_twilight_compensate(0)) 
	SOL__set_config("nerd__fog_custom_distant_fog", "Level", 2.5+0.2*from_twilight_compensate(0)) 
	
	--gfx__reflections_brightness = 0.6 + day_compensate(1) 

	--ac.setPpContrast(night_compensate(pp_contrast_night))
	--ac.setPpTonemapGamma(0.2 + day_compensate(1.1))
	ac.setPpBrightness(math.lerp(pp_brightness_min, pp_brightness_max, 0.14 *( night_compensate( 8 * weather__get_badness() - 0.2 * ac.getCloudsShadow()) + from_twilight_compensate(6))))
	--ac.setPpColorTemperatureK(math.max(6700, 6700*__IntD(0.95, 1, 0.2)*night_compensate(-0.01*weather__get_overcast()+0.01*ac.getCloudsShadow()+0.99)))--*__IntD(1.1,1,0.4))
	SOL__set_config("nerd__ambient_adjust", "Saturation", math.lerp(nerd__ambient_adjust_saturation_max, nerd__ambient_adjust_saturation_min, 0.5*(weather__get_badness() + 0.5* ac.getCloudsShadow() + __IntD(0.8,0.1,0.9))))

	--nerd__clouds_adjust.Lit = math.lerp(0.75, 0.65, -0.0125*duskdawn_compensate(0)) + __IntD(0.1, 0, 0.1)
	--clouds__opacity_multiplier = __IntD(0.7, 0.9, 0.4) + night_compensate(0)*0.6
	if ac.isVertexAoPatchApplied() then
		if ac.setVAOExponent then --check if function is present, for compatibility to older csp versions
			-- Set VAO exponent, according to the height of the sun
			-- If sun is realy high, VAO could be very contrasty to the sun litten track parts
			ac.setVAOExponent(0.4 + __IntD(0,0.65))
		end
	end

	
	--night__moonlight_multiplier = day_compensate(0)
	--sun__sky_bloom = 0.67* __IntD(0.0,1.0,0.9)
	--nerd__sun_adjust.ap_MieExp = __IntD(0.0,1.0,0.9)
	--nerd__sun_adjust.ls_Hue = __IntD(0.8,0.7,0.3)
	ac.setPpSaturation(math.lerp(pp_saturation_max, pp_saturation_min, __IntD(0.95,0,0.8)))
	--ac.setGodraysAngleAttenuation(20 * (50* weather__get_badness() + day_compensate(50)))
	--ac.setGodraysAngleAttenuation(20 * __IntN(50,__IntD(100,1,0.4),10))
	--nerd__ambient_adjust.Level = math.lerp(0.6, 0.7, weather__get_badness() )
	SOL__set_config("nerd__ambient_adjust", "Level", __IntD(nerd__ambient_adjust_level_max, nerd__ambient_adjust_level_min, 0.9)- day_compensate(0) *0.65*(0.3*weather__get_badness()+weather__get_overcast()+0.5*(1-ac.getCloudsShadow())))
	--nerd__sun_adjust.ap_Saturation = math.lerp(1.01, 1.051, __IntD(1,0,9))
	--nerd__sun_adjust.ls_Level = 0.89+2*duskdawn_compensate(0.01)

	--nerd__sky_adjust.Hue = __IntD(nerd__sky_adjust_hue_max, nerd__sky_adjust_hue_min, 0.5)
	--nerd__sky_adjust.Saturation = nerd__sky_adjust_saturation_min * sun_compensate(nerd__sky_adjust_saturation_max)

	if sol__debug__custom_config == true then
		--ac.debug("CC lights", string.format('%.2f', global_CSP_lights_multi) )
		ac.debug("A3PP: Badness", string.format('%.2f', weather__get_badness()))
		ac.debug("A3PP: Overcast", string.format('%.2f', weather__get_overcast()))
		ac.debug("A3PP: Ambient saturation", string.format('%.2f', SOL__config("nerd__ambient_adjust", "Saturation")))
    	ac.debug("A3PP: Moon multiplier", string.format('%.2f', SOL__config("night", "moonlight_multiplier")))
    	ac.debug("A3PP: Ambient level", string.format('%.2f', SOL__config("nerd__ambient_adjust", "Level")))
    	ac.debug("A3PP: Cloud lit", string.format('%.2f', SOL__config("nerd__clouds_adjust", "Lit")))
		ac.debug("A3PP: Sun light level", string.format('%.2f', SOL__config("nerd__sun_adjust", "ls_Level")))
		ac.debug("A3PP: Cloud opacity", string.format('%.2f', SOL__config("clouds", "opacity_multiplier")))
		ac.debug("A3PP: Sun light sat", string.format('%.2f', SOL__config("nerd__sun_adjust", "ls_Saturation")))
		ac.debug("A3PP: Sun light hue", string.format('%.2f', SOL__config("nerd__sun_adjust", "ls_Hue")))
		ac.debug("A3PP: Sky sat", string.format('%.2f', SOL__config("nerd__sky_adjust", "Saturation")))
		ac.debug("A3PP: Sky hue", string.format('%.2f', SOL__config("nerd__sky_adjust", "Hue")))
		--ac.debug("A3PP: Sun app sat", string.format('%.2f', nerd__sun_adjust.ap_Saturation))
		--ac.debug("A3PP: Sun app mie", string.format('%.2f', nerd__sun_adjust.ap_MieExp))
		ac.debug("A3PP: Sun bloom", string.format('%.2f', SOL__config("sun", "sky_bloom")))
		ac.debug("A3PP: PP saturation", string.format('%.2f', ac.getPpSaturation()))
		ac.debug("A3PP: PP brightness", string.format('%.2f', ac.getPpBrightness()))
		ac.debug("A3PP: PP contrast", string.format('%.2f', ac.getPpContrast()))
		ac.debug("A3PP: PP gamma", string.format('%.2f', ac.getPpTonemapGamma()))
		ac.debug("A3PP: PP K", string.format('%.2f', ac.getPpColorTemperatureK()))
		ac.debug("A3PP: Cloud shadows", string.format('%.2f', ac.getCloudsShadow()))
    end
end

function update_sol_custom_config__every_frame(dt)
	if global_CSP_lights_controlled_by_sol == true and bounced_light_occlusion == true then
		CamOcclusion = 1 - 0.75*ac.getCameraOcclusion(vec3(0,1,0)) - 0.25*ac.getCameraLookOcclusion()
		local auto_bounced_light = math.min(1, math.pow(math.max(0, CamOcclusion), 1.5))
		--SOL__set_config("nerd__csp_lights_adjust", "emissive_day", (math.max(0, math.min(1, 0.0+1.0 * auto_bounced_light))))
		SOL__set_config("nerd__csp_lights_adjust", "bounced_day",  (math.max(0, math.min(1, 0.3+1.5 * auto_bounced_light+0.5*weather__get_overcast()))))
		if sol__debug__custom_config == true then
			ac.debug("A3PP: Camera Occlusion", string.format('%.2f', CamOcclusion))
		end
    end
end