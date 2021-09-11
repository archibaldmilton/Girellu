-- This is just an example, how custom sol config could be used
-- This file must have the same name like your PPFilter and the extension lua

-- For your release version, this file should be placed in the folder /system/cfg/ppfilters/sol_custom_configs/
-- For realtime editing, you can place it in /extension/weather/sol as well.

local sun
local sky
local sky_blue_booster
local clouds
local amb
local amb_vert
local amb_hori
local amb_headlight
local fog
local hdr
local lights_backup


function table__deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[table__deepcopy(orig_key)] = table__deepcopy(orig_value)
        end
        setmetatable(copy, table__deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function init_sol_custom_config()

	--------------------------------
	--activate extra Sol functions
	--------------------------------

	SOL__set_config("monitor_compensation", "colors_whitebalance", 3)
	SOL__set_config("night", "brightness_adjust", 0.4 + 0.15) --root is 0.4

	-- adaptive brightness
	SOL__set_config("pp", "brightness_sun_link", 1.5)

	-- Sol controlled PPFilter effects
	SOL__set_config("pp", "modify_glare", true)
	SOL__set_config("pp", "modify_godrays", true)
	SOL__set_config("pp", "modify_spectrum", true)

	-- Autoexposure
	SOL__set_config("ae", "use_self_calibrating", true)
	SOL__set_config("ae", "control_strength", 1.80)
	SOL__set_config("ae", "control_damping", 0.30)
	SOL__set_config("ae", "eye_laziness", 1.0)
	SOL__set_config("ae", "alternate_ae_mode", 1)

	-- CSP lights
	SOL__set_config("csp_lights", "controlled_by_sol", true)

	-- sky
	SOL__set_config("sky", "blue_strength", 0.95)

	-- ambient
	--ambient__use_sols_dynamic_ambient_settings = true

	
	-- backup the used values to have a fixed base of manipulation
	-- use relative changes, so the user is able the adjust it

	--sun 			  = table__deepcopy(nerd__sun_adjust)
	--sun.ls_Level 	  = sun.ls_Level * 0.60
	--sun.ls_Saturation = sun.ls_Saturation * 0.70
	--sun.ap_Level 	  = sun.ap_Level * 1.50
	--sun.ap_Saturation = sun.ap_Saturation * 0.92

	SOL__set_config("sun", "sky_bloom", 0.32)

	SOL__set_config("night", "moonlight_multiplier", 0.65, true)

	--sky 		   	= table__deepcopy(nerd__sky_adjust)
	--sky.Hue 	   	= sky.Hue --* 1.003
	--sky.Saturation 	= sky.Saturation * 1.02

	--sky_blue_booster = table__deepcopy(nerd__sky_blue_booster_adjust)

	--clouds 				= table__deepcopy(nerd__clouds_adjust)
	--clouds.Lit 			= clouds.Lit * 1.05
	--clouds.Saturation 	= clouds.Saturation * 1.05

	--amb 	   		= table__deepcopy(nerd__ambient_adjust)
	--amb.Level  		= amb.Level * 0.70
	--amb.Saturation 	= amb.Saturation * 1.20

	SOL__set_config("headlights", "if_ambient_light_is_under", 0.8)

	--amb_static = table__deepcopy(nerd__static_ambient_adjust)

	fog = ta_fog_level -- this is from track adaptions

	-- initial values of weatherFX settings
	ac.setWeatherFakeShadowOpacity(1.10)

	-- backup lights multi
	lights_backup = global_CSP_lights_multi



end

local exp = 1

function update_sol_custom_config__every_frame()

	-- more Gamma in the Night 
	ac.setPpTonemapGamma(0.35 + day_compensate(0.95) + (0.03 * weather__get_overcast()) + (0.075 * weather__get_cloud_shadow()) ) -- 1.23 at day, 1.33 at night

	-- a better adaption of the AC euto exposure. With this an exposure base is set,
	-- which then is used to adjust the target and limit values
	-- Exposure is now a function of ambient light, therefore all weather are automatically adjusted for good visiblity
	exp = math.lerp(0.40, 0.59, from_twilight_compensate(0))
		  - (0.25 * math.pow(weather__get_ambient_brightness() / 20, 1.0)) 
	SOL_filter__set_exposure_base(exp)
	ac.setPpTonemapExposure(exp)

	-- adapt lights to exposure
	--global_CSP_lights_multi = lights_backup * math.pow(0.39/exp, 1)

	-- weather__get_hdr_multiplier() returns the fixed HDR value from config and the dynamic one,
	-- which is changed by Sol's AE
	-- lift hdr with dusk and dawn, to create a nice mood
	hdr = weather__get_hdr_multiplier() - (weather__get_cloud_shadow()*__IntD(0, 0.20, 0.45))
	
	if ac.isInteriorView() == true then
		hdr = hdr * __IntD(0.8, 1.0, 0.45) 
	else

	end

	if hdr < 1 and hdr > 0.01 then

		SOL__set_config("nerd__sun_adjust", "ls_Level", __IntD(0.6*1.1, 0.6, 0.6) / hdr)
		SOL__set_config("nerd__sun_adjust", "ls_Saturation", __IntD(0.7*1.5, 0.7, 0.5) / (0.9+0.1*hdr))

		SOL__set_config("nerd__sky_adjust", "Level", (math.lerp(0.75, 1, weather__get_badness()) / hdr) * (1+0.1 * weather__get_cloud_shadow()))

		SOL__set_config("nerd__ambient_adjust", "Level", 0.7 / (0.4+0.6*hdr))
		
		--ta_fog_level = fog * (0.75+0.25*hdr)
	else

		SOL__set_config("nerd__sun_adjust", "ls_Level", __IntD(0.6*1.1, 0.6, 0.6) * (0.96+0.04*hdr))
		SOL__set_config("nerd__sun_adjust", "ls_Saturation", __IntD(0.7*1.5, 0.7, 0.5)  / (0.7+0.3*hdr))

		SOL__set_config("nerd__sky_adjust", "Level", math.lerp(0.75, 1, weather__get_badness()) * (0.5+0.5*hdr) * (1+0.1 * weather__get_cloud_shadow()))

		SOL__set_config("nerd__ambient_adjust", "Level", 0.7 / hdr)
		
		--ta_fog_level = fog * (0.5+0.5*hdr)
	end

	SOL__set_config("nerd__sun_adjust", "ap_Level", 1.5)
	--nerd__sun_adjust.ap_Saturation = sun.ap_Saturation

	SOL__set_config("nerd__sky_adjust", "Hue", 1.003)
	SOL__set_config("nerd__sky_adjust", "Saturation", 1.02)
	SOL__set_config("nerd__sky_adjust", "Level", 1+0.35*sun_compensate(0), true)

	SOL__set_config("nerd__sky_adjust", "AnisotropicIntensity", 1 - 0.8*sun_compensate(0), true)

	--nerd__sky_blue_booster_adjust.Hue 			= sky_blue_booster.Hue * (1 - 0.04*from_twilight_compensate(0)) 
	--nerd__sky_blue_booster_adjust.Saturation 	= sky_blue_booster.Saturation * (1 - 0.4*from_twilight_compensate(0))
	--nerd__sky_blue_booster_adjust.Level 		= sky_blue_booster.Level * (1 + 0.3*from_twilight_compensate(0))

	SOL__set_config("nerd__ambient_adjust", "Saturation", 1.2)

	SOL__set_config("nerd__clouds_adjust", "Lit", 1.05)
	SOL__set_config("nerd__clouds_adjust", "Saturation", 1.05)

	if sol__debug__custom_config == true then

		ac.debug("CC", string.format('exposure %.2f, hdr %.2f', exp, hdr) )
		ac.debug("CC lights", string.format('%.2f', global_CSP_lights_multi) )
	end


	-- more blueish at dawn and dusk 
	ac.setPpColorTemperatureK(7450*dawn_exclusive(1.15)*dusk_exclusive(1.045))

	-- shift colors to achieve ACC colorstyle
	ac.setPpSepia(0.35 + 0.20 * weather__get_overcast() * from_twilight_compensate(0))
	-- compensate sepia
	ac.setPpSaturation(1.51 * (1 + math.lerp(0.37, 0.45, sun_compensate(0)) * weather__get_overcast() * from_twilight_compensate(0)))
	
	-- try to achieve an effect of noise with contrast 0.995 in nighttime
	ac.setPpContrast(from_twilight_compensate(0.945) + 0.05)

	ac.setPpBrightness(0.3 + day_compensate(1.15))


	-- prevent this for now
	ac.setExtraAsphaltReflectionsMultiplier(0.0)

end