local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0
local a = 0
local window = 0
local downscroll = 1
local bumppincush = {180,186,192,212,224,230,242,244,248,252,256,276,288,308,314,320,340,352,358,370,372,378,384,404,416,436,442,448,468,480,486,532,544,564,576,596,608,614,628
,642,652,660,672,692,696,724,736,870,886,890,896,928,960,992,1012,1300,1332,1338,1344,1364,1382,1396,1408,1416,1432,1448,1464,1542,1556,1562,1568,1574,1580,1588,1594,1600
,1606,1620,1626,1632,1638,1644,1652,1658,1664,1670,1684,1692,1696,1702,1708,1716,1722,1728,1734,1748,1754,1760,1766,1772,1780,1784,1792,1798,1812,1818,1824,1832,1838,1844,1848,1856,1862,1876,1882,1894,1900,1908,1926,1940,1946,1952,1958,1964,1972,1978,1984,1990
,2004,2010,2016,2022,2028,2036,2044,2054,2068,2074,2080,2086,2092,2100,2106,2112,2118,2132,2138,2144,2150,2156,2164,2168,2172,2176,3184}


local bloom = {544,576,608,672,704,736,752,768,1024,1408,1536,1600,1664,1792,1856,1920,2050,2080,2144,2176,2304}
local angulos = {552,572,596,608,632,652,716,736,756,796,824,832,860,880,904,924,940,956,988,1320,1372,1376,1440,1624,1628,1816,1840,1888,2040,2044,2050,2080}

function createPost()

    makeSprite("TKO VIP TEXT", "TKO VIP TEXT", 40, -1100, 0.9)
    setObjectCamera("TKO VIP TEXT", "hud")
    setActorAlpha(1, "TKO VIP TEXT")

    initShader('PerlinSmokeEffect', 'PerlinSmokeEffect')
    setCameraShader('game', 'PerlinSmokeEffect')
    setCameraShader('hud', 'PerlinSmokeEffect')
    setShaderProperty("PerlinSmokeEffect","waveStrength",0)
    setShaderProperty("PerlinSmokeEffect","smokeStrength",0.7)
    
    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1.5)
    setShaderProperty('mirrorGame', 'angle', -20)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength',0)
    setShaderProperty('sobel', 'intensity', 4)


    initShader('betterblurGame', 'BetterBlurEffect')
    setCameraShader('game', 'betterblurGame')
    setShaderProperty('betterblurGame', 'strength', 10)
    setShaderProperty('betterblurGame', 'loops', 5)
    setShaderProperty('betterblurGame', 'quality', 10)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.005)

    initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
    setShaderProperty('pincushgame', 'angle', 0)
    setShaderProperty('pincushgame', 'y', 0)
	setShaderProperty('pincushgame', 'barrel', 0)
    setShaderProperty('pincushgame', 'doChroma', true)


    initShader('pincush', 'PincushNewEffect')
    setCameraShader('hud', 'pincush')
	setCameraShader('game', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
    setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
    setShaderProperty('pincush', 'angle', 0)
	setShaderProperty('pincush', 'barrel', -4)
    setShaderProperty('pincush', 'doChroma', true)


    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setShaderProperty('zoomblur', 'posX', 0)
    setShaderProperty('zoomblur', 'focusPower', 0)
    
    initShader('WaveBurstEffect', 'WaveBurstEffect')
    setCameraShader('hud', 'WaveBurstEffect')
    setCameraShader('game', 'WaveBurstEffect')
    setShaderProperty('WaveBurstEffect', 'strength',0)
    
    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setCameraShader('hud', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH', 0)


    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 1)



    makeSprite('topBar', 'topBar', 0, -440, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1120, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    makeSprite('uno', 'uno', -3000, 150, 1.2)
	setObjectCamera('uno', 'hud')

	makeSprite('dos', 'dos', 3000, 150, 1.2)
	setObjectCamera('dos', 'hud')

	makeSprite('tres', 'tres', -3000, 150, 1.2)
	setObjectCamera('tres', 'hud')

	makeSprite('cuatro', 'cuatro', 3000, 150, 1.2)
	setObjectCamera('cuatro', 'hud')


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

    fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
    swayingsmall = false
     if difficulty == "4K" then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-600)
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+600)
                end
            end
        end
    end
    if difficulty == "6K" then
        for i = 0,11 do
            if not middlescroll then
                if (i >= 0 and i <= 5) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-600)
                elseif (i >= 6 and i <= 11) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+600)
                end
            end
        end
    end
end

