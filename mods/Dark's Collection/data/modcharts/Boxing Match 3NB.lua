local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local time = 0
local barrelzoom = {168,192,220,222,224,240,272,336,342,352,368,400,464,528,656,672,680,688,768,784,800,816,
                    832,848,896,912,1856,1872,1892,1888,1904,1920,1984,2000,2064,2192,2208,2224,2280}
local barrelxd = {1424,1440,1464,1472,1488,1504,1526}
local beatSwap = 1

function createPost()

    initShader('pixel', 'MosaicEffect')
    setCameraShader('hud', 'pixel')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 0)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 1)
    setShaderProperty('barrel', 'zoom', 2.5)
    setShaderProperty('barrel', 'angle', 90)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'doChroma', false)

    initShader('barrelGame', 'BarrelBlurEffect')
    setCameraShader('game', 'barrelGame')
    setShaderProperty('barrelGame', 'barrel', 0.05)
    setShaderProperty('barrelGame', 'zoom', 1)
    setShaderProperty('barrelGame', 'x', 0)
    setShaderProperty('barrelGame', 'y', 0)
    setShaderProperty('barrelGame', 'angle', 0)
    setShaderProperty('barrelGame', 'doChroma', true)

    initShader('barrelHud', 'BarrelBlurEffect')
    setCameraShader('hud', 'barrelHud')
    setShaderProperty('barrelHud', 'barrel', 0)
    setShaderProperty('barrelHud', 'zoom', 1)
    setShaderProperty('barrelHud', 'x', 0)
    setShaderProperty('barrelHud', 'y', 0)
    setShaderProperty('barrelHud', 'angle', 0)
    setShaderProperty('barrelHud', 'doChroma', true)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.2)

    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.04)

    initShader('smokeHUD', 'PerlinSmokeEffect')
    setCameraShader('hud', 'smokeHUD')
    setShaderProperty('smokeHUD', 'waveStrength', 0.05)

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('MirrorRepeatEffect', 'MirrorRepeatEffect')
    setCameraShader('game', 'MirrorRepeatEffect')
    setCameraShader('hud', 'MirrorRepeatEffect')
    setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
    setShaderProperty('MirrorRepeatEffect','x',0)
    setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0) 

    initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
	setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 10)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.006)
    
    initShader('cablue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'cablue')
    setCameraShader('hud', 'cablue')
    setShaderProperty('cablue', 'strength', 0)

    createCustomShader("vcrshader", "vcrshader", 120)
      setCameraCustomShader("vcrshader", "game")

      setProperty("healthBar","alpha",0)
      setProperty("healthBarBG","alpha",0)
      setProperty("infoTxt","alpha",0)
      setProperty("iconP1","alpha",0)
      setProperty("iconP2","alpha",0)
      setProperty("scoreTxt","alpha",0)
      setProperty("timeBar","alpha",0)
      setProperty("timeBarBG","alpha",0)
      setProperty("ratingText","alpha",0)
      setProperty("ratingsGroup","x",0)

      if not middlescroll then
		for i = 0,3 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+640,0.01,"cubeOut")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
            tweenActorProperty(i,"alpha",0,0.1,"linear")
		end
        for i = 4,7 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-640,0.01,"cubeOut")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
            tweenActorProperty(i,"alpha",0,0.1,"linear")
		end
    end

    
end

function barrelZoom()
    setShaderProperty('barrel', 'barrel', 1)
    setShaderProperty('barrel', 'zoom', 0.8)
    setShaderProperty('blur', 'strength', 10)
    tweenShaderProperty('barrel', 'zoom', 1.0, stepCrochet*0.001*4, 'cubeOut')
    tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
    tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
    beatSwap = beatSwap * -1
    setShaderProperty('barrelHud', 'x', -0.15*beatSwap)
    tweenShaderProperty('barrelHud','x',0,stepCrochet*0.001*4,'cubeOut')
end

function barrelBurst()
    setShaderProperty("barrel","barrel",1.2)
    tweenShaderProperty("barrel","barrel",-0.15, stepCrochet*0.001*4, "cubeOut")
end


