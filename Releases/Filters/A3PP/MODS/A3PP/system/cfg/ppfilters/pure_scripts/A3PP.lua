-- This is called once while AC starts
function init_pure_script()

    --ac.setPpTonemapFunction(5)
    --__PURE__set_config("pp.saturation", 1, true)
    __PURE__set_config("light.sky.hue", 5, false)
    __PURE__set_config("light.sky.level", 0.8, false)
    __PURE__set_config("clouds2D.brightness", 0.78, false)
    --__PURE__set_config("clouds2D.brightness", 0.7, false)


    -- activate Pure's Exposure Calculation via Cubemap Brightness Estimation
    -- Cubemap reflections must NOT be static (Settings->Assetto Corsa->Video->Reflections frequency)
    -- "Use proper physically-based smapling" MUST be activated (Settings->Custom Shaders Patch->Reflections FX->General Cubemap Reflections)
    PURE__use_ExpCalc(true)
    -- this will compensate the spectrum with missing sunlight in overcast sceneries
    PURE__use_SpectrumAdaption(true)
    -- this adapts the VAO parameters with overcast sceneries
    PURE__use_VAOAdaption(true)

    -- sets a version and show it in Pure Config (PP)
    __SCRIPT__setVersion(10)
    __SCRIPT__ResetSettingsWithNewVersion()

    __SCRIPT__UI_Text("The sensitivity to Light")
    __SCRIPT__UI_SliderFloat("Photosensitivity", 4, 3, 7.0)

    __SCRIPT__UI_Text("Set the time the eye needs, to adapt to low light.")
    __SCRIPT__UI_SliderFloat("low light adaption time", 2.0, 0.01, 5.0)

    __SCRIPT__UI_Text("Set the time the eye needs, to adapt to bright light.")
    __SCRIPT__UI_SliderFloat("high light adaption time", 4.0, 0.1, 30.0)
    
    __SCRIPT__UI_Separator()

    __SCRIPT__UI_Text("maximum closure of the iris")
    __SCRIPT__UI_SliderFloat("Iris minimum", 0.13, 0.0, 0.25)

    __SCRIPT__UI_Text("the lowest light the eye can see")
    __SCRIPT__UI_SliderFloat("Iris maximum", 0.50, 0.0, 3.00)

    __SCRIPT__UI_Separator()

    __SCRIPT__UI_Text("Tonemapping Gamma (set 1.1 if you prefer older look)")
    __SCRIPT__UI_SliderFloat("Gamma", 1.0, 0.8, 1.8)

    __SCRIPT__UI_Text("Tonemapping Gamma Daylight influence (set 0 if you prefer older look)")
    __SCRIPT__UI_SliderFloat("Gamma Daylight", 0.0, 0.0, 0.50)

    __SCRIPT__UI_Text("Tonemapping Curve direction")
    __SCRIPT__UI_SliderFloat("Tonemapping Curve", 0.10, 0.0, 1.0)

    __SCRIPT__UI_Separator()
    
    __SCRIPT__UI_StateFloat("Final Exposure", 0)
    __SCRIPT__UI_StateFloat("Cloud shadow", 0)

    
end

local curve
local cloud_shadow
local tmp_hsv = hsv(0,0,0)
local tmp_rgb = rgb(0,0,0)
local fog

-- This is called every frame
function update_pure_script(dt)

    -- check for cloud shadows and adapt the curve for being in the shadow
    cloud_shadow = math.max(Pure_get_Overcast() , (1-ac.getCloudsShadow())) * sun_compensate(0)
    __SCRIPT__UI_setValue("Cloud shadow", cloud_shadow)
    
    -- use this "curve" variable as a better gamma function
    curve = 0.4* (1 + 0.50*cloud_shadow)

    -- set tonemapping adaption / use this instead of gamma, to gain brightness
    PURE__set_PP_Tonemapping_Curve(__SCRIPT__UI_getValue("Tonemapping Curve"))

    local sense = __SCRIPT__UI_getValue("Photosensitivity")
    PURE__ExpCalc_set_Target(1+0.60*(sense-2*cloud_shadow-1))
    PURE__ExpCalc_set_Sensitivity(1)
  
    PURE__ExpCalc_set_Limits(
        __SCRIPT__UI_getValue("Iris minimum"),
        __SCRIPT__UI_getValue("Iris maximum")
    )
    PURE__ExpCalc_set_AdaptionSpeeds(
        __SCRIPT__UI_getValue("low light adaption time"),
        __SCRIPT__UI_getValue("high light adaption time")
    )

    __SCRIPT__UI_setValue("Final Exposure", PURE__ExpCalc_get_final_exposure())


    local exp_curve = math.min(1, math.max(0, math.pow(PURE__ExpCalc_get_final_exposure()*2, 0.34)))
    --ac.setPpColorGradingIntensity(math.min(1, math.max(0, exp_curve-0.1)))
    ac.setPpTonemapGamma(__SCRIPT__UI_getValue("Gamma") - __SCRIPT__UI_getValue("Gamma Daylight")* day_compensate(0) + 0.10*math.min(1, math.max(0, exp_curve-0.1)))

    ac.setGodraysGlareRatio(0.0)
    ac.setGodraysLength( __IntD(8,4,0.6)
                       -- use the internal godrays modulator to set the godrays length
                       -- this will adapt them to many situations and switch them off
                       -- with sunangles below 0°
                       * PURE__getGodraysModulator()
                    )

   
