 local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0
local beatSwap2 = 2
local cam = true
local characters = {"dad","boyfriend"}
local yPositions = {100, 300, 440}  
local xPositions = {-12, -12, 30} --1,9,18
local originalPositions = {}

function posiciones(context, spacing)
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "hud" then        
            set(character .. ".x", xPositions[i] * spacing)
            set(character .. ".y", yPositions[i] or 0)
        elseif context == "game" then
            local originalPos = originalPositions[character]
            if originalPos then
                set(character .. ".x", originalPos.x)
                set(character .. ".y", originalPos.y)
            end
        end
        setCamera(character, context)
    end
end

function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if moverDadCharacters then
            if i <= 4 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 4 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end

function createPost()
    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setCameraShader('hud', 'zoomblur')
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'posX', 2)
    setShaderProperty('zoomblur', 'focusPower', 10)


    initShader('particles', 'particlesnew')
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.7)
    setShaderProperty('particles', 'red', 1.7)
    setShaderProperty('particles', 'blue', 1.0)
    setShaderProperty('particles', 'green', 2)

    initShader("godrays","godrays")
    setCameraShader('hud', 'godrays')
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.75)
    setShaderProperty('godrays', 'density',0.2)
    setShaderProperty('godrays', 'weigth', 0.5)


    initShader("speedlines","speedlines")
    setCameraShader("game","speedlines")
    setShaderProperty('speedlines', 'transparency',1)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 2)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)



    initShader('bars', 'bars')
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)

 
    initShader('perspectivagame', 'EyeFishEffect')
    setCameraShader('game', 'perspectivagame')
    setShaderProperty('perspectivagame', 'power', 0.1)

    makeSprite('chessxd', '', 0, 0, 1) --este sera el actor del ajedrezxdxd
    defaultZoom = getCamZoom()
    makeGraphic('chessxd', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
    actorScreenCenter('chessxd')
    setActorScroll(0,0, 'chessxd')
    setActorAlpha(0.00000001, 'chessxd')
    local lol = getActorLayer('girlfriend')
    setActorLayer('chessxd', lol)

    initShader('chesslol', 'chess') --el ajedrez, no es muy complicado, solo transparencia y direccion, aunque es mas recomendado que al poner la direccion sea en set y no en tween xdxdxd, tambien es del -1.0 al 1.0)
    setActorShader('chessxd', 'chesslol') --tambien pa q este atras de la gf pues ponerlo asixdxd)
    setShaderProperty('chesslol', 'transparency', 0.0)
    setShaderProperty('chesslol', 'direction', -1.0)



    initShader("vcrchroma","vcrchroma")
    setCameraShader('game', 'vcrchroma')

      makeSprite('blackBG', '', 0, 0, 1)
    defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0,0, 'blackBG')
    setActorAlpha(0, 'blackBG')

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    local lol = getActorLayer('girlfriend')
    setActorLayer('blackBG', lol)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.2)


    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
end

function start()
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)   
    setShaderProperty('bloom', 'brightness', -0.1)   
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('godrays', 'iTime', time*4) 
    setCustomShaderFloat('particles', 'iTime', time) 
    setCustomShaderFloat('chesslol', 'iTime', time)
    setCustomShaderFloat('speedlines', 'iTime', time)
    setCustomShaderFloat('vcrchroma', 'iTime', time) 
    setCustomShaderFloat('titleeffect', 'uTime', time) 
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
    perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
        setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    if cam then
        set("camFollow.x",1000)
        set("camFollow.y",1500)
    end

    function playerTwoSing(data,time,type)
        if getHealth() - 0.010 > 0 then
            setHealth(getHealth() - 0.010)
        else
            setHealth(0.001)
        end
        triggerEvent('Screen Shake','0.55,0.015','0.1,0.005')
    end
end

