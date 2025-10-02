function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("infoTxt",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("timeBarBG",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
function createBar(name, x, y, width, height, color, layer, alpha)
    makeSprite(name, name, x, y, 1)
    makeGraphic(name, width, height, color)
    actorScreenCenter(name)
    setActorLayer(name, layer)
    setActorY(y, name)
    setObjectCamera(name, 'hud')
    setActorAlpha(alpha, name)
end
function createPost()
    makeSprite('zoinks', 'zoinks', 0,0,1.3)
    setActorScroll(0,0,'zoinks')
	actorScreenCenter("zoinks")
	setObjectCamera('zoinks', 'game')
    set("zoinks.x",-2000)

    
    createBar('topBar', -1200, -670, 4000, 720, '0xFF000000', layershit, 1)
    createBar('bottomBar', -1200, 670, 4000, 720, '0xFF000000', layershit, 1)
    lascosasdelhud(0,stepCrochet,1,"cubeOut")

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(1, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)
    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)


    initShader('glowBorder', 'glowBorder')--
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'transparency', 0.35)
    setShaderProperty('glowBorder', 'transparency2', 0.35)
    setShaderProperty('glowBorder', 'color', 0.2)
    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    



    initShader('mirror3', 'PincushNewEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle',0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2.5)
    setShaderProperty('mirror', 'angle',-20)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)


    



    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'speed', 1.2)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

   
    initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.5)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)



    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)



 --   setProperty('', 'cameraSpeed', 6)

    
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness',0)

    initShader('BetterBlurEffect', 'BetterBlurEffect')
    setCameraShader('game', 'BetterBlurEffect')
    setShaderProperty('BetterBlurEffect', 'strength', 0)
    setShaderProperty('BetterBlurEffect', 'loops', 7)
    setShaderProperty('BetterBlurEffect', 'quality', 10)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)

    initShader('color2', 'ColorOverrideEffect')
    setCameraShader('hud', 'color2')
    setCameraShader('game', 'color2')
    setShaderProperty('color2', 'red',1.35)
    setShaderProperty('color2', 'green', 1.35)
    setShaderProperty('color2', 'blue', 1.35)


    setProperty('', 'cameraSpeed', 5)
end
local time = 0
local shaggy = true
local bf = false

local caWave = 0
local caWaveSpeed = 2
local caWaveRange = 0

local zoom = 1
function update(elapsed)
    time = time + elapsed
   
    setCustomShaderFloat("vcrchroma","iTime",time)
    setCustomShaderFloat("glowBorder","iTime",time)
    setCustomShaderFloat("glitchy","iTime",time)
    setCustomShaderFloat("chess","iTime",time/1.5)
    setCustomShaderFloat("speedlines","iTime",time)
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    zoom = lerp(zoom, 1, elapsed * 8)
    setShaderProperty('mirror3', 'zoom', zoom)
    if shaggy then
        set("camFollow.x", get("dad.x")+250)
        set("camFollow.y", get("dad.y")+400)
        set("defaultCamZoom", 0.8)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+100)
        set("defaultCamZoom", 0.8)
    end
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function songStart()
    mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
    mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
    bloom(0,1,crochet,1,"cubeOut")
