function init_pure_script()

    pure.light.setSpectrumAdaption(0.50)
    pure.light.setVAOAdaption(1.0)
    pure.light.setLambertGamma(2.2)

    pure.script.setVersion(1.0)
    pure.script.resetSettingsWithNewVersion()


    PURE__use_ExpCalc(true)

    pure.exposure.cbe.setLimits(0.001, 0.500)

    pure.exposure.cbe.setAdaptionSpeeds(3, 3)
    pure.exposure.yebis.setAdaptionSpeeds(0.375, 1.5)




    pure.script.ui.addSeparator()
    pure.script.ui.addText("********** AE *********")

    pure.script.ui.addSliderFloat("Target Day", 1.5, 0, 5)
    pure.script.ui.addSliderFloat("Target Night", 3, 0, 5)
    pure.script.ui.addSliderFloat("Sensitivity", 1, 0, 5)
    pure.script.ui.addSliderFloat("Range Minimum", 0.050, 0.0, 0.25)
    pure.script.ui.addSliderFloat("Range Maximum", 0.600, 0.0, 3.00)
    pure.script.ui.addSliderFloat("Multiplier", 1, 0, 5)

    pure.script.ui.addSeparator()
    pure.script.ui.addText("******** COLOR ********")

    pure.script.ui.addSliderInteger("Hue", 0, 0, 360)
    pure.script.ui.addSliderInteger("Saturation", 90, 0, 200)
    pure.script.ui.addSliderInteger("Brightness", 100, 0, 200)
    pure.script.ui.addSliderInteger("Contrast", 100, 0, 200)
    pure.script.ui.addSliderInteger("Sepia", 0, -100, 100)
    pure.script.ui.addSliderInteger("Color Temperature", 6500, 0, 9000)
    pure.script.ui.addSliderInteger("White Balance", 6500, 0, 9000)

    pure.script.ui.addSeparator()
    pure.script.ui.addText("***** TONEMAPPING *****")

    pure.script.ui.addSliderInteger("Function", 2, -1, 6)
    pure.script.ui.addSliderFloat("Exposure", 0.3, 0.05, 5)
    pure.script.ui.addSliderFloat("Gamma", 1.4, 0.1, 5)
    pure.script.ui.addSliderFloat("Mapping Factor", 1.2, 0.1, 256)
    pure.script.ui.addSliderInteger("Filmic Contrast", 50, 0, 100)

    
    pure.script.ui.addStateFloat("final gamma", 0)
    pure.script.ui.addStateFloat("final exposure", 0)
end

-- This is called every frame
function update_pure_script(dt)

--    ██    ██  █████  ██      ██    ██ ███████ ███████ 
--    ██    ██ ██   ██ ██      ██    ██ ██      ██      
--    ██    ██ ███████ ██      ██    ██ █████   ███████ 
--     ██  ██  ██   ██ ██      ██    ██ ██           ██ 
--      ████   ██   ██ ███████  ██████  ███████ ███████ 

    -- ******** COLOR ********
    local uiHue = pure.script.ui.getValue("Hue")
    local uiSaturation = pure.script.ui.getValue("Saturation")/100
    local uiBrightness = pure.script.ui.getValue("Brightness")/100
    local uiContrast = pure.script.ui.getValue("Contrast")/100
    local uiSepia = pure.script.ui.getValue("Sepia")/100
    local uiColorTemperature = pure.script.ui.getValue("Color Temperature")
    local uiWhiteBalance = pure.script.ui.getValue("White Balance")

    -- ***** TONEMAPPING *****
    local uiToneFunc = pure.script.ui.getValue("Function")
    local uiToneExp = pure.script.ui.getValue("Exposure")
    local uiToneGamma = pure.script.ui.getValue("Gamma")
    local uiToneMapFac = pure.script.ui.getValue("Mapping Factor")
    local uiToneFilCon = pure.script.ui.getValue("Filmic Contrast")/100


--    ███████  ██████ ██████  ██ ██████  ████████ 
--    ██      ██      ██   ██ ██ ██   ██    ██    
--    ███████ ██      ██████  ██ ██████     ██    
--         ██ ██      ██   ██ ██ ██         ██    
--    ███████  ██████ ██   ██ ██ ██         ██    

    -- ******** COLOR ********
    ac.setPpHue(uiHue)
    ac.setPpSaturation(uiSaturation)
    ac.setPpBrightness(uiBrightness)
    ac.setPpContrast(uiContrast)
    ac.setPpSepia(uiSepia)
    ac.setPpColorTemperatureK(uiColorTemperature)
    ac.setPpWhiteBalanceK(uiWhiteBalance)

    -- ***** TONEMAPPING *****
    ac.setPpTonemapFunction(uiToneFunc)
    ac.setPpTonemapExposure(uiToneExp)
    ac.setPpTonemapGamma(uiToneGamma)
    ac.setPpTonemapMappingFactor(uiToneMapFac)
    ac.setPpTonemapFilmicContrast(uiToneFilCon)





    pure.exposure.cbe.setTarget(
        math.lerp(
            pure.script.ui.getValue("Target Day"),
            pure.script.ui.getValue("Target Night"),
            pure.mod.night(0)
        )
    )
    pure.exposure.cbe.setSensitivity(pure.script.ui.getValue("Sensitivity"))
    pure.exposure.cbe.setLimits(
        pure.script.ui.getValue("Range Minimum"),
        pure.script.ui.getValue("Range Maximum")
    )
    pure.exposure.cbe.setMultiplier(pure.script.ui.getValue("Multiplier"))

    pure.script.ui.setValue("final exposure", pure.exposure.getValue())

    ac.setGodraysGlareRatio(0.0)
    ac.setGodraysLength(7 * pure.pp.getGodraysModulator())
end