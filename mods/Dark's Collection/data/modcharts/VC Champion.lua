local time = 0
local beatSwap = 1
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.6
local perlinXRange = 0.07
local perlinYRange = 0.07
flechas = {42,60,80,102,122,140}
angulos = {780,794,800,820,840,860,866,872,876,896,916,920,932,944,952,956,1240,1260}
bloom = {1040,1120,1200,1780}
callatedarking = {780,794,800,820,840,860,866,872,876,896,916,920,932,944,952,956,1240,1260,1900,1906}

local downscroll = 1

function createPost()
       set("dad.y",getActorY("dad")-50)
    initShader('vcrshader', 'vcrshader')

    initShader('particles', 'particlesnew')--
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.84)
    setShaderProperty('particles', 'red', 1.5)
    setShaderProperty('particles', 'green', 1)
    setShaderProperty('particles', 'blue', 3.5)

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH', 0)

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-350,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(350,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")
	
    
    initShader('MosaicEffect', 'MosaicEffect')
	setCameraShader('hud', 'MosaicEffect')
    setCameraShader('game', 'MosaicEffect')
	setShaderProperty("MosaicEffect","strength",50)
    
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue', 1.5)

    initShader('colorgame', 'ColorOverrideEffect')
    setCameraShader('game', 'colorgame')
    setShaderProperty('colorgame', 'red', 1)
    setShaderProperty('colorgame', 'green',1)
    setShaderProperty('colorgame', 'blue', 1)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.3)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.5)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('MirrorRepeatEffect', 'MirrorRepeatEffect')
    setCameraShader('hud', 'MirrorRepeatEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
    setShaderProperty('MirrorRepeatEffect', 'zoom', 1.5)
    setShaderProperty('MirrorRepeatEffect', 'angle', 20)
    setShaderProperty('MirrorRepeatEffect', 'x', 0)
    setShaderProperty('MirrorRepeatEffect', 'y', 0)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 1)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.005)

    initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    initShader('colorfill', 'ColorFillEffect')
    setCameraShader('game', 'colorfill')
    setCameraShader('hud', 'colorfill')
    setShaderProperty('colorfill', 'red', 0)
    setShaderProperty('colorfill', 'green', 0)
    setShaderProperty('colorfill', 'blue', 0)
    setShaderProperty('colorfill', 'fade', 1)


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

    for i = 0,7 do
        setActorProperty(i,"y",-150,defaultStrum0Y+(150*downscroll))
    end