function update(elapsed)

    if curStep == 2432 or curStep == 2688 then
        setActorY(-1000000,"ratingsGroup")
        window = -0.8
    elseif curStep == 2672 or curStep == 2944 then
        window = 0 
    end  

    a = a + (elapsed*0.7) 
    if curStep >= 2432 and curStep <= 2672 or curStep >= 2688 and curStep <= 2944 then
        if difficulty == "4K" then
            for i = 0,7 do
                if (i >= 0 and i <= 3) then
                    setActorX(getActorX(i)+(math.sin(5.65*(a))*window),i)
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                    setActorProperty(i,"alpha",0.25)
                elseif (i >= 4 and i <= 7) then
                    setActorX(getActorX(i)+(math.sin(-5.65*(a))*window),i)
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                end
            end
        end
        if difficulty == "6K" then
            for i = 0,11 do
                if (i >= 0 and i <= 5) then
                    setActorX(getActorX(i)+(math.sin(5.65*(a))*window),i)
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                    setActorProperty(i,"alpha",0.25)
                elseif (i >= 6 and i <= 11) then
                    setActorX(getActorX(i)+(math.sin(-5.65*(a))*window),i)
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                end
            end
        end
    end

    time = time + elapsed
    setCustomShaderFloat('WaveBurstEffect', 'iTime', time)
    setCustomShaderFloat('PerlinSmokeEffect', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('pincush', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('pincush', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('pincush', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end

function bumpzoom(valor,valor2,steps)
    beatSwap = beatSwap * -1
    setShaderProperty('pincushgame', 'barrel',valor)
    tweenShaderProperty('pincushgame', 'barrel', valor2, stepCrochet*0.001*steps, 'cubeOut')

    --matt

    set("0.y",defaultStrum0Y-(70*downscroll)*beatSwap)
    tween(0,{y = defaultStrum0Y},stepCrochet*0.001*2,"cubeOut")
    setActorProperty(0,"angle",-70*beatSwap)
    tweenActorProperty(0,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("1.y",defaultStrum0Y-(70*downscroll)*beatSwap)
	tween(1,{y = defaultStrum0Y},stepCrochet*0.001*2,"cubeOut")
    setActorProperty(1,"angle",70*beatSwap)
    tweenActorProperty(1,"angle",0,stepCrochet*0.001*4,"cubeOut")
    set("2.y",defaultStrum0Y+(70*downscroll)*beatSwap)
    tween(2,{y = defaultStrum0Y},stepCrochet*0.001*2,"cubeOut")
    setActorProperty(2,"angle",-70*beatSwap)
    tweenActorProperty(2,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("3.y",defaultStrum0Y+(70*downscroll)*beatSwap)
	tween(3,{y = defaultStrum0Y},stepCrochet*0.001*2,"cubeOut")
    setActorProperty(3,"angle",70*beatSwap)
    tweenActorProperty(3,"angle",0,stepCrochet*0.001*4,"cubeOut")

    -- bf

    set("4.y",defaultStrum0Y+(70*downscroll)*beatSwap)
    tween(4,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(4,"angle",70*beatSwap)
    tweenActorProperty(4,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("5.y",defaultStrum0Y+(70*downscroll)*beatSwap)
	tween(5,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(5,"angle",-70*beatSwap)
    tweenActorProperty(5,"angle",0,stepCrochet*0.001*4,"cubeOut")
    set("6.y",defaultStrum0Y-(70*downscroll)*beatSwap)
    tween(6,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(6,"angle",-70*beatSwap)
    tweenActorProperty(6,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("7.y",defaultStrum0Y-(70*downscroll)*beatSwap)
	tween(7,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(7,"angle",-70*beatSwap)
    tweenActorProperty(7,"angle",0,stepCrochet*0.001*4,"cubeOut")

    if difficulty == "6K" then
    set("8.y",defaultStrum0Y-(70*downscroll)*beatSwap)
    tween(8,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(8,"angle",-70*beatSwap)
    tweenActorProperty(8,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("9.y",defaultStrum0Y+(70*downscroll)*beatSwap)
	tween(9,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(9,"angle",70*beatSwap)
    tweenActorProperty(9,"angle",0,stepCrochet*0.001*4,"cubeOut")
    set("10.y",defaultStrum0Y-(70*downscroll)*beatSwap)
    tween(10,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(10,"angle",-70*beatSwap)
    tweenActorProperty(10,"angle",0,stepCrochet*0.001*4,"cubeOut")
	set("11.y",defaultStrum0Y+(70*downscroll)*beatSwap)
	tween(11,{y = defaultStrum0Y},stepCrochet*0.001*2,"expoOut")
    setActorProperty(11,"angle",70*beatSwap)
    tweenActorProperty(11,"angle",0,stepCrochet*0.001*4,"cubeOut")
    end
end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'cubeOut')
end

function anglesmirror(valor,valor2,steps)
	beatSwap = beatSwap * -1
	setShaderProperty('barrel', 'angle',valor*beatSwap)
    tweenShaderProperty('barrel', 'angle', valor2, stepCrochet*0.001*steps, 'cubeOut')
    setShaderProperty('zoomblur', 'posX', 5)
    setShaderProperty('zoomblur', 'focusPower', 10)
    tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
    tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
end

function beatsqlol(sans,drop)
    if curStep == sans or curStep == sans+4 or curStep == sans+8 or curStep == sans+14 or curStep == sans+20 or curStep == sans+24 or curStep == sans+36 or curStep == sans+40 or curStep == sans+48 or curStep == sans+60 then
        beatSwap = beatSwap * -1
        setShaderProperty('pincushgame', 'barrel',-3.5)
        tweenShaderProperty('pincushgame', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('barrel', 'barrel', -0.45)
        tweenShaderProperty('barrel', 'barrel', 0.0, stepCrochet*0.001*4, 'cubeOut')
    
        --matt

        setActorProperty(0,"angle",-60*beatSwap)
        tweenActorProperty(0,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(1,"angle",60*beatSwap)
        tweenActorProperty(1,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(2,"angle",-60*beatSwap)
        tweenActorProperty(2,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(3,"angle",60*beatSwap)
        tweenActorProperty(3,"angle",0,stepCrochet*0.001*4,"cubeOut")

        --bf

        setActorProperty(4,"angle",-60*beatSwap)
        tweenActorProperty(4,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(5,"angle",60*beatSwap)
        tweenActorProperty(5,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(6,"angle",-60*beatSwap)
        tweenActorProperty(6,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(7,"angle",60*beatSwap)
        tweenActorProperty(7,"angle",0,stepCrochet*0.001*4,"cubeOut")

        setActorProperty(8,"angle",-60*beatSwap)
        tweenActorProperty(8,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(9,"angle",60*beatSwap)
        tweenActorProperty(9,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(10,"angle",-60*beatSwap)
        tweenActorProperty(10,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(11,"angle",60*beatSwap)
        tweenActorProperty(11,"angle",0,stepCrochet*0.001*4,"cubeOut")

    elseif curStep == sans+12 or curStep == sans+16 or curStep == sans+28 or curStep == sans+30 or curStep == sans+32 or curStep == sans+44 or curStep == sans+46 or curStep == sans+50 or curStep == sans+52 or curStep == sans+54 or curStep == sans+56 or curStep == sans+58 then
        beatSwap = beatSwap * -1
        setShaderProperty('pincushgame', 'barrel',-3.5)
        tweenShaderProperty('pincushgame', 'barrel', 0, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('barrel', 'barrel', -0.45)
        tweenShaderProperty('barrel', 'barrel', 0.0, stepCrochet*0.001*2, 'cubeOut')

        --matt

        setActorProperty(0,"angle",60*beatSwap)
        tweenActorProperty(0,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(1,"angle",-60*beatSwap)
        tweenActorProperty(1,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(2,"angle",60*beatSwap)
        tweenActorProperty(2,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(3,"angle",-60*beatSwap)
        tweenActorProperty(3,"angle",0,stepCrochet*0.001*4,"cubeOut")

        --bf

        setActorProperty(4,"angle",60*beatSwap)
        tweenActorProperty(4,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(5,"angle",-60*beatSwap)
        tweenActorProperty(5,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(6,"angle",60*beatSwap)
        tweenActorProperty(6,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(7,"angle",-60*beatSwap)
        tweenActorProperty(7,"angle",0,stepCrochet*0.001*4,"cubeOut")

        setActorProperty(8,"angle",60*beatSwap)
        tweenActorProperty(8,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(9,"angle",-60*beatSwap)
        tweenActorProperty(9,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(10,"angle",60*beatSwap)
        tweenActorProperty(10,"angle",0,stepCrochet*0.001*4,"cubeOut")
        setActorProperty(11,"angle",-60*beatSwap)
        tweenActorProperty(11,"angle",0,stepCrochet*0.001*4,"cubeOut")
    end

    if curStep == drop or curStep == drop+8 then
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('pincush', 'barrel', 2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == drop+4 or curStep == drop+12 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', -1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == drop+16 or curStep == drop+20 or curStep == drop+24 or curStep == drop+28 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'expoOut')
    elseif curStep == drop+42 then
        setShaderProperty('pincushgame', 'angle', -360)
        tweenShaderProperty('pincushgame', 'angle', 0,  stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == drop+46 then
        setShaderProperty('mirrorGame', 'y', -2)
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'elasticInOut')
    elseif curStep == drop+50 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == drop+54 then
        setShaderProperty('mirrorGame', 'zoom', 5)
        tweenShaderProperty('mirrorGame', 'zoom', 1,  stepCrochet*0.001*8, 'cubeOut')
        bloomBurst(3,1,8)
    elseif curStep == drop+56 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'elasticInOut')
    elseif curStep == drop+64 then
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'elasticInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'elasticInOut')
        tweenShaderProperty('pincush', 'barrel', 1,stepCrochet*0.001*8, 'cubeOut')
        bloomBurst(3,1,8)
    end
end




function stepHit (step)

    if curStep >= 1024 and curStep <= 1280 then
        if difficulty == "4K" then
            for i = 0,7 do
                if (i >= 0 and i <= 7) then
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                end
            end
        end
    elseif curStep >= 1280 or curStep >= 2944 then
        for i = 0,7 do
            setActorY(defaultStrum0Y,i)
        end
    end
    if curStep >= 1024 and curStep <= 1280 then
        if difficulty == "6K" then
            for i = 0,11 do
                if (i >= 0 and i <= 11) then
                    setActorY(defaultStrum0Y-24*math.cos((a+i*0.35)*math.pi),i)
                end
            end
        end  
    elseif curStep >= 1280 or curStep >= 2944 then
            for i = 0,11 do
               setActorY(defaultStrum0Y,i)
            end
        end
        

   
    for i = 1, #bumppincush do
        if curStep == bumppincush [i]-1 then
            bumpzoom(-3.5,0,6)
        end
    end

    for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(3,1,8)
        end
    end

    for i = 1, #angulos do
        if curStep == angulos [i]-1 then
            anglesmirror(-15,0,4)
        end
    end
    
    if curStep == 248 then
        if difficulty == "4K" then
            for i = 0,3 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"expoOut")
                    end
                end
            end
        end
        if difficulty == "6K" then
            for i = 0,5 do
                if not middlescroll then
                    if (i >= 0 and i <= 5) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"expoOut")
                    end
                end
            end
        end
    elseif curStep == 252 then
        if difficulty == "6K" then
            for i = 6,11 do
                if not middlescroll then
                    if (i >= 6 and i <= 11) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"expoOut")
                    end
                end
            end
        end
        if difficulty == "4K" then
            for i = 4,7 do
                if not middlescroll then
                    if (i >= 4 and i <= 7) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"expoOut")
                    end
                end
            end
        end
    end
    
    
    if curStep == 256 then
       
        setShaderProperty('greyscale', 'strength', 0)
        bloomBurst(3,1,8)
        setShaderProperty('mirrorGame', 'x', -6)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
    elseif curStep == 260 then
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 264 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 480 then
        tweenShaderProperty('barrel', 'barrel', 1, crochet*0.001*4, 'cubeIn')
    end 


    if curStep == 496 then
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 0.6)
        tweenShaderProperty('mirrorGame', 'zoom', 0.5,  stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('WaveBurstEffect', 'strength', 10)
    elseif curStep == 500 then
        setShaderProperty('WaveBurstEffect', 'strength', 40)
    elseif curStep == 504 then
        setShaderProperty('WaveBurstEffect', 'strength', 0)
    end


    if curStep == 502 then
        setShaderProperty('pincushgame', 'angle', -360)
        tweenShaderProperty('pincushgame', 'angle', 0,  stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 3,  stepCrochet*0.001*6, 'cubeOut')
        setShaderProperty('zoomblur', 'posX', 4)
        setShaderProperty('zoomblur', 'focusPower', 5)
    elseif curStep == 506 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0,  stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('sobel', 'strength', 0.8, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 508 then
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('sobel', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 512 then
        setShaderProperty('barrel', 'barrel', 1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('zoomblur', 'posX', 0)
        setShaderProperty('zoomblur', 'focusPower', 0)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(3,1,8)
        setShaderProperty('greyscale', 'strength', 0)
    end

    if curStep == 536 then
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 544 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0,  crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 548 or curStep == 642 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bloomBurst(3,1,8)
    elseif curStep == 576 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 608 or curStep == 672 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 624 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 634 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 638 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 640 then
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 744 then
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*6, 'cubeIn')
        triggerEvent('screen shake', (crochet*0.001*2)..',0.015', (crochet*0.001*2)..',0.015')
    elseif curStep == 750 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 752 then
        setShaderProperty('greyscale', 'strength', 0.5)
    elseif curStep == 760 then
        tweenShaderProperty('betterblurGame', 'strength', 5, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('WaveBurstEffect', 'strength', 40)
    elseif curStep == 764 then
        setShaderProperty('pincushgame', 'angle', 360)
        tweenShaderProperty('pincushgame', 'angle', 0,  stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 768 then
        tweenShaderProperty('betterblurGame', 'strength', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeOut')
        setShaderProperty('WaveBurstEffect', 'strength', 0)
        setShaderProperty('barrel', 'barrel', 4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 800 or curStep == 832 or curStep == 864 then
        setShaderProperty('barrel', 'barrel', 4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end


    if curStep == 784 or curStep == 896 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'elasticInOut')
    elseif curStep == 816 or curStep == 912 then
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'elasticInOut')
    elseif curStep == 848 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*2, 'quartOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('pincush', 'barrel', -2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 856 or curStep == 860 or curStep == 980 or curStep == 988 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 864 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-440, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 1, stepCrochet*0.001*4, 'cubeOut')

    elseif curStep == 880 or curStep == 888 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 884 or curStep == 892 then
        setShaderProperty('mirrorGame', 'x', 2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end



    if curStep == 1020 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*2, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*2, 'quartOut')
    elseif curStep == 1024 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*2, 'cubeIn')
        setShaderProperty('WaveBurstEffect', 'strength', 30)
        perlinXRange = 0.25
        perlinYRange = 0.1
        perlinZRange = 12.5
        perlinSpeed = 3
    elseif curStep == 1264 then
        tweenShaderProperty('barrel', 'barrel', 8, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1280 then
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('WaveBurstEffect', 'strength', 0)
        perlinXRange = 0.1
        perlinYRange = 0.1
        perlinZRange = 12.5
        perlinSpeed = 0.9
    elseif curStep == 1312 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
    end



    if curStep == 788 or curStep == 800 or curStep == 820 or curStep == 828 or curStep == 852 or curStep == 864 or curStep == 888 or curStep == 916 or curStep == 948 or curStep == 980 or curStep == 1000 or curStep == 1016 then
        setShaderProperty('greyscale', 'strength',0)
        anglesmirror(-15,0,2.5)
        setShaderProperty('zoomblur', 'posX', 5)
        setShaderProperty('zoomblur', 'focusPower', 10)
        tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 792 or curStep == 804 or curStep == 822 or curStep == 836 or curStep == 856 or curStep == 874 or curStep == 900 or curStep == 952 or curStep == 984 or curStep == 1004 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 700 or curStep == 702 or curStep == 704 then
        anglesmirror(-15,0,2)
    end

    if curStep == 1016 then
        tweenActorProperty('healthBar', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('healthBarBG', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('scoreTxt', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('infoTxt', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP1', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP2', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenFadeIn("healthBar",0,2)
        tweenFadeIn("healthBarBG",0,2)
        tweenFadeIn("scoreTxt",0,2)
        tweenFadeIn("iconP1",0,2)
        tweenFadeIn("iconP2",0,2)
    elseif curStep == 1344 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'expoOut')
    elseif curStep == 1456 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 1408 or curStep == 1424 or curStep == 1440 then
        triggerEvent('screen shake', (crochet*0.001*1)..',0.009', (crochet*0.001*1)..',0.009')
        setShaderProperty('barrel', 'barrel', -1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1472 then
        triggerEvent('screen shake', (crochet*0.001*8)..',0.009', (crochet*0.001*8)..',0.009')
        setShaderProperty('barrel', 'barrel', -1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1528 then
        tweenShaderProperty('mirrorGame', 'x', -1, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('barrel', 'barrel', 0.5, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('healthBar', 'x', 350, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('healthBarBG', 'x', 350, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('scoreTxt', 'x', 350, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('infoTxt', 'x', 350, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP1', 'x', 350, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP2', 'x',350, stepCrochet*0.001*16, 'expoOut')
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
    elseif curStep == 1532 then
        tweenShaderProperty('mirrorGame', 'x', -2, stepCrochet*0.001*4, 'expoOut')
        setShaderProperty('mirrorGame', 'angle', 360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*16, 'cubeOut')
    elseif curStep == 1536 then
        setShaderProperty('greyscale', 'strength',0)
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
    end

    if curStep == 1408 or curStep == 1440 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1414 or curStep == 1456 then
        setShaderProperty('mirrorGame', 'x', 4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1424 or curStep == 1434 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1472 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, crochet*0.001*8, 'cubeIn')
    elseif curStep == 1504 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*4, 'cubeIn')
    end



    if curStep == 1568 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('barrel', 'angle',-20, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 1574 then
        tweenShaderProperty('barrel', 'zoom', 3, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('barrel', 'angle',20, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 1580 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('barrel', 'angle',0, stepCrochet*0.001*6, 'cubeOut')
    elseif curStep == 1648 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1652 then
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*6, 'quartOut')
        tweenActorProperty('healthBar', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('healthBarBG', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('scoreTxt', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('infoTxt', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP1', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenActorProperty('iconP2', 'x', -1000.0, stepCrochet*0.001*16, 'expoOut')
        tweenFadeIn("healthBar",0,2)
        tweenFadeIn("healthBarBG",0,2)
        tweenFadeIn("scoreTxt",0,2)
        tweenFadeIn("iconP1",0,2)
        tweenFadeIn("iconP2",0,2)
    elseif curStep == 1662 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1664 then
        setShaderProperty('greyscale', 'strength',0.5)
        setShaderProperty('glitchChromatic', 'GLITCH', 0.05)
    elseif curStep == 1784 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1788 then
        tweenShaderProperty('barrel', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1792 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*2, 'cubeIn')
        setShaderProperty('greyscale', 'strength',0)
        setShaderProperty('glitchChromatic', 'GLITCH', 0)
    end

    if curStep == 1808 or curStep == 1824 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1816 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1820 then
        setShaderProperty('mirrorGame', 'zoom', 5)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1856 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1888 then
        setShaderProperty('mirrorGame', 'y', 4)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'expoOut')
    elseif curStep == 1904 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1916 then
        tweenShaderProperty('barrel', 'angle', -15, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1920 then
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 1936 or curStep == 1980 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1940 or curStep == 1984 then
        setShaderProperty('mirrorGame', 'zoom', 5)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst(5,1,4)
    elseif curStep == 1952 or curStep == 1968 or curStep == 2000 or curStep == 2016 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'x', -4*beatSwap)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2032 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2064 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2080 then
        setShaderProperty('mirrorGame', 'y', 4)
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 2086 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 2112 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -3.5, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2160 or curStep == 2288 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 2168 or curStep == 2296 then
        setShaderProperty('mirrorGame', 'x', -8)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*16, 'elasticInOut')
    elseif curStep == 2172 or curStep == 2300 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 2160 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*4, 'cubeIn')
    end
    if curStep == 2176 then
        setShaderProperty('greyscale', 'strength',0.5)
        tweenShaderProperty('barrel', 'barrel', 0.5, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2236 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2240 then
        setShaderProperty('mirrorGame', 'zoom', 5)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 2288 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2304 then
        setStageColorSwap('hue', 0.2)
        setShaderProperty('greyscale', 'strength',0)
        setShaderProperty('barrel', 'barrel', -4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2320 then
        tweenStageColorSwap('hue', 0,crochet*0.001*4, 'cubeIn')
    end

    if curStep == 2368 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('barrel', 'barrel', -1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2384 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('barrel', 'barrel', -1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2400 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('barrel', 'barrel', -1)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2416 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2420 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2424 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('mirrorGame', 'x', -8)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'elasticInOut')
    elseif curStep == 2428 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2432 then
        setShaderProperty('mirrorGame', 'zoom', 5)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincush', 'barrel', -8)
        tweenShaderProperty('pincush', 'barrel', 1, crochet*0.001*4, 'cubeOut')
        perlinXRange = 0.25
        perlinYRange = 0.2
        perlinZRange = 12.5
        perlinSpeed = 3
    end
    if curStep == 2672 then
        tweenShaderProperty('barrel', 'barrel', -2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2688 or curStep == 2816 or curStep == 2944 then
        setShaderProperty('barrel', 'barrel', -8)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end

    if (curStep >= 1024 and curStep < 1280) or (curStep >= 2432 and curStep < 2944) then
        if curStep % 4 == 0 then
			beatSwap = beatSwap * -1
            setShaderProperty('mirrorGame', 'angle', 25*beatSwap)
            tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'linear')
            setShaderProperty('barrel', 'y', 0.07*beatSwap)
            tweenShaderProperty('barrel','y',0,stepCrochet*0.001*2.5,'linear')
        end
    end

    if (curStep >= 1664 and curStep < 1792) then
        if curStep % 32 == 0 then
            tweenShaderProperty('barrel','angle',15,stepCrochet*0.001*16,'cubeOutIn')
        elseif curStep % 32 == 16 then
            tweenShaderProperty('barrel','angle',-15,stepCrochet*0.001*16,'cubeOutIn')
        end
    end

    if curStep >= 2304 and curStep < 2368 then
        if curStep % 16 == 0 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
            setShaderProperty('pincushgame', 'angle', 15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 4 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
            setShaderProperty('pincushgame', 'angle', -15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 8 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
            setShaderProperty('pincushgame', 'angle', 15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 12 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
            setShaderProperty('pincushgame', 'angle', -15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        end
    end

    -- counts 

    if curStep == 496 or curStep == 880 or curStep == 1072 or curStep == 2224 or curStep == 2992 then 
        tweenActorProperty('uno', 'x', 270.0,stepCrochet *0.001*4, 'expoOut')
    end
    if curStep == 500 or curStep == 884 or curStep == 1076 or curStep == 2228 or curStep == 2996 then
        tweenActorProperty('dos', 'x', 200.0, stepCrochet*0.001*4, 'expoOut')
		tweenActorProperty('uno', 'x', -1000.0, stepCrochet*0.001*4, 'expoOut')
    end
    if curStep == 504 then
        tweenActorProperty('dos', 'x', 1500.0, stepCrochet*0.001*4, 'expoOut')
    end
    if curStep == 888 or curStep == 1080 or curStep == 2232 or curStep == 3000 then
        tweenActorProperty('tres', 'x', 270.0, stepCrochet*0.001*4, 'expoOut')
		tweenActorProperty('dos', 'x', 1500.0, stepCrochet*0.001*4, 'expoOut')
    end
    if curStep == 892 or curStep == 1084 or curStep == 2236 or curStep == 3004 then
        tweenActorProperty('cuatro', 'x', 200.0, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('tres', 'x', -1500.0, stepCrochet*0.001*4, 'expoOut')
    end
    if curStep == 896 or curStep == 1088 or curStep == 2240 or curStep == 3008 then
        tweenActorProperty('cuatro', 'x', 1500.0, stepCrochet*0.001*4, 'expoOut')
    end
    

    if curStep >= 1664 and curStep < 1776 then
        if curStep % 16 == 0 then
            tweenShaderProperty("mirrorGame","zoom",1,stepCrochet*0.001*8,"cubeOut")
            tweenShaderProperty("greyscale","strength",0,stepCrochet*0.001*8,"cubeOut")
        elseif curStep % 16 == 8 then
            tweenShaderProperty("mirrorGame","zoom",2,stepCrochet*0.001*8,"cubeIn")
            tweenShaderProperty("greyscale","strength",1,stepCrochet*0.001*8,"cubeIn")
        end
    end

    beatsqlol(1024,1040)
    beatsqlol(1088,1104)
    beatsqlol(1152,1168)
    beatsqlol(1216,1232)
    beatsqlol(2432,2448)
    beatsqlol(2496,2512)
    beatsqlol(2560,2576)
    beatsqlol(2624,2640)
    beatsqlol(2816,2832)
    if curStep == 1024 or curStep == 1280 then
        triggerEvent('toggle bf echo trail','','')
        triggerEvent('toggle matt echo trail','','')
    end

    if curStep == 496 or curStep == 768 or curStep == 800 or curStep == 832 or curStep == 864 or curStep == 1016 or curStep == 1264 or curStep == 1392 or curStep == 1472 or curStep == 1638 or curStep == 1792 or curStep == 1904 or curStep == 2160 then
        triggerEvent('change block state','tko-closeup','')
    elseif curStep == 784 or curStep == 816 or curStep == 848 or curStep == 880 or curStep == 1376 or curStep == 1456 or curStep == 1616 or curStep == 1888 or curStep == 2304 then
        triggerEvent('change block state','','')
    elseif curStep == 896 or curStep == 2064 or curStep == 2336 or curStep == 2608 then
        triggerEvent('change block state','tko-mattmoveleft','')
    end
    if curStep == 1088 or curStep == 2096 then
        triggerEvent('change block state','tko-bfmoveright','')
    elseif curStep == 1120 or curStep == 1760 or curStep == 2576 or curStep == 2624 then
        triggerEvent('change block state','tko-closeup','')
    elseif curStep == 1152 or curStep == 1568 or curStep == 1920 then
        triggerEvent('change block state','shield','')
    elseif curStep == 624 or curStep == 1200 or curStep == 1696 or curStep == 1856 or curStep == 2032 or curStep == 2288 or curStep == 2336 or curStep == 2368 or curStep == 2400 or curStep == 2432 or curStep == 2544 then
        triggerEvent('change block state','duet-tko','')
    elseif curStep == 640 or curStep == 1168 or curStep == 1600 or curStep == 1216 or curStep == 1728 or curStep == 1776 or curStep == 2048 or curStep == 2352 or curStep == 2384 or curStep == 2416 or curStep == 2496 or curStep == 2560 or curStep == 2592 or curStep == 2656 then
       
        triggerEvent('change block state','','')
    elseif curStep == 1248 then
        triggerEvent('flip echo direction','doubleshield','')
        triggerEvent('change block state','tko-closeup','')
    elseif curStep == 1408 or curStep == 1664 then
        triggerEvent('change block state','tko-closeup','')
    elseif curStep == 1816 then
        triggerEvent('flip echo direction','shield','')
    elseif curStep == 1984 then
        triggerEvent('change block state','bfshield','')
       
    end

    if curStep == 2672 then
        triggerEvent('change block state','tko-powerup','')
        
        tweenActorProperty("TKO VIP TEXT", 'y',50, crochet*0.001*4, 'cubeOut')
        tweenActorProperty("TKO VIP TEXT", 'angle',360, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2688 then
        tweenActorProperty("TKO VIP TEXT", 'y',800, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("TKO VIP TEXT", 'angle',450, stepCrochet*0.001*4, 'expoOut')
    
    end


    -- final 
    if curStep == 2688 then
        triggerEvent('flip echo direction','doubleshield','')
    end

    if curStep == 2688 or curStep == 2704 or curStep == 2720 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'x', -4*beatSwap)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2696 or curStep == 2736 then
        setShaderProperty('mirrorGame', 'y', -4)
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2714 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2728 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2746 then
        tweenShaderProperty('pincush', 'barrel', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2756 or curStep == 2764 or curStep == 2772 or curStep == 2788 or curStep == 2912 or curStep == 2920 then
        setShaderProperty('mirrorGame', 'x', -2)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2795 then
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2800 or curStep == 2928 then
        tweenShaderProperty('barrel', 'barrel', -2, crochet*0.001*3, 'cubeIn')
    elseif curStep == 2940 then
        tweenShaderProperty('mirrorGame', 'zoom', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2944 then
        setShaderProperty('mirrorGame', 'angle', -360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('mirrorGame', 'zoom', 3)
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')

        tweenShaderProperty('PerlinSmokeEffect', 'smokeStrength', 2, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 3040 then
        tweenShaderProperty('vignette', 'strength', 1, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('vignette', 'size', 2, crochet*0.001*16, 'cubeIn')
    elseif curStep == 3072 then
        for i = 0,7 do
            tweenFadein(i,0,1)
        end
        if difficulty == "6K" then
            for i = 0,11 do
             tweenFadein(i,0,1)
            end
        end 
    elseif curStep == 3160 then
        tweenShaderProperty('barrel', 'barrel', 4, crochet*0.001*6, 'cubeIn')
        tweenShaderProperty('vignette', 'strength', 15, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('vignette', 'size', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 3184 then
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        for i = 4,7 do
            tweenFadeOut(i,1,0.5)
        end
        if difficulty == "6K" then
            for i = 5,11 do
                tweenFadeOut(i,1,0.5)
            end
        end 
    elseif curStep == 3200 then
        flashCamera('hud', 'white', 1)
        tweenShaderProperty('color', 'red', 0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*16, 'cubeIn')
        for i = 4,7 do
            tweenFadeIn(i,0,2)
        end
    end

    if curStep == 2944 then
        perlinXRange = 0.1
        perlinYRange = 0.1
        perlinZRange = 12.5
        perlinSpeed = 0.9
    end

end

function songStart()
    flashCamera('hud', '#000000', 4)
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('color', 'green',1.5, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*48, 'cubeIn')
    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*48, 'cubeIn')
    tweenShaderProperty('pincush', 'barrel', 1, crochet*0.001*48, 'cubeIn')
    tweenShaderProperty('betterblurGame', 'strength', 0, crochet*0.001*48, 'cubeIn')
    perlinXRange = 0.1
    perlinYRange = 0.1
    perlinZRange = 12.5
    perlinSpeed = 0.9
end