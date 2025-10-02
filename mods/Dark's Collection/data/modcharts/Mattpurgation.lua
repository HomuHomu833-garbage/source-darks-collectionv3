local time = 0
function createPost()
    initShader('vcrshader', 'vcrshader')

    
    initShader('glitchPeak', 'Glitchy')
    setCameraShader('hud', 'glitchPeak')
    setCameraShader('game', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0.1)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.5)

	initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')

    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)

    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 50)

    initShader('pincush', 'BarrelBlurEffect')
    
	setCameraShader('game', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
    setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
    setShaderProperty('pincush', 'angle', 0)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'doChroma', true)


    initShader('barrelbomb', 'BarrelBlurEffect')
    setCameraShader('game', 'barrelbomb')
	setCameraShader('hud', 'barrelbomb')
    setShaderProperty('barrelbomb', 'zoom', 1)
	setShaderProperty('barrelbomb', 'barrel', 0)
    setShaderProperty('barrelbomb', 'doChroma', true)

    initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
	setCameraShader('hud', 'barrel')

	setShaderProperty('barrel', 'zoom', 0.05)
    setShaderProperty('barrel', 'angle', -720)
	setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('perlin', 'BarrelBlurEffect')
    setCameraShader('hud', 'perlin')
	setCameraShader('game', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
    setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)
    setShaderProperty('perlin', 'angle', 0)
	setShaderProperty('perlin', 'barrel', 0)
    setShaderProperty('perlin', 'doChroma', true)

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-750,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(750,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")
    
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    
    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 1)

    
    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('PerlinSmokeEffect', 'PerlinSmokeEffect')
    setCameraShader('hud', 'PerlinSmokeEffect')
    setShaderProperty("PerlinSmokeEffect","waveStrength",0)
    setShaderProperty("PerlinSmokeEffect","smokeStrength",2.5)
    setShaderProperty("PerlinSmokeEffect","speed",2)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0)

    
    makeText('600 SUB', '600 SUB', -185,150,164)
    setActorFont("600 SUB", "Contb___.ttf")
    setActorScroll(0,0,'600 SUB')
    setObjectCamera('600 SUB', 'hud')
    setActorAlpha(0, "600 SUB")

    makeText('SPECIAL', 'SPECIAL', 925,350,164)
    setActorFont("SPECIAL", "Contb___.ttf")
    setActorScroll(0,0,'SPECIAL')
    setObjectCamera('SPECIAL', 'hud')
    setActorAlpha(0, "SPECIAL")
    setActorY(-1000000,"ratingsGroup")


    for i = 0,7 do
        setActorProperty(i,"alpha",0)
    end
    if not middlescroll then
        for i = 0,7 do
            if (i >= 0 and i <= 3) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320)
            elseif (i >= 4 and i <= 7) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320)
            end
        end
    end
    
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
end

local perlinX = 0
local perlinY = 0
local perlinZ = 0

local perlinSpeed = 0.5

local perlinXRange = 0.02
local perlinYRange = 0.02
local perlinZRange = 0.5

local beatSwap = 1

function updatePost(elapsed)
    time = time + elapsed
    setCustomShaderFloat('PerlinSmokeEffect', 'iTime', time)
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange)+getActorX('perlin'))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange)+getActorY('perlin'))
	setShaderProperty('perlin', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange)+getActorAngle('perlin'))
end
function songStart()
    tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*63, 'cubeInOut')
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*64, 'cubeInOut')
    tweenShaderProperty('pixel', 'strength', 1, stepCrochet*0.001*64, 'backIn')
    tweenShaderProperty('EyeFishEffect', 'power', -0.8, stepCrochet*0.001*64, 'backIn')
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'green',1.5, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*4, 'cubeIn')
end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'linear')
end