end
saltosxd = {28,92,188,444,572,956,1020,1084,1212,1468,1596}
saltosanglexd = {1980,2108}
saltosanglexdoytro = {2044,2172}
function stepHit()
    if curStep == 32 or curStep == 96 or curStep == 1984 or curStep == 2064 or curStep == 2096 then
        shaggy = false
        bf = true
    elseif curStep == 2048 or curStep == 2080  or curStep == 2104 then
        shaggy = true
        bf = false
    end
    if curStep > 2112 and curStep <= 2176  then
        if curStep % 32 == 0 then
            shaggy = false
            bf = true
        elseif curStep % 32 == 16 then
            shaggy = true
            bf = false
        end
    end
    for i = 1, #saltosxd do
        if curStep == saltosxd [i] then
            mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
            tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
        elseif curStep == saltosxd [i]+2 then
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
            mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        elseif curStep == saltosxd [i]+4 then
            bloom(8,1,crochet,2,"cubeOut")
            mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        end
    end
    for i = 1, #saltosanglexd do
        if curStep == saltosanglexd [i] then
            mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeOut")
            tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
        elseif curStep == saltosanglexd [i]+2 then
            mirror(false,true,"","angle",0,20,0.5,crochet,"expoIn")
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
            mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        elseif curStep == saltosanglexd [i]+4 then
            bloom(8,1,crochet,2,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        end
    end

    for i = 1, #saltosanglexdoytro do
        if curStep == saltosanglexdoytro [i] then
            mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,20,0.5,crochet,"cubeOut")
            tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
        elseif curStep == saltosanglexdoytro [i]+2 then
            mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
            mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        elseif curStep == saltosanglexdoytro [i]+4 then
            bloom(8,1,crochet,2,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        end
    end
    if curStep == 60 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == 62 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
    elseif curStep == 64 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        shaggy = true
        bf = false
    end
    if curStep == 88 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeIn')
    elseif curStep == 104 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 120 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*1, 'cubeOut')
    elseif curStep == 126 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'cubeIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 128 then
        setProperty('', 'cameraSpeed', 1)
        bf = false
        set("defaultCamZoom", 0.6)
        removeCameraShader("game","vcrchroma")
        bloom(8,1,crochet,2,"cubeOut")
        lascosasdelhud(1,stepCrochet,16,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
    end
    if curStep == 880 then
        tweenShaderProperty('BetterBlurEffect', 'strength',30, crochet*0.001*4, 'cubeIn')
    elseif curStep == 928 then
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('BetterBlurEffect', 'strength',0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*8, 'cubeIn')
    elseif curStep == 992 or curStep == 1056 or curStep == 1120 or curStep == 1196
    or curStep == 1264 or curStep == 1372 then
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 1020 then
        mirror(false,true,"","angle",0,-180,1,crochet,"cubeIn")
    elseif curStep == 1024 then
        mirror(false,true,"","angle",0,-360,1,crochet,"cubeOut")
    elseif curStep == 1136 then
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1148 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == 1150 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
    elseif curStep == 1152 then
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        removeCameraShader("game","vcrchroma")
        removeCameraShader("game","vcrchroma")
        lascosasdelhud(1,stepCrochet,16,"cubeOut")
    end
    if curStep == 1024 or curStep == 1088 or curStep == 1196 or curStep == 1372 then
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0, crochet*0.001*1.5, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.012')
    end

    if curStep == 1872 then
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1910-4 or curStep == 2038-4 then
        tween("zoinks",{x = 0}, crochet*0.001*1, 'expoIn')
    elseif curStep == 1912 or curStep == 2040 then
        tween("zoinks",{x = 2000}, crochet*0.001*1, 'cubeInOut')
    end

    if curStep == 2040 then
        tweenShaderProperty('BetterBlurEffect', 'strength',30, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 2064 then
        tweenShaderProperty('BetterBlurEffect', 'strength',0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2208 then
        bloom(1,0,crochet,8,"cubeIn")
        mirror(false,true,"","zoom",0,4,9,crochet,"cubeIn")
        mirror(false,true,"","angle",0,50,9,crochet,"cubeIn")
    end
    if curStep == 1952 or curStep == 1968 or curStep == 2080 or curStep == 2096 or curStep == 2144
    or curStep == 2160 then
        zoom = 0.8
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0.15, crochet*0.001*1, 'cubeOut')
    elseif curStep == 2176 then
        setShaderProperty('chess', 'transparency', 0)
        setShaderProperty('speedlines', 'transparency', 1)
        tweenShaderProperty('glitchy', 'AMT',0, crochet*0.001*1, 'cubeOut')
      
        triggerEvent('screen shake', (crochet*0.001*32)..',0.012')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        shaggy = false
        setProperty('', 'cameraSpeed', 1)
        bf = false
        set("defaultCamZoom", 0.6)
    end
    if (curStep > 640 and curStep <= 768 or curStep > 1692 and curStep <= 1820) and curStep % 8 == 0 then
        zoom = 0.85
    end
    if curStep > 384 and curStep <= 504 or curStep > 512 and curStep <= 624 or curStep > 1408 and curStep <= 1528
    or curStep > 1536 and curStep <= 1648 then
        if curStep % 64 == 2 or curStep % 64 == 10 or curStep % 64 == 26 or
        curStep % 64 == 42 or curStep % 64 == 58 then 
            tweenShaderProperty('mirror2', 'angle',20, crochet*0.001*0.5, 'cubeIn')
        elseif curStep % 64 == 4 or curStep % 64 == 12 or curStep % 64 == 28 or
        curStep % 64 == 44 or curStep % 64 == 60 then
            tweenShaderProperty('mirror2', 'angle',0, crochet*0.001*0.5, 'cubeOut')
        end

        if curStep % 64 == 18 or curStep % 64 == 34 or curStep % 64 == 50  then
            tweenShaderProperty('mirror2', 'angle',-20, crochet*0.001*0.5, 'cubeIn')
        elseif curStep % 64 == 20 or curStep % 64 == 36 or curStep % 64 == 52 then
            tweenShaderProperty('mirror2', 'angle',0, crochet*0.001*0.5, 'cubeOut')
        end
    end
    parte1(156)
    parte1(1180)
    parte2(408)
    parte2(1432)
    parte3(668)

    partedrop(1692)
end
function parte1(s)
    if curStep == s then--156
        mirror(false,true,"","x",0,1,1,crochet,"expoIn")
    elseif curStep == s+12 then
        mirror(false,true,"","angle",0,180,2,crochet,"expoIn")
    elseif curStep == s+16 then
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*2, 'cubeInOut')
    elseif curStep == s+28 then
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+80 then--236
        mirror(false,true,"","angle",0,360,2,crochet,"cubeInOut")
    elseif curStep == s+88 then
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+96 then
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+98 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
    elseif curStep == s+100 then--256
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == s+104 then--260
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+112 or curStep == s+152 then
        tweenShaderProperty('mirror2', 'y',3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+116 or curStep == s+144 then
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+120 then
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+136 then
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+148 then
        tweenShaderProperty('mirror2', 'x',4, crochet*0.001*1, 'expoIn')
    elseif curStep == s+160 then--316
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+162 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,0.5,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+164 then--320
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+168 then
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,1.2,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*1, 'expoIn')
    elseif curStep == s+172 then--0.22
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == s+176 then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'cubeInOut')
    elseif curStep == s+178 then
        mirror(false,true,"","zoom",0,1.2,0.5,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+180 then
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+184 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+188 then
        mirror(false,true,"","zoom",0,1.2,1,crochet,"cubeIn")
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+192 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+196 then
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'y',3, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*1, 'expoIn')
    elseif curStep == s+200 then--356
        mirror(false,true,"","zoom",0,1.5,1,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'y',4, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+204 then
        tweenShaderProperty('mirror2', 'x',4, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+206 then
        tweenShaderProperty('mirror2', 'y',5, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+208 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == s+210 then
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+212 then
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,1.5,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+214 then
        tweenShaderProperty('mirror2', 'y',4, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+216 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"expoIn")
    elseif curStep == s+218 then
        tweenShaderProperty('mirror2', 'x',5, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+220 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'y',5, crochet*0.001*0.5, 'expoIn')
   
    elseif curStep == s+222 then
        tweenShaderProperty('mirror2', 'y',4, crochet*0.001*0.5, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+224 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'cubeIn')
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")
    elseif curStep == s+226 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+228 then--384
        setCameraShader("game","vcrchroma")
        setProperty('', 'cameraSpeed', 5)
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0, crochet*0.001*1.5, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.012')
    end
end
function parte2(s)--408
    
    if curStep == s then
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'expoIn')
    elseif curStep == s+36 then
        setShaderProperty("mirror2","y",0)
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'cubeIn')  
    elseif curStep == s+64 then
        tweenShaderProperty('mirror2', 'x',4, crochet*0.001*2, 'expoIn')
    elseif curStep == s+72 then
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*2, 'expoIn')
    elseif curStep == s+90 then--498
        mirror(false,true,"","x",0,0,1,crochet,"expoIn")
        tween("zoinks",{x = 0}, crochet*0.001*1, 'expoIn')
    elseif curStep == s+96 then
        tween("zoinks",{x = 2000}, crochet*0.001*1, 'cubeInOut') 
    elseif curStep == s+100 then--508
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        tweenShaderProperty('mirror2', 'angle',-20, crochet*0.001*0.5, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0.1, crochet*0.001*1, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.012')
        bloom(8,1,crochet,1,"cubeOut")
    elseif curStep == s+102 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        tweenShaderProperty('mirror2', 'angle',20, crochet*0.001*0.5, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+104 then
        tweenShaderProperty('mirror2', 'angle',0, crochet*0.001*1, 'cubeOut')
        bloom(8,1,crochet,2,"cubeOut")
        shaggy = true
    elseif curStep == s+128 then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+132 then
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+144 then
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*2, 'expoIn')
    elseif curStep == s+164 then
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+168 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        shaggy = false
        bf = true
    elseif curStep == s+176 then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+184 then
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'y',3, crochet*0.001*1, 'expoIn')
    elseif curStep == s+188 then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+192 then
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*2, 'expoIn')
    elseif curStep == s+200 then
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*2, 'expoIn')
    elseif curStep == s+208 then
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*2, 'expoIn')
    elseif curStep == s+216 then--624
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*2, 'expoIn')
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*2, 'expoIn')
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+218 then
        tween("zoinks",{x = 0}, crochet*0.001*1, 'expoIn')
    elseif curStep == s+224 then
        tween("zoinks",{x = -2000}, crochet*0.001*1, 'cubeInOut')
    elseif curStep == s+228 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,0.5,crochet,"cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.012')
        bloom(8,1,crochet,1,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+230 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+232 then
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        setShaderProperty('chess', 'transparency', 0.1)
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShaderProperty('glitchy', 'AMT',0, crochet*0.001*1, 'cubeOut')
        lascosasdelhud(0,stepCrochet,8,"cubeOut")
        bf = false
        caWaveRange = 0.07
        triggerEvent('screen shake', (crochet*0.001*32)..',0.005')
    end
end

function parte3(s)--668
    if curStep == s then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')

    elseif curStep == s+8 then--676
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+12 or curStep == s+64 then--680,732
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+28 then--696
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+32 then--700
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,2.5,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+34 or curStep == s+98 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0,crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+36 then--704  
        bloom(8,1,crochet,2,"cubeOut")
        --mirror(false,true,"","angle",0,-360,1.5,crochet,"cubeOut")
    elseif curStep == s+68 then--736
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*1.5, 'expoIn')
    elseif curStep == s+76 then--744
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+88 then--756
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+96 then--764
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-180,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+100 then--768  
        caWaveRange = 0
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1.5,crochet,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0.1, crochet*0.001*1, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*32)..',0.012')
        shaggy = true
    elseif curStep == s+112-2 then--776
        mirror(false,true,"","angle",0,-1440,6,crochet,"quadInOut")
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == s+116 or curStep == s+180 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+128 then--796
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+132 or curStep == s+196 then
        mirror(true,true,"zoom","zoom",0.8,1,1,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+136 or curStep == s+148 then--804
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+140 then--808
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+142 then--810
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+156 then--816 
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+152 then--820
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+160 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+162 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,0.5,crochet,"expoIn")
    elseif curStep == s+164 then--832
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        shaggy = false
        bf = true
    elseif curStep == s+176-2 then--842
        mirror(false,true,"","angle",0,1440,6,crochet,"quadInOut")
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == s+192 then--860
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+200 then--868
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+204 then--872
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+206 then--874
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+212 then--880
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+216 then--884
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+220 then
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+224 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+226 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
    elseif curStep == s+228 then--832
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        shaggy = false
        setProperty('', 'cameraSpeed', 1)
        bf = false
        set("defaultCamZoom", 0.6)
        setShaderProperty('chess', 'transparency', 0)
        setShaderProperty('speedlines', 'transparency', 1)
        tweenShaderProperty('glitchy', 'AMT',0, crochet*0.001*1, 'cubeOut')
    end
