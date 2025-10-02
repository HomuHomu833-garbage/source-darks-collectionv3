function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)

end
local nombres = {'uno', 'dos', 'tres', 'cuatro'}
local posicionesX = {-3000, 3000, -3000, 3000}
local characters = {"dad","boyfriend"}
local yPositions = {200, 350}  
local xPositions = {7,13} --3,9,18
local originalPositions = {}

function posiciones(context, spacing, personajesolo)
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "hud" then
            if not personajesolo or character == personajesolo then
                set(character .. ".x", xPositions[i] * spacing)
                set(character .. ".y", yPositions[i] or 0)
                setCamera(character, context)
            end
        elseif context == "game" then
            local originalPos = originalPositions[character]
            if originalPos then
                if not personajesolo or character == personajesolo then
                    set(character .. ".x", originalPos.x)
                    set(character .. ".y", originalPos.y)
                    setCamera(character, context)
                end
            end
        end
    end
end



function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if moverDadCharacters then
            if i <= 1 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 1 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end
function createPost()
    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
 

    for i, nombre in ipairs(nombres) do
        makeSprite(nombre, nombre, posicionesX[i], 150, 1)
        setObjectCamera(nombre, 'hud')
        setActorLayer(nombre, 1)
    end

    
    

    initShader('ghost', 'ghost')--
    setCameraShader('game', 'ghost')
    setShaderProperty('ghost', 'strength', 0)
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
    setProperty('', 'centerCamera', true)




    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)





    lascosasdelhud(0,crochet,1,"cubeOut")
    initShader('flashlight', 'flashlight')--
    setCameraShader('game', 'flashlight')
    setShaderProperty('flashlight', 'flashX', -0.5)
    setShaderProperty('flashlight', 'flashY', -0.5)
    setShaderProperty('flashlight', 'strengthGlow',0)
    setShaderProperty('flashlight', 'strengthDark', 1)
    setShaderProperty('flashlight', 'sizeY', 0.8)
    setShaderProperty('flashlight', 'sizeX', 0.8)

    initShader('mirror', 'PincushNewEffect')--PincushNewEffect
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('rain', 'RainEffect')
    setCameraShader('game', 'rain')


    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)
 
    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0)
    setShaderProperty('bars', 'angle1', 0)
    setShaderProperty('bars', 'angle2', 0)
    initShader('bump', 'BarrelBlurEffect')--PincushNewEffect
    setCameraShader('hud', 'bump')
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'y', 0)
    setShaderProperty('bump', 'x', 0)
	setShaderProperty('bump', 'barrel', 0)
    setShaderProperty('bump', 'doChroma', true)
    initShader('mirror2', 'BarrelBlurEffect')--PincushNewEffect
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 45)
	setShaderProperty('mirror2', 'x', -3)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

     initShader('fish', 'EyeFishEffect')--
     setCameraShader('game', 'fish')
     setShaderProperty('fish', 'power', 0.5)

     initShader('glitchPeak', 'Glitchy')
     setCameraShader('game', 'glitchPeak')
     setShaderProperty('glitchPeak', 'AMT', 0)
     setShaderProperty('glitchPeak', 'SPEED', 0.1)

     initShader('scanline', 'ScanlineEffect')
     setCameraShader('game', 'scanline')
     setShaderProperty('scanline', 'strength', 0.5)
     setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)
 
     initShader('bloom', 'BloomEffect')--
     setCameraShader('hud', 'bloom')
     setCameraShader('game', 'bloom')
     setShaderProperty('bloom', 'contrast', 0)
     setShaderProperty('bloom', 'brightness', -0.1)

     initShader('bloom2', 'BloomEffect')--
     setCameraShader('hud', 'bloom2')
     setCameraShader('game', 'bloom2')
     setShaderProperty('bloom2', 'contrast', 1)

   

    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.35)
    setShaderProperty('color', 'green',1.35)
    setShaderProperty('color', 'blue',1.35)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.5)
    setShaderProperty('vignette', 'red', 0)
    setShaderProperty('vignette', 'blue', 0)
    setShaderProperty('vignette', 'green', 0)

    initShader('chromaaberr', 'chromaaberr')--
    setCameraShader("game","chromaaberr")
     setShaderProperty('chromaaberr', 'strength', 0.2)


    --setCamZoom(0.8)
end
local time = 0
local matt = false
local bloomxd = 1
local qeres = 0