angulos = {80,124,156,188,256,272,284,320,568,730,880,888,948,1696}
angulosotro = {120,160,192,236,264,280,440,572,734,884,944,952}
bumpsmarapido = {96,108,160}

 
function stepHit()

  

    if curStep == 88 or curStep == 168 or curStep == 248 then
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',600, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-600, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 92 or curStep == 172 or curStep == 252 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeOut')
    end

    for i = 1,#angulos do 
        if curStep == angulos[i]-1 then 
            tweenShaderProperty('barrel', 'angle', 25, stepCrochet*0.001, 'cubeIn')
        elseif curStep == angulos[i] then
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.2, 'cubeOut')
        end
    end
    for i = 1,#angulosotro do 
        if curStep == angulosotro[i]-1 then 
            tweenShaderProperty('barrel', 'angle', -25, stepCrochet*0.001, 'cubeIn')
        elseif curStep == angulosotro[i] then
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.2, 'cubeOut')
        end
    end
       

    for i = 1,#bumpsmarapido do 
        if curStep == bumpsmarapido[i]-1 then 
            setShaderProperty('pincush', 'zoom', 0.8)
            tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'linear')
        end
       
    end

    if curStep >= 288 and curStep < 312 or curStep >= 592 and curStep < 608 then
        if curStep % 8 == 0 then 
            setShaderProperty('barrel', 'angle', -15)
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.2, 'linear')
        elseif curStep % 8 == 4 then 
            setShaderProperty('barrel', 'angle', 15)
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.2, 'linear')
        end
    end

    if curStep >= 1072 and curStep < 1088 or curStep >= 1776 and curStep < 1792 then
        if curStep % 8 == 0 then 
            setShaderProperty('pincush', 'angle', -15)
            tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*3.3, 'linear')
        elseif curStep % 8 == 4 then 
            setShaderProperty('pincush', 'angle', 15)
            tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*3.3, 'linear')
        end
    end

    if curStep >= 312 and curStep < 320 then
        if curStep % 4 == 0 then 
            setShaderProperty('barrel', 'angle', -10)
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*1.7, 'linear')
        elseif curStep % 4 == 2 then 
            setShaderProperty('barrel', 'angle', 10)
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*1.7, 'linear')
        end
    end

    if curStep == 192 or curStep == 224 or curStep == 256 or curStep == 288 then
        setShaderProperty('ca', 'strength', 0.05)
        tweenShaderProperty('ca', 'strength', 0, crochet*0.001*6, 'linear')
    end

    local section = math.floor(curStep/16)

    if (section >= 20 and section < 36) or (section >= 38 and section < 42) or (section >= 46 and section < 50) or (section >= 54 and section < 70) or (section >= 102 and section < 114)  then
        if curStep % 8 == 0 then 
            tweenShaderProperty('barrel', 'zoom', 0.85, stepCrochet*0.001*3.5, 'cubeIn')
        elseif curStep % 8 == 4 then 
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*3.5, 'cubeOut')
        end
        

    end
    if curStep == 64 then
        tweenShaderProperty('barrel', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
        for i = 0,3 do
            tweenActorProperty(i,"alpha",0.25,1,"cubeOut")
            tweenActorProperty(i,"angle",360,1,"cubeOut")
        end
        for i = 4,7 do
		    tweenActorProperty(i,"alpha",1,1,"cubeOut")
            tweenActorProperty(i,"angle",360,1,"cubeOut")
        end
    elseif curStep == 68 or curStep == 252 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 94 then
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 156 or curStep == 252 then
        bloomBurst(4,1,4)
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 128 or curStep == 220 then
        setShaderProperty('pincush', 'zoom', 0.6)
        tweenShaderProperty('pincush', 'zoom', 0.8, stepCrochet*0.001*4, 'linear')
        tweenActorProperty('bottomBar', 'y',600, stepCrochet*0.001*4, 'linear')
        tweenActorProperty('topBar', 'y',-600, stepCrochet*0.001*4, 'linear')
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 144 or curStep == 224 then
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.7, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',550, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-550, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 256 then
        tweenActorProperty('bottomBar', 'y',550, crochet*0.001*16, 'cubeIn')
        tweenActorProperty('topBar', 'y',-550, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 3, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, crochet*0.001*16, 'cubeIn')
    elseif curStep == 304 then
        tweenShaderProperty('barrelbomb', 'barrel', 2, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 320 then
        setShaderProperty("PerlinSmokeEffect","smokeStrength",0)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        setShaderProperty('pincush', 'angle', -360)
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
        setShaderProperty('barrelbomb', 'barrel', -6)
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrelbomb', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*4, 'cubeOut')
        for i = 0,7 do
            tweenActorProperty(i,"angle",0,1.5,"cubeOut")
        end
        if not middlescroll then
            for i = 0,7 do
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20, crochet*0.001*4, 'expoOut')
                    tweenActorProperty(i,"alpha",1,1,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20, crochet*0.001*4, 'expoOut')
                end
            end
        end
    end

    if curStep == 336 or curStep == 342 or curStep == 348 or curStep == 400 or curStep == 406 or curStep == 412 or curStep == 1648 or curStep == 1654 or curStep == 1660 or curStep == 1712 or curStep == 1718 or curStep == 1724 then
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'expoOut')
    end
    if curStep == 336 or curStep == 400 or curStep == 1648 or curStep == 1712 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == 342 or curStep == 406 or curStep == 1654 or curStep == 1718 then
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == 348 or curStep == 412 or curStep == 1660 or curStep == 1724 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 352 or curStep == 416 or curStep == 1664 or curStep == 1728 then
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 368 or curStep == 432 or curStep == 1680 or curStep == 1744 then
        tweenShaderProperty('pincush', 'zoom', 0.6, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 380 or curStep == 1692 then
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 444 or curStep == 1756 then
        tweenShaderProperty('pincush', 'zoom', 0, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('pincush', 'angle', 360, stepCrochet*0.001*12, 'cubeInOut')
    elseif curStep == 448 or curStep == 1760 then
        setShaderProperty('pincush', 'zoom', 3)
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 464 then
        tweenShaderProperty('pincush', 'x', 1, crochet*0.001*2, 'expoOut')
    elseif curStep == 480 or curStep == 544 then
        tweenShaderProperty('pincush', 'x', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 496 or curStep == 560 then
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.7, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',550, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-550, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 512 then
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 528 then
        tweenShaderProperty('pincush', 'x', -1, crochet*0.001*2, 'expoOut')
    end

    if curStep == 576 then
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*2, 'expoOut')
        setShaderProperty('barrel', 'angle', -15)
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*7.5, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 584 then
        setShaderProperty('barrel', 'angle', 15)
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*7.5, 'cubeOut')
    
    elseif curStep == 592 then
        tweenShaderProperty('EyeFishEffect', 'power', 1, stepCrochet*0.001*15, 'cubeIn')
        
    end
    if curStep == 592 then 
        tweenShaderProperty('perlin', 'barrel', 2, stepCrochet*0.001*15, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 0.5, stepCrochet*0.001*15, 'cubeIn')
    elseif curStep == 608 then 
        setCameraShader("game","vcrshader")
        tweenShaderProperty('perlin', 'barrel', 0.5, stepCrochet*0.001*12, 'cubeOut')
        tweenShaderProperty('pincush', 'x', -0.5, stepCrochet*0.001*4, 'cubeInOut')
        triggerEvent("set Camera Zoom","0.6","1")
        flashCamera('game', '#FFFFFF', stepCrochet*0.001*4)
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*2, 'cubeOut')
        perlinZRange = 20
        perlinXRange = 0.2
        perlinYRange = 0.2
        perlinSpeed = 2.5
    elseif curStep == 624 or curStep == 656 then
        tweenShaderProperty('pincush', 'x', 0.5, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 640 then
        tweenShaderProperty('pincush', 'x', -0.5, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 668 then
        tweenShaderProperty('pincush', 'x', 4, crochet*0.001*2, 'cubeInOut')
        triggerEvent("set Camera Zoom","0.37","1")
    elseif curStep == 672 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('barrel', 'angle', 25)
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('perlin', 'x', 0.15)
        tweenShaderProperty('perlin', 'x', 0, stepCrochet*0.001*16, 'cubeOut')
    elseif curStep == 688 then
        tweenShaderProperty('barrel', 'zoom', 2.5, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('barrel', 'angle', -25)
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('perlin', 'x', -0.15)
        tweenShaderProperty('perlin', 'x', 0, stepCrochet*0.001*16, 'cubeOut')
    elseif curStep == 704 then
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 712 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 716 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 720 then 
        tweenShaderProperty('EyeFishEffect', 'power', 1, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 2, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 720+16 then 
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('perlin', 'barrel', 0.3, stepCrochet*0.001*8, 'cubeOut')
        flashCamera('hud', '#FFFFFF', stepCrochet*0.001*4)
    end

    if curStep == 736 then
        triggerEvent("set Camera Zoom","0.6","1")
        tweenShaderProperty('pincush', 'x', -0.5, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 752 then
        tweenShaderProperty('pincush', 'x', 0.5, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 764 then
        tweenShaderProperty('pincush', 'x', 4, crochet*0.001*2, 'cubeInOut')
        triggerEvent("set Camera Zoom","0.37","1")
    elseif curStep == 768 then
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 798 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*1.7, 'cubeOut')
    end

    if curStep == 800 then
        tweenShaderProperty('pincush', 'zoom', 1.5, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 806 then
        tweenShaderProperty('pincush', 'zoom', 2, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 812 then
        tweenShaderProperty('pincush', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 816 then
        tweenShaderProperty('pincush', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 820 then
        tweenShaderProperty('pincush', 'zoom', 1.5, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 824 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 828 then
        tweenShaderProperty('pincush', 'zoom', 0.7, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 832 then
        tweenShaderProperty('pincush', 'zoom', 3, stepCrochet*0.001*16, 'cubeOut')
        setShaderProperty('pincush', 'angle', -360)
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',470, stepCrochet*0.001*16, 'cubeOut')
        tweenActorProperty('topBar', 'y',-470, stepCrochet*0.001*16, 'cubeOut')
    end

    if curStep == 848 or curStep == 860 then
        tweenShaderProperty('pincush', 'angle', 10, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',10, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',10, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    elseif curStep == 854 then
        tweenShaderProperty('pincush', 'angle', -10, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',-10, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',-10, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    end
    if curStep == 848 then
        tweenShaderProperty('pixel', 'strength', 50, stepCrochet*0.001*16, 'backIn')
        tweenShaderProperty('color', 'red', 0, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, stepCrochet*0.001*16, 'cubeIn')
    elseif curStep == 864 then
        tweenShaderProperty('pixel', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 866 then
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'angle',0, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'angle',0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 896 or curStep == 960 then
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.7, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',520, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-520, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 912 or curStep == 976 then
        tweenShaderProperty('pincush', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 920 then
        tweenShaderProperty('pincush', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'angle',10, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'angle',10, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 924 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenActorProperty('bottomBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 928 or curStep == 992 then
        tweenShaderProperty('pincush', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 976 then
        tweenShaderProperty('pincush', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'angle',-10, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'angle',-10, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 988 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', 2)
        tweenShaderProperty('pincush', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenActorProperty('bottomBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep >= 812 and curStep < 828 then
        if curStep % 8 == 0 then 
            setShaderProperty('pincush', 'angle', -15)
            tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*3.3, 'linear')
        elseif curStep % 8 == 4 then 
            setShaderProperty('pincush', 'angle', 15)
            tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*3.3, 'linear')
        end
    end

    if curStep == 992 then
       bloomBurst(4,1,4)
    elseif curStep == 1008 then
        tweenShaderProperty('pixel', 'strength', 20, stepCrochet*0.001*16, 'backOut')
    elseif curStep == 1016 or curStep == 1072 or curStep == 1088 then
        tweenShaderProperty('pincush', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1024 then
        setShaderProperty('barrel', 'y', -2)
        tweenShaderProperty('barrel', 'y', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('pixel', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1032 or curStep == 1036 then
        beatSwap = beatSwap * -1
        setShaderProperty('barrel', 'angle', -15*beatSwap)
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.5, 'linear')
    elseif curStep == 1040 then
        tweenShaderProperty('pincush', 'zoom', 2.5, stepCrochet*0.001*3.5, 'linear')
    elseif curStep == 1052 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1056 then
        bloomBurst(4,1,4)
        tweenShaderProperty('pincush', 'angle', -360, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pincush', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1104 then
        setShaderProperty('pincush', 'angle', -720)
        tweenShaderProperty('pincush', 'angle', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'zoom', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pixel', 'strength', 50, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, stepCrochet*0.001*16, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 2, stepCrochet*0.001*16, 'cubeIn')
    end
    if curStep == 1120 then 
        flashCamera('hud', 'black', crochet*0.001*7.5)
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', -0.4, crochet*0.001*2, 'cubeOut')
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*8, 'cubeIn')
        setShaderProperty('pincush', 'angle', -40)
        tweenShaderProperty('pincush', 'angle', 10, crochet*0.001*7.8, 'linear')
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
        perlinSpeed = 0
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('sobel', 'strength', 0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pixel', 'strength', 3, stepCrochet*0.001*4, 'cubeIn')

        for i = 0,7 do
            setActorProperty(i,"alpha",0)
        end
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+1200)
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+250)
                end
            end
        end
        
        setProperty("healthBar","alpha",0)
        setProperty("healthBarBG","alpha",0)
        setProperty("infoTxt","alpha",0)
        setProperty("iconP1","alpha",0)
        setProperty("iconP2","alpha",0)
        setProperty("scoreTxt","alpha",0)
        setProperty("timeBar","alpha",0)
        setProperty("timeBarBG","alpha",0)
        setProperty("ratingText","alpha",0)
        
        tweenActorProperty('bottomBar', 'y',600, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-600, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1152 or curStep == 1216 then
        flashCamera('hud', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.8, 'linear')
        setShaderProperty('pincush', 'angle', 40)
        tweenShaderProperty('pincush', 'angle', -10, crochet*0.001*7.8, 'linear')
    elseif curStep == 1184 then
        flashCamera('hud', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.8, 'linear')
        setShaderProperty('pincush', 'angle', -40)
        tweenShaderProperty('pincush', 'angle', 10, crochet*0.001*7.8, 'linear')
    elseif curStep == 1232 then 
        tweenShaderProperty('EyeFishEffect', 'power', 1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 2, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 0, stepCrochet*0.001*12, 'cubeOut')
        tweenShaderProperty('pixel', 'strength', 0, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('sobel', 'strength', 0, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('caBlue', 'strength', 0.003, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('color', 'red', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1248 then
        flashCamera('hud', 'black', crochet*0.001*12)
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('PerlinSmokeEffect', 'smokeStrength', 2.5, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', -0.4, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('pincush', 'angle', -720)
        tweenShaderProperty('pincush', 'angle', 0, crochet*0.001*27.5, 'cubeIn')
        setShaderProperty('pincush', 'zoom', 4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*27.5, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*36, 'cubeIn')
    elseif curStep == 1352 then 
        playCharacterAnimation('dad', 'trans', true)
    elseif curStep == 1360 then 
        tweenShaderProperty('pincush', 'zoom', 0.9, stepCrochet*0.001*1, 'backInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 1, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 2, stepCrochet*0.001*12, 'cubeIn')
        if middlescroll then
           for i = 0,7 do
               tweenActorProperty(i,"alpha",1,0.5,"cubeOut")
           end
        end
        for i = 0,3 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"angle",360)
                    tweenActorProperty(i,"angle",0,1,"elasticInOut")
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,crochet*0.001*4, 'elasticInOut')
                    tweenActorProperty(i,"alpha",1,stepCrochet*0.001*2, 'cubeIn')
                end
            end
        end
    elseif curStep == 1360+4 then 
        tweenShaderProperty('pincush', 'zoom', 0.7, stepCrochet*0.001*1, 'backInOut')
    elseif curStep == 1360+8 then 
        tweenShaderProperty('pincush', 'zoom', 0.5, stepCrochet*0.001*1, 'backInOut')
    elseif curStep == 1360+12 then 
        tweenShaderProperty('pincush', 'zoom', 0.4, stepCrochet*0.001*1, 'backInOut')
    elseif curStep == 1360+16 then 
        setShaderProperty('pincush', 'barrel', -4)
        tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('barrel', 'barrel', -8)
        tweenShaderProperty('barrel', 'barrel', 0.3, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*1, 'backInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', -0.45, stepCrochet*0.001*4, 'cubeIn')
        perlinZRange = 20
        perlinXRange = 0.1
        perlinYRange = 0.1
        perlinSpeed = 3.5
    end

    if curStep == 1392 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"angle",360)
                    tweenActorProperty(i,"angle",0,1,"expoOut")
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,crochet*0.001*4, 'expoOut')
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"angle",-360)
                    tweenActorProperty(i,"angle",0,1,"expoOut")
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,crochet*0.001*2, 'expoOut')
                    tweenActorProperty(i,"alpha",1,stepCrochet*0.001*2, 'cubeIn')
                end
            end
        end
    elseif curStep == 1440 then
        flashCamera('hud', 'black', crochet*0.001*4)
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320)
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320)
                    setActorProperty(i,"alpha",0)
                end
            end
        end
    elseif curStep == 1456 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 1) then
                    setActorProperty(i,"angle",360)
                    tweenActorProperty(i,"angle",0,1,"elasticInOut")
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,crochet*0.001*4, 'elasticInOut')
                elseif (i >= 2 and i <= 3) then
                    setActorProperty(i,"angle",-360)
                    tweenActorProperty(i,"angle",0,1,"elasticInOut")
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+620,crochet*0.001*4, 'elasticInOut')
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"alpha",1,0.5)
                end
            end
        end
    end

    -- drop

    if curStep == 1376 or curStep == 1456 then
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('glitchPeak', 'AMT', 0.1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'SPEED', 0.1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1380 or curStep == 1396 or curStep == 1444 or curStep == 1460 then
        tweenShaderProperty('pincush', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1392 or curStep == 1440 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', 2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'AMT', 0.1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'SPEED', 0.1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1424 or curStep == 1488 then
        tweenShaderProperty('pincush', 'zoom', 0.5, crochet*0.001*4, 'cubeIn')
        triggerEvent('screen shake', (crochet*0.001*4)..',0.025', (crochet*0.001*2)..',0')
        tweenShaderProperty('glitchPeak', 'SPEED', 0.5, crochet*0.001*4, 'cubeIn')
    end
    if curStep == 1504 then
        tweenShaderProperty('glitchPeak', 'AMT', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('glitchPeak', 'SPEED', 0, stepCrochet*0.001*4, 'cubeIn')
        flashCamera('game', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.7, 'linear')
        setShaderProperty('pincush', 'angle', 40)
        tweenShaderProperty('pincush', 'angle', -10, crochet*0.001*7.7, 'linear')
    elseif curStep == 1536 then
        flashCamera('game', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.7, 'linear')
        setShaderProperty('pincush', 'angle', -40)
        tweenShaderProperty('pincush', 'angle', 10, crochet*0.001*7.7, 'linear')
    end

    if curStep == 1568 then
        flashCamera('game', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.7, 'linear')
        setShaderProperty('pincush', 'angle', 40)
        tweenShaderProperty('pincush', 'angle', -10, crochet*0.001*7.7, 'linear')
        tweenShaderProperty('pincush', 'x', 1, stepCrochet*0.001*2, 'linear')
    elseif curStep == 1600 then
        flashCamera('game', 'black', crochet*0.001*7.5)
        setShaderProperty('pincush', 'zoom', 0.4)
        tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*7.7, 'linear')
        setShaderProperty('pincush', 'angle', -40)
        tweenShaderProperty('pincush', 'angle', 10, crochet*0.001*7.7, 'linear')
    elseif curStep == 1612 then
        tweenShaderProperty('pincush', 'x', 4, crochet*0.001*2, 'cubeInOut')
    end

    if curStep == 1616 then
        tweenActorProperty('bottomBar', 'y',550, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-550, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 3, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelbomb', 'barrel', 2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1632 then
        setShaderProperty("PerlinSmokeEffect","smokeStrength",0)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        setShaderProperty('pincush', 'angle', -360)
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
        setShaderProperty('barrelbomb', 'barrel', -6)
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*8, 'cubeOut')
        tweenShaderProperty('barrelbomb', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 1408 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    elseif curStep == 1414 then
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    elseif curStep == 1420 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 1424 then
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
    end

    if curStep == 1472 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', 2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    elseif curStep == 1478 then
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',-20, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'x', 2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*6, 'cubeInOut')
    elseif curStep == 1484 then
        tweenShaderProperty('pincush', 'angle', 20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'angle',20, stepCrochet*0.001*4, 'expoOut')
        setShaderProperty('pincush', 'x', 2)
        tweenShaderProperty('pincush', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 1488 then
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('bottomBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty('topBar', 'angle',0, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('pincush', 'y', -2)
        tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
    end


    if curStep == 1624 then 
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('caBlue', 'strength', 0.001, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1632 then 
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
        perlinSpeed = 0.5
        perlinXRange = 0.02
        perlinYRange = 0.02
        perlinZRange = 0.5
    elseif curStep == 1776 then
        tweenShaderProperty('pincush', 'zoom', 0.6, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1792 then
        tweenShaderProperty('pincush', 'zoom', 2.5, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',520, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty('topBar', 'y',-520, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1820 then
        tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'x', -2)
        tweenShaderProperty('pincush', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenActorProperty('bottomBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',650, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-650, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1824 then
        tweenShaderProperty('pincush', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'angle',720, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, crochet*0.001*16, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', 2, crochet*0.001*20, 'cubeIn')
        tweenFadeIn("healthBar",0,0.5)
        tweenFadeIn("healthBarBG",0,0.5)
        tweenFadeIn("infoTxt",0,0.5)
        tweenFadeIn("iconP1",0,0.5)
        tweenFadeIn("iconP2",0,0.5)
        tweenFadeIn("scoreTxt",0,0.5)
        tweenFadeIn("timeBar",0,0.5)
        tweenFadeIn("timeBarBG",0,0.5)
        tweenFadeIn("ratingText",0,0.5)
        for i = 0,7 do
            tweenActorProperty(i,"alpha",0,0.5,"cubeOut")
        end
    end


    if curStep == 1888 then 
        flashCamera('hud', 'white', crochet*0.001*2)
        setShaderProperty('barrel', 'barrel', -8)
        setShaderProperty('barrel', 'angle', -5400)
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*24, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pixel', 'strength', 70, stepCrochet*0.001*64, 'backIn')
        tweenShaderProperty('color', 'red', 0, stepCrochet*0.001*72, 'cubeIn')
        tweenShaderProperty('color', 'green',0, stepCrochet*0.001*72, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, stepCrochet*0.001*72, 'cubeIn')
    end

end