end
function partedrop(s)--1692
    if curStep == s then
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')

    elseif curStep == s+8 then--676
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+12 or curStep == s+128 then--s+64,1820
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+28 then--696
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+32 then--700
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,2.5,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+34 or curStep == s+162 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0,crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+36 then--1728  
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.5)
        tweenShaderProperty('glitchy', 'AMT',0.15, crochet*0.001*1, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*32)..',0.012')
        shaggy = true
    elseif curStep == s+46 then--1738
        mirror(false,true,"","angle",0,-1440,6,crochet,"quadInOut")
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == s+52 or curStep == s+180 then--1744 1872
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*2, 'cubeOut')

    elseif curStep == s+64 then--1756
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+68 or curStep == s+196 then
        mirror(true,true,"zoom","zoom",0.8,1,1,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')


    elseif curStep == s+72 or curStep == s+84 then--804
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+76 then--808
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+78 then--810
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+92 then--816 
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+88 then--820
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+96 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+98 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,0.5,crochet,"expoIn")
    elseif curStep == s+100 then--1792
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        shaggy = false
        bf = true
        
    elseif curStep == s+132 then--1824 736
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*1.5, 'expoIn')
    elseif curStep == s+140 then--744
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+152 then--756
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+160 then--764
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+164 then--1856
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","angle",0,360,1.5,crochet,"cubeOut")
    elseif curStep == s+174 then--1866 
        mirror(false,true,"","angle",0,1440,6,crochet,"quadInOut")
        tweenShaderProperty('mirror2', 'y',1, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == s+192 then--1884
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('mirror2', 'x',1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+200 then--868
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+204 then--872
        tweenShaderProperty('mirror2', 'y',-1, crochet*0.001*0.5, 'cubeIn')
    elseif curStep == s+206 then--874
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*0.5, 'expoIn')
    elseif curStep == s+212 then--880
        bloom(8,1,crochet,2,"cubeOut")
 
        
        tweenShaderProperty('mirror2', 'x',-1, crochet*0.001*1, 'expoIn')
    elseif curStep == s+216 then--884
        tweenShaderProperty('mirror2', 'y',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+220 then
        tweenShaderProperty('mirror2', 'x',0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+224 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,0.5,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*0.5, 'cubeOut')
    elseif curStep == s+226 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*0.5, 'expoIn')
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"expoIn")
    elseif curStep == s+228 then--832
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.8,1,2,crochet,"cubeOut")
        shaggy = true
        bf = false
        triggerEvent('screen shake', (crochet*0.001*64)..',0.012')
     
    end

end