end

    -- Pure get/set functions
    --[[

        -- CAMERA functions

        Pure_getVector(VECTORS.CAM_DIR) --vec3
        Pure_getVector(VECTORS.CAM_POS) --vec3
        Pure__get_camFOV() --float


        -- Autoexposure

        Pure_get_AE_target()
        Pure_set_AE_target(v)


        -- Lighting
        -- use those ids to retrieve Pure's colors
        COLORS.LIGHTSOURCE
        COLORS.AMBIENT
        COLORS.DIRECTIONAL_AMBIENT
        COLORS.SUN
        COLORS.MOON
        COLORS.NLP
        -- with the function:
        Pure_getColor(id)

        e.g.:
        ac.setGodraysCustomColor(Pure_getColor(COLORS.LIGHTSOURCE):scale(0.125))
}
    ]]




    -- direct wfx PP functions
    --[[  You can use this weatherFX functions to set and get PP Filter values:

        SET

		    ac.resetSpecularColor()
            ac.setSpecularColor(c: rgb)
            ac.resetEmissiveMultiplier()
            ac.setEmissiveMultiplier(v: number)
            ac.resetReflectionEmissiveBoost()
            ac.setReflectionEmissiveBoost(v: number)
            ac.resetGlowBrightness()
            ac.setGlowBrightness(v: number)
            ac.resetGodraysCustomColor()
            ac.setGodraysCustomColor(c: rgb)
            ac.resetGodraysCustomDirection()
            ac.setGodraysCustomDirection(v: vec3)
            ac.setGodraysLength(v: number)
            ac.setGodraysGlareRatio(v: number)
            ac.setGodraysAngleAttenuation(v: number)
            ac.setGodraysNoiseFrequency(v: number)
            ac.setGodraysNoiseMask(v: number)
            ac.setGodraysDepthMapThreshold(v: number)
            ac.setGlareThreshold(v: number)
            ac.setGlareBloomFilterThreshold(v: number)
            ac.setGlareBloomLuminanceGamma(v: number)
            ac.setGlareStarFilterThreshold(v: number)
            ac.setPpColorTemperatureK(v: number)
            ac.setPpWhiteBalanceK(v: number)
            ac.setPpHue(v: number)
            ac.setPpSepia(v: number)
            ac.setPpSaturation(v: number)
            ac.setPpBrightness(v: number)
            ac.setPpContrast(v: number)
            ac.setPpTonemapFunction(v: ac.TonemapFunction)
            ac.setPpTonemapExposure(v: number)
            ac.setPpTonemapGamma(v: number)
            ac.setPpTonemapUseHdrSpace(v: boolean)
            ac.setPpTonemapMappingFactor(v: number)
            ac.setPpTonemapFilmicContrast(v: number)
            ac.setPpColorGradingIntensity(v: number)
            ac.setPpWhiteBalanceK(v: number)
	        ac.setPpColorTemperatureK(v: number)


        GET

            ac.getGodraysLength(): number
            ac.getGodraysGlareRatio(): number
            ac.getGodraysAngleAttenuation(): number
            ac.getGodraysNoiseFrequency(): number
            ac.getGodraysNoiseMask(): number
            ac.getGodraysDepthMapThreshold(): number
            ac.getGlareThreshold(): number
            ac.getGlareBloomFilterThreshold(): number
            ac.getGlareStarFilterThreshold(): number
            ac.getPpColorTemperatureK(): number
            ac.getPpWhiteBalanceK(): number
            ac.getPpHue(): number
            ac.getPpSepia(): number
            ac.getPpSaturation(): number
            ac.getPpBrightness(): number
            ac.getPpContrast(): number
            ac.getPpAutoExposureEnabled(): boolean
            ac.getAutoExposure(): number
            ac.getPpTonemapFunction(): number
            ac.getPpTonemapExposure(): number
            ac.getPpTonemapGamma(): number
            ac.getPpTonemapMappingFactor(): number
            ac.getPpTonemapFilmicContrast(): number
            ac.getPpTonemapUseHdrSpace(): number
            ac.getPpGodraysEnabled(): boolean
            ac.getPpDofEnabled(): boolean
            ac.getPpDofActive(): boolean
            ac.getPpChromaticAbberationActive(): boolean
            ac.getPpGlareGhostActive(): boolean
            ac.getPpHeatParticleActive(): boolean
            ac.getPpAirydiskEnabled(): boolean
            ac.getPpAntialiasingEnabled(): boolean
            ac.getPpChromaticAbberationEnabled(): boolean
            ac.getPpFeedbackEnabled(): boolean
            ac.getPpLensDistortionEnabled(): boolean
            ac.getPpHeatParticleEnabled(): boolean
            ac.getPpGlareEnabled(): boolean
            ac.getPpGlareAnamorphicEnabled(): boolean
            ac.setPpTonemapViewportScale(v: vec2)
            ac.setPpTonemapViewportOffset(v: vec2)
	]]

	--[[ Using weatherFX's color corrections

		local filter = ac.ColorCorrectionGrayscale {  }
		local filter = ac.ColorCorrectionNegative {  }

		local filter = ac.ColorCorrectionSepiaTone { value = 0 }
		local filter = ac.ColorCorrectionBrightness { value = 0 }
		local filter = ac.ColorCorrectionSaturation { value = 0 }
		local filter = ac.ColorCorrectionContrast { value = 0 }
		local filter = ac.ColorCorrectionBias { value = 0 }

		local filter = ac.ColorCorrectionModulationRgb { color = rgb(1,1,1) }
		local filter = ac.ColorCorrectionSaturationRgb { color = rgb(1,1,1) }
		local filter = ac.ColorCorrectionContrastRgb { color = rgb(1,1,1) }
		local filter = ac.ColorCorrectionBiasRgb { color = rgb(1,1,1) }

		local filter = ac.ColorCorrectionMonotoneRgb { color = rgb(1,1,1), effectRation = 0 }
		local filter = ac.ColorCorrectionMonotoneRgbSatMod { color = rgb(1,1,1), saturation = 0, modulation = 0 }
		local filter = ac.ColorCorrectionFadeRgb { color = rgb(1,1,1), effectRation = 0 }
		local filter = ac.ColorCorrectionHue { hue = 0, keepLuminance = 0 }
		local filter = ac.ColorCorrectionHue { hue = 0, saturation = 0, brightness = 1 }

		local filter = ac.ColorCorrectionTemperature { temperature = 6500, luminance = 0 }
		local filter = ac.ColorCorrectionWhiteBalance { temperature = 6500, luminance = 0 }

		ac.weatherColorCorrections[#ac.weatherColorCorrections + 1] = filter


		Example:
			
			At beginning of custom config:

			local filter_bias = ac.ColorCorrectionBiasRgb { color = rgb(1,1,1) }
			ac.weatherColorCorrections[#ac.weatherColorCorrections + 1] = filter_bias

			local color_bias_low = rgb(0.1,0,0)
			local color_bias_high = rgb(0,0,0.1)


			In update_sol_custom_config():

			filter_bias.color = math.lerp(color_bias_low, color_bias_high, from_twilight_compensate(0))
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
		
		- transition between v and 1 is with sunangles between +30°->+10° and -9°->-20°
		dawn_exclusive(v) 	- returns 1 while not in dawn
		dusk_exclusive(v) 	- returns 1 while not in dusk

		- __IntD(x, y, e) - "Interpolate Day" 
		sin function of the sun angle, to interpolate between:
		x (value when sunangle is 0°) and y (value when sun is 90°)
		e is the exponent of the sin function a = sin(sunangle)^e
		For example __IntD(0, 1, 0.5), will return almost 1 till the sun is realy near the horizon

        - __IntN(x, y, e) - "Interpolate Night"
        The same function as __IntD, but for night. You need to reverse the exponent, So __IntD(0, 1, 100) is a very steep curve 

		E.g.
		"Boost PP Brightness in the night"

		1. Method:
		ac.setPpBrightness( 1.14 * day_compensate(1.1) )

		Brightness will then be 1.14 at day and 1.24 at night


		2. Method (using math.lerp):
		ac.setPpBrightness( math.lerp( 1.24, 1.14, day_compensate(0) ) )
    ]]
