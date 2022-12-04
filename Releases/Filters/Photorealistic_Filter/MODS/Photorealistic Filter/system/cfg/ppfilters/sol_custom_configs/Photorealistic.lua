-- define a LUT (Look Up Table) / The following one is for FOV depandency of Autoexposure
n = 1                  
local _l_FOV_LUT = {}
_l_FOV_LUT[n] = {  0, 0.00, 1.00 } n=n+1
_l_FOV_LUT[n] = { 30, 0.00, 1.00 } n=n+1
_l_FOV_LUT[n] = { 40, 0.15, 1.00 } n=n+1
_l_FOV_LUT[n] = { 50, 0.30, 1.00 } n=n+1
_l_FOV_LUT[n] = { 60, 0.40, 1.00 } n=n+1
_l_FOV_LUT[n] = { 70, 0.50, 1.00 } n=n+1
_l_FOV_LUT[n] = { 80, 0.57, 1.00 } n=n+1
_l_FOV_LUT[n] = { 90, 0.65, 1.00 } n=n+1
_l_FOV_LUT[n] = {180, 0.70, 1.00 } n=n+1
_l_FOV_LUT[n] = {360, 0.70, 1.00 } n=n+1

n = 1                  
local _l_AE_LIMIT_LUT = {}
_l_AE_LIMIT_LUT[n] = {  -90, 0.40, 	0.60 } n=n+1
_l_AE_LIMIT_LUT[n] = {  -12, 0.40, 	0.60 } n=n+1
_l_AE_LIMIT_LUT[n] = {   -9, 0.40,  0.60 } n=n+1
_l_AE_LIMIT_LUT[n] = {   -6, 0.40,  0.60 } n=n+1
_l_AE_LIMIT_LUT[n] = {   -3, 0.40,  0.60 } n=n+1
_l_AE_LIMIT_LUT[n] = {    0, 0.35,  0.50 } n=n+1
_l_AE_LIMIT_LUT[n] = {    5, 0.30,  0.45 } n=n+1
_l_AE_LIMIT_LUT[n] = {   15, 0.30,  0.40 } n=n+1
_l_AE_LIMIT_LUT[n] = {   90, 0.30,  0.40 } n=n+1

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

	--------------------------------
	--activate extra Sol functions
	--------------------------------

	-- Adaptive brightness (higher value = more brightness on dusk/dawn)
	SOL__set_config("pp", "brightness_sun_link", 1, true)
	
	-- Sol controlled PPFilter effects
	SOL__set_config("pp", "modify_glare", true)
	SOL__set_config("pp", "modify_godrays", true)
	SOL__set_config("pp", "modify_spectrum", true)
	
	SOL__set_config("pp", "brightness_sun_link_only_interior", false)

	-- Autoexposure
	SOL__set_config("ae", "use_self_calibrating", false) -- Don't use self calibrating AE, use the YEBIS AE
	SOL__set_config("ae", "alternate_ae_mode", 0) -- But neutralise it, to have custom access...
	
	-- Deactivate cars exposure multiplier
	ac.setCarExposureActive(false)
	
	-- Dazzle effect	
	SOL__set_config("sun", "dazzle_mix", 1)
	SOL__set_config("sun", "dazzle_strength", 0.01)
	SOL__set_config("sun", "dazzle_zenith_multi", 1)
	

	-- Clouds
	SOL__set_config("clouds", "movement_linked_to_time_progression", true)
			
	-- Sky
	SOL__set_config("sky", "blue_preset", 8)
	
end

local _l_camFOV = 60
local AE_backup = 0