function stepHit(step)
    --nada simpapue qlol--
    if curStep == 1 then
   
        perlinYRange = 0.2
        perlinSpeed = 1.3
        perlinXRange = 0.2
        perlinzRange = 7
    end
    if curStep == 128 then
        setProperty('', 'centerCamera', true)
        tweenShaderProperty('mirrorGame', 'zoom', 0.8, stepCrochet*0.001*100, "cubeInOut")
        tweenActorProperty('dad', 'alpha', 0, stepCrochet*0.001*16, 'linear')
        tweenActorProperty('boyfriend', 'alpha', 0, stepCrochet*0.001*16, 'linear')
        tweenActorProperty('girlfriend', 'alpha', 0, stepCrochet*0.001*16, 'linear')
        tweenShaderProperty( 'greyscale', 'strength', 0, stepCrochet*0.001*380, "cubeIn")
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*100, "cubeIn")
        tweenShaderProperty('bloom', 'contrast', 1.5, stepCrochet*0.001*100, "cubeIn")
        tweenShaderProperty('bars', 'effect', 0.1, stepCrochet*0.001*100, "linear")
    end
    if curStep == 256 then
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 448 then
        setShaderProperty('mirrorGame', 'zoom', 0.8)
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame', 'x', 0.15)
        tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 484 then
        setShaderProperty('mirrorGame', 'zoom', 0.8)
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame', 'x', 0.15)
        tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 488 then
        setShaderProperty('mirrorGame', 'zoom', 0.8)
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame', 'x', 0.15)
        tweenShaderProperty('mirrorGame','x',0,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 502 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('bars','effect',0.5,stepCrochet*0.001*10,'cubeIn')
    end
    if curStep == 508 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
        tweenShaderProperty('mirrorGame','x',-0.10,stepCrochet*0.001*7.5,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*5,'cubeIn')

    end
    if curStep == 512 then
        tweenActorProperty('dad', 'alpha', 1.0, crochet*0.001*1, 'linear')
        tweenActorProperty('boyfriend', 'alpha', 1.0, crochet*0.001*1, 'linear')
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*10,"cubeOut")  
        tweenActorProperty('girlfriend', 'alpha',1.0, stepCrochet*0.001*1, 'linear')
    elseif curStep == 516 then
         tweenShaderProperty('bars','effect',0.1,stepCrochet*0.001*8,'cubeOut')
    end
    if curStep == 528 then
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*10,"cubeOut")  
    end
    if curStep == 548 then
        setShaderProperty('mirrorGame', 'zoom', 0.5)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 560 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty('mirrorGame','angle',180)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*10,"cubeOut")  
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 568 then
        tweenShaderProperty('mirrorGame','zoom',3.5,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty('mirrorGame','angle',70)
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 576 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("mirrorGame","angle",0)
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',-0.10,stepCrochet*0.001*7.5,'cubeOut')
    end
    if curStep == 592 then
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 608 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',2,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 616 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',4,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 621 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*3,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3,'cubeIn')
    end
    if curStep == 624 then
        setShaderProperty('mirrorGame', 'angle', 30)
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*7.5,'cubeOut')
        tweenShaderProperty('mirrorGame','x',-0.10,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 592 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 640 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        tweenShaderProperty('mirrorGame','x',0.10,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 632 then
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 637 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*5,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end   
    if curStep == 640 then
        tweenShaderProperty('mirrorGame','x',-0.10,stepCrochet*0.001*7.5,'cubeOut')
    end   
    if curStep == 676 then
        setShaderProperty('mirrorGame', 'zoom', 0.5)
        tweenShaderProperty('mirrorGame', 'zoom', 0.7,stepCrochet*0.001*5,"cubeOut") 
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 688 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty('mirrorGame','angle',-180)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 696 then
        tweenShaderProperty('mirrorGame','zoom',3.5,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty('mirrorGame','angle',-70)
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 704 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("mirrorGame","angle",0)
        tweenShaderProperty('mirrorGame','x',0.10,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty("bloom","contrast",15)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 720 then
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 736 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',6,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 744 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',8,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 749 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*3,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3,'cubeIn')
    end
    if curStep == 752 then
        setShaderProperty('mirrorGame', 'angle', 30)
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*7.5,'cubeOut')
        tweenShaderProperty('mirrorGame','x',0.10,stepCrochet*0.001*7.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 760 then
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
    end   
    if curStep == 765 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*5,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end   
    if curStep == 768 then
        setShaderProperty("bloom","contrast",7.5)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',-0.10,stepCrochet*0.001*7.5,'cubeOut')
    end
    if curStep == 772 then
        tweenShaderProperty('mirrorGame','angle',20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',1.5,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 776 then
        tweenShaderProperty('mirrorGame','angle',30,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2.5,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 780 then
        tweenShaderProperty('mirrorGame','angle',45,stepCrochet*0.001*2,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',3.5,stepCrochet*0.001*3,'cubeOut')
    end
    if curStep == 782 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*3,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3,'cubeIn')
    end
    if curStep == 784 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 804 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 816 then
        tweenShaderProperty('mirrorGame', 'zoom', 2,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 824 then
        tweenShaderProperty('mirrorGame', 'zoom', 3,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 832 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 848 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 864 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 872 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 884 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 888 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','y',2,stepCrochet*0.001*10,'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 893 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','y',4,stepCrochet*0.001*10,'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 896 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','x',0.10,stepCrochet*0.001*7.5,'cubeOut')
    end
    if curStep == 900 then
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',1.5,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 904 then
        tweenShaderProperty('mirrorGame','angle',-30,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2.5,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 908 then
        tweenShaderProperty('mirrorGame','angle',-45,stepCrochet*0.001*2,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',3.5,stepCrochet*0.001*3,'cubeOut')
    end
    if curStep == 910 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*3,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3,'cubeIn')
    end
    if curStep == 912 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end  
    if curStep == 932 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 944 then
        tweenShaderProperty('mirrorGame', 'zoom', 2,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 952 then
        tweenShaderProperty('mirrorGame', 'zoom', 3,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 960 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 976 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 992 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1000 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1012 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1016 then
        tweenShaderProperty('mirrorGame','zoom',2.5,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',100,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('bars','effect',0.5,stepCrochet*0.001*6,'cubeIn')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1024 then
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty( 'greyscale', 'strength', 1, stepCrochet*0.001*2, "cubeIn")
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('bars','effect',0.1,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
      
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        tweenActorProperty('boyfriend', 'alpha', 0, stepCrochet*0.001*1, 'linear')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        setShaderProperty('mirrorGame','x',-0.13)
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeIn")
    end
    if curStep == 1060 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1072 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1088 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1120 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1128 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1140 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1152 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenActorProperty('boyfriend', 'alpha', 1.0, stepCrochet*0.001*1, 'linear')
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenActorProperty('dad', 'alpha', 0, stepCrochet*0.001*10, 'linear')
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',0.10,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1188 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1200 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1208 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1216 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1248 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1256 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1268 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1272 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*6,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*7,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1279 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1280 then
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        tweenFadeIn("blackBG",0,stepCrochet*0.001*2,"cubeIn")
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        setShaderProperty("bloom","contrast",10)

        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','',0,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty( 'greyscale', 'strength', 0, stepCrochet*0.001*2, "cubeIn")
        tweenActorProperty('dad', 'alpha', 1.0, stepCrochet*0.001*1, 'linear')
    end
    if curStep == 1296 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1316 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1328 then
        setShaderProperty('mirrorGame', 'zoom', 2.5)
        setShaderProperty('mirrorGame', 'angle', 180)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1336 then
        setShaderProperty('mirrorGame', 'zoom', 3.5)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame', 'angle', 80)
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1344 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame', 'angle', 0)
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1360 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1376 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*4.5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',6,stepCrochet*0.001*7,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1382 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*4.5,'cubeIn')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1386 then
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1392 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1400 then
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 1405 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*5,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end  
    if curStep == 1408 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end 
    if curStep == 1424 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1444 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1456 then
        setShaderProperty('mirrorGame', 'zoom', 2.5)
        setShaderProperty('mirrorGame', 'angle', 180)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1464 then
        setShaderProperty('mirrorGame', 'zoom', 3.5)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame', 'angle', 80)
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1472 then
        setShaderProperty('mirrorGame', 'zoom', 0.7)
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame', 'angle', 0)
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1488 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1504 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*4.5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',8,stepCrochet*0.001*7,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1510 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*4.5,'cubeIn')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1514 then
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1520 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1528 then
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end   
    if curStep == 1533 then
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*5,'cubeIn')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end  
    if curStep == 1536 then
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1552 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1572 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1584 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',10,stepCrochet*0.001*7,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1592 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*8,'cubeIn')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','y',12,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1600 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 1616 then
        tweenShaderProperty('mirrorGame','x',10,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1620 then
        tweenShaderProperty('mirrorGame','x',12,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1624 then
        tweenShaderProperty('mirrorGame','x',14,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1628 then
        tweenShaderProperty('mirrorGame','x',16,stepCrochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end
    if curStep == 1632 then
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1638 then
        setShaderProperty('mirrorGame','angle',0)
    end
    if curStep == 1640 then
        tweenShaderProperty('mirrorGame','x',18,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 1645 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
    end
    if curStep == 1648 then
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1656 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 1661 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
    end
    if curStep == 1664 then
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1680 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1680 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1700 then
        setShaderProperty('mirrorGame', 'zoom', 0.4)
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1712 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',14,stepCrochet*0.001*7,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1720 then
        tweenShaderProperty('mirrorGame','zoom',1,stepCrochet*0.001*8,'cubeIn')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','y',16,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1728 then
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 1744 then
        tweenShaderProperty('mirrorGame','x',20,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1748 then
        tweenShaderProperty('mirrorGame','x',22,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1752 then
        tweenShaderProperty('mirrorGame','x',24,stepCrochet*0.001*4,'cubeOut')
    end
    if curStep == 1756 then
        tweenShaderProperty('mirrorGame','x',26,stepCrochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*5,'cubeIn')
    end
    if curStep == 1760 then
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1766 then
        setShaderProperty('mirrorGame','angle',0)
    end
    if curStep == 1768 then
        tweenShaderProperty('mirrorGame','x',28,stepCrochet*0.001*7,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 1773 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
    end
    if curStep == 1776 then
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1784 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty( 'greyscale', 'strength', 1, stepCrochet*0.001*3, "cubeIn")
        tweenShaderProperty('mirrorGame','angle',-20,stepCrochet*0.001*5,'cubeOut')
    end
    if curStep == 1789 then
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('bars','effect',0.5,stepCrochet*0.001*2,'cubeIn')
    end
    if curStep == 1792 then
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('bars','effect',0.1,stepCrochet*0.001*4,'cubeOut')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1828 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1840 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1848 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1855 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1888 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1896 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1908 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1920 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','y',0.10,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1956 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1968 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1976 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 1984 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2016 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2024 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2032 then
        tweenShaderProperty('mirrorGame','zoom',2,stepCrochet*0.001*5,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',20,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2034 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2036 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2038 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2040 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2042 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2044 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
    end
    if curStep == 2045 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty('mirrorGame','zoom',0.7,stepCrochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',0,stepCrochet*0.001*4,'cubeIn')
    end
    --drop 
    if curStep == 2048 then
        setShaderProperty("bloom","contrast",0)
        tweenShaderProperty('chesslol', 'transparency', 0.08, stepCrochet*0.001*1, "cubeInOut")
        posiciones("hud", 50)
        movimiento({2, -425, 10, -0, 0, -0}, 1, "cubeOut", true)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        tweenShaderProperty( 'greyscale', 'strength', 0, stepCrochet*0.001*2, "cubeIn")
        setShaderProperty('titleeffect', 'money',1.1)
        tweenShaderProperty('bars','effect' , 0.1, stepCrochet*0.001*3.5,'cubeIn')
     
        tweenShaderProperty('speedlines', 'transparency',0.1, stepCrochet*0.001*2, "cubeInOut")
        perlinYRange = 0.3
        perlinSpeed = 2
        perlinXRange = 0.3
        perlinzRange = 10
    end
    if curStep == 2064 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2084 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2096 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',30,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 2105 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',32,stepCrochet*0.001*7,'cubeOut')
    end
    if curStep == 2112 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
    end
    if curStep == 2128 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2144 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',34,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2152 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',36,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2164 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',38,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2176 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',40,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2192 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',42,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2212 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',44,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2224 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',46,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2232 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',48,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2240 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',50,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2256 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',52,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2272 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',54,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2280 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',56,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2300 then
        tweenShaderProperty('bars','effect',0.5,stepCrochet*0.001*4,'cubeIn')
    end
    if curStep == 2304 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('bars','effect' , 0.1, stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',-0.15)
        tweenShaderProperty('mirrorGame','x',0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        setShaderProperty("bloom","contrast",10)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"linear")  
        posiciones("hud", 50)
        movimiento({-20, 18, 10, -0, 0, -0}, 1, "cubeIn", true)
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2320 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',58,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2340 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',60,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2352 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',62,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2360 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',64,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2368 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',66,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2400 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',68,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2408 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',70,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2420 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',72,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2432 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',74,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2448 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',76,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2468 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',78,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2480 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',80,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2488 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',82,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2496 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',84,stepCrochet*0.001*13,'cubeOut')
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
    end
    if curStep == 2512 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',86,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2528 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',88,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2536 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',90,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2548 then
        setShaderProperty('mirrorGame', 'zoom', 0.3)
        tweenShaderProperty('mirrorGame','zoom',0.5,stepCrochet*0.001*3.5,'cubeOut')
        setShaderProperty('mirrorGame','x',0.15)
        tweenShaderProperty('mirrorGame','x',-0.13,stepCrochet*0.001*5,'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 4)
        tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*6, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.010')
        tweenShaderProperty('mirrorGame','x',92,stepCrochet*0.001*13,'cubeOut')
    end
    if curStep == 2552 then
        tweenShaderProperty('bars','effect',0.5,stepCrochet*0.001*6,'cubeIn')
    end
    if curStep == 2560 then
        flashCamera("hud","white",1)
        tweenShaderProperty( 'greyscale', 'strength', 1, stepCrochet*0.001*2, "cubeIn")
        setShaderProperty('titleeffect', 'money',0)
        tweenShaderProperty('bars','effect' , 0.1, stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('chesslol', 'transparency', 0, stepCrochet*0.001*1, "cubeInOut")
        tweenShaderProperty('mirrorGame','angle',-360,stepCrochet*0.001*10,'cubeOut')
        tweenShaderProperty('speedlines', 'transparency',1, stepCrochet*0.001*2, "cubeInOut")
        tweenShaderProperty('mirrorGame','zoom',3,stepCrochet*0.001*400,'cubeIn')
        tweenShaderProperty('mirrorGame','angle',180,stepCrochet*0.001*360,'cubeIn')
        tweenShaderProperty('zoomblur', 'focusPower', 10, stepCrochet*0.001*300, "cubeIn")
        posiciones("game")
    end
    if curStep == 2570 then
        tweenShaderProperty('bars','effect' , 0.5, stepCrochet*0.001*248,'cubeIn')
    end
end

--oye dark when agregar mas cosas