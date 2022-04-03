function init_pure_script()
	PURE__use_ExpCalc(false)
	PURE__use_SpectrumAdaption(true)
	PURE__use_VAOAdaption(true)
	--__PURE__set_config("light.sky.level",0.92)
	--__PURE__set_config("clouds2D.brightness",0.7)--set dynamically 0.7 at high sun angle?
	ac.setGodraysGlareRatio(0)
	ac.setGodraysAngleAttenuation(30)
    ac.setGodraysCustomColor(rgb(50,50,50))
end

local tmp = 2
local last_ae = 2
local curr_ae = 2
local overcast = 0
local low_light_adaption_time  = 2
local high_light_adaption_time = 0.25 --bigger = slower reaction
local exp
local gamma_min = 1.45
local gamma_max = 1.6
local contrast_min = 0.975
local contrast_max = 0.985
local _l_wp = 1.0
local _l_wp_last = 1.0
local display_brightness = 1

function update_pure_script(dt)
    overcast  = Pure_get_Overcast()
                    * from_twilight_compensate(0)
	curr_ae = ac.getCubemapBrightnessEstimationAverage()

	tmp = curr_ae - last_ae
	--this could probably be better, take code from pure_exposure.lua?
    if tmp > 0 then
        last_ae = math.lerp(last_ae, curr_ae, 1/high_light_adaption_time*math.min(1, dt))
    else
        last_ae = math.lerp(last_ae, curr_ae, 1/low_light_adaption_time*math.min(1, dt))
    end

	cbe_scaler = math.min(math.max(0,last_ae/(4.2*day_compensate(0.1))),1)--configure as 0 to 1 range, and disable at night -- replace with intD or similar so you dont get harsh transition at -3 to -12 sunangle

	contrast_min = math.max(math.min(__IntD(1,0.93,0.95),0.975),0.955)--outer values are the desired range, inner are wider to give more control
	gamma_min = math.max(math.min(__IntD(1.8,1.2,0.95),1.45),1.2)--outer values are the desired range, inner are wider to give more control
	ac.setPpContrast(night_compensate(math.min(math.lerp(0.99,contrast_min,cbe_scaler)),contrast_max))-- higher value than actual max used to widen curve
	ac.setPpTonemapGamma(math.min(math.lerp(1.7,gamma_min,night_compensate(cbe_scaler)),gamma_max))-- higher value than actual max used to widen curve
	ac.setPpTonemapFilmicContrast(0.15 + (0.25 * night_compensate(0)))--try 0.3
	exp = 0.1 + (0.05 * overcast) + ((0.35 + (0.15 - (cbe_scaler * 0.15))) * night_compensate(0))--ideally overcast addition would be smoothed
	ac.setPpTonemapExposure(exp)

	night_compensate_alt = sun_compensate(2) - 1
	ac.setPpSaturation(-0.025 + day_compensate(1.025))
	ac.setGlareBloomLuminanceGamma(math.lerp(1.7,1.1,exp*2))
	ac.setGodraysLength(__IntD(5.5,-2,0.4) * PURE__getGodraysModulator())--MAYBE TOO LOW?

	ac.debug("gamma", string.format('%.3f', ac.getPpTonemapGamma()))
	ac.debug("contrast", string.format('%.3f', ac.getPpContrast()))
	ac.debug("gamma_min", string.format('%.3f', gamma_min))
	ac.debug("contrast_min", string.format('%.3f', contrast_min))
	ac.debug("exp", string.format('%.3f', ac.getPpTonemapExposure()))
	ac.debug("bright", string.format('%.3f', ac.getPpBrightness()))
	ac.debug("1 cbe_scaler", string.format('%.3f', cbe_scaler))
	ac.debug("1 overcast", string.format('%.3f', overcast))
	ac.debug("1 curr_ae", string.format('%.3f', curr_ae))

--copied from pure weather code:
  local tmpDT = math.min(0.9, dt*5)
        local tmpDT = math.min(0.9, dt*5)
        local tmpExp = exp

            tmpExp = math.pow(tmpExp, 1.5)

        _l_wp = 0.25/math.max(0.01, tmpExp) --math.max(1, math.pow(ac.getCubemapBrightnessEstimationAverage(), 0.67)) * 0.375/_l_new_exp
        _l_wp_last = _l_wp_last * (1-tmpDT) + _l_wp * (tmpDT)
        ac.setWhiteReferencePoint(_l_wp_last)

    local tmp = 0.34/math.max(0.01, exp) --ac.getCubemapBrightnessEstimationMinimum()
    display_brightness = display_brightness * (1-dt*0.25) + tmp * (dt*0.25)
    ac.setAdaptiveEmissiveMultiplier(display_brightness)
end