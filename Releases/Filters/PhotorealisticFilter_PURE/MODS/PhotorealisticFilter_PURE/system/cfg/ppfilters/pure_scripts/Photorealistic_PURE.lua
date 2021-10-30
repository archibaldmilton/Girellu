function init_pure_script()	
	ac.resetCloudsLight()
	ac.resetEmissiveMultiplier()
	ac.resetGlowBrightness()
	ac.resetGodraysCustomColor()
	ac.resetGodraysCustomDirection()
	ac.resetHorizonFogMultiplier()
	ac.resetShadowsResolution()
	ac.resetShadowsSplits()
	ac.resetSpecularColor()
	ac.resetWeatherLightsMultiplier()
	ac.resetWeatherStaticAmbient()
end

function update_pure_script(dt)
	-- use this "curve" variable as a better gamma function
    curve = 1

    -- check for cloud shadows and adapt the curve for being in the shadow
    cloud_shadow = math.max(Pure_get_Overcast() , (1-ac.getCloudsShadow())) * sun_compensate(0)
    curve = curve * (1 + 0.75 * cloud_shadow)

    -- set tonemapping adaption / use this instead of gamma, to gain brightness
    --PURE__set_PP_Tonemapping_Curve(curve)


	local limit_low = 0.075
	local limit_high = 1
    ac.setAutoExposureLimits(limit_low, limit_high)
	
	
		
	ac.setGodraysCustomColor(Pure_get_LightSource_color() * 0.125)

	fog = Pure_get_Fog()
    fog = fog * fog
    ac.setGlareBloomLuminanceGamma(1.75 + 0.20 * fog)
    ac.setGlareThreshold(math.max(0, 3.5 - 3.0 * fog))
    ac.setGodraysLength(3 + 8*fog)
						
						
	ac.setReflectionsBrightness(1)
	--ac.setReflectionsSaturation(0.5)

	------------------------------------
	-- Dynamic ppfilter's .ini values --
	------------------------------------

	-- COLOR
	local hue = 0.3
	ac.setPpHue(hue)

	local saturation = 0.95
	ac.setPpSaturation(saturation)

	local gamma = 1.15
	ac.setPpTonemapGamma(gamma)
				
	local sepia = 0.05 * Pure_get_Overcast()
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
	local tm_function = 2
	ac.setPpTonemapFunction(tm_function)

	local tm_mapping_factor = 1
	ac.setPpTonemapMappingFactor(tm_mapping_factor)

	local tm_f_contrast = 0.3
	ac.setPpTonemapFilmicContrast(tm_f_contrast)


	-- DEBUG
	ac.debug("Auto Exposure: Limits", string.format("Low %.2f // High %.2f", limit_low, limit_high))
	ac.debug("Auto Exposure: Current Exp", string.format('%.2f', ac.getAutoExposure()))

	ac.debug("Auto Exposure: Pure Target", string.format('%.2f', Pure_get_AE_target()))

	ac.debug("Color: Hue", string.format("%.1f", ac.getPpHue()))
	ac.debug("Color: Saturation", string.format("%.f", ac.getPpSaturation()))
	ac.debug("Color: Color Temperature", string.format("%.f", ac.getPpColorTemperatureK()))
	ac.debug("Color: Brightness", string.format("%.f", ac.getPpBrightness()))
	ac.debug("Color: Sepia", string.format("%.f", ac.getPpSepia()))
	ac.debug("Color: White Balance", string.format("%.f", ac.getPpWhiteBalanceK()))

		if ac.getPpTonemapFunction() == 0 then
			ac.debug("Tonemapping: Function", "Default")
		elseif ac.getPpTonemapFunction() == 1 then
			ac.debug("Tonemapping: Function", "Linear")
		elseif ac.getPpTonemapFunction() == 2 then
			ac.debug("Tonemapping: Function", "Linear (saturation)")
		elseif ac.getPpTonemapFunction() == 3 then
			ac.debug("Tonemapping: Function", "Sensiometric")
		elseif ac.getPpTonemapFunction() == 4 then
			ac.debug("Tonemapping: Function", "Reinhard")
		elseif ac.getPpTonemapFunction() == 5 then
			ac.debug("Tonemapping: Function", "Reinhard (luminance)")
		elseif ac.getPpTonemapFunction() == 6 then
			ac.debug("Tonemapping: Function", "Logarithmic")
		elseif ac.getPpTonemapFunction() == 7 then
			ac.debug("Tonemapping: Function", "Logarithmic (luminance)")
		end
			
	ac.debug("Tonemapping: Exposure", string.format("%.2f", ac.getPpTonemapExposure()))
	ac.debug("Tonemapping: Mapping Factor", string.format("%.2f", ac.getPpTonemapMappingFactor()))
	ac.debug("Tonemapping: Gamma", string.format("%.2f", ac.getPpTonemapGamma()))
	ac.debug("Tonemapping: Filmic Contrast", string.format("%.f", ac.getPpTonemapFilmicContrast()))
end