local time = 0
local beatSwap = 1
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.13
bloom = {256,300}
function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('blaze', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    
end



function playerTwoSing(data,time,type)
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.010)
    else
        setHealth(0.001)
    end
    triggerEvent('Screen Shake','0.55,0.015','0.1,0.005')
end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'cubeOut')
end


function dropraro(drop)
    if curStep == drop then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, crochet*0.001*2, 'cubeIn')
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.1)
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
    elseif curStep == drop+16 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0.8)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
    elseif curStep == drop+20 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 0)
        bloomBurst(3,1,8)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.1)
    elseif curStep == drop+24 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == drop+32 or curStep == drop+35 or curStep == drop+38 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
    elseif curStep == drop+40 then
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
        bloomBurst(3,1,8)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.1)
        setShaderProperty('color', 'blue', 2.5)
    elseif curStep == drop+48 then
        setShaderProperty('mirrorGame', 'x', -8)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == drop+56 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == drop+59 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == drop+62 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == drop+64 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == drop+70 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, crochet*0.001*2, 'cubeIn')
        bloomBurst(3,1,8)
        setShaderProperty('color', 'red', 3)
        setShaderProperty('color', 'green', 1.8)
        setShaderProperty('color', 'blue', 1.4)
    elseif curStep == drop+80 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == drop+88 then
        tweenShaderProperty('mirrorGame', 'zoom', 5, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.1)
        bloomBurst(3,1,8)
    elseif curStep == drop+96 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        setShaderProperty('color', 'red', 1.8)
        setShaderProperty('color', 'green', 3)
        setShaderProperty('color', 'blue', 1.4)
        bloomBurst(3,1,8)
    elseif curStep == drop+110 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('barrel', 'barrel', -8, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'red', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'SPEED', 0, crochet*0.001*4, 'cubeIn')
    elseif curStep == drop+124 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
        setShaderProperty('barrel', 'barrel', -4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
end


function createPost()

    initShader('colorfill', 'ColorFillEffect')
    setCameraShader('game', 'colorfill')
    setCameraShader('hud', 'colorfill')
    setShaderProperty('colorfill', 'red', 0)
    setShaderProperty('colorfill', 'green', 0)
    setShaderProperty('colorfill', 'blue', 0)
    setShaderProperty('colorfill', 'fade', 1)

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    
    setShaderProperty('glitchChromatic', 'GLITCH', 0.05)
    

    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0)

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'focusPower', 20)

    makeSprite('topBar', 'topBar', 0, -150, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1440, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    initShader('blaze', 'blaze')
    setCameraShader('game', 'blaze')

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 20)
    setShaderProperty('vignette', 'size', 0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')

    setShaderProperty('mirrorGame', 'zoom', 3)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

    initShader('perlin', 'MirrorRepeatEffect')
	setCameraShader('game', 'perlin')
    setCameraShader('hud', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
    setShaderProperty('perlin', 'angle', 0)
    setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)

    initShader('pincush', 'PincushNewEffect')
    setCameraShader('hud', 'pincush')
	setCameraShader('game', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'doChroma', true)

    initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
	setShaderProperty('pincushgame', 'barrel', 0)
    setShaderProperty('pincushgame', 'doChroma', true)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty("bloom","contrast",1)


    initShader('MosaicEffect', 'MosaicEffect')
	setCameraShader('hud', 'MosaicEffect')
    setCameraShader('game', 'MosaicEffect')
	setShaderProperty("MosaicEffect","strength",15)


    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0)
    setShaderProperty('color', 'green', 0)
    setShaderProperty('color', 'blue', 0)


    setProperty("healthBar","alpha",0)
    setProperty("healthBarBG","alpha",0)
    setProperty("infoTxt","alpha",0)
    setProperty("iconP1","alpha",0)
    setProperty("iconP2","alpha",0)
    setProperty("scoreTxt","alpha",0)
    setProperty("timeBar","alpha",0)
    setProperty("timeBarBG","alpha",0)
    setProperty("ratingText","alpha",0)

    for i = 0,7 do
        setActorProperty(i,"alpha",0)
        setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-70)
    end
    for i = 2,3 do
        setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+620)
    end
    if not middlescroll then
        for i = 4,7 do
            setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320)
        end
    end


