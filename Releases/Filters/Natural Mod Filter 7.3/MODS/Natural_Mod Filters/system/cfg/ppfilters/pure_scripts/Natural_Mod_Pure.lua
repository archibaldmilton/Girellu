-- This is called once while AC starts
function init_pure_script()
    -- sets a version and show it in Pure Config (PP)
    __SCRIPT__setVersion(7.4)
	__SCRIPT__UI_Text("these sliders allow you to fine tune without compromising the appearance at night time")
	__SCRIPT__UI_SliderFloat("Contrast Day", 0.975, 0.96, 1.0)
	__SCRIPT__UI_SliderFloat("Gamma Day", 1.33, 1, 1.6)
end

local curve
local tmp_hsv = hsv(0,0,0)
local tmp_rgb = rgb(0,0,0)
local fog

-- This is called every frame
function update_pure_script(dt)
	contrast_day = __SCRIPT__UI_getValue("Contrast Day")--set value for day here. value at night will always be 1.0. Probably want to set this to 1.0 for displays with poor black level
	gamma_day = __SCRIPT__UI_getValue("Gamma Day")
	--ac.setPpContrast(1 - ((1-contrast_day) * from_twilight_compensate(0)))
	--ac.setPpContrast(1 - ((1-contrast_day) * sun_compensate(0)))
	ac.setPpContrast(1 - ((1-contrast_day) * day_compensate(0)))
	ac.setPpTonemapGamma(1 + (gamma_day - 1	) * day_compensate(0))
	--ac.setPpTonemapGamma(1 + (gamma_day - 1	) * from_twilight_compensate(0))	
    PURE__set_PP_Tonemapping_Curve(1)
	exp = PURE__return_IDLE_EXPOSURE()
	ac.setPpTonemapExposure(exp)
	local ref_point = 1 / exp * day_compensate(0.65)
    ac.setWhiteReferencePoint(ref_point)
	ac.debug("contrast", string.format('%.3f', ac.getPpContrast()))
	ac.debug("gamma", string.format('%.3f', ac.getPpTonemapGamma()))
	
	
	
	--ac.setGlareBloomLuminanceGamma(1 + 0.20 * fog)
	
	
	
	
    -- compensate godrays color / remove the reddish shine a bit
    -- scale the light for better godrays usage and convert the color into HSV format
    RGBToHSV_To(tmp_hsv, Pure_getColor(COLORS.LIGHTSOURCE):scale(0.125))
    -- adapt the hue dependent to sun angle
    tmp_hsv.h = tmp_hsv.h + (10 + 40*sun_compensate(0))
    -- prevent godrays for the moon
    tmp_hsv.v = math.max(0, from_twilight_compensate(-0.5)) * __IntD(1,6)
    -- convert it back to RGB
    HSVToRGB_To(tmp_rgb, tmp_hsv.h, tmp_hsv.s, tmp_hsv.v)
    -- set the godrays color
    ac.setGodraysCustomColor(tmp_rgb)
    -- to avoid the continuous allocation of new memory, use 2 container variables
    -- "tmp_hsv" and "tmp_rgb". Only their member variables will be changed with
    -- RGBToHSV_To() and HSVToRGB_To(). There will be no allocation of new memory.
    --  some PP effects controlled by the world
    fog = Pure_get_Fog()
    fog = fog * fog
    ac.setGlareBloomLuminanceGamma(1 + 0.20 * fog)
    ac.setGlareThreshold(math.max(0, 3.5 - 3.0 * fog))
end