end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'linear')
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('heat', 'iTime', time)
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('particles', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    
end

function songStart()
    tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*8, 'cubeInOut')
    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*7, 'cubeInOut')
    tweenShaderProperty('MosaicEffect', 'strength', 0, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('EyeFishEffect', 'power', -0.1, crochet*0.001*8, 'cubeInOut')
    tweenActorProperty('bottomBar', 'y',650, crochet*0.001*6, 'cubeIn')
    tweenActorProperty('topBar', 'y',-650, crochet*0.001*6, 'cubeIn')
    for i = 0,7 do
        tweenActorProperty(i,"y",defaultStrum0Y,4,"cubeInOut")
        tweenActorProperty(i,"angle",360,2.5,"cubeInOut")
    end
end

function stepHit()
    for i = 1, #angulos do
        if curStep == angulos [i]-1 then
            beatSwap = beatSwap * -1
            setShaderProperty('barrel', 'angle', -25*beatSwap)
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        end
    end
    for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(4,1,4)
        end
    end
    for i = 1, #flechas do
        if curStep == flechas [i]-1 then
            beatSwap = beatSwap * -1
            for i = 0,7 do   
                if (i >= 0 and i <= 7) then   
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+40*beatSwap)
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20, stepCrochet*0.001*8, 'cubeOut')
                    setActorProperty(i,'angle',-30*beatSwap)
                    tweenActorProperty(i,'angle',0, stepCrochet*0.001*8, 'cubeOut')
                end
            end
        end
    end

    for i = 1, #callatedarking do
        if curStep == callatedarking [i]-1 then
            beatSwap = beatSwap * -1
            for i = 0,7 do   
                if (i >= 0 and i <= 7) then   
                    setActorProperty(i,'angle',-40*beatSwap)
                    tweenActorProperty(i,'angle',0, stepCrochet*0.001*4, 'linear')
                end
            end
        end
    end
    if curStep == 136 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*6, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 2, crochet*0.001*6, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 10, crochet*0.001*6, 'cubeIn')
    elseif curStep == 160 then
        setShaderProperty('ca', 'strength', 0)
        bloomBurst(10,1,6)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('MirrorRepeatEffect', 'zoom', 2)
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 176 or curStep == 216 then
        tweenShaderProperty('mirrorGame', 'x', 2, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 192 or curStep == 236 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
    end
    if curStep == 280 or curStep == 300 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.3, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',600, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('topBar', 'y',-600, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 292 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.5, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',550, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('topBar', 'y',-550, stepCrochet*0.001*8, 'cubeOut')
    end
    if curStep == 312 then
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 316 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 2, crochet*0.001*2, 'cubeInOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*4, 'cubeOut')
    elseif curStep == 320 then
        setShaderProperty('ca', 'strength', 0.005)
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst(4,1,4)
    end
    if curStep >= 320 and curStep < 400 or curStep >= 960 and curStep < 1040 then
        if curStep % 16 == 0 then
            tweenShaderProperty("mirrorGame","zoom",1,stepCrochet*0.001*8,"cubeOut")
           
        elseif curStep % 16 == 8 then
            tweenShaderProperty("mirrorGame","zoom",0.8,stepCrochet*0.001*8,"cubeIn")
        end
    end

    if curStep == 336 then
        tweenShaderProperty("mirrorGame","x",1.5,stepCrochet*0.001*8,"cubeInOut")
    elseif curStep == 356 then
        tweenShaderProperty("mirrorGame","x",0,crochet*0.001*2,"cubeInOut")
    elseif curStep == 400 then
        bloomBurst(4,1,4)
        tweenShaderProperty("mirrorGame","zoom",1,stepCrochet*0.001*8,"cubeOut")
    elseif curStep == 432 or curStep == 1712 then
        tweenShaderProperty("barrel","zoom",1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 436 or curStep == 1716 then
        tweenShaderProperty("barrel","zoom",1.2,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 440 or curStep == 1720 then
        tweenShaderProperty("barrel","zoom",1,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","angle",10,crochet*0.001*2,"cubeOut")
        bloomBurst(4,1,4)
    elseif curStep == 452 or curStep == 1732 then
        tweenShaderProperty("barrel","zoom",2,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","angle",-10,crochet*0.001*2,"cubeOut")
        tweenShaderProperty('EyeFishEffect', 'power', 0.3, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 460 or curStep == 1740 then
        tweenShaderProperty("barrel","zoom",1,stepCrochet*0.001*4,"cubeIn")
        tweenShaderProperty("barrel","angle",0,stepCrochet*0.001*4,"cubeIn")
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 472 or curStep == 1752 then
        tweenShaderProperty("barrel","zoom",1.5,stepCrochet*0.001*4,"cubeIn")
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 480 then
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*2,"cubeOut")
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        perlinXRange = 0.1
        perlinYRange = 0.1
        perlinZRange = 12.5
        perlinSpeed = 1
    elseif curStep == 1760 then
        tweenShaderProperty("barrel","zoom",1,crochet*0.001*2,"cubeOut")
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 492 then
        tweenShaderProperty("barrel","zoom",2,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 500 then
        tweenShaderProperty("barrel","zoom",1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 512 or curStep == 560 then
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 544 or curStep == 600 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
    end

    if (curStep >= 1920 and curStep < 2240) then
        if curStep % 16 == 0 then
            for i = 0,7 do   
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+40)
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20, stepCrochet*0.001*8, 'cubeOut')
                setActorProperty(i,'angle',-30)
                tweenActorProperty(i,'angle',0, stepCrochet*0.001*8, 'cubeOut')
            end
        elseif curStep % 16 == 8 then
            for i = 0,7 do   
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-50)
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20, stepCrochet*0.001*8, 'cubeOut')
                setActorProperty(i,'angle',30)
                tweenActorProperty(i,'angle',0, stepCrochet*0.001*8, 'cubeOut')
            end
        end
    end


    if (curStep >= 544 and curStep < 560) then
        if curStep % 8 == 0 then
            tweenShaderProperty('mirrorGame','zoom',2.5,stepCrochet*0.001*4,'cubeOut')
            tweenShaderProperty('EyeFishEffect', 'power', -0.4, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 8 == 4 then
            tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*4,'cubeIn')
            tweenShaderProperty('EyeFishEffect', 'power', 0.1, stepCrochet*0.001*4, 'cubeIn')
        end
    end
    
    if (curStep >= 626 and curStep < 638) then
        if curStep % 4 == 0 then
			beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'x', 0.25*beatSwap)
            tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*4,'quartOut')
        end
    end


    if curStep == 620 then
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', -0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty("MosaicEffect","strength",10,stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 632 then
        tweenShaderProperty("MosaicEffect","strength",0,stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
        setShaderProperty('mirrorGame', 'angle', 360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 640 then
        bloomBurst(4,1,4)
        perlinSpeed = 1.5
    elseif curStep == 688 or curStep == 704 then 
        setShaderProperty('mirrorGame', 'y', -2)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 800 then
        triggerEvent('screen shake', (crochet*0.001*20)..',0.015', (crochet*0.001*20)..',0')
    end
    if curStep == 800 or curStep == 880 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'x',10*beatSwap)
        tweenShaderProperty('mirrorGame','x',0,crochet*0.001*20,'linear')
    elseif curStep == 940 then
        tweenShaderProperty('barrel', 'zoom', 0.75, crochet*0.001*4, 'cubeIn')
    elseif curStep == 960 then
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        bloomBurst(4,1,4)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green',1.5)
        setShaderProperty('color', 'blue', 1.5)
        tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*6,"linear")
        perlinSpeed = 0
    end

    if curStep == 1056 or curStep == 1136 or curStep == 1216 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1060 or curStep == 1120 or curStep == 1140 or curStep == 1200 or curStep == 1220 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1104 or curStep == 1184 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.75, stepCrochet*0.001*8, 'cubeOut')
    end

    if curStep == 1260 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.55, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', -0.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty("MosaicEffect","strength",10,crochet*0.001*4, 'cubeIn')
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4, 'cubeIn')
    elseif curStep == 1264 then
        tweenShaderProperty('colorgame', 'red', 0,crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('colorgame', 'green',0,crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('colorgame', 'blue', 0,crochet*0.001*3, 'cubeIn')
    elseif curStep == 1276 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("MosaicEffect","strength",0,crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorgame', 'red', 1,crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorgame', 'green',1,crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorgame', 'blue', 1,crochet*0.001*4, 'cubeIn')
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
        setShaderProperty('ca', 'strength', 0)
    end
    if curStep >= 640 and curStep < 960 then
        if curStep % 4 == 0 then
            setShaderProperty('mirrorGame', 'zoom', 0.85)
            tweenShaderProperty("mirrorGame","zoom",1,stepCrochet*0.001*3.5,"linear")
        end
    end
    if curStep == 800 or curStep == 1920 then
        bloomBurst(4,1,4)
        setShaderProperty('color', 'red', 1.8)
        setShaderProperty('color', 'green',2.2)
        setShaderProperty('color', 'blue', 1)
        setShaderProperty('barrel', 'barrel', -2)
        tweenShaderProperty("barrel","barrel",0.3,stepCrochet*0.001*8,"linear")
    end

    if curStep == 1900 then
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', -0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty("MosaicEffect","strength",10,stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('barrel', 'angle', 25)
        tweenShaderProperty("barrel","angle",0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1912 then
        tweenShaderProperty("MosaicEffect","strength",0,stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1906 then
        setShaderProperty('barrel', 'angle', -25)
        tweenShaderProperty("barrel","angle",0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1920 then
        setShaderProperty('glitchChromatic', 'GLITCH', 0.07)
        setCameraShader('game', 'vcrshader')
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
        triggerEvent('screen shake', (crochet*0.001*80)..',0.015', (crochet*0.001*80)..',0')
        perlinXRange = 0.07
        perlinYRange = 0.07
        perlinZRange = 20
        perlinSpeed = 3.5
    end
    if curStep >= 1912 and curStep < 1920 then
        if curStep % 2 == 0 then
            beatSwap = beatSwap * -1
            setShaderProperty('barrel', 'angle', 25*beatSwap)
            tweenShaderProperty("barrel","angle",0,stepCrochet*0.001*1.5,"cubeOut")
        end
    end

    if curStep == 1444 then
        removeCameraShader("hud","colorfill")
        tweenShaderProperty('colorfill', 'red', 255, crochet*0.001*38, 'cubeIn')
        tweenShaderProperty('colorfill', 'green',255, crochet*0.001*38, 'cubeIn')
        tweenShaderProperty('colorfill', 'blue', 255, crochet*0.001*38, 'cubeIn')
        tweenShaderProperty('colorfill', 'fade', 0, crochet*0.001*38, 'cubeIn')
    elseif curStep == 1592 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.55, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', -0.5, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty("MosaicEffect","strength",10,stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4, 'cubeOut')
    elseif curStep == 1600 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("MosaicEffect","strength",0,crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('colorfill', 'fade', 1, crochet*0.001*2, 'cubeOut')
        setShaderProperty('ca', 'strength', 0.005)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        
        bloomBurst(4,1,4)
        perlinSpeed = 1.5
    end

    if curStep == 2200 or curStep == 2220 or curStep == 2226 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.55, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2204 or curStep == 2224 or curStep == 2230 or curStep == 2236 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 2232 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.3, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 2240 then
        bloomBurst(4,1,4)
        setShaderProperty('glitchChromatic', 'GLITCH', 0)
        removeCameraShader('game', 'vcrshader')
        setShaderProperty('greyscale', 'strength', 1)
        
        perlinZRange = 0
        perlinSpeed = 0.6 
        perlinXRange = 0.07
        perlinYRange = 0.07
    elseif curStep == 2360 then
        bloomBurst(4,1,4)
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty("greyscale","strength",1,stepCrochet*0.001*8,"cubeIn")
        tweenShaderProperty('color', 'red', 0,crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'green',0,crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0,crochet*0.001*8, 'cubeIn')
    end
    if curStep == 1920 or curStep == 1960 or curStep == 2000 or curStep == 2040 or curStep == 2080 or curStep == 2120 or curStep == 2160 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty("mirrorGame","x",0,stepCrochet*0.001*8,"expoOut")
    end
    if curStep >= 1920 and curStep < 2240 then
        if curStep % 4 == 0 then
            setShaderProperty('mirrorGame', 'zoom', 0.85)
            tweenShaderProperty("mirrorGame","zoom",1,stepCrochet*0.001*3.5,"linear")
        end
        if curStep % 24 == 0 then
            bloomBurst(2.5,1,4)
        end
    end
end