-- this is called every frame
function update_sol_custom_config(dt)

	_l_camFOV = ac.getCameraFOV()
	
	-- speed of AE controlling
	-- If you like, modulate this for different situations
	local AE_reaction_speed = 1

	-- get cloud shadow state, prevent controlling in night
	local cloud_shadow_mod = weather__get_cloud_shadow() * sun_compensate(0)

	-- do the same controlling for cloud shadows and overcast
	local overcast = math.max(weather__get_overcast(), cloud_shadow_mod)

	-- get Autoexposure from Sol
	local AE_from_PP = weather__get_AE()
	if AE_from_PP < AE_backup then
		-- fast reaction to bright scenery
		AE_reaction_speed = AE_reaction_speed * 125
		AE_backup = math.lerp(AE_backup, AE_from_PP, math.min(1, AE_reaction_speed*dt))
	else
		-- slower reaction to adapt on dark scenery (like the process with rhodopsin in retina)
		AE_reaction_speed = AE_reaction_speed * 4
		AE_backup = math.lerp(AE_backup, AE_from_PP, math.min(1, AE_reaction_speed*dt))
	end

	local AE = AE_backup
	
	-- double the reflections amount to have a nice night look
	if ac.setReflectionEmissiveBoost then --check if function is present, for compatibility to older csp versions
		ac.setReflectionEmissiveBoost(from_twilight_compensate(2))
	end
	if ac.isVertexAoPatchApplied() then
		if ac.setVAOExponent then --check if function is present, for compatibility to older csp versions
			-- Set VAO exponent, according to the height of the sun
			-- If sun is realy high, VAO could be very contrasty to the sun litten track parts
			ac.setVAOExponent(0.5 + __IntD(0,0.65))
		end
	end
	

	local target_multi = SOL_filter__predict_interiorAE()
	-- get the result of the LUT / _l_camFOV acts as the index
	local _l_FOV_LUT_r = interpolate__plan(_l_FOV_LUT, nil, _l_camFOV)

	if ac.isInteriorView() == true then 
		-- try to set the exposure measurement area to the windscreen area and expand it for the night

		
		-- use the result to form the measuring area
		ac.setAutoExposureMeasuringArea(vec2(0,-0.04+0.06*night_compensate(0)),
										vec2(0.8-_l_FOV_LUT_r[1]*day_compensate(0),
											 0.7-_l_FOV_LUT_r[1]*from_twilight_compensate(0)))
											 
		target_multi = math.lerp(1, target_multi, from_twilight_compensate(0))

	else
		-- set the full exposure measurement area for extirior views
		ac.setAutoExposureMeasuringArea(vec2(0,0), vec2(1,1))	
		target_multi = 1	
	end

	-- adapt the AE target
	local target = math.max(0.05, -- never set this to 0 !
					( 0.35 -- daylight target value

					- __IntD(0.130, 0, 0.6) -- adapt AE to sunangle
					- 0.200*(1-from_twilight_compensate(0)) -- lower it for twilight time
					- 0.100*(1-day_compensate(0)) -- lower it for night
					-- all together will set the value for night
					-- 0.4 - 0.1(*1) - 0.1(*1) - 0.17(*1) = 0.03

					-- lower it for bad weather
					- 0.200*weather__get_badness()*day_compensate(0) 

					-- lower it a little bit in cloud shadows
					- 0.050*overcast
		
					-- raise it with fog, because fog makes the picture very bright and AE will start
					-- darken the picture, but we want to show bright fog !
					+ 0.100*weather__get_fog_dense()*from_twilight_compensate(0)
					))
	
	ac.setAutoExposureTarget(target * target_multi)
	
	local _l_AE_LIMIT_LUT_r = interpolate__plan(_l_AE_LIMIT_LUT)
	local limit_low	 = _l_AE_LIMIT_LUT_r[1]
	local limit_high = _l_AE_LIMIT_LUT_r[2]
	ac.setAutoExposureLimits(limit_low, limit_high)

	if SOL__config("csp_lights", "controlled_by_sol", true) then
		local CamOcclusion = 1
							- 0.75 * ac.getCameraOcclusion(vec3(0,1,0))
							- 0.25 * ac.getCameraLookOcclusion()
		
		local auto_bounced_light = math.min(1, math.pow(math.max(0, CamOcclusion), 1.5))
		--SOL__set_config("nerd__csp_lights_adjust", "emissive_day", (math.max(0, math.min(1, 0.65+0.75 * auto_bounced_light))))
		SOL__set_config("nerd__csp_lights_adjust", "bounced_day",  (math.max(0, math.min(1, 0.3+1.5 * auto_bounced_light))))
		
    end

	-- some multiplier to adapt exposure to the main light situations
	local exp_at_night = 1.0
	local exp_at_twilight = 1.0
	local exp_at_day = 1.0

	-- do not modify exposure with auto exposure, because it will start to wobble (self oscillation)
	local exp
	exp = (0.15 + 0.10*night_compensate(0)) * 1.5-- raise exposure with night
	exp = exp * math.lerp(math.lerp( exp_at_twilight, exp_at_day, sun_compensate(0)), exp_at_night, night_compensate(0))
	SOL_filter__set_exposure_base(exp)

	-- Different treatments depending on the cloud system
	if SOL__config("clouds", "render_method") == 0 then
		SOL__set_config("nerd__clouds_adjust", "Lit", 1  * (1 + 0.10*from_twilight_compensate(0)), true)
		SOL__set_config("nerd__clouds_adjust", "Contour", 2 - 0.5 * sun_compensate(0), true)
	else
		SOL__set_config("clouds", "opacity_multiplier", __IntD(0.5, 0.9, 0.7), true)
	end
		
	SOL__set_config("nerd__ambient_adjust", "Saturation", math.lerp(1, 0.5, 0.5*(weather__get_badness()
		+ 0.5* ac.getCloudsShadow() + __IntD(0.8,0.1,0.9))), true)
	SOL__set_config("nerd__ambient_adjust", "Level", 1, true)
	
	SOL__set_config("gfx", "reflections_saturation", 0.5, true)
	
	SOL__set_config("nerd__speculars_adjust", "Level", 1 - 0.1 * sun_compensate(0), true)
		
	
	-- Custom sky preset	
	SOL__custom_sky_preset.hue = 0
	SOL__custom_sky_preset.saturation = 1 + 0.1 * sun_compensate(0)
	SOL__custom_sky_preset.level = 1.25 - 0.25 * sun_compensate(0)
	SOL__custom_sky_preset.atmosphere_color = hsv(30+15*sun_compensate(0), 1.0-0.5*sun_compensate(0), __IntD(-0.2, 2.5, 0.5)):toRgb()*day_compensate(0)*0.1
	SOL__custom_sky_preset.booster = 0.5
	--SOL__custom_sky_preset.cloud_adaption = 1 - 0.5 * sun_compensate(0)
	--SOL__custom_sky_preset.cloud_opacity = __IntD(0.5, 0.9, 0.7)
	--SOL__custom_sky_preset.cloud_level = night_compensate(0.975) - 0.1 * weather__get_overcast()
	--SOL__custom_sky_preset.cloud_saturation = 1
	--SOL__custom_sky_preset.cloud_saturation_limit = 1.2


	------------------------------------
	-- Dynamic ppfilter's .ini values --
	------------------------------------
	local hue = 1
	ac.setPpHue(hue)

	local saturation = 0.85
	ac.setPpSaturation(saturation)

	local gamma = 1.15
	ac.setPpTonemapGamma(gamma)
				
	local sepia = 0.05 * weather__get_overcast()
		* from_twilight_compensate(0)
	ac.setPpSepia(sepia)
	
	local brightness = 1
	ac.setPpBrightness(brightness)

	local contrast = 1
	ac.setPpContrast(contrast)
	
	local white_balance = 6250
	ac.setPpWhiteBalanceK(white_balance)

	local color_temp = 6500
		* dawn_exclusive(0.975)
		* dusk_exclusive(0.95)
	ac.setPpColorTemperatureK(color_temp)


	-- TONEMAPPING	
	local tm_exp = 0.4 + 0.1 * night_compensate(0)
	ac.setPpTonemapExposure(tm_exp)
	
	-- Adapt fake shadow
	--ac.setWeatherFakeShadowOpacity(0.85 + (0.30) * sun_compensate(0))
	--ac.setWeatherFakeShadowConcentrarion(0.75 + 0.25 * day_compensate(0) - (0.65) * sun_compensate(0))


	-----------------------
	-- Debug information --
	-----------------------	
	if SOL__config("debug", "custom_config") == true then
		ac.debug("CC lights", string.format('%.2f', SOL__config("csp_lights", "multiplier")))
    	ac.debug("AE status", ac.getPpAutoExposureEnabled())
		ac.debug("PPF: AE Target", string.format('%.2f', target))
		ac.debug("PPF: AE Limits", string.format('Low %.2f, High %.2f', limit_low, limit_high))
		ac.debug("PPF: AE Calculation", string.format('%.2f', ac.getAutoExposure()))
		ac.debug("PPF: AE Final Exposure", string.format('%.2f', exp))
		ac.debug("PPF: Hue", string.format('%.2f', ac.getPpHue()))
		ac.debug("PPF: Saturation", string.format('%.2f', ac.getPpSaturation()))
		ac.debug("PPF: Contrast", string.format('%.2f', ac.getPpContrast()))
		ac.debug("PPF: Color Temp K", string.format('%.2f', ac.getPpColorTemperatureK()))
		ac.debug("PPF: White Balance K", string.format('%.2f', ac.getPpWhiteBalanceK()))
		ac.debug("PPF: Brightness", string.format('%.2f', ac.getPpBrightness()))
		ac.debug("PPF: Sepia", string.format('%.2f', ac.getPpSepia()))
		ac.debug("PPF: Tonemapping Gamma", string.format('%.2f', ac.getPpTonemapGamma()))
		ac.debug("PPF: Tonemapping Exposure", string.format('%.2f', ac.getPpTonemapExposure()))	
			if ac.getPpTonemapFunction() == -1 then
				ac.debug("PPF: Tonemapping Function", "Default")
			elseif ac.getPpTonemapFunction() == 0 then
				ac.debug("PPF: Tonemapping Function", "Linear")
			elseif ac.getPpTonemapFunction() == 1 then
				ac.debug("PPF: Tonemapping Function", "Linear (saturation)")
			elseif ac.getPpTonemapFunction() == 2 then
				ac.debug("PPF: Tonemapping Function", "Sensiometric")
			elseif ac.getPpTonemapFunction() == 3 then
				ac.debug("PPF: Tonemapping Function", "Reinhard")
			elseif ac.getPpTonemapFunction() == 4 then
				ac.debug("PPF: Tonemapping Function", "Reinhard (luminance)")
			elseif ac.getPpTonemapFunction() == 5 then
				ac.debug("PPF: Tonemapping Function", "Logarithmic")
			elseif ac.getPpTonemapFunction() == 6 then
				ac.debug("PPF: Tonemapping Function", "Logarithmic (luminance)")
			end	

		ac.debug("SOL: Sky", string.format('Hue %.2f, Sat %.2f, Lev %.2f', SOL__custom_sky_preset.hue, SOL__custom_sky_preset.saturation, SOL__custom_sky_preset.level))
		ac.debug("SOL: Sun", string.format('Hue %.2f, Sat %.2f, Lev %.2f', SOL__config("nerd__sun_adjust", "ls_Hue"), SOL__config("nerd__sun_adjust", "ls_Saturation"), SOL__config("nerd__sun_adjust", "ls_Level")))
		ac.debug("SOL: Amb", string.format('Hue %.2f, Sat %.2f, Lev %.2f', SOL__config("nerd__ambient_adjust", "Hue"), SOL__config("nerd__ambient_adjust", "Saturation"), SOL__config("nerd__ambient_adjust", "Level")))
		ac.debug("SOL: Clouds Opacity", string.format('%.2f', SOL__config("clouds", "opacity_multiplier")))
    	ac.debug("SOL: Clouds Lit", string.format('%.2f', SOL__config("nerd__clouds_adjust", "Lit")))
    	ac.debug("SOL: Clouds Contour", string.format('%.2f', SOL__config("nerd__clouds_adjust", "Contour")))
		ac.debug("SOL: Sky Smog", string.format('%.2f', SOL__config("sky", "smog")))
		ac.debug("SOL: Reflections", string.format('Sat %.2f, Bright %.2f', SOL__config("gfx", "reflections_saturation"), SOL__config("gfx", "reflections_brightness")))
		ac.debug("SOL: Lights Day", string.format('Bounced %.2f, Emissive %.2f', SOL__config("nerd__csp_lights_adjust", "bounced_day"), SOL__config("nerd__csp_lights_adjust", "emissive_day")))
		ac.debug("SOL: Clouds Method", string.format('%.2f', SOL__config("clouds", "render_method")))
	end
end