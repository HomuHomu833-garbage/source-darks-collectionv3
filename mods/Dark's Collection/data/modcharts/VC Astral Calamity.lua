function createPost()
    makeCamera("anotherhud")
    makeCamera("anotherhud2")


    makeSprite('focus', 'focus', -900, 0, 1)
    setObjectCamera('focus', 'hud')
    setActorAlpha(1, "focus")

    makeSprite('concentrate', 'concentrate', 0, -700, 1)
    setObjectCamera('concentrate', 'hud')
    setActorProperty("concentrate", 'angle',-40)
    setActorAlpha(1, "concentrate")

    initShader('perlin', 'BarrelBlurEffect')
	setCameraShader('game', 'perlin')
	setShaderProperty('perlin', 'zoom', 1)
	setShaderProperty('perlin','x',0)
	setShaderProperty('perlin','y',0)
	setShaderProperty('perlin','angle', 0)
	setShaderProperty('perlin', 'barrel', 0.0)
	setShaderProperty('perlin', 'doChroma', true)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('anotherhud2', 'vignette')
    setShaderProperty('vignette', 'strength', 20)
    setShaderProperty('vignette', 'size',0.1)

    initShader('MirrorRepeatEffect', 'MirrorRepeatEffect')
    setCameraShader('hud', 'MirrorRepeatEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
    setCameraShader('anotherhud', 'MirrorRepeatEffect')
    setShaderProperty('MirrorRepeatEffect', 'zoom', 2.5)
    setShaderProperty('MirrorRepeatEffect', 'angle', 0)
    setShaderProperty('MirrorRepeatEffect', 'x', 0)
    setShaderProperty('MirrorRepeatEffect', 'y', 0)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setCameraShader('anotherhud', 'mirrorGame')
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

    initShader('bars', 'bars')
	setCameraShader('hud', 'bars')
	setShaderProperty('bars', 'effect', 0)

    initShader('barsotro', 'bars')
	setCameraShader('anotherhud', 'barsotro')
	setShaderProperty('barsotro', 'effect', 0)

    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setCameraShader('anotherhud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0.35)

    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setCameraShader('anotherhud', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0)

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH',0.1)

    initShader('GlitchedEffect', 'glitchy')
    setCameraShader('game', 'GlitchedEffect')
    setShaderProperty('GlitchedEffect', 'AMT',0)
    setShaderProperty('GlitchedEffect', 'SPEED',0.1)

    initShader('vcrshader', 'vcrchroma')
    setCameraShader('game', 'vcrshader')

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
    setShaderProperty('bloom', 'effect', 0)
    setShaderProperty('bloom', 'strength', 0)

    initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 0)
    setShaderProperty('zoomblurGame', 'focusPower',0)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0)
    setShaderProperty('color', 'green', 0)
    setShaderProperty('color', 'blue', 0)

    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 20, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'hud')
    setObjectCamera("speed", 'anotherhud')
    setActorAlpha(0, 'speed')
	setActorLayer('speed', layershit)

    setProperty("healthBar","alpha",0)
    setProperty("healthBarBG","alpha",0)
    setProperty("infoTxt","alpha",0)
    setProperty("iconP1","alpha",0)
    setProperty("iconP2","alpha",0)
    setProperty("scoreTxt","alpha",0)
    setProperty("timeBarBG","alpha",0)
    setProperty("ratingText","alpha",0)
    setProperty("timeBar","y",-15)
    tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.1)
    for i = 0,13 do
        if not middlescroll then
            if (i >= 0 and i <= 6) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320)  
                setActorProperty(i,"alpha",0.2)
            elseif (i >= 7 and i <= 13) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320)
            end
        end
    end
end
function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'cubeOut')
    setShaderProperty('bloom', 'effect', 0.15)
    setShaderProperty('bloom', 'strength', 1)
    tweenShaderProperty('bloom', 'effect', 0, stepCrochet*0.001*4, 'cubeOut')
    tweenShaderProperty('bloom', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
end
local time = 0
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.9 
local perlinXRange = 0.1
local perlinYRange = 0.1
local perlinZRange = 0
function update(elapsed)

    time = time + elapsed
   
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('GlitchedEffect', 'iTime', time)
    setCustomShaderFloat('glitchChromatic', 'iTime', time)



    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    
end
function startSong()
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*2, 'cubeIn')
    tweenShaderProperty('color', 'green',1.5, crochet*0.001*2, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*2, 'cubeIn')
    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*4, 'cubeOut')
    tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*6, 'cubeOut')