local rotCam = false
local rotCamSpd = 1
local rotCamRange = 2.5
local rotCamInd = 0
local bf = false
local temblor = true
local balas = true
function update(elapsed)
    local currentBeat = (songPos / 1000) * (bpm / 60)
    if  curStep >= 1152 and curStep < 1280 then--1640 then 
     
        set("camFollow.x", 1600 + math.cos(time*2  * crochet * 0.001 * 2) * 400)
        set("camFollow.y", 1100 + math.sin(time*4 * crochet * 0.001 * 1) * 200)


    end
    time = time + elapsed
    setShaderProperty("ghost","iTime",time*2)
    setShaderProperty("glitchPeak","iTime",time)
    setShaderProperty("rain","iTime",time)
    setShaderProperty("titleeffect","uTime",time)
    if matt then
        set("camFollow.x", get("dad.x") + 225)
        set("camFollow.y", get("dad.y") + 200)
        set("defaultCamZoom", 0.9)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x") + 200)
        set("camFollow.y", get("boyfriend.y") + 150)
        set("defaultCamZoom", 0.9)
    end
    bloomxd = lerp(bloomxd, 1, elapsed * 6)
    setShaderProperty('bloom2', 'contrast', bloomxd)
    
    if temblor then
        if math.abs(bloomxd - qeres) > 0.01 then
            triggerEvent('screen shake', (stepCrochet * 0.001 * 1) .. ',0.012')
        end
       qeres = bloomxd 
    end

    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('bump', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        angulo = lerp(angulo, 0, elapsed * 8)
        setShaderProperty('bump', 'angle', angulo)
    end
    if curStep >= 640 and curStep < 1664
    or curStep >= 1920 and curStep < 2432 then --1664  1152
        local factor = math.min((curStep - 640) / 256, 1) 
        local speed = 1.5 + factor * 1.5 
    
        setShaderProperty('flashlight', 'flashX', -1.5 + ((math.cos(time * crochet * 0.001 * speed) + 1) / 2) * 1.8)
        setShaderProperty('flashlight', 'flashY', -0.7 + ((math.sin(time * speed * crochet * 0.001) + 1) / 2) * 0.5)
    else  
        setShaderProperty('flashlight', 'flashX', -0.5)
        setShaderProperty('flashlight', 'flashY', -0.5)
    end
    
    
end

function playerOneSing(a, b, c, d)

    if c == "VoiidBullet" then
        if balas then
        bloomxd = 4
        triggerEvent('add Camera Zoom', "","0.07")
        end
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
function startSong()

    tweenShader("bloom","contrast",1,crochet*0.001*16,"linear")
    tweenShader("bloom","brightness",0,crochet*0.001*16,"linear")
    tweenShader("fish","power",0,crochet*0.001*32,"quadOut")
    tweenShader("bars","effect",0.1,crochet*0.001*16,"linear")
    mirror(false,true,"","zoom",0,1,96,stepCrochet,"quadOut")
    tweenShader("mirror2","angle",0,stepCrochet*0.001*108,"cubeInOut")
    tweenShader("mirror2","x",0,stepCrochet*0.001*108,"cubeInOut")
end
local swap = 1
local qxd = {1280,1306,1324,1334,1338,1360,1370,1388,1392,1402,2196,2208,2214,2224}
local qxdx = {1296,1300,1312,1328,1344,1364,1376,1398,2176,2200,2220,2228,2232}
function stepHit()
    for i = 1,#qxd do
        if curStep == qxd [i] then
            angulo = 15
        end
    end
    for i = 1,#qxdx do
        if curStep == qxdx [i] then
            angulo = -15
        end
    end
    if curStep >= 128 and curStep < 640
    or curStep >= 1408 and curStep < 1664   then 
        if curStep % 16 == 6 then
            swap = swap * -1
            tweenShader("bump","zoom",0.8,stepCrochet*0.001*1.5,"cubeIn")
            tweenShader("bump","x",0.07*swap,stepCrochet*0.001*1.5,"cubeIn")
            tweenShader("bump","y",-0.03,stepCrochet*0.001*1.5,"cubeIn")
        elseif curStep % 16 == 8 then
            tweenShader("bump","zoom",1,crochet*0.001*1,"cubeOut")
            tweenShader("bump","x",0,crochet*0.001*1,"backOut")
            tweenShader("bump","y",0,crochet*0.001*1,"backInOut")
        end
        if curStep % 32 == 0 then
            set("defaultCamZoom", 0.6)
        elseif curStep % 32 == 16 then
            set("defaultCamZoom", 0.45)
        end
 
    end
   
    if curStep == 144 or curStep == 176 or curStep == 272 or curStep == 560 
    or curStep == 664 or curStep == 816 or curStep == 1056 or curStep == 2080 
    or curStep == 2352 or curStep == 2608 then
        tween("uno",{x=300},crochet*0.001*1,"cubeOut")
    elseif curStep == 148 or curStep == 184 or curStep == 276 or curStep == 564 
    or curStep == 668 or curStep == 820 or curStep == 1060 or curStep == 2084
    or curStep == 2356 or curStep == 2576  or curStep == 2612 then
        tween("uno",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("dos",{x=300},crochet*0.001*1,"cubeOut")
    elseif curStep == 152 or curStep == 280 or curStep == 672 then
        tween("dos",{x=3000},crochet*0.001*1,"cubeInOut")
    elseif curStep == 180 then
        tween("uno",{x=-3000},crochet*0.001*1,"cubeInOut")
    elseif curStep == 188 or curStep == 532 or curStep == 568 or curStep == 788 
    or curStep == 824 or curStep == 1064 or curStep == 2088 or curStep == 2360
    or curStep == 2580 or curStep == 2616 then
        tween("dos",{x=3000},crochet*0.001*1,"cubeInOut")
		tween("tres",{x=300},crochet*0.001*1,"cubeOut")
    elseif curStep == 192 or curStep == 536 or curStep == 792 or curStep == 2584 then
        tween("tres",{x=-3000},crochet*0.001*1,"cubeInOut")
    elseif curStep == 528 or curStep == 784 then
        tween("dos",{x=300},crochet*0.001*1,"cubeOut")
    elseif curStep == 572 or curStep == 828 or curStep == 1068 or curStep == 2092 
    or curStep == 2364 or curStep == 2620 then
        tween("tres",{x=-3000},crochet*0.001*1,"cubeInOut")
        tween("cuatro",{x=300},crochet*0.001*1,"cubeOut")
    elseif curStep == 576 or curStep == 832 or curStep == 1072 or curStep == 2096 
    or curStep == 2368 or curStep == 2624 then
        tween("cuatro",{x=3000},crochet*0.001*1,"cubeInOut")
    end
    if curStep == 96 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeInOut")
        setProperty('', 'centerCamera', false)
    elseif curStep == 112 then
        mirror(false,true,"","zoom",0,0.75,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
    elseif curStep == 116 then
        mirror(false,true,"","zoom",0,0.9,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 120 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShader("greyscale","strength",0.5,crochet*0.001*2,"cubeIn")
        tweenShader("fish","power",0.2,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,-90,2,crochet,"cubeIn")
    elseif curStep == 124 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 128 then
         mirror(true,true,"barrel","barrel",5,0,3,crochet,"cubeOut")
        
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")

        lascosasdelhud(1,crochet,4,"cubeOut")
        setShaderProperty('scanline', 'strength', 0)
    end
    if curStep == 176 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,2,crochet,"cubeOut")
    elseif curStep == 184 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",45,0,1,crochet,"cubeOut")
    elseif curStep == 188 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(true,true,"angle","angle",-45,0,1,crochet,"cubeOut")
    elseif curStep == 192 then
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 224 or curStep == 226 then
        mirror(true,true,"zoom","zoom",0.7,1,0.5,crochet,"cubeOut")
    elseif curStep == 230 then
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,45,0.5,crochet,"cubeOut")
    elseif curStep == 232 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,0.5,crochet,"cubeOut")
    elseif curStep == 234 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 236 then
        mirror(false,true,"","x",0,10,5,crochet,"cubeInOut")
    elseif curStep == 240 then
        tweenShader("greyscale","strength",0,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShader("fish","power",0.2,crochet*0.001*1,"cubeOut")
        tweenShader("bars","effect",0.6,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
        tweenShader("mirror2","angle",-20,crochet*0.001*2,"cubeOut")
    elseif curStep == 248 then
        tweenShader("mirror2","barrel",-10,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
        tweenShader("mirror2","angle",20,crochet*0.001*2,"cubeIn")
    elseif curStep == 256 then
        rotCam = true
        tweenShader("mirror2","barrel",0,crochet*0.001*4,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        tweenShader("mirror2","angle",0,crochet*0.001*2,"cubeOut")
        tweenShader("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        matt = true
        setProperty('', 'cameraSpeed', 3)
    end
    if curStep == 272 or curStep == 368 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 284 then
        mirror(false,true,"","y",0,2,3,crochet,"expoInOut")
    elseif curStep == 288 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 304 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-90,4,crochet,"cubeIn")
    elseif curStep == 312 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
        matt = false
    elseif curStep == 320 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 336 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,2,crochet,"cubeOut")
    elseif curStep == 344 or curStep == 488 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,2,crochet,"cubeOut")
    elseif curStep == 348 or curStep == 380 or curStep == 492 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 352 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 376 then
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShader("mirror2","barrel",-10,crochet*0.001*2,"cubeIn")
        mirror(true,true,"angle","angle",360,0,3,crochet,"cubeOut")
    elseif curStep == 384 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        matt = true
    end
    if curStep == 396 or curStep == 460 then
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeInOut")
        mirror(false,true,"","zoom",0,0.85,2,crochet,"cubeInOut")
    elseif curStep == 400 or curStep == 464 then

        mirror(true,true,"x","x",0,-0.8,2,crochet,"cubeIn")
    elseif curStep == 408 or curStep == 472 then
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeIn")
        mirror(false,true,"","x",0,0,3,crochet,"cubeInOut")
    elseif curStep == 416 or curStep == 480 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        matt = false
        bf = false
        tweenShader("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")

    elseif curStep == 428 then
        mirror(false,true,"","x",0,0.5,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,0.5,crochet,"cubeOut")
    elseif curStep == 430 then
        mirror(false,true,"","x",0,1,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,0.5,crochet,"cubeOut")
    elseif curStep == 432 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
    elseif curStep == 440 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
        mirror(false,true,"","x",0,2,3,crochet,"expoInOut")
    elseif curStep == 444 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 448 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bf = true
    elseif curStep == 496 then
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,4,crochet,"cubeIn")
    elseif curStep == 504 then
        tweenShader("mirror2","x",2,crochet*0.001*3,"cubeInOut")
    elseif curStep == 512 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        matt = true
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
    end
    if curStep == 528 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 532 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
    elseif curStep == 536 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShader("fish","power",0.2,crochet*0.001*2,"cubeIn")
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 556 then
        tweenShader("mirror2","x",3,crochet*0.001*1,"cubeIn")
    elseif curStep == 544 then
        tweenShader("fish","power",0,crochet*0.001*3,"cubeOut")
        tweenShader("greyscale","strength",0,crochet*0.001*3,"cubeOut")
        mirror(false,true,"","zoom",0,1,3,crochet,"cubeOut")
    elseif curStep == 560 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,2,crochet,"cubeOut")
    elseif curStep == 564 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 568 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
        tweenShader("mirror2","x",4,crochet*0.001*2,"cubeInOut")
    elseif curStep == 576 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        matt = false
        bf = true
    elseif curStep == 580 then
        mirror(false,true,"","y",0,1,2,crochet,"backInOut")
    elseif curStep == 592 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 596 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoOut")
    elseif curStep == 604 then
        mirror(false,true,"","y",0,0,2,crochet,"cubeInOut")
    elseif curStep == 616 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 624 then
        mirror(false,true,"","zoom",0,2,1,crochet,"backIn")
        tweenShader("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        tweenShader("vignette","strength",0,crochet*0.001*3.5,"cubeIn")
    elseif curStep == 628 then
        mirror(false,true,"","zoom",0,3,1,crochet,"backIn")
    elseif curStep == 632 then
        mirror(false,true,"","zoom",0,4,1,crochet,"backIn")
        mirror(false,true,"","angle",0,360,3,crochet,"cubeInOut")
        tweenShader("mirror2","barrel",-1,crochet*0.001*2,"cubeIn")
    elseif curStep == 640 then
        rotCam = false
        tweenShader("vignette","strength",15,crochet*0.001*4,"linear")
        tweenShader("bars","angle1",-0.3,crochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,1,32,crochet,"cubeIn")
        bloom(4,1,crochet,4,"linear")
        bf = false
        matt = true
        lascosasdelhud(0,crochet,4,"cubeOut")
        set("defaultCamZoom", 0.45)
        setShaderProperty('scanline', 'strength', 0.5)
        setShaderProperty('flashlight', 'strengthGlow',0.3)
        setShaderProperty('flashlight', 'strengthDark', 0.8)
        tween("blackBG",{alpha = 0.5},crochet*0.001*2,"cubeOut")
    end
    if curStep == 696 then
        setShaderProperty("mirror2","x",0)
        mirror(false,true,"","angle",0,45,2,crochet,"cubeIn")
        tweenShader("mirror2","x",2,crochet*0.001*3,"backInOut")
    elseif curStep == 704 then
        bf = true
        matt = false
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 752 then
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
    elseif curStep == 760 then
        tweenShader("mirror2","barrel",2,crochet*0.001*2,"backIn")
        tween("blackBG",{alpha = 0},crochet*0.001*2,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
    elseif curStep == 764 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 768 then
        bf = false
        matt = true
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tween("blackBG",{alpha = 0.5},crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        setShaderProperty("mirror2","barrel",-2)
        tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShader("bars","angle1",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 784 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,1,crochet,"cubeOut")
    elseif curStep == 788 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,1,crochet,"cubeOut")
    elseif curStep == 792 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 800 or curStep == 2592 then
        mirror(false,true,"","zoom",0,3,4,crochet,"cubeOut")
        tweenShader("fish","power",0.3,crochet*0.001*4,"cubeOut")
        tween("blackBG",{alpha = 0},crochet*0.001*4,"cubeOut")
    elseif curStep == 816 or curStep == 2608 then
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
    elseif curStep == 824 or curStep == 2616 then
        mirror(false,true,"","angle",0,20,2,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 832 or curStep == 2624 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        bf = true
        matt = false
    elseif curStep == 844 or curStep == 2636 then
        tweenShader("mirror2","x",1,crochet*0.001*2,"cubeInOut")
    elseif curStep == 848 or curStep == 2640 then
        tweenShader("mirror2","zoom",2,crochet*0.001*2,"cubeOut")
    elseif curStep == 860 or curStep == 2652 then
        tweenShader("mirror2","x",0,crochet*0.001*2,"cubeInOut")
        tweenShader("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 864 then
        bf = false
        matt = true
    elseif curStep == 880 then
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
        tweenShader("mirror2","barrel",-5,crochet*0.001*4,"cubeIn")
        tweenShader("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 884 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeIn")
    elseif curStep == 888 then
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,2,crochet,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*2,"cubeIn")
        tweenShader("mirror2","y",2,crochet*0.001*3,"cubeInOut")
    elseif curStep == 892 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 896 or curStep == 1920 then
        setShaderProperty('scanline', 'strength', 0)
        flashCamera("hud","white",crochet*0.001*2,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('ghost', 'strength', 0.03)
        tweenShader("bars","effect2",0,crochet*0.001*2,"cubeOut")

        tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShader("bump","barrel",-0.3,crochet*0.001*2,"cubeOut")
        mirror(true,true,"angle","angle",60,0,3,crochet,"cubeOut")
       -- bloom(4,1,crochet,4,"linear")
        matt = false
        temblor = false
        triggerEvent('screen shake', (crochet * 0.001 * 64) .. ',0.01')
        set("defaultCamZoom", 0.45)
        rotCam = true
        rotCamSpd = 1.5
        rotCamRange = 2
  
    elseif curStep == 1136 then
        tweenShader("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        balas = false
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","contrast",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 1152 then
        setShaderProperty('ghost', 'strength', 0)
        tweenShader("bloom","brightness",0,crochet*0.001*4,"cubeOut")
        tweenShader("bloom","contrast",1,crochet*0.001*8,"cubeIn")
        tweenShader("bump","barrel",0,crochet*0.001*2,"cubeOut")
        rotCam = false
        flashCamera("hud","black",crochet*0.001*8,"cubeOut")
    elseif curStep == 1160 then
        balas = true
        setCamZoom(1.2)
        setShaderProperty("bars","effect",0.6)
        tweenShader("bars","effect",0.2,crochet*0.001*24,"linear")
        mirror(true,true,"zoom","zoom",0,1,36,crochet,"cubeOut")
        mirror(true,true,"angle","angle",45,0,36,crochet,"cubeOut")
        mirror(true,true,"y","y",1,0,32,crochet,"cubeOut")
    elseif curStep == 1280 then
        bf = true
        mirror(true,true,"barrel","barrel",1,0.5,2,crochet,"cubeOut")
        tweenShader("greyscale","strength",0.7,crochet*0.001*2,"cubeOut")
        setProperty('', 'cameraSpeed', 1)

    elseif curStep == 1408 then
        bf = false
        tweenShader("flashlight","strengthGlow",0,crochet*0.001*4,"cubeOut")
        tweenShader("flashlight","strengthDark",1,crochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        set("defaultCamZoom", 0.45)
        mirror(true,true,"barrel","barrel",-1,0,2,crochet,"cubeOut")
        lascosasdelhud(0.5,crochet,4,"cubeOut")
        tweenShader("greyscale","strength",0.5,crochet*0.001*2,"cubeOut")
    elseif curStep == 1528 then
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,45,2,crochet,"cubeIn")
    elseif curStep == 1536 then
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
    elseif curStep == 1568 then
        mirror(false,true,"","angle",0,-45,8,crochet,"cubeIn")
        mirror(false,true,"","y",0,4,8,crochet,"cubeIn")
    elseif curStep == 1600 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    
    elseif curStep == 1632 then
        tweenShader("mirror2","barrel",-5,crochet*0.001*8,"cubeIn")
    elseif curStep == 1648 then
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,45,4,crochet,"cubeIn")
    elseif curStep == 1656 then
        mirror(false,true,"","zoom",0,0.3,2,crochet,"cubeIn")
        tweenShader("bars","effect2",0.1,crochet*0.001*2,"cubeIn")
        mirror(true,true,"y","y",-2,0,8,crochet,"cubeInOut")
    elseif curStep == 1664 then
        setShaderProperty('glitchPeak', 'AMT', 0.07)
        tweenShader("mirror2","barrel",0,crochet*0.001*12,"cubeOut")
        mirror(false,true,"","zoom",0,1,8,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,12,crochet,"cubeOut")
        lascosasdelhud(0,crochet,4,"cubeOut")
        bloom(4,1,crochet,4,"linear")
        tweenShader("bars","effect",0.1,crochet*0.001*8,"cubeOut")
    end
    if curStep == 1696 then
        mirror(false,true,"","zoom",0,4,8,crochet,"cubeIn")
    elseif curStep == 1712 then
        mirror(false,true,"","angle",0,90,4,crochet,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 1728 then
        set("boyfriend.alpha", 0) 
        posiciones("hud", 50, "boyfriend")
        setActorScale(1.5, "boyfriend")

        tween("boyfriend", {alpha = 0.7}, 0.001) 
        tween("boyfriend", {alpha = 0}, crochet * 0.001 * 8, "expoOut") 

        movimiento({0,17}, 8, "expoOut", false)
        tweenShader("bloom","brightness",0,crochet*0.001*4,"cubeOut")
        mirror(true,true,"zoom","zoom",0,1,8,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,12,crochet,"cubeOut")
        mirror(true,true,"y","y",-2,0,8,crochet,"cubeOut")
        setShaderProperty("greyscale","strength",1)
        tweenShader("greyscale","strength",0.5,crochet*0.001*16,"cubeOut")
    elseif curStep == 1760 then
        posiciones("game")
        setActorScale(1, 'boyfriend')
       
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
    elseif curStep == 1776 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 1780 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 1784 then
        mirror(false,true,"","angle",0,-45,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeIn")
        mirror(true,true,"x","x",0,0,3,crochet,"cubeInOut")
    elseif curStep == 1792 then
        setShaderProperty("greyscale","strength",1)
        tweenShader("greyscale","strength",0.5,crochet*0.001*16,"cubeOut")
        set("dad.alpha", 0)
        posiciones("hud", 50, "dad")
        setActorScale(1.5, "dad")
        posiciones("game", nil, "boyfriend")
        tween("dad", {alpha = 0.7}, 0.001)
        tween("dad", {alpha = 0}, crochet * 0.001 * 8, "expoOut")
        movimiento({0}, 8, "expoOut", true)
        
        mirror(true,true,"y","y",-2,0,8,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0,1,8,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
        tweenShader("bars","effect",0.1,crochet*0.001*4,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.001*4,"cubeOut")

        set("boyfriend.alpha",1)
    elseif curStep == 1816 then
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
    elseif curStep == 1824 then
       
       
        mirror(false,true,"","angle",0,0,4,crochet,"linear")
    elseif curStep == 1840 then
        mirror(false,true,"","zoom",0,2,1.5,crochet,"quadOut")
    elseif curStep == 1846 then
        mirror(false,true,"","zoom",0,3,1.5,crochet,"quadOut")
        mirror(false,true,"","angle",0,45,10,stepCrochet,"cubeIn")
    elseif curStep == 1852 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 1856 then
        mirror(false,true,"","zoom",0,3,8,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
    elseif curStep == 1888 then
        mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-90,8,crochet,"cubeIn")
    
        tweenShader("mirror2","barrel",-2,crochet*0.001*8,"cubeIn")
    elseif curStep == 1904 then
        mirror(false,true,"","zoom",0,4,4,crochet,"quadOut")
        tweenShader("bars","effect2",0.6,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
        tweenShader("flashlight","strengthGlow",0.3,crochet*0.001*4,"cubeIn")
        tweenShader("flashlight","strengthDark",0.8,crochet*0.001*4,"cubeIn")
         posiciones("game")
        setActorScale(1, 'dad')
        set("dad.alpha",1)


    elseif curStep == 1920 then
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
        bf = false
        setShaderProperty('titleeffect', 'money',0.35)
        tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        matt = false
    elseif curStep == 2160 then
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 2168 then
        setShaderProperty("mirror2","barrel",-5)
        tweenShader("mirror2","barrel",0,crochet*0.001*4,"cubeOut")
         rotCam = false
    elseif curStep == 2176 then
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        tweenShader("bump","barrel",0.3,crochet*0.001*2,"cubeOut")
        setShaderProperty('titleeffect', 'money',1.1)
        flashCamera("hud","white",crochet*0.001*2,"cubeOut")
        setShaderProperty('glitchPeak', 'AMT', 0.1)
    end

    if curStep == 2304 then
        tweenShader("bars","effect",0.15,crochet*0.001*2,"cubeOut")
    elseif curStep == 2312 or curStep == 2344 then
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
    elseif curStep == 2328 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
        triggerEvent('screen shake', (stepCrochet * 0.001 * 102) .. ',0.015')
    elseif curStep == 2336 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 2352 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 2356 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 2360 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,45,2,crochet,"cubeIn")
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",2,crochet*0.001*3,"cubeInOut")
    elseif curStep == 2368 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,10,16,crochet,"cubeIn")
        tweenShader("bump","barrel",1.5,crochet*0.001*16,"cubeIn")
    elseif curStep == 2400 then
        set("defaultCamZoom", 0.6)
        bf = false
        matt = false
    elseif curStep == 2416 then
        mirror(false,true,"","angle",0,-90,4,crochet,"cubeIn")
        tweenShader("glitchPeak","AMT",5,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 2432 then
        tweenShader("glitchPeak","AMT",0,crochet*0.001*2,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        tweenShader("bars","effect",0.1,crochet*0.001*4,"cubeOut")
        flashCamera("hud","white",crochet*0.001*2,"cubeOut")
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShader("bump","barrel",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('titleeffect', 'money',0)
        setShaderProperty('ghost', 'strength', 0)
        mirror(true,true,"zoom","zoom",0,1,12,crochet,"cubeOut")
        mirror(true,true,"angle","angle",45,0,12,crochet,"cubeOut")
        setShaderProperty('scanline', 'strength', 0.5)
    end
    if curStep == 2480 then
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        setProperty('', 'cameraSpeed',1)
    elseif curStep == 2488 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
    elseif curStep == 2492 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")
    elseif curStep == 2496 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 2552 then
        mirror(false,true,"","angle",0,-25,2,crochet,"cubeIn")
    elseif curStep == 2560 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        matt = true
    elseif curStep == 2656 then
        set("defaultCamZoom", 0.45)
        bf = false
        matt = false
    elseif curStep == 2672 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
    elseif curStep == 2680 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 2688 then
        mirror(false,true,"","zoom",0,10,10,crochet,"cubeIn")
        tweenShader("mirror2","angle",20,crochet*0.001*10,"cubeIn")
        tween("camHUD",{alpha = 0},stepCrochet*0.001*32,"cubeIn")
        bloom(4,1,crochet,2,"linear")
        triggerEvent('screen shake', (crochet * 0.001 * 12) .. ',0.015')
        tweenShader("bloom","brightness",0.5,crochet*0.001*8,"cubeIn")
    elseif curStep == 2712 then
        tweenShader("fish","power",0.5,crochet*0.001*2,"cubeIn")
        tweenShader("bars","effect",0.6,crochet*0.001*2,"cubeIn")
    elseif curStep == 2720 then
        tweenShader("bloom","brightness",-1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1608 or curStep == 1616 or curStep == 1728 or curStep == 2304 or curStep == 2336 
    or curStep == 2368 then
        bf = false
        matt = true
        setProperty('', 'cameraSpeed',3.5)
    elseif curStep == 1608 or curStep == 1628 or curStep == 1792 or curStep == 2320 or curStep == 2352
    or curStep == 2384 then
        bf = true
        matt = false
        setProperty('', 'cameraSpeed', 3.5)
    end
    if curStep >= 112 and curStep < 128 then
        if curStep % 4 == 0 then
            setShaderProperty("bloom","contrast",0)
        elseif curStep % 4 == 2 then
            setShaderProperty("bloom","contrast",1)
        end
    end
    if curStep >= 832 and curStep < 864 or curStep >= 2624 and curStep < 2656 then
        if curStep % 8 == 0 then
            mirror(true,true,"zoom","zoom",0.7,1,1.5,crochet,"cubeOut")
        end
    end
    if curStep >= 864 and curStep < 880 or curStep >= 2656 and curStep < 2672 then
        if curStep % 4 == 0 then
            mirror(true,true,"zoom","zoom",0.7,1,1,crochet,"cubeOut")
        end
    end
  
    if curStep >= 896 and curStep < 1152
    or curStep >= 1920 and curStep < 2432 then
        if curStep % 16 == 6 then
            tween("camHUD",{zoom = 1.2 , y = 0.05},stepCrochet*0.001*1.5,"cubeIn")
        elseif curStep % 16 == 8 then
            tween("camHUD",{zoom = 1 , y = 0},stepCrochet*0.001*6,"cubeOut")
        end
    end
    if curStep >= 1664 and curStep < 1904 then 
        if curStep % 32 == 16 then
            tweenShader("bump","barrel",-0.5,crochet*0.001*4,"cubeIn")
        elseif curStep % 32 == 0 then
            tweenShader("bump","barrel",0,crochet*0.001*4,"cubeOut")
        end
        
 
    end
    partepeak(896,true)
    partepeak(960,false)

    partepeak(1920,true)
    partepeak(1984,false)

    parte2(1024,true)
    parte2(1088,false)

    parte2(1984+64,true)
    parte2(1984+64+64,false)

    partefinal(2176,true)
    partefinal(2240,false)
end

local sapo = 1
function partepeak(s,q)
    sapo = -sapo
    if curStep == s+8 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+12 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-45*sapo,1,crochet,"cubeIn")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,1,4,crochet,"linear")
        mirror(false,true,"","angle",0,0,4,crochet,"linear")
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShader("bump","barrel",0.3,crochet*0.001*2,"cubeIn")
        if q then
        matt = true
        else 
        bf = true
        end
    elseif curStep == s+24 then
        tweenShader("bump","barrel",-0.3,crochet*0.001*2,"cubeInOut")
        tweenShader("mirror2","x",2*sapo,crochet*0.001*3,"cubeInOut")
        tweenShader("greyscale","strength",0,crochet*0.001*3,"cubeInOut")
    elseif curStep == s+32 then
        if q then
            matt = false
            set("defaultCamZoom", 0.45)
        else 
            bf = false
            set("defaultCamZoom", 0.45)
        end
    elseif curStep == s+36 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20*sapo,1,crochet,"cubeIn")
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-45*sapo,0,2,crochet,"cubeOut")
    elseif curStep == s+44 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")
    elseif curStep == s+48 then
        if q then
            matt = true
            else 
            bf = true
            end
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShader("bump","barrel",0.3,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1,4,crochet,"linear")
        mirror(true,true,"angle","angle",-45*sapo,0,4,crochet,"linear")
    elseif curStep == s+56 then
        tweenShader("mirror2","x",0,crochet*0.001*3,"cubeInOut")
        tweenShader("bump","barrel",-0.3,crochet*0.001*2,"cubeInOut")
        tweenShader("greyscale","strength",0,crochet*0.001*3,"cubeInOut")
    elseif curStep == s+64 then
        if q then
            matt = false
            set("defaultCamZoom", 0.45)
        else 
            bf = false
            set("defaultCamZoom", 0.45)
        end
        bloom(4,1,crochet,2,"linear")
    end
end
function parte2(s,q)
    sapo = -sapo
    if curStep == s then
        tweenShader("bump","barrel",-0.3,crochet*0.001*2,"cubeOut")
    elseif curStep == s+8 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-25*sapo,2,crochet,"cubeIn")
    elseif curStep == s+16 then
        if q then
            matt = true
        else 
            bf = true
        end
        mirror(false,true,"","zoom",0,1.5,4,crochet,"linear")
        tweenShader("bump","barrel",-1,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","angle",0,25*sapo,4,crochet,"linear")
    elseif curStep == s+24 then
        tweenShader("mirror2","x",1*sapo,crochet*0.001*3,"cubeInOut")
    elseif curStep == s+32 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("bump","barrel",-0.3,crochet*0.001*4,"cubeOut")
        mirror(false,true,"","angle",0,-25*sapo,2,crochet,"cubeOut")
        if q then
            matt = false
            set("defaultCamZoom", 0.45)
        else 
            bf = false
            set("defaultCamZoom", 0.45)
        end
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,25*sapo,2,crochet,"cubeIn")
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShader("bump","barrel",1,crochet*0.001*4,"cubeIn")
    elseif curStep == s+56 then
        tweenShader("mirror2","x",0,crochet*0.001*3,"cubeInOut")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-25*sapo,2,crochet,"cubeIn")
    elseif curStep == s+64 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
      
    end
end
function partefinal(s,q)
    if curStep == s then
        if q then
            matt = true
        else 
            bf = true
        end
        tweenShader("mirror2","zoom",0.8,crochet*0.001*2,"cubeIn")
        mirror(true,true,"angle","angle",45*sapo,0,4,crochet,"linear")
    elseif curStep == s+8 then
        tweenShader("mirror2","zoom",1,crochet*0.001*3,"cubeInOut")
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",1*sapo,crochet*0.001*3,"cubeInOut")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,4,crochet,"cubeIn")
        tweenShader("bump","barrel",1,crochet*0.001*4,"cubeIn")
        if q then
            matt = false
            set("defaultCamZoom", 0.45)
        else 
            bf = false
            set("defaultCamZoom", 0.45)
        end
    elseif curStep == s+24 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        tweenShader("mirror2","x",2*sapo,crochet*0.001*3,"cubeInOut")
    elseif curStep == s+32 then
        if q then
            matt = true
        else 
            bf = true
        end
        tweenShader("bump","barrel",0.3,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-45,2,crochet,"cubeIn")
    elseif curStep == s+44 then
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")
    elseif curStep == s+48 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShader("bump","barrel",-0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == s+52 or curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")
        if q then
            matt = false
            set("defaultCamZoom", 0.45)
        else 
            bf = false
            set("defaultCamZoom", 0.45)
        end
    elseif curStep == s+64 then
        bloom(4,1,crochet,4,"linear")
        tweenShader("bump","barrel",0.3,crochet*0.001*2,"cubeOut")
    end
end