function songStart()

    tweenShaderProperty('barrel', 'zoom', 1.0, crochet*0.001*35, 'cubeInOut')
    tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*55, 'cubeInOut')
	tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*35, 'cubeInOut')
    tweenShaderProperty('scanline', 'strength', 0, crochet*0.001*36, 'cubeIn')
    tweenShaderProperty('color', 'red', 1.3, crochet*0.001*26, 'cubeIn')
    tweenShaderProperty('color', 'green', 1.3, crochet*0.001*26, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.3, crochet*0.001*26, 'cubeIn')
    tweenShaderProperty("blur","strength",0,stepCrochet*0.001*64,"backIn")
    tweenShaderProperty("smokeHUD","waveStrength",0,crochet*0.001*64,"cubeIn")
    perlinXRange = 0.25 
    perlinYRange = 0.25
    perlinSpeed = 1.9 

end

function bloomBurst( step )
    setShaderProperty("bloom","contrast",4.5)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*6,"cubeOut")
end

function stepHit()
    if curStep == 112 then
        tweenShaderProperty("bloom","contrast",10,crochet*0.001*4,"cubeIn")
	elseif curStep == 128 then
        setShaderProperty('greyscale', 'strength', 0)
        flashCamera('hud', '#FFFFFF', 1)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*6,"cubeOut")
        perlinXRange = 0 
        perlinYRange = 0
        if not middlescroll then
            for i = 0,0 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 7,7 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 1,1 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,3.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 6,6 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,3.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 2,2 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,4.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 5,5 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,4.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 3,3 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,5.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 4,4 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,5.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
        end
    elseif curStep == 240 then
        tweenShaderProperty("bloom","contrast",10,crochet*0.001*4,"cubeIn")
        setShaderProperty('barrel', 'angle', 0)
        tweenShaderProperty('barrel', 'angle', -360, crochet*0.001*8, 'cubeInOut')
    elseif curStep == 256 then
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*6,"cubeOut")
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        if not middlescroll then
            for i = 0,3 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"cubeIn")
            end
            for i = 4,7 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"cubeIn")
            end
        end
    end

    for i = 1, #barrelzoom do
        if curStep == barrelzoom [i]-1 then
            barrelZoom()
        end
    end
    
    for i = 1, #barrelxd do
        if curStep == barrelxd [i]-1 then
            barrelBurst()
        end
    end

    if curStep == 288 or curStep == 416 or curStep == 544 or curStep == 1824 then
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 296 or curStep == 424 or curStep == 1832 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.25)
    elseif curStep == 304 or curStep == 432 or curStep == 1840 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.45)
    elseif curStep == 312 or curStep == 440 or curStep == 1848 then
        setShaderProperty('barrelGame', 'angle', 40)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        setStageColorSwap('hue', 0.74)
    elseif curStep == 316 then
        setShaderProperty('barrelGame', 'angle', -40)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 320 or curStep == 448 or curStep == 1856 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('barrelGame', 'zoom', 0.5)
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*6, 'cubeOut')
        setStageColorSwap('hue', 0)

    -- una parte

    elseif curStep == 552 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
        setStageColorSwap('hue', 0)
        setShaderProperty('barrel', 'barrel', -6)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 560 then
        setShaderProperty('barrelGame', 'angle', -40)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.2)
    elseif curStep == 568 then
        setShaderProperty('barrelGame', 'angle', 40)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, crochet*0.001*2, 'cubeOut')
        setStageColorSwap('hue', 0.45)
    elseif curStep == 576 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*6, 'cubeOut')
        setStageColorSwap('hue', 0.74)
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 584 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.2)
    elseif curStep == 592 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.45)
    elseif curStep == 600 then
        setShaderProperty('barrelGame', 'angle', -40)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, crochet*0.001*2, 'cubeOut')
        setStageColorSwap('hue', 0.74)
    elseif curStep == 608 then
        setStageColorSwap('hue', 0)
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'barrel', -2.5, crochet*0.001*10, 'cubeIn')
        setShaderProperty('barrel', 'doChroma', true)
    elseif curStep == 624 then
        tweenShaderProperty('barrelGame', 'zoom', 2.5,stepCrochet*0.001*4,'backOut')
        tweenShaderProperty("barrelGame","y",-8,crochet*0.001*4,"cubeInOut")
        tweenShaderProperty("bloom","contrast",8,crochet*0.001*5,"cubeIn")
    elseif curStep == 630 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 640 then
        tweenShaderProperty('barrelGame', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 480 or curStep == 2016 then
        tweenShaderProperty('barrelGame', 'barrel', -1, crochet*0.001*6, 'cubeIn')
    elseif curStep == 496 or curStep == 2032 then
        tweenShaderProperty("barrelGame","zoom",2.5,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrelGame","x",-2,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty("bloom","contrast",20,crochet*0.001*4,"cubeIn")
    elseif curStep == 504 then
        tweenShaderProperty("pixel","strength",10,crochet*0.001*1.7,"cubeOut")
        tweenShaderProperty("barrelGame","y",-4,crochet*0.001*4,"cubeInOut")
        tweenShaderProperty('barrelGame', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty("barrelGame","angle",-360,crochet*0.001*8,"cubeInOut")
        tweenShaderProperty("barrelGame","zoom",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 512 or curStep == 2048 then
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*6,"cubeOut")
        setShaderProperty('pixel', 'strength', 0)
        setShaderProperty('barrelGame', 'zoom', 1)
        setShaderProperty('greyscale', 'strength', 0)
    elseif curStep == 2040 then
        tweenShaderProperty("pixel","strength",10,crochet*0.001*1.7,"cubeOut")
        tweenShaderProperty("barrelGame","y",-14,crochet*0.001*4,"cubeInOut")
        tweenShaderProperty('barrelGame', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty("barrelGame","angle",-360,crochet*0.001*8,"cubeInOut")
        tweenShaderProperty("barrelGame","zoom",1,crochet*0.001*4,"cubeOut")
    end

    if curStep == 704 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 712 then
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*6, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'zoom', 3,stepCrochet*0.001*4,'cubeOut')
        setStageColorSwap('hue', 0.25)
    elseif curStep == 720 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'zoom', 1,stepCrochet*0.001*4,'cubeIn')
        setStageColorSwap('hue', 0.45)
    elseif curStep == 728 then
        setShaderProperty('barrelGame', 'angle', -360)
        setShaderProperty('barrelGame', 'barrel', -2)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 736 then
        tweenShaderProperty('barrelGame', 'zoom', 1,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('barrelGame', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)
    elseif curStep == 752 then
        tweenShaderProperty("barrelGame","zoom",3,crochet*0.001*2,"cubeOut")
        setShaderProperty('barrelGame', 'barrel', 0.05)
        tweenShaderProperty("bloom","contrast",8,crochet*0.001*4,"cubeIn")
    elseif curStep == 758 then
        tweenShaderProperty("barrelGame","y",-14,crochet*0.001*4,"cubeInOut")
    elseif curStep == 768 then
        tweenShaderProperty("barrelGame","zoom",1,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('barrelGame', 'barrel', 0)
        triggerEvent('screen shake', (crochet*0.001*64)..',0.004', (crochet*0.001*64)..',0.0055')
    elseif curStep == 800 or curStep == 832 or curStep == 848 or curStep == 880 or curStep == 896 or curStep == 928 or curStep == 960 or curStep == 984 or curStep == 999 then
        tweenShaderProperty("barrel","zoom",3,stepCrochet*0.001*7,"cubeIn")
    elseif curStep == 816 or curStep == 840 or curStep == 864 or curStep == 888 or curStep == 912 or curStep == 944 or curStep == 976 or curStep == 992 or curStep == 1008 then
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*2,"cubeOut")
    end
    if curStep == 864 or curStep == 866 or curStep == 928 or curStep == 960 then
        setShaderProperty('barrel', 'barrel', -2.05)
        tweenShaderProperty("barrel","barrel",0.05,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 992 or curStep == 1008 then
        tweenShaderProperty("barrel","barrel",-2.05,crochet*0.001*4,"cubeIn")
    end
    if curStep == 1008 or curStep == 2544 then
        tweenShaderProperty("barrelGame","y",-18,crochet*0.001*4,"cubeInOut")
        tweenShaderProperty("bloom","contrast",8,crochet*0.001*4,"cubeIn")
    elseif curStep == 1024 or curStep == 2560 then
        tweenShaderProperty("barrel","barrel",0.05,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    end
    if curStep == 1024 then
        perlinXRange = 0.25
        perlinZRange = 20
        perlinSpeed = 1.9
        setProperty("healthBar","alpha",0)
        setProperty("healthBarBG","alpha",0)
        setProperty("infoTxt","alpha",0)
        setProperty("iconP1","alpha",0)
        setProperty("iconP2","alpha",0)
        setProperty("scoreTxt","alpha",0)
        setProperty("timeBar","alpha",0)
        setProperty("timeBarBG","alpha",0)
        setProperty("ratingText","alpha",0)
        setProperty("ratingsGroup","alpha",0)
        tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
    end
    if curStep == 768 or curStep == 2304 then
        tweenShaderProperty("smokeHUD","waveStrength",0.04,crochet*0.001*4,"cubeOut")
    elseif curStep == 1024 or curStep == 1528 or curStep == 2560 then
        tweenShaderProperty("smokeHUD","waveStrength",0.025,crochet*0.001*4,"cubeOut")
    elseif curStep == 1280 then
        tweenShaderProperty("smokeHUD","waveStrength",0,crochet*0.001*16,"cubeIn")
    elseif curStep == 1722 then
        tweenShaderProperty("smokeHUD","waveStrength",0,crochet*0.001*4,"cubeIn")
    end
     
    -- primer drop

    if curStep == 1040 or curStep == 1072 or curStep == 1056 or curStep == 1088 or curStep == 1104 or curStep == 1120 or curStep == 1128 or curStep == 1136 or curStep == 1152 or curStep == 1168 or curStep == 1184 or curStep == 1200  then
        setShaderProperty('bloom', 'contrast', 8.05)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1048 or curStep == 1078 or curStep == 1112 or curStep == 1128 or curStep == 1176 or curStep == 1208 then
        triggerEvent('Add Camera Zoom','0.09','0.09')
        tweenShaderProperty('barrelGame', 'zoom', 0.7, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1056 or curStep == 1088 or curStep == 1120 or curStep == 1184 or curStep == 1216 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1056 or curStep == 1184 then
        setStageColorSwap('hue', 0.25)--verde
    elseif curStep == 1088 then
        setStageColorSwap('hue', 0.45)--cyan
    elseif curStep == 1120 then
        setStageColorSwap('hue', 0.71)--morado
        tweenShaderProperty("barrel","barrel",-0.55,crochet*0.001*8,"cubeIn")
    elseif curStep == 1136 then
        tweenShaderProperty("barrelGame","y",-14,crochet*0.001*6,"cubeInOut")
        tweenShaderProperty("barrel","zoom",2.5,crochet*0.001*4,"cubeInOut")
    elseif curStep == 1152 then
        tweenShaderProperty("barrelGame","zoom",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)--default
        tweenShaderProperty("barrel","barrel",0.05,crochet*0.001*4,"cubeOut")
    elseif curStep == 1216 then
        perlinXRange = 0
        perlinZRange = 0
        tweenShaderProperty("barrel","barrel",-4,crochet*0.001*16,"cubeIn")
    elseif curStep == 1276 then
        tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1280 then
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*26,"linear")
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeIn')
        tweenStageColorSwap('hue', 0,crochet*0.001*16, 'linear')--default
    elseif curStep == 1392 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1408 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 2.05)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1520 then
        setShaderProperty('barrel', 'angle', 360)
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*6, 'cubeInOut')
    elseif curStep == 1528 then
        tweenShaderProperty("bloom","contrast",8,crochet*0.001*3,"cubeIn")
    elseif curStep == 1536 then
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","barrel",-0.7,crochet*0.001*2,"cubeOut")
        setShaderProperty('barrel', 'doChroma', false)
        tweenShaderProperty("cablue","strength",0.006,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("ca","strength",0,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("greysale","strength",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 1648 then
        setShaderProperty('barrel', 'angle', 360)
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("pixel","strength",60,crochet*0.001*2,"cubeIn")
        setShaderProperty("barrel","barrel",0)
    elseif curStep == 1664 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","barrel",-0.7,crochet*0.001*2,"cubeOut")
        setShaderProperty('pixel', 'strength', 0)
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1760 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*10, 'cubeInOut')
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 1768 then
        tweenShaderProperty("pixel","strength",60,crochet*0.001*4,"cubeIn")
    elseif curStep == 1776 or curStep == 1782 or curStep == 1786 or curStep == 1790 then
        setShaderProperty('color', 'red', 0.0)
        setShaderProperty('color', 'green', 0.0)
        setShaderProperty('color', 'blue', 0.0)
        tweenShaderProperty('color', 'red', 1.3, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.3, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.3, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1792 then
        setShaderProperty('pixel', 'strength', 0)
        setShaderProperty('barrel', 'angle', 360)
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('ca', 'strength', 0.006)
        setShaderProperty('cablue', 'strength', 0)
        bloomBurst()
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
    end
    if curStep == 1920 then
        tweenShaderProperty('barrelGame', 'zoom', 1.0, crochet*0.001*2, 'cubeOut')
        bloomBurst()
    elseif curStep == 1936 then
        tweenShaderProperty('barrelGame', 'zoom', 3.0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1952 then
        setShaderProperty('barrelGame', 'angle', -360)
        setShaderProperty('barrelGame', 'zoom', 1)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 1960 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'zoom', 3.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.25)
    elseif curStep == 1968 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.45)
        tweenShaderProperty('barrelGame', 'y', -10, crochet*0.001*6, 'cubeInOut')
    elseif curStep == 1978 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 1984 then
        setShaderProperty('barrelGame', 'angle', -360)
        setShaderProperty('barrelGame', 'zoom', 1)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)
    end
    if curStep == 2048 then
        perlinXRange = 0.25 
        perlinZRange = 12
        perlinSpeed = 0.9
    elseif curStep == 2080 or curStep == 2112 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.7)
    elseif curStep == 2087 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)
    elseif curStep == 2096 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.3)
    elseif curStep == 2104 then
        setStageColorSwap('hue', 0.6)
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2120 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.25)
    elseif curStep == 2128 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.55)
    elseif curStep == 2136 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.7)
        setShaderProperty('barrelGame', 'barrel', -1)
        tweenShaderProperty('barrelGame', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2144 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)
        tweenShaderProperty('barrel', 'barrel', -1.5, crochet*0.001*6, 'cubeIn')
        setShaderProperty('barrel', 'doChroma', true)
    elseif curStep == 2160 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.7)
    elseif curStep == 2168 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.25)
        tweenShaderProperty('barrelGame', 'y', -20, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 2176 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setStageColorSwap('hue', 0)
        setShaderProperty('barrel', 'barrel', 0.15)
    end
    if curStep == 2080 then
        tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2112 then
        tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*2, 'backOut')
    elseif curStep == 2128 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'expoOut')
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*8, 'cubeInOut')
    end
    if curStep == 2240 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.7)
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2248 then
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2256 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        setStageColorSwap('hue', 0.45)
    elseif curStep == 2264 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.7)
        setShaderProperty('barrelGame', 'angle', 50)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2272 then
        setShaderProperty('bloom', 'contrast', 4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)
        tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2288 then
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrelGame', 'y', -24, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty("bloom","contrast",8,crochet*0.001*4,"cubeIn")
    elseif curStep == 2296 then
        tweenShaderProperty('barrel', 'barrel', -1.5, stepCrochet*0.001*8, 'cubeIn')
        setShaderProperty('barrel', 'doChroma', true)
    elseif curStep == 2304 then
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*64)..',0.004', (crochet*0.001*64)..',0.0055')
        perlinXRange = 0
        perlinZRange = 0
        perlinSpeed = 0.5
    elseif curStep == 2336 or curStep == 2368 or curStep == 2384 or curStep == 2416 or curStep == 2432 or curStep == 2464 or curStep == 2496 or curStep == 2520 or curStep == 2536 then
        tweenShaderProperty("barrel","zoom",3,stepCrochet*0.001*7,"cubeIn")
    elseif curStep == 2352 or curStep == 2376 or curStep == 2400 or curStep == 2424 or curStep == 2448 or curStep == 2484 or curStep == 2512 or curStep == 2528 or curStep == 2544 then
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*2,"cubeOut")
    elseif curStep == 2560 then
        perlinXRange = 0.25
        perlinZRange = 20
        perlinSpeed = 1.9
        setProperty("healthBar","alpha",0)
        setProperty("healthBarBG","alpha",0)
        setProperty("infoTxt","alpha",0)
        setProperty("iconP1","alpha",0)
        setProperty("iconP2","alpha",0)
        setProperty("scoreTxt","alpha",0)
        setProperty("timeBar","alpha",0)
        setProperty("timeBarBG","alpha",0)
        setProperty("ratingText","alpha",0)
        setProperty("ratingsGroup","alpha",0)
        tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
    end
    
    -- segundo drop 

    if curStep == 2576 or curStep == 2592 or curStep == 2608 or curStep == 2624 or curStep == 2640 or curStep == 2656 or curStep == 2672 or curStep == 2688 or curStep == 2720 or curStep == 2736 then
        setShaderProperty('bloom', 'contrast', 8.05)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 2584 or curStep == 2616 or curStep == 2648 or curStep == 2704 or curStep == 2744 then
        triggerEvent('Add Camera Zoom','0.09','0.09')
        tweenShaderProperty('barrelGame', 'zoom', 0.7, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 2592 or curStep == 2624 or curStep == 2656 or curStep == 2720 or curStep == 2752 then
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 2592 or curStep == 2720 then
        setStageColorSwap('hue', 0.25)--verde
    elseif curStep == 2616 then
        setStageColorSwap('hue', 0.45)--cyan
    elseif curStep == 2656 then
        setStageColorSwap('hue', 0.71)--morado
        tweenShaderProperty("barrel","barrel",-0.55,crochet*0.001*8,"cubeIn")
    elseif curStep == 2672 then
        tweenShaderProperty("barrelGame","y",-20,crochet*0.001*6,"cubeInOut")
        tweenShaderProperty("barrel","zoom",2.5,crochet*0.001*4,"cubeInOut")
    elseif curStep == 2688 or curStep == 3200 then
        tweenShaderProperty("barrelGame","zoom",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0)--default
        tweenShaderProperty("barrel","barrel",0.05,crochet*0.001*4,"cubeOut")
    elseif curStep == 2752 then
        perlinXRange = 0
        perlinZRange = 0
        tweenShaderProperty("barrel","barrel",-4,crochet*0.001*16,"cubeIn")
    elseif curStep == 2800 then
        tweenShaderProperty('barrelGame', 'x', 4, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 2816 then
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"linear")
        bloomBurst()
        tweenStageColorSwap('hue', 0,crochet*0.001*16, 'linear')
        perlinXRange = 0.3
        perlinZRange = 25
        perlinSpeed = 2.1
    end
    if curStep == 2832 or curStep == 2864 or curStep == 2896 or curStep == 2960 or curStep == 3024 or curStep == 3008 or curStep == 3120 or curStep == 3152 or curStep == 3242 then
        setShaderProperty('barrel', 'barrel',-3)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        bloomBurst()
    elseif curStep == 2840 or curStep == 2872 or curStep == 2904 or curStep == 2968 or curStep == 3000 or curStep == 3032 or curStep == 3096 or curStep == 3128 or curStep == 3160 or curStep == 3224 or curStep == 3256 then
        triggerEvent('Add Camera Zoom','0.09','0.09')
        tweenShaderProperty('barrelGame', 'zoom', 0.7, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 2848 or curStep == 2880 or curStep == 2912 or curStep == 2976 or curStep == 3008 or curStep == 3104 or curStep == 3136 or curStep == 3168 or curStep == 3232 or curStep == 3264 then
        triggerEvent('Add Camera Zoom','0.09','0.09')
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
        bloomBurst()
    elseif curStep == 2928 then
        setShaderProperty('barrel', 'barrel',1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'y', -18, stepCrochet*0.001*6, 'cubeInOut')
        bloomBurst()
    elseif curStep == 2944 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('barrel', 'barrel',-1)
        bloomBurst()
    end
    if curStep == 3200 then
        tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*32, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*32, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*32, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*32, 'cubeIn')
        tweenShaderProperty("blur","strength",10,crochet*0.001*32,"cubeIn")
        tweenShaderProperty("pixel","strength",10,crochet*0.001*48,"cubeIn")
        tweenStageColorSwap('hue', 0,crochet*0.001*24, 'cubeIn')--default
    end
    if curStep == 2944 or curStep == 2992 or curStep == 3168 then
        setStageColorSwap('hue', 0.71)
    elseif curStep == 2960 or curStep == 3024 or curStep == 3112 or curStep == 3232 then
        setStageColorSwap('hue', 0.25)
    elseif curStep == 2976 or curSep == 3136 then
        setStageColorSwap('hue', 0.45)
    elseif curStep == 3008 or curStep == 3200 then
        setStageColorSwap('hue', 0)
    end
    if curStep == 3168 then
        tweenShaderProperty("barrel","barrel",-0.55,crochet*0.001*8,"cubeIn")
    elseif  curStep == 3184 then
        tweenShaderProperty("barrelGame","y",-14,crochet*0.001*6,"cubeInOut")
        tweenShaderProperty("barrel","zoom",2.5,crochet*0.001*4,"cubeInOut")
    end
    if curStep == 3040 then
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.74)
    elseif curStep == 3048 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.25)
    elseif curStep == 3056 then
        setShaderProperty('barrelGame', 'angle', -360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setStageColorSwap('hue', 0.45)
    elseif curStep == 3064 then
        setShaderProperty('barrelGame', 'angle', 40)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        setStageColorSwap('hue', 0.74)
    elseif curStep == 3072 then
        setShaderProperty('bloom', 'contrast', 3)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('barrelGame', 'angle', 360)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('blur', 'strength', 10)
        tweenShaderProperty('blur', 'strength', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*6, 'cubeOut')
    end
    if curStep >= 768 and curStep < 832 or curStep >= 896 and curStep < 1024 or curStep >= 1216 and curStep < 1288 or curStep >= 2304 and curStep < 2368 or curStep >= 2432 and curStep < 2560 or curStep >= 2752 and curStep < 2824 then
		if curStep % 48 == 0 then
			tweenShaderProperty("barrel", "angle", 5, stepCrochet*0.001*12, "cubeOut")
		end
		if curStep % 48 == 12 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*12, "cubeIn")
		end
		if curStep % 48 == 24 then
			tweenShaderProperty("barrel", "angle", -5, stepCrochet*0.001*12, "cubeOut")
		end
		if curStep % 48 == 36 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*12, "cubeIn")
		end
	end
    if curStep >= 1536 and curStep < 1648 or curStep >= 1664 and curStep < 1760  then
        if curStep % 24 == 8 then
            triggerEvent('Add Camera Zoom','0.09','0.09')
            tweenShaderProperty('barrelGame', 'zoom', 1.0, crochet*0.001*2, 'cubeOut')
        elseif curStep % 24 == 16 then
            tweenShaderProperty('barrelGame', 'zoom', 0.75, stepCrochet*0.001*8, 'cubeIn')
        end
    end
    if curStep == 1668 or curStep == 1676 or curStep == 1688 or curStep == 3216 then
        bloomBurst()
    end

    -- sobel

    if curStep == 256 or curStep == 320 or curStep == 448 or curStep == 512 or curStep == 640 or curStep == 768 or curStep == 896 or curStep == 1024 or curStep == 1152 or curStep == 1792 or curStep == 1856 or curStep == 2048 or curStep == 2112 or curStep == 2304 or curStep == 2432 or curStep == 2560 or curStep == 2688 or curStep == 3072 or curStep == 3200 then
        setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*6, 'cubeOut')
    elseif curStep == 1280 then
        setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1024 or curStep == 2560 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,1.5,"cubeOut")
                    tweenActorProperty(i,"alpha",0.25,0.5,"linear")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,1.5,"cubeOut")
                end
            end
        end
    elseif curStep == 1280 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,3.5,"cubeOut")
                    tweenActorProperty(i,"alpha",0,3.5,"linear")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,3.5,"cubeOut")
                    tweenActorProperty(i,"alpha",0,3.5,"linear")
                end
            end
        end
    elseif curStep == 1376 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700)
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700)
                end
            end
        end
    elseif curStep == 1408 then
        if not middlescroll then
            for i = 0,0 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 7,7 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 1,1 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,3.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 6,6 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,3.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 2,2 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,4.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 5,5 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,4.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 3,3 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,5.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
            for i = 4,4 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,5.5,"cubeOut")
                tweenActorProperty(i,"alpha",1,6,"linear")
            end
        end
    elseif curStep == 1792 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"cubeIn")
                    tweenActorProperty(i,"alpha",1,0.5,"linear")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"cubeIn")
                end
            end
        end
    elseif curStep == 1520 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,2.5,"cubeOut")
                    tweenActorProperty(i,"alpha",0.25,2.5,"linear")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,2.5,"cubeOut")
                end
            end
        end
    elseif curStep == 2816 then
        for i = 0,3 do
            if not middlescroll then
                if (i >= 0 and i <= 1)  then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-30,0.5,"cubeIn")
                elseif (i >= 2 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+620,0.5,"cubeIn")
                end
            end
        end
    end
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)
    setCustomShaderFloat('smokeHUD', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end
 
function bloomBurst()
    setShaderProperty('bloom', 'contrast', 3)
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
end