local gamma_fix = 0.0
local bGammaFix = false
--if ac.setColorTexturesGamma ~= nil then bGammaFix = true end

-- create a simple brightness filter to use it, to countermeasure YEBIS AE
local _l_brightness_filter = ac.ColorCorrectionHsb { hue=0, saturation=1.0, brightness=1.0, keepLuminance=true }
ac.weatherColorCorrections[#ac.weatherColorCorrections + 1] = _l_brightness_filter

local _l_AE_reaction_LUT = {
    {  0.00,  0.01, 1.00  },
    {  0.10,  0.05, 1.00  },
    {  0.15,  0.08, 1.00  },
    {  0.20,  0.10, 1.00  },
    {  0.30,  0.15, 1.00  },
    {  0.40,  0.20, 1.00  },
    {  0.50,  0.40, 1.00  },
    {  0.65,  0.80, 1.50  },
    {  0.80,  0.90, 1.00  },
    {  1.00,  1.00, 0.00  },
    }
local _l_AE_reaction_lut
local _l_AE_reactionCPP = LUT:new(_l_AE_reaction_LUT)

-- This is called once while AC starts
function init_pure_script()

    ac.setPpTonemapFunction(2)

    ac.setPpTonemapGamma(1.0)
    ac.setPpSaturation(0.90)
end


local low_light_adaption_time  = 0.3
local high_light_adaption_time = 0.3

local exp
local curve
local gamma
local cloud_shadow
local tmp
local tmp_ae
local new_brightness
local str
local bright_display
local fog
local curr_ae
local last_ae = 0.5


-- This is called every frame
function update_pure_script(dt)

    --ac.setPpTonemapFunction(2)

    exp = ac.getPpTonemapExposure()
    ac.debug("A3PP: exposure", string.format('%.3f', exp))

    -- use this "curve" variable as a better gamma function
    curve = 0.00
    gamma = 1.10

    -- check for cloud shadows and adapt the curve for being in the shadow
    cloud_shadow = math.max(Pure_get_Overcast() , (1-ac.getCloudsShadow())) * sun_compensate(0)
    --curve = curve * (1 + 0.75 * cloud_shadow)

    PURE__set_PP_Tonemapping_Curve(curve)

    --ac.setPpTonemapFunction(2)

    -- COLOR BALANCE

    ac.setPpWhiteBalanceK(6500)
    ac.setPpColorTemperatureK(6700) --6500 = perfect white with sun over 45°



    -- EXPOSURE
    -- The exposure is set by Pure automatically, according to the sunangle.
    -- If you like to have your own exposure, just set it.
    -- AutoExposure must be deactivated to do this!

    -- ac.setPpTonemapExposure(0.092)


    -- AUTO EXPOSURE
    -- The target and limit values are set by Pure automatically.
    -- If you like to set your own values, use those functions:

    --ac.setAutoExposureTarget(0.15)

    ac.setAutoExposureLimits( 0.1  --[[ minimum ]]
                            , 
                            0.5 --[[ maximum ]]) -- always use the full raise of exposure (its needed for very dark places like tunnels)

    curr_ae = math.max(0.05, ac.getAutoExposure())
    tmp = curr_ae - last_ae

    -- Here we calculate a ratio, to not react that much in bright light (daylight).
    _l_AE_reaction_lut = _l_AE_reactionCPP:get(math.max(0, math.min(1, curr_ae*2)))
    tmp_ae = math.lerp(_l_AE_reaction_lut[1], 1, Pure_get_Overcast()*0.25) 



    if tmp > 0 then
        -- react to low light
        last_ae = math.lerp(last_ae, curr_ae, 1/low_light_adaption_time*tmp_ae*math.min(1, dt))
    else
        -- react to high light
        last_ae = math.lerp(last_ae, curr_ae, 1/high_light_adaption_time*math.min(1, dt))
    end
    last_ae = math.max(0.05, last_ae)

    new_brightness = (last_ae / curr_ae)
                    * (1 + 0.1*cloud_shadow)

    -- use the brightness filter to countermeasure the YEBIS AE
    _l_brightness_filter.brightness = new_brightness

    if bGammaFix then
        gamma_fix = 0.15 + math.max(0, new_brightness - 1)*4   --* _l_AE_reaction_lut[2] 
        ac.debug("A3PP: Gamma-fix", string.format('%.3f', gamma_fix))
    end
    
    -- You are also able to get/set Pure's precalculated values
    Pure_set_AE_target( Pure_get_AE_target()
                        -- adapt Pure's precalculated AE target value to customized tonemapping
                        * (1.5 - 0.5*math.pow(curve, 0.5))
                        -- adapt Pure's preset AE target to this AE control
                        -- try to achieve a target, to make AE nearly static in nightimes, but it start to dim with realy bright lights
                        * 0.625
                        -- boost target for sunset times
                        * sun_compensate(1.5)
                        --* (1 - 0.5*gamma_fix)
                    )

    ac.setPpTonemapGamma(gamma)
    

    -- boost VAO depending on exposure amount / most boost in nighttimes
    -- This will simulate the loss of ambient light and therefore the less visibility of dark places
    Pure_set_VAO_exponent_additive(curr_ae * 0.5)
--[[
    str = " "
    bright_display = (math.max(0, math.min(2.1, new_brightness)) - 1) * 10
    for i=-10,10 do
        if i==0 then
            str = str.."█"
        else
            if i<0 then
                if i<=bright_display and i+1>=bright_display then
                    str = str.."▄"
                elseif tmp < i*0.025 then
                    str = str.."▓"
                else 
                    str = str.."░"
                end
            else
                if i<=bright_display and i+1>=bright_display then
                    str = str.."▄"
                elseif tmp > i*0.025 then
                    str = str.."▓"
                else
                    str = str.."░"
                end
            end
        end
    end
    ac.debug("CustPP: Iris > Brain", str)
]]
    if bGammaFix then
        ac.setColorTexturesGamma(1.0 + gamma_fix)
        ac.setPpTonemapGamma(1.0 + 0.75*gamma_fix)
        ac.setPpSaturation(1.0+0.125*gamma_fix)
    end

    --  some PP effects controlled by the world
    fog = Pure_get_Fog()
    fog = fog * fog
    --ac.setGlareBloomLuminanceGamma(1.75 + 0.20 * fog)
    --ac.setGlareThreshold(math.max(0, 3.5 - 3.0 * fog))
    ac.setGodraysLength(1 + 8*fog)
end

    -- Pure get/set functions
    --[[

        -- CAMERA functions

        Pure__get_camDir() --vec3
        Pure__get_camPos() --vec3
        Pure__get_camFOV() --float


        -- Autoexposure

        Pure_get_AE_target()
        Pure_set_AE_target(v)


        -- Lighting
        
        Pure_get_LightSource_color() 
        Pure_get_AmbientLight_color()
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
    