function getppfilter()
	-- debug

	-- color
		ac.debug("Color: Hue", string.format("%.1f", ac.getPpHue()))
		ac.debug("Color: Saturation", string.format("%.f", ac.getPpSaturation()*100))
		ac.debug("Color: Color Temperature", string.format("%.f", ac.getPpColorTemperatureK()))
		ac.debug("Color: Brightness", string.format("%.f", ac.getPpBrightness()*100))
		ac.debug("Color: Sepia", string.format("%.f", ac.getPpSepia()*100))
		ac.debug("Color: White Balance", string.format("%.f", ac.getPpWhiteBalanceK()))

	-- tonemapping
		ac.debug("Tonemapping: Function", ac.getPpTonemapFunction())
		ac.debug("Tonemapping: Exposure", string.format("%.2f", ac.getPpTonemapExposure()))
		ac.debug("Tonemapping: Mapping Factor", string.format("%.2f", ac.getPpTonemapMappingFactor()))
		ac.debug("Tonemapping: Gamma", string.format("%.2f", ac.getPpTonemapGamma()))
		ac.debug("Tonemapping: Filmic Contrast", string.format("%.f", ac.getPpTonemapFilmicContrast()*100))

	-- dxgi hdr
	-- chromatic aberration
	-- vignetting
	-- lens distortion
	-- glare
		ac.debug("Glare: Threshold", string.format("%.1f", ac.getGlareThreshold()))
		ac.debug("Glare: Bloom Filter Threshold", string.format("%.4f", ac.getGlareBloomFilterThreshold()))
		-- ac.debug("Glare: Bloom Luminance Gamma", string.format("%.2f", ac.getGlareBloomLuminanceGamma()))
		ac.debug("Glare: Star Filter Threshold", string.format("%.4f", ac.getGlareStarFilterThreshold()))

	-- depth of field
	-- sun rays
		ac.debug("Godrays: Lenght", string.format("%.1f", ac.getGodraysLength()))
		ac.debug("Godrays: Angle Attenuation", string.format("%.1f", ac.getGodraysAngleAttenuation()))
		ac.debug("Godrays: Glare Ration", string.format("%.1f", ac.getGodraysGlareRatio()))
		ac.debug("Godrays: Noise Mask", string.format("%.1f", ac.getGodraysNoiseMask()))
		ac.debug("Godrays: Noise Frequency", string.format("%.1f", ac.getGodraysNoiseFrequency()))
		ac.debug("Godrays: Depth Mask Threshold", string.format("%.2f", ac.getGodraysDepthMapThreshold()))

	-- diaphragm rotation
	-- feedback
	-- airy disc
end

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

	-- locals
		local amb	=	__PURE__world__ambient_light:getLuminance() / (20)
		local AEmin	=	math.min(2,math.max(0.3,0))
		local AEmax	=	math.min(2,math.max(0.5+(0.05/amb)*from_twilight_compensate(4),AEmin))
		local AEt	=	math.min(AEmax,math.max(0.45/amb,AEmin))


	-- Custom Pure stuff
		-- reflections
			ac.setReflectionsBrightness(1/ac.getPpTonemapGamma())
			-- ac.setReflectionsSaturation()

	-- Post-Processing Filter
		-- color gamma fix
			ac.setColorTexturesGamma(ac.getPpTonemapGamma()-(0.1/amb*sun_compensate(0)))

		-- color
			ac.setPpHue(1.4)
			ac.setPpSaturation(1)
			ac.setPpColorTemperatureK(0)
			ac.setPpBrightness(1)
			ac.setPpSepia(0.08)
			ac.setPpWhiteBalanceK(0)
			ac.setPpColorGradingIntensity(1)

		-- auto exposure
			ac.setAutoExposureActive(true)
			ac.setCarExposureActive(true)

			ac.setAutoExposureLimits(AEmin,AEmax)
			ac.setAutoExposureTarget(AEt)

			ac.setAutoExposureMeasuringArea(vec2(0,0), vec2(1,1))

		-- tonemapping
			ac.setPpTonemapUseHdrSpace(false)
			ac.setPpTonemapFunction(2)
			ac.setPpTonemapExposure(0.43)
			ac.setPpTonemapMappingFactor(1)
			ac.setPpTonemapGamma(1.3)
			ac.setPpTonemapFilmicContrast(0.3)

		-- dxgi hdr
		-- chromatic aberration
		-- vignetting
		-- lens distortion
		-- glare
			ac.setGlareThreshold(10)
			ac.setGlareBloomFilterThreshold(0.002)
			ac.setGlareBloomLuminanceGamma(1.82)
			ac.setGlareStarFilterThreshold(0.0002)

		-- depth of field
		-- sun rays
			-- ac.setGodraysCustomColor(rgb(255,255,255))
			-- ac.setGodraysLength(1.7)
			-- ac.setGodraysAngleAttenuation(5)
			-- ac.setGodraysGlareRatio(0.01)
			-- ac.setGodraysNoiseMask(0.01)
			-- ac.setGodraysNoiseFrequency(1)
			-- ac.setGodraysDepthMapThreshold(1)

		-- diaphragm rotation
		-- feedback
		-- airy disc

	getppfilter()
end