end
local beatSwap = -1
bloomgrey = {28,56,64,92}
bloom = {32,96}
bumpsshake = {156,160,220,390,394,422,427,448,450,452,454,502,486,490,506,774,778,788,796,800
,810,838,842,846,852,858,864,874,1990,1994,2004,2012,2026,2054,2058,2068,2076,2090,2094}
function stepHit()
    for i = 1, #bloomgrey do
        if curStep == bloomgrey [i]-1 then
            bloomBurst(7.5,1,4)
            triggerEvent("add Camera Zoom","0.15","0.15")
            setShaderProperty('greyscale', 'strength', 0)
            tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*12, 'cubeOut')
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        end
    end
    for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(7.5,1,4)
            triggerEvent("add Camera Zoom","0.15","0.15")
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        end
    end
    for i = 1, #bumpsshake do
        if curStep == bumpsshake [i]-1 then
            triggerEvent("add Camera Zoom","0.15","0.15")
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        end
    end
    if curStep == 120 then
        bloomBurst(7.5,1,4)
        triggerEvent("add Camera Zoom","0.15","0.15")
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')

    
    elseif curStep == 124 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')

    elseif curStep == 128 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.1)
        for i = 0,13 do
            if not middlescroll then
                if (i >= 0 and i <= 6) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,stepCrochet*0.001*12, 'cubeOut')  
                    tweenActorProperty(i,"alpha",1,stepCrochet*0.001*2, 'cubeOut')
                    tweenActorProperty(i,"angle",360,stepCrochet*0.001*12, 'cubeOut')
                elseif (i >= 7 and i <= 13) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20, stepCrochet*0.001*12, 'cubeOut')
                    tweenActorProperty(i,"angle",-360,stepCrochet*0.001*12, 'cubeOut')
                end
            end
        end
    end
    if curStep == 182 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 184  then
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 188 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 192 then
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)
    end
    if curStep == 240 or curStep == 496 or curStep == 880 then
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 250 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
    elseif curStep == 254 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 256 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')

        bloomBurst(7.5,1,4)
    elseif curStep == 310 then
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*2.8, 'cubeIn')
    elseif curStep == 320 or curStep == 352 then
        bloomBurst(7.5,1,4)
    elseif curStep == 342 then
        tweenShaderProperty('mirrorGame', 'angle', -180, crochet*0.001*2.8, 'cubeIn')
    elseif curStep == 368 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2.8, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'y', 6, crochet*0.001*2.8, 'cubeIn')
    end
    if curStep == 376 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')

    elseif curStep == 380 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 384 then
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    end
    if curStep >= 256 and curStep < 384 or curStep >= 896 and curStep < 1024 or curStep >= 1152 and curStep < 1408 or curStep >= 2112 and curStep < 2240 or curStep >= 2368 and curStep < 2624 then
	    if curStep % 16 == 6 then
            triggerEvent("add Camera Zoom","0.12","0.12")
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        elseif curStep % 16 == 12 then
            triggerEvent("add Camera Zoom","0.12","0.12")
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        end
        if curStep % 16 == 0 then
            triggerEvent("add Camera Zoom","0.12","0.12")
            triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.015', '')
        end
    end
    if curStep == 398 or curStep == 462 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'angle', -1440*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 5, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 412 or curStep == 476 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 416 or curStep == 480 then
        setShaderProperty('greyscale', 'strength', 0)
        bloomBurst(7.5,1,4)
    elseif curStep == 442 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 446 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 450 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    end
    if curStep == 504 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 508 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 512 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.45, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        setStageColorSwap('hue',0.95)
    end

    if curStep == 768 then
        setStageColorSwap('hue',0)
        setShaderProperty('GlitchedEffect', 'AMT',0.0)
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
    elseif curStep == 824 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 828 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 832 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == 888 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 892 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 896 then
        tweenShaderProperty('bars', 'effect',0,crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
        perlinSpeed = 1.5
    end
    if curStep == 1024 then
        tweenFadeIn("healthBar",0,0.5)
        tweenFadeIn("healthBarBG",0,0.5)
        tweenFadeIn("infoTxt",0,0.5)
        tweenFadeIn("iconP1",0,0.5)
        tweenFadeIn("iconP2",0,0.5)
        tweenFadeIn("scoreTxt",0,0.5)
        tweenFadeIn("timeBar",0,0.5)
        tweenFadeIn("timeBarBG",0,0.5)
        tweenFadeIn("ratingText",0,0.5)
        tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.1)
        for i = 0,13 do
            if not middlescroll then
                if (i >= 0 and i <= 6) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,stepCrochet*0.001*12, 'cubeOut')  
                    tweenActorProperty(i,"alpha",0.2,stepCrochet*0.001*2, 'cubeOut')
                    tweenActorProperty(i,"angle",720,stepCrochet*0.001*12, 'cubeOut')
                elseif (i >= 7 and i <= 13) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320, stepCrochet*0.001*12, 'cubeOut')
                    tweenActorProperty(i,"angle",-720,stepCrochet*0.001*12, 'cubeOut')
                end
            end
        end
    end

    if curStep == 1036 or curStep == 2252 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.2, crochet*0.001*4, 'crochet')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1052 or curStep == 2268 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.25, crochet*0.001*3, 'crochet')
    elseif curStep == 1068 or curStep == 2284 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.3, crochet*0.001*3, 'crochet')
    elseif curStep == 1076 or curStep == 2292 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1082 or curStep == 2298 then
        tweenShaderProperty('mirrorGame', 'x',-2, stepCrochet*0.001*6, 'cubeInOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'crochet')
    elseif curStep == 1088 or curStep == 2304 then
        bloomBurst(7.5,1,4)
    elseif curStep == 1100 or curStep == 2316 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, crochet*0.001*8, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, crochet*0.001*7, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, crochet*0.001*8, 'cubeOut')
    elseif curStep == 1134 or curStep == 2350 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*2, 'cubeOut')
  
    elseif curStep == 1144 or curStep == 2360 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 1148 or curStep == 2364 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1152 or curStep == 2368 then
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('GlitchedEffect', 'AMT',0.1)
        setActorAlpha(1, 'speed')
        bloomBurst(7.5,1,4)
    end
    --drop 
    if curStep == 1208 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 1212 or curStep == 1276 or curStep == 1404 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1216 or curStep == 1280 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == 1270 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 1272 or curStep == 1400 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 1336 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0.8, stepCrochet*0.001*7, 'cubeIn')
    elseif curStep == 1340 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1344 then
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength',0)
        bloomBurst(7.5,1,4)
    elseif curStep == 1392 then
        setShaderProperty('mirrorGame', 'y', -6)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 1408 then
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength',1)
        setActorAlpha(0, 'speed')
        setShaderProperty('GlitchedEffect', 'AMT',0)
        bloomBurst(7.5,1,4)
    end
    if curStep == 1424 then
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == 1432 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', 360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
    elseif curStep == 1436 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1440 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1456 then
        tweenShaderProperty('mirrorGame', 'y', 1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == 1468 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1470 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1472 then
        setShaderProperty('mirrorGame', 'y', 0)
        setShaderProperty('mirrorGame', 'x', 0)
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
        bloomBurst(9.5,1,4)
    elseif curStep == 1474 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 1472 and curStep < 1496 or curStep >= 1504 and curStep < 1520 then
        if curStep % 4 == 0 then
            tweenShaderProperty('perlin', 'zoom', 0.87, stepCrochet*0.001*1.5, 'cubeIn')   
        elseif curStep % 4 == 2 then
            tweenShaderProperty('perlin', 'zoom', 1, stepCrochet*0.001*1.5, 'cubeOut')
        end
    end
    if curStep == 1496 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1500 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1504 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    end
    if curStep == 1520 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1526 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 1532 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1536 then
        bloomBurst(9.5,1,4)
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', 360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*1.5, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 1560 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1564 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*1.5, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1568 or curStep == 1716 then
        bloomBurst(9.5,1,4)
    elseif curStep == 1594 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*5.5, 'cubeIn')
    elseif curStep == 1596 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1600 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 12, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*22, 'cubeIn')
    elseif curStep == 1616 then
        tweenShaderProperty('mirrorGame', 'y', -8, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 1628 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst(9.5,1,4)
    elseif curStep == 1630 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1632 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == 1648 or curStep == 1664 or curStep == 1672 or curStep == 1680 or curStep == 1684 or curStep == 1692 or curStep == 1694 then
        bloomBurst(4.5,1,4)
    end
    if curStep == 1656 then
        setShaderProperty('mirrorGame', 'angle', 360)
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*2.5, 'cubeInOut')
    elseif curStep == 1664 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1668 or curStep == 1676 then
        tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*3.5, 'cubeOut')
    elseif curStep == 1672 then
        tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*3.5, 'cubeOut')
    elseif curStep == 1696 then
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('zoomblurGame', 'focusPower', 8, crochet*0.001*2, 'cubeOut')
        bloomBurst(4.5,1,4)
        setShaderProperty('greyscale', 'strength', 1)
        triggerEvent('toggle checker bg','0',stepCrochet*0.001*4)  
    end
    if curStep == 1696 then
        tweenActorProperty("focus", 'x',0, stepCrochet*0.001*10, 'cubeIn')
        for i = 0,13 do
            tweenActorProperty(i,"alpha",0,stepCrochet*0.001*2, 'cubeOut')    
        end
    elseif curStep == 1708 then
        tweenActorProperty("focus", 'x',1000, crochet*0.001*3, 'cubeInOut')
    elseif curStep == 1710 then
        tweenActorProperty("concentrate", 'y',0, crochet*0.001*2.5, 'cubeOut')
        tweenActorProperty("concentrate", 'angle',0, crochet*0.001*2.5, 'cubeOut')
    elseif curStep == 1720 then
        tweenShaderProperty('zoomblurGame', 'focusPower', 0, crochet*0.001*4, 'cubeOut')
        tweenActorProperty("concentrate", 'y',850, crochet*0.001*3, 'cubeOut')
        tweenActorProperty("concentrate", 'angle',90, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('MirrorRepeatEffect', 'angle', 360)
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
        tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.1)
        for i = 0,13 do
            tweenActorProperty(i,"alpha",1,crochet*0.001*2, 'cubeOut')
            if not middlescroll then
                if (i >= 0 and i <= 6) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20)  
                elseif (i >= 7 and i <= 13) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20)
                end
            end
        end
    elseif curStep == 1724 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1728 then
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*3, 'cubeOut')
        setStageColorSwap('hue',0.95)
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.45, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 1680 and curStep < 1690 then
        if curStep % 4 == 0 then
            tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*1.8, 'cubeOut')
        elseif curStep % 4 == 2 then
            tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*1.8, 'cubeOut')
        end
    end
    if curStep >= 1690 and curStep < 1696 then
        if curStep % 2 == 0 then
            tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*0.87, 'cubeOut')
        elseif curStep % 2 == 1 then
            tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*0.87, 'cubeOut')
        end
    end
    if curStep == 1984 then
        setStageColorSwap('hue',0)
        setShaderProperty('GlitchedEffect', 'AMT',0.0)
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
    elseif curStep == 2040 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2044 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2048 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == 2104 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('bars', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 2108 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2112 then
        tweenShaderProperty('bars', 'effect',0,crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
        perlinSpeed = 1.5
    end
    if curStep == 2240 then
        tweenFadeIn("healthBar",0,0.5)
        tweenFadeIn("healthBarBG",0,0.5)
        tweenFadeIn("infoTxt",0,0.5)
        tweenFadeIn("iconP1",0,0.5)
        tweenFadeIn("iconP2",0,0.5)
        tweenFadeIn("scoreTxt",0,0.5)
        tweenFadeIn("timeBar",0,0.5)
        tweenFadeIn("timeBarBG",0,0.5)
        tweenFadeIn("ratingText",0,0.5)
        tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.1)
        for i = 0,13 do
            if not middlescroll then
                if (i >= 0 and i <= 6) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,stepCrochet*0.001*12, 'cubeOut')  
                    tweenActorProperty(i,"alpha",0.2,stepCrochet*0.001*2, 'cubeOut')
                    tweenActorProperty(i,"angle",720,stepCrochet*0.001*12, 'cubeOut')
                elseif (i >= 7 and i <= 13) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320, stepCrochet*0.001*12, 'cubeOut')
                    tweenActorProperty(i,"angle",-720,stepCrochet*0.001*12, 'cubeOut')
                end
            end
        end
    end

     --drop final 
     if curStep == 2424 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 2428 or curStep == 2492 or curStep == 2620 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2432 or curStep == 2496 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == 2486 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 2488 or curStep == 2616 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == 2552 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*3.5, 'cubeInOut')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0.8, stepCrochet*0.001*7, 'cubeIn')
    elseif curStep == 2556 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2560 then
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength',0)
        bloomBurst(7.5,1,4)
    elseif curStep == 2608 then
        setShaderProperty('mirrorGame', 'y', -6)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 2624 then
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength',1)
        setActorAlpha(0, 'speed')
        setShaderProperty('GlitchedEffect', 'AMT',0)
        bloomBurst(7.5,1,4)
        triggerEvent('toggle checker bg','0',stepCrochet*0.001*4)  
    end
    if curStep == 2632 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*7.5, 'cubeIn')
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*7, 'cubeIn')
    elseif curStep == 2636 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2640 then
        tweenShaderProperty('barsotro', 'effect', 0, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(7.5,1,4)
        setShaderProperty('GlitchedEffect', 'AMT',0.1)
    end
    if curStep == 2656 then
        tweenShaderProperty('greyscale', 'strength',1, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 2672 then
        tweenShaderProperty('bars', 'effect', 0.6, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('zoomblurGame', 'focusPower', 8, crochet*0.001*8, 'cubeIn')
    end
    dropquelegustaLolmaster(512)
    dropquelegustaLolmaster(1728)
    otrapartenoseqesperoserepite(896)
    otrapartenoseqesperoserepite(2112)
   
end

function otrapartenoseqesperoserepite(xd)
    if curStep == xd then
        triggerEvent('toggle checker bg','0.06',stepCrochet*0.001*4)
        setActorAlpha(1, 'speed')
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+16 then
        tweenShaderProperty('mirrorGame', 'y', -1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+32 then
        tweenShaderProperty('mirrorGame', 'x', 2, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+48 then
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+56 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == xd+60 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == xd+64 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*1.5, 'cubeOut')
        bloomBurst(7.5,1,4)
    elseif curStep == xd+80 then
        tweenShaderProperty('mirrorGame', 'y', 1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+96 then
        tweenShaderProperty('mirrorGame', 'x', 2, crochet*0.001*1.5, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == xd+96+16 then
        tweenShaderProperty('mirrorGame', 'y', -6, crochet*0.001*2.8, 'cubeIn')
    elseif curStep == xd+96+24 then
        tweenShaderProperty('perlin', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlin', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == xd+96+28 then
        tweenShaderProperty('perlin', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlin', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == xd+96+32 then
        tweenShaderProperty('perlin', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        setActorAlpha(0, 'speed')
        bloomBurst(7.5,1,4)
    end
end
function dropquelegustaLolmaster(lol)
    if curStep == lol then
       
        setActorAlpha(1, 'speed')
        triggerEvent('toggle checker bg','0.06',stepCrochet*0.001*4)
        bloomBurst(7.5,1,4)
        setShaderProperty('GlitchedEffect', 'AMT',0.1)
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, crochet*0.001*8, 'cubeInOut')
        setShaderProperty('mirrorGame','x',0)
        tweenShaderProperty('mirrorGame', 'x', 6, crochet*0.001*8, 'cubeInOut')
        tweenFadeIn("healthBar",0,0.5)
        tweenFadeIn("healthBarBG",0,0.5)
        tweenFadeIn("infoTxt",0,0.5)
        tweenFadeIn("iconP1",0,0.5)
        tweenFadeIn("iconP2",0,0.5)
        tweenFadeIn("scoreTxt",0,0.5)
        tweenFadeIn("timeBar",0,0.5)
        tweenFadeIn("timeBarBG",0,0.5)
        tweenFadeIn("ratingText",0,0.5)
    elseif curStep == lol+32 then
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*8, 'cubeInOut')
        setShaderProperty('mirrorGame', 'y', 8)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*8, 'cubeInOut')
    elseif curStep == lol+64 then
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*8, 'cubeInOut')
    elseif curStep == lol+96 then
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*4, 'cubeOut')
    elseif curStep == lol+96+16 then
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 4, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.8, crochet*0.001*3, 'cubeOut')
    elseif curStep == lol+96+16+8 or curStep == lol+96+96+48+8 then
        tweenShaderProperty('barsotro', 'effect',0.35, stepCrochet*0.001*7.5, 'cubeIn')
    elseif curStep == lol+96+16+12 or curStep == lol+96+96+48+12 then
      
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == lol+96+32 then
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'x', 6, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('barsotro', 'effect',0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)
        setShaderProperty('greyscale', 'strength', 0)
    elseif curStep == lol+96+64 then
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*8, 'cubeInOut')
        setShaderProperty('mirrorGame', 'y', -8)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*8, 'cubeInOut')
    elseif curStep == lol+96+96 then
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*8, 'cubeInOut')
    elseif curStep == lol+96+96+32 then
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*4, 'cubeOut')
    elseif curStep == lol+96+96+48 then
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 4, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.8, crochet*0.001*3, 'cubeOut')
    elseif curStep == lol+96+96+48+16 then
        tweenShaderProperty('barsotro', 'effect',0, crochet*0.001*3, 'cubeOut')
        bloomBurst(7.5,1,4)   
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('toggle checker bg','0',stepCrochet*0.001*4)  
        setActorAlpha(0, 'speed')

    end
end