end

function locura()
    setShaderProperty("bloom","contrast",1.3)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*2,"linear")
end


function songStart()

    tweenShaderProperty('colorfill', 'red', 255, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('colorfill', 'green',255, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('colorfill', 'blue', 255, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('colorfill', 'fade', 0, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('MosaicEffect', 'strength', 0, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('zoomblur', 'focusPower', 0, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*32, 'cubeIn')

    tweenActorProperty('bottomBar', 'y',-1180, crochet*0.001*32, 'cubeIn')
    tweenActorProperty('topBar', 'y',-360, crochet*0.001*32, 'cubeIn')
    

    tweenShaderProperty('color', 'red', 1, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('color', 'green',1, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1, crochet*0.001*8, 'cubeIn')



end

function stepHit()

    for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(2.5,1,8)
        end
    end

    if curStep == 128 then
        tweenShaderProperty('pincush', 'barrel', -3, crochet*0.001*12, 'cubeInOut')
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('colorfill', 'red', 255, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorfill', 'green',255, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorfill', 'blue', 255, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('colorfill', 'fade', 1, crochet*0.001*4, 'cubeIn')
        removeCameraShader("game","blaze")
        setShaderProperty('mirrorGame', 'zoom', 0.5)
        setShaderProperty('mirrorGame', 'angle', 20)
        tweenShaderProperty('mirrorGame','zoom',1,crochet*0.001*32,'cubeInOut')
        tweenShaderProperty('mirrorGame','angle',0,crochet*0.001*32,'cubeInOut')
        triggerEvent('screen shake', (crochet*0.001*32)..',0.015', (crochet*0.001*32)..'0')
    elseif curStep == 240 then
        tweenShaderProperty('MosaicEffect', 'strength', 50, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 0, stepCrochet*0.001*16, 'cubeOut')
        tweenShaderProperty('pincushgame', 'barrel', 8, stepCrochet*0.001*16, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',5, stepCrochet*0.001*16, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*8, 'cubeInOut')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*3, 'cubeIn')
        for i = 0,7 do
            tweenActorProperty(i,"alpha",1,2,"cubeOut")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2,"cubeOut")
        end
    end
    if curStep == 256 then
        tweenShaderProperty('pincush', 'barrel', -1, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*4, 'cubeInOut')
        setShaderProperty('mirrorGame', 'zoom',0.5)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('MosaicEffect', 'strength',0)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
        setProperty("healthBar","alpha",1)
        setProperty("healthBarBG","alpha",1)
        setProperty("infoTxt","alpha",1)
        setProperty("iconP1","alpha",1)
        setProperty("iconP2","alpha",1)
        setProperty("scoreTxt","alpha",1)
        setProperty("timeBar","alpha",1)
        setProperty("timeBarBG","alpha",1)
        setProperty("ratingText","alpha",1)
    end



    if curStep == 272 or curStep == 800 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*2,'cubeIn')
        setShaderProperty('mirrorGame', 'angle', -20)
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
        setShaderProperty('pincushgame', 'barrel', -2.5)

        setShaderProperty('color', 'red', 1.7)
        setShaderProperty('color', 'green', 2.1)
        setShaderProperty('color', 'blue', 1.1)

        bloomBurst(4.5,1,8)

    elseif curStep == 276 or curStep == 804 then
        tweenShaderProperty('mirrorGame','zoom',3,stepCrochet*0.001*2,'cubeIn')
        setShaderProperty('mirrorGame', 'angle', 20)
        tweenShaderProperty('mirrorGame','angle',-10,stepCrochet*0.001*4,'cubeIn')

        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.1)

    elseif curStep == 280 or curStep == 808 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*2,'cubeIn')
        setShaderProperty('mirrorGame', 'angle', -20)
        tweenShaderProperty('mirrorGame','angle',10,stepCrochet*0.001*4,'cubeIn')

        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.1)
        setShaderProperty('color', 'blue', 2.5)

    elseif curStep == 284 or curStep == 812 then
        setShaderProperty('mirrorGame', 'angle', 20)
        tweenShaderProperty('mirrorGame','angle',0,crochet*0.001*2,'cubeOut')

        setShaderProperty('color', 'red', 1.1)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.5)

        bloomBurst(4.5,1,8)

    end

    if curStep == 288 or curStep == 816 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*2,'cubeIn')

        setShaderProperty('color', 'red', 1.75)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.2)

        bloomBurst(4.5,1,8)

    elseif curStep == 291 or curStep == 819 then
        tweenShaderProperty('mirrorGame','zoom',3.5,stepCrochet*0.001*2,'cubeIn')
    
        setShaderProperty('color', 'red', 1.8)
        setShaderProperty('color', 'green', 3)
        setShaderProperty('color', 'blue', 1.4)

    elseif curStep == 294 or curStep == 822 then
        tweenShaderProperty('mirrorGame','zoom',5,stepCrochet*0.001*2,'cubeIn')

        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)

    elseif curStep == 297 or curStep == 825 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*2,'cubeIn')
        
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)

    end

    if curStep == 304 then
        tweenShaderProperty('mirrorGame','zoom',0.8,stepCrochet*0.001*2,'cubeIn')
    elseif curStep == 308 then
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*2,'cubeIn')
    elseif curStep == 312 then
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    end
   
    if curStep == 320 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*2,'cubeIn')
    elseif curStep == 324 then
        tweenShaderProperty('mirrorGame','zoom',3,stepCrochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',40,stepCrochet*0.001*2,'cubeIn')
    elseif curStep == 328 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*2,'cubeIn')
    elseif curStep == 332 then
        tweenShaderProperty('mirrorGame','angle',0,crochet*0.001*2,'cubeOut')
    elseif curStep == 336 then
        setShaderProperty('color', 'red', 1.7)
        setShaderProperty('color', 'green', 2.1)
        setShaderProperty('color', 'blue', 1.1)
        bloomBurst(4.5,1,4)
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
    elseif curStep == 340 then
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 2.5)
        setShaderProperty('color', 'blue', 1.1)
        bloomBurst(4.5,1,4)
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
    elseif curStep == 344 then
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
        bloomBurst(4.5,1,4)
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
    elseif curStep == 352 then
        tweenShaderProperty('mirrorGame','zoom',3,stepCrochet*0.001*16,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*16,'cubeOut')
    elseif curStep == 368 then
        tweenShaderProperty('color', 'red', 0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*2, 'cubeIn')
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',1,crochet*0.001*4,'cubeIn')
    elseif curStep == 384 then
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
        setShaderProperty('barrel', 'barrel', -6)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 400 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 416 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 432 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 436 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 448 or curStep == 452 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
    elseif curStep == 460 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 464 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 468 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 496 then
        tweenShaderProperty('color', 'red', 0, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*3, 'cubeIn')
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*6, 'cubeIn')
        tweenShaderProperty('MosaicEffect', 'strength', 50, crochet*0.001*3, 'cubeIn')
    elseif curStep == 512 then
        setShaderProperty('MosaicEffect', 'strength', 0)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
        setShaderProperty('barrel', 'barrel', -6)
        tweenShaderProperty('barrel', 'barrel', 1, crochet*0.001*2, 'cubeOut')
        perlinXRange = 0.15
        perlinYRange = 0.15
        perlinZRange = 20
        perlinSpeed = 2.5
    elseif curStep == 768 then
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
        perlinSpeed = 0
        setShaderProperty('barrel', 'barrel', -6)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 768 then
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 772 then
        tweenShaderProperty('mirrorGame', 'angle', -40, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 776 then
        tweenShaderProperty('mirrorGame', 'angle', -60, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 780 then
        tweenShaderProperty('mirrorGame', 'angle', -80, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 784 then
        tweenShaderProperty('mirrorGame', 'angle', -100, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 788 then
        tweenShaderProperty('mirrorGame', 'angle', -120, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 792 then
        tweenShaderProperty('mirrorGame', 'angle', -140, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
        setShaderProperty('color', 'red', 0)
        setShaderProperty('color', 'green', 0)
        setShaderProperty('color', 'blue', 0)
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'linear')    
    elseif curStep == 794 then
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
        setShaderProperty('color', 'red', 0)
        setShaderProperty('color', 'green', 0)
        setShaderProperty('color', 'blue', 0)
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'linear')    
    elseif curStep == 796 then
        tweenShaderProperty('mirrorGame', 'angle', -160, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('color', 'red', 0)
        setShaderProperty('color', 'green', 0)
        setShaderProperty('color', 'blue', 0)
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'linear')    
    elseif curStep == 798 then
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
        setShaderProperty('color', 'red', 0)
        setShaderProperty('color', 'green', 0)
        setShaderProperty('color', 'blue', 0)
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'linear')    
    elseif curStep == 800 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('barrel', 'barrel',6)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('color', 'red', 0)
        setShaderProperty('color', 'green', 0)
        setShaderProperty('color', 'blue', 0)
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*2, 'linear')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'linear')    
    end

    if curStep >= 480 and curStep < 512 then
        if curStep % 8 == 0 then
            setShaderProperty('barrel', 'barrel',1)
            tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 8 == 4 then
            tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        end
    end

    if curStep >= 256 and curStep < 384 or curStep >= 800 and curStep < 928 then
        if curStep % 16 == 4 then
            setShaderProperty('mirrorGame', 'x', 0.1)
            tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*4,'cubeOut')
            setShaderProperty('zoomblur', 'posX', -5)
            setShaderProperty('zoomblur', 'focusPower', 15)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 10 then
            setShaderProperty('mirrorGame', 'x', 0.1)
            tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*4,'cubeOut')
            setShaderProperty('zoomblur', 'posX', -5)
            setShaderProperty('zoomblur', 'focusPower', 15)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        end
    end

    if curStep >= 384 and curStep < 512 then
        if curStep % 16 == 0 then
            beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('zoomblur', 'posX', -3)
            setShaderProperty('zoomblur', 'focusPower', 5)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 4 then
            beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('zoomblur', 'posX', -3)
            setShaderProperty('zoomblur', 'focusPower', 5)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 8 then
            beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('zoomblur', 'posX', -3)
            setShaderProperty('zoomblur', 'focusPower', 5)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
    
        elseif curStep % 16 == 12 then
            beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'angle', 20*beatSwap)
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('zoomblur', 'posX', -3)
            setShaderProperty('zoomblur', 'focusPower', 5)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 15 then
            setShaderProperty('barrel', 'zoom', 0.8)
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*2, 'linear')
            setShaderProperty('zoomblur', 'posX', -3)
            setShaderProperty('zoomblur', 'focusPower', 5)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
        end
        if curStep % 8 == 0 then
            setActorProperty(0,"angle",-40)
            tweenActorProperty(0,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(1,"angle",-40)
            tweenActorProperty(1,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(2,"angle",-40)
            tweenActorProperty(2,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(3,"angle",-40)
            tweenActorProperty(3,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(4,"angle",-40)
            tweenActorProperty(4,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(5,"angle",-40)
            tweenActorProperty(5,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(6,"angle",-40)
            tweenActorProperty(6,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(7,"angle",-40)
            tweenActorProperty(7,"angle",0,stepCrochet*0.001*4,"cubeOut")
        elseif curStep % 8 == 4 then
            setActorProperty(0,"angle",40)
            tweenActorProperty(0,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(1,"angle",40)
            tweenActorProperty(1,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(2,"angle",40)
            tweenActorProperty(2,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(3,"angle",40)
            tweenActorProperty(3,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(4,"angle",40)
            tweenActorProperty(4,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(5,"angle",40)
            tweenActorProperty(5,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(6,"angle",40)
            tweenActorProperty(6,"angle",0,stepCrochet*0.001*4,"cubeOut")
            setActorProperty(7,"angle",40)
            tweenActorProperty(7,"angle",0,stepCrochet*0.001*4,"cubeOut")
        end
    end
    if curStep >= 512 and curStep < 768 then
        if curStep % 16 == 8 then
            beatSwap = beatSwap * -1
            setShaderProperty('pincushgame', 'angle', 20*beatSwap)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*8, 'cubeIn')
            setShaderProperty('zoomblur', 'posX', -5)
            setShaderProperty('zoomblur', 'focusPower', 15)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*6, 'cubeOut')
            tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, 'cubeOut')
        end
    end
    dropraro(512)
    dropraro(640)
end