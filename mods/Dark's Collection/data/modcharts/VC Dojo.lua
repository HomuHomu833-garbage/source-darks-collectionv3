function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)

    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end

local characters = {"dad"}
local yPositions = {50}  
local xPositions = {-10} --3,9,18
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
function movimiento(nuevasPosiciones, duration, ease)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if i <= 1 then
            tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
        end
    end
end
function createPost()
    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end


    lascosasdelhud(0,crochet,1,"cubeOut")
    for i = 0,7 do
        set(i..".alpha",0)
    end

    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('GlowingBlack', 'GlowingBlack')
    setCameraShader('game', 'GlowingBlack')
    setShaderProperty('GlowingBlack', 'strength', 0.025)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('speedlines', 'speedlines')--
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    initShader('greyscalemoving', 'greyscalemoving')--
    setCameraShader("hud","greyscalemoving")
     setCameraShader("game","greyscalemoving")
     setShaderProperty('greyscalemoving', 'strength', 0.5)

	initShader('mirror', 'PincushNewEffect')--PincushNewEffect
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    
    initShader('mirror2', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror2')
    --setCameraShader('hud', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)


    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0)
    setShaderProperty('bars', 'angle1', 0)
    setShaderProperty('bars', 'angle2', 0.2)

        
    initShader('bump', 'BarrelBlurEffect')--
    setCameraShader('game', 'bump')
    setCameraShader('hud', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'angle', 0)
	setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)
	setShaderProperty('bump', 'barrel', 0)
    setShaderProperty('bump', 'doChroma', true)
    
    initShader('blur', 'blur')
    setCameraShader('game', 'blur')
    setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strengthX', 0)
    setShaderProperty('blur', 'strengthY', 0)
    

	initShader('bloom', 'BloomEffect')--
    setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
	setShaderProperty('bloom', 'brightness', 0)

    
    initShader('fish', 'EyeFishEffect')--
    setCameraShader('game', 'fish')
    setShaderProperty('fish', 'power', 0.1)

    initShader('flashlight', 'flashlight')--
    setCameraShader('game', 'flashlight')
    setShaderProperty('flashlight', 'flashX', 0)
    setShaderProperty('flashlight', 'flashY', 0)
    setShaderProperty('flashlight', 'strengthGlow',0)
    setShaderProperty('flashlight', 'strengthDark', 1)
    setShaderProperty('flashlight', 'sizeY', 0.9)
    setShaderProperty('flashlight', 'sizeX', 0.9)

     initShader('color', 'ColorOverrideEffect')--
     setCameraShader('hud', 'color')
     setCameraShader('game', 'color')
     setShaderProperty('color', 'red', 1.35)
     setShaderProperty('color', 'green',1.35)
     setShaderProperty('color', 'blue',1.35)

     
 
     

     initShader('chromaaberr', 'chromaaberr')--
     setCameraShader("game","chromaaberr")

      setShaderProperty('chromaaberr', 'strength', 0.7)
 




    set("dad.alpha",0)
    set("girlfriend.alpha",0)
    set("boyfriend.alpha",0)
    setProperty('', 'centerCamera', true)

    setCamZoom(0.45)
end
function startSong()
    tweenShader("bloom","contrast",1,crochet*0.001*8,"cubeOut")
    tweenShader("bloom","brightness",0.5,crochet*0.001*8,"cubeIn")
    tweenShader("mirror2","barrel",-5,crochet*0.001*8,"cubeIn")
    tweenShader("bars","effect",0.15,crochet*0.001*8,"linear")
    mirror(false,true,"","zoom",0,2,8,crochet,"cubeIn")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
local time = 0
local zoom = 1
local previousZoom = zoom
local shaggy = false
local bf = false
local downscroll = 1
local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 1.3 
local perlinXRange = 0.085
local perlinYRange = 0.085

local rotCam = false
local rotCamSpd = 1
local rotCamRange = 10
local rotCamInd = 0

local serpientelol = 1 -- tamaño del movimiento
local serpientexd = 0.65 -- velocidad
function update(elapsed)
    time = time + elapsed
    setShaderProperty("GlowingBlack","iTime",time)
    setShaderProperty("speedlines","iTime",time)
    
    local currentBeat = (songPos / 1000) * (bpm / 60)
    if curStep >= 32 and curStep < 160 or curStep >= 1184 and curStep < 1312 then 
     
        local direction = 1  

        if (curStep >= 96 and curStep < 160) or (curStep >= 1184+64 and curStep < 1312) then
            direction = -1
        end
        set("camFollow.x", 400 + math.cos(time * crochet*0.001*4) * 350 * direction)
        set("camFollow.y", 150 + math.cos(time * crochet*0.001*2) * 350)
    elseif curStep >= 1872 and curStep < 1984 or curStep >= 2000 and curStep < 2112 then
        for i = 0, (keyCount * 2) - 1 do
            local movementX = serpientelol * math.cos(currentBeat * serpientexd) * 100
            local movementY = serpientelol * math.sin(currentBeat * serpientexd) * -30
            local rarete = serpientelol * math.cos(currentBeat * serpientexd + i) * 30 
            if i <= 3 then
                setActorProperty(i, 'x', _G['defaultStrum'..i..'X'] - movementX) 
                setActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + movementY) 
            else
                setActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + movementX) 
                setActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] - movementY) 
            end
            setActorProperty(i, 'angle',rarete) 
            set("ratingsGroup.x",movementX)
           
        end
    
    end
    if curStep >= 2000 and curStep < 2112 then
        setShaderProperty('chromaaberr', 'strength',math.cos(time*4* crochet*0.001*4)*0.5)
    else
        setShaderProperty('chromaaberr', 'strength', 0)
    end
    
    zoom, blur = lerp(zoom, 1, elapsed * 8), lerp(blur, 0, elapsed * 8)
        setShaderProperty('bump', 'zoom', zoom)
        setShaderProperty('blur', 'strengthX', blur)
        setShaderProperty('blur', 'strengthY', blur)
    if math.abs(zoom - previousZoom) > 0.01 then
        triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.008')
    end

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
   
    setShaderProperty('bump', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('bump', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))

    if shaggy then
        set("camFollow.x", get("dad.x")+200)
        set("camFollow.y", get("dad.y")+420)
      
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+175)
        set("camFollow.y", get("boyfriend.y")+100)
       
    end
    previousZoom = zoom

    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('bump', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('bump', 'angle', 0)
    end
end
local qperroqqq = true
local lolito = true
local qperrolol = true
local lol = true
local qxd = {288,292,296,297,298,300,302,310,316,
544,548,552,553,554,556,558,566,572,800,804,808,809,810,812,814,822,828,920,922,
924,926,1056,1060,1068,1070,1856,1860,1864,1868,1992,1996,1998}

local barras = {1114,1116,1146,1148}
local barraslol = {494,498,590,594,622,626,654,658,708,846,850}
local reversaaa = 1
function stepHit()
    for i = 1,#barras do
        if curStep == barras [i]-1 then
            tweenShader("bars","effect",0.15,stepCrochet*0.001*1,"cubeIn")
        elseif curStep == barras [i] then
            tweenShader("bars","effect",0.07,stepCrochet*0.001*1,"cubeOut")
        end
    end

    for i = 1,#barraslol do
        if curStep == barraslol [i]-2 then
            tweenShader("bars","effect",0.15,stepCrochet*0.001*2,"cubeIn")
        elseif curStep == barraslol [i] then
            tweenShader("bars","effect",0.07,stepCrochet*0.001*2,"cubeOut")
        end
    end
    for i = 1,#qxd do
        if curStep == qxd [i]-1 then
            zoom,blur = 0.85,0
        end
    end
    local section = math.floor(curStep / 16)
    if section >= 10 and section < 57 
    or section >= 74 and section < 96 then
        if qperrolol then
            if curStep % 16 == 8 then
                zoom, blur = 1.1, 4
                local offset = 100 * reversaaa
                for i = 0, 7 do
                    setActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + offset) 
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 3, 'cubeOut') 
                    local qxdddddd = (i <= 3) and 45 or 45
                    setActorProperty(i, 'angle', qxdddddd*reversaaa)
                    tweenActorProperty(i, 'angle', 0, crochet * 0.001 * 3, 'cubeOut')
                end
                reversaaa = -reversaaa 
            end
            
        end
    end

    if curStep == 96 or curStep == 124 or curStep == 128 or curStep == 144 or curStep == 1184+28
    or curStep == 1184+32 or curStep == 1248 or curStep == 1276 or curStep == 1280 
    or curStep == 1184+64+48 then 
    
        local bloomStrength = (curStep == 124 or curStep == 128 or curStep == 1184+28 or curStep == 1184+32
        or curStep == 1276 or curStep == 1280) and 1 or 4
        bloom(4,1,crochet,bloomStrength,"linear")
        setShaderProperty('chromaaberr', 'strength', bloomStrength == 1 and 0.7)
        tweenShader("chromaaberr", "strength", bloomStrength == 1 and 0.1,crochet*0.001*4,"linear")
        local ereslol = ({
            [96] = {0, 7}, [124] = {1, 6}, [128] = {2, 5}, [144] = {3, 4}, 
            [1248] = {0, 7}, [1276] = {1, 6}, [1280] = {2, 5}, [1184+64+48] = {3, 4} 
        })[curStep]
    
        for _, i in ipairs(ereslol) do
            tweenActorProperty(i, "angle", get(i..".angle") + 360, stepCrochet * 0.001 * 16, "cubeOut") 
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 4, 'cubeOut')
        end
    end
    
    if curStep == 32 or curStep == 1184 then
        setShaderProperty("mirror2","barrel",-5)
        flashCamera("game","white",crochet*0.001*2)
        tweenShader("mirror2","barrel",0,crochet*0.001*15,"cubeOut")
        mirror(true,true,"angle","angle",45,0,16,crochet,"linear")
        mirror(true,true,"zoom","zoom",0.5,1,28,crochet,"linear")
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 80 or curStep == 1184+48 then
        bloom(1,0,crochet,3,"cubeIn")
        tweenShader("bars","effect2",0.6,crochet*0.001*4,"cubeIn")
        tweenShader("mirror2","barrel",-5,crochet*0.001*4,"cubeIn")
    elseif curStep == 96 or curStep == 1184+64 then
        setCamZoom(0.5)
        tweenShader("mirror2","barrel",0,crochet*0.001*16,"cubeOut")
        tweenShader("bars","effect2",0,crochet*0.001*4,"cubeOut")
        mirror(true,true,"angle","angle",-45,0,12,crochet,"linear")
    elseif curStep == 144 or curStep == 1184+64+48 then
        setCamZoom(0.7)
       -- bloom(4,1,crochet,4,"linear")
        tween("camHUD",{alpha = 1},crochet*0.001*4)
        tween("dad",{alpha = 1},crochet*0.001*4)
        tween("girlfriend",{alpha = 1},crochet*0.001*4)
        tween("boyfriend",{alpha = 1},crochet*0.001*4)
        tweenShader("greyscale","strength",0,crochet*0.001*4,"cubeIn")
        tweenShader("greyscalemoving","strength",0,crochet*0.001*4,"cubeIn")
        tweenShader("GlowingBlack","strength",0,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("fish","power",0.3,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,-90,4,crochet,"cubeIn")
        tweenShader("bars","effect",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 152 or curStep == 1184+64+48+8 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        tweenShader("bars","angle2",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 160 or curStep == 1184+64+48+16 then
        tweenShader("bars","effect",0.07,crochet*0.001*4,"cubeOut")
     --   tweenShader("vignette","size",0.05,crochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        setProperty('', 'centerCamera', false)
        bloom(4,1,crochet,4,"cubeOut")
        setProperty('', 'cameraSpeed', 3)
        shaggy = true
        set("defaultCamZoom", 0.8)
    end
    if curStep == 160 then
        lascosasdelhud(1,crochet,4,"cubeOut")
    end
    
    if curStep >= 192 and curStep <= 912 and (curStep % 32 == 0) then
        local zoom = (curStep % 64 == 0) and 0.7 or 0.8
       -- local angle = (curStep % 128 == 0) and 5 or -5
        set("defaultCamZoom", zoom)
       -- set("cameraAngle", angle)
    end
    
   
    if curStep == 188 or curStep == 444 or curStep == 700 then
        mirror(true,true,"x","x",0,1,1,crochet,"cubeIn")
     elseif curStep == 216 or curStep == 472 or curStep == 728 then
        mirror(false,true,"","angle",0,-90,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 224 or curStep == 288 or curStep == 352 or curStep == 480 or curStep == 544 
    or curStep == 736 or curStep == 800 or curStep == 864 then
        bloom(4,1,crochet,4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
       
    end
    if curStep == 272 or curStep == 528 or curStep == 784 then
        tweenShader("bars","effect",0.5,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","angle",0,-180,4,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("fish","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 280 or curStep == 536 or curStep == 792 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == 288 or curStep == 544 or curStep == 800 then
        tweenShader("bars","effect",0.07,crochet*0.001*2,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShader("mirror2","barrel",-0.5,crochet*0.001*2,"cubeOut")
    elseif curStep == 304 or curStep == 560 or curStep == 816 then
        tweenShader("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")


    elseif curStep == 312 or curStep == 380 or curStep == 824 or curStep == 892 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 316 or curStep == 376 or curStep == 828 or curStep == 888 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
    elseif curStep == 320 or curStep == 384 or curStep == 832 or curStep == 896 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 332 or curStep == 844 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"backIn")
        mirror(false,true,"","angle",0,20,1,crochet,"backIn")
    elseif curStep == 336 or curStep == 848 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,2,crochet,"cubeOut")
        tweenShader("fish","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 344 or curStep == 856 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 348 or curStep == 860 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == 408 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShader("fish","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 412 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == 416 then
        bloom(4,1,crochet,4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        shaggy = true
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        --set("defaultCamZoom", 0.8)
    end

    if curStep == 572 then
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
    elseif curStep == 574 then
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeOut")
    elseif curStep == 588 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 600 then
        mirror(true,true,"x","x",0,0.5,4,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",45,0,1,crochet,"cubeOut")
    elseif curStep == 604 then
        mirror(true,true,"angle","angle",-45,0,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,1,4,stepCrochet,"cubeOut")
    elseif curStep == 620 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 628 then
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
    elseif curStep == 630 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == 636 then
        mirror(false,true,"","x",0,2,4,stepCrochet,"cubeIn")
    elseif curStep == 652 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"backIn")
    elseif curStep == 656 then
        mirror(false,true,"","zoom",0,3,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,90,4,crochet,"cubeIn")
        tweenShader("fish","power",0.3,crochet*0.001*4,"cubeIn")
        tweenShader("bars","effect",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 672 then
        bloom(4,1,crochet,4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader("bars","effect",0.07,crochet*0.001*2,"cubeOut")
        shaggy = true
        tweenShader("fish","power",0,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
    end
    if curStep == 224 or curStep == 480 or curStep == 736 then
        shaggy = false
        bf = true
        mirror(false,true,"","x",0,2,2,crochet,"cubeOut")
    end

    if curStep == 288 or curStep == 544 or curStep == 800 then
        qperrolol = false
        shaggy = false
        bf = false
    elseif curStep == 304 or curStep == 560 or curStep == 816 then
        qperrolol = true
    elseif curStep == 320 or curStep == 576 or curStep == 832 then
        lol = true
        shaggy = false
        bf = false
    end

    if curStep == 912 then
        mirror(false,true,"","zoom",0,2,2,crochet,"backIn")
        tweenShader("mirror2","barrel",-2,crochet*0.001*4,"cubeIn")
        tweenShader("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","angle",0,-90,4,crochet,"expoIn")
    elseif curStep == 920 then
        tweenShader("bars","effect",0.5,crochet*0.001*2,"expoIn")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"expoIn")
        tweenShader("fish","power",0.1,crochet*0.001*1,"cubeOut")
    elseif curStep == 928 then
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        setShaderProperty("mirror2","barrel",-5)
        tweenShader("mirror2","barrel",1,crochet*0.001*3,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShader("bars","angle1",0.3,crochet*0.001*2,"cubeOut")
        tweenShader("bars","effect",0.07,crochet*0.001*4,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        tweenShader("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        shaggy = true
        set("defaultCamZoom", 0.8)

    elseif curStep == 1060 or curStep == 1860 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == 1064 or curStep == 1864 then
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShader("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeOut")
        set("defaultCamZoom", 0.85)
        for i = 0,7 do
            setActorProperty(i, 'angle', -360)
            tweenActorProperty(i, 'angle', 0, crochet * 0.001 * 2, 'cubeOut')
        end
        tweenShader("bars","angle1",0.3,crochet*0.001*2,"cubeOut")
    elseif curStep == 1068 or curStep == 1868 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1176 then
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShader("bars","effect",0.6,crochet*0.001*2,"cubeIn")
        tweenShader("bars","angle1",0,crochet*0.001*2,"cubeIn")
       -- tweenShader("vignette","size",0.2,crochet*0.001*2,"cubeIn")
        tweenShader("fish","power",0.1,crochet*0.001*2,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*2,"cubeIn")
    end
    if curStep == 1184 then
        tweenShader("titleeffect","money",0.3,crochet*0.001*32,"cubeOut")
     
        tweenShader("bars","effect",0.15,crochet*0.001*3,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 1)
        setShaderProperty('greyscalemoving', 'strength', 0.5)
        setShaderProperty('GlowingBlack', 'strength', 0.025)
        bf = false
        shaggy = false
        set("dad.alpha",0)
        set("girlfriend.alpha",0)
        set("boyfriend.alpha",0)
        setProperty('', 'centerCamera', true)
        for i = 0,7 do
            set(i..".alpha",0)
        end
        set("defaultCamZoom", 0.6)
    elseif curStep == 1188 then
        setCamZoom(0.45)
    end
    if curStep == 1056 then
        lolito = false
        bf = true
        shaggy = false
    elseif curStep == 1072 then
        lolito = true
    end


    if curStep == 1312 or curStep == 2112 then
        tweenShader("GlowingBlack","strength",0.1,crochet*0.001*4,"cubeOut")
        tweenShader("mirror2","zoom",2,crochet*0.001*14,"quadOut")
        tweenShader("bump","barrel",-0.5,crochet*0.001*32,"cubeIn")
        tweenShader("mirror2","angle",-25,crochet*0.001*14,"quadOut")
        tweenShader("bars","effect2",0.15,crochet*0.001*2,"cubeOut")
        tweenShader("bars","effect",0.07,crochet*0.001*2,"cubeOut")
        tweenShader("bars","angle2",0.2,crochet*0.001*2,"cubeOut")
        tweenShader("bars","angle1",-0.2,crochet*0.001*2,"cubeOut")
        mirror(true,true,"y","y",2,0,3,crochet,"cubeInOut")
        tween("blackBG",{alpha = 0.8},crochet*0.001*14,"quadOut")
        tweenShader("greyscale","strength",0.5,crochet*0.001*14,"cubeIn")
        setShaderProperty('speedlines', 'transparency', 1)
    elseif curStep == 1368 then
        tweenShader("mirror2","zoom",0.7,crochet*0.001*2,"cubeIn")
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
        tweenShader("mirror2","angle",0,crochet*0.001*2,"cubeIn")
        tweenShader("greyscale","strength",0,crochet*0.001*2,"quadOut")
        tweenShader("bars","angle2",-0.2,crochet*0.001*2,"cubeIn")
        tweenShader("bars","angle1",0.2,crochet*0.001*2,"cubeIn")
        tween("blackBG",{alpha = 0},crochet*0.001*2,"cubeIn")
    elseif curStep == 1376 then
        tweenShader("greyscale","strength",0.5,crochet*0.001*14,"cubeIn")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShader("mirror2","zoom",2,crochet*0.001*14,"quadOut")
        tweenShader("mirror2","angle",25,crochet*0.001*14,"quadOut")
        tween("blackBG",{alpha = 0.8},crochet*0.001*14,"quadOut")
        shaggy = false
        bf = true
    elseif curStep == 1432 or curStep == 2168 then
        tweenShader("mirror2","zoom",1,crochet*0.001*2,"cubeIn")
        mirror(true,true,"x","x",2,0,3,crochet,"cubeInOut")
        tweenShader("mirror2","angle",0,crochet*0.001*2,"cubeIn")
        tweenShader("greyscale","strength",0,crochet*0.001*2,"quadOut")
        tweenShader("bars","effect2",0.6,crochet*0.001*2,"cubeIn")
        tweenShader("bars","angle2",0,crochet*0.001*2,"cubeIn")
        tweenShader("bars","angle1",0,crochet*0.001*2,"cubeIn")
        tween("blackBG",{alpha = 0},crochet*0.001*2,"cubeIn")
    elseif curStep == 1440 or curStep == 2176 then
        local zoomValue = (curStep == 2176) and 40 or 88 
        mirror(false, true, "", "zoom", 0, 2, zoomValue, stepCrochet, "cubeOut")
        set("defaultCamZoom", 0.85)
        bf = false
        shaggy = true
        rotCam = true
        tweenShader("bars", "effect2", 0, crochet * 0.001 * 2, "cubeOut")
        tweenShader("bars", "effect", 0.25, crochet * 0.001 * 2, "cubeOut")
    elseif curStep == 1496 then
        setShaderProperty("mirror2","x",-2)
        tweenShader("mirror2","x",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 1496+8 then
        tweenShader("bars","effect2",0.25,crochet*0.001*2,"cubeOut")
    elseif curStep == 1528 or curStep == 2232 then
        mirror(false,true,"","zoom",0,1,8,stepCrochet,"cubeIn")
        tweenShader("bars","effect",0.1,crochet*0.001*2,"cubeIn")
        tweenShader("bump","barrel",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 1536 or curStep == 2240 then
        tweenShader("bars","effect2",0,crochet*0.001*4,"cubeOut")
        qperroqqq = false
       -- set("defaultCamZoom", 0.6)
        tweenShader("bars","angle1",0.3,crochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        rotCam = false
        tweenShader("titleeffect","money",0,crochet*0.001*2,"cubeOut")
      --  tweenShader("vignette","size",0.2,crochet*0.001*2,"cubeOut")
        tweenShader("GlowingBlack","strength",0,crochet*0.001*4,"cubeOut")
        for i = 0,7 do
        setActorProperty(i, 'angle', 360)
        tweenActorProperty(i, 'angle', 0, crochet * 0.001 * 2, 'cubeOut')
        end
        tweenShader("flashlight","strengthGlow",0.2,crochet*0.001*2,"cubeOut")
        tweenShader("flashlight","strengthDark",0.25,crochet*0.001*2,"cubeOut")
    end
    if curStep == 1536 then
        bf = true
        shaggy = false
        
        mirror(false,true,"","zoom",0,0.8,48,stepCrochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,48,stepCrochet,"cubeIn")
        tweenShader("chromaaberr","strength",0.5,stepCrochet*0.001*56,"cubeIn")
        tweenShader("flashlight","flashX",-0.5,crochet*0.001*2,"cubeOut")
        tweenShader("flashlight","flashY",-0.3,crochet*0.001*2,"cubeOut")
    elseif curStep == 2240 then
        set("defaultCamZoom", 0.6)
        tweenShader("bump","barrel",0,crochet*0.001*4,"cubeOut")
        bf = false
        shaggy = false
    elseif curStep == 2256 then
        tween("camHUD",{alpha = 0},crochet*0.001*8,"cubeOut")
        tweenShader("bars","effect",0.7,crochet*0.001*8,"linear")
    end
 
    if curStep == 1584 then
        mirror(false,true,"","zoom",0,2,2,crochet,"backIn")
        tweenShader("mirror2","barrel",-2,crochet*0.001*4,"cubeIn")
        tweenShader("greyscale","strength",0,crochet*0.001*4,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","angle",0,90,4,crochet,"expoIn")
        tweenShader("flashlight","sizeX",3,crochet*0.001*4,"cubeIn")
        tweenShader("flashlight","sizeY",3,crochet*0.001*4,"cubeIn")
        tweenShader("flashlight","strengthGlow",0,crochet*0.001*4,"cubeIn")
        tweenShader("flashlight","strengthDark",1,crochet*0.001*4,"cubeIn")
    elseif curStep == 1592 then
        tweenShader("bars","effect",0.5,crochet*0.001*2,"expoIn")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"expoIn")
        tweenShader("fish","power",0.1,crochet*0.001*1,"cubeOut")
        lolito = false
    elseif curStep == 1600 then
        tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        setShaderProperty("mirror2","barrel",-5)
        tweenShader("mirror2","barrel",1,crochet*0.001*3,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShader("bars","angle1",0.3,crochet*0.001*2,"cubeOut")
        tweenShader("bars","effect",0.07,crochet*0.001*4,"cubeOut")
        mirror(true,true,"angle","angle",60,0,2,crochet,"cubeOut")
        shaggy = true
        flashCamera("game","white",crochet*0.001*2)
    elseif curStep == 1608 then
        set("defaultCamZoom", 0.85)
    elseif curStep == 1728  then
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 1736 then
        tweenShader("bars","angle1",0.3,crochet*0.001*2,"cubeOut")
        lolito = true
    elseif curStep == 1856 or curStep == 1984 then
        shaggy = false
        bf = false  
        setProperty('', 'cameraSpeed', 5)
        set("defaultCamZoom", 0.6)
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 1992 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
    elseif curStep == 1996 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 2000 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShader("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        set("defaultCamZoom", 0.85)
    elseif curStep == 2096 then
        tweenShader("mirror","barrel",-2,crochet*0.001*2,"cubeIn")
    elseif curStep == 2104 then
        tweenShader("bars","effect",0.6,crochet*0.001*2,"cubeIn")
        
        qperroqqq = true
    elseif curStep == 2112 then
        tweenShader("mirror","barrel",0,crochet*0.001*2,"cubeOut")
        for i = 0,7 do
        tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut') 
        tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'], crochet * 0.001 * 2, 'cubeOut') 
        tweenActorProperty(i, 'angle',360, crochet * 0.001 * 2, 'cubeOut') 
        tweenActorProperty(i, 'alpha',1, crochet * 0.001 * 2, 'cubeOut') 
        end
    end
    if curStep == 1552 or curStep == 1576 or curStep == 1588 or curStep == 1592 or curStep == 2112 then
        bf = false
        
        shaggy = true
    elseif curStep == 1568 or curStep == 1584 or curStep == 1728 then
        bf = true
        shaggy = false
    
    end
    if curStep >= 1440 and curStep < 1536 
    or curStep >= 1872 and curStep < 1984
    or curStep >= 2000 and curStep < 2112 
    or curStep >= 2176 and curStep < 2240 then
        if curStep % 32 == 0 then
            setProperty('', 'cameraSpeed', 5)
            bf = false
            shaggy = true
        end
        if curStep % 32 == 16 then
            bf = true
            shaggy = false
        end
    end

    --hud
    if curStep == 1408 then
        posiciones("hud",50)
        set("dad.alpha",0)
        tween("dad",{alpha = 1},crochet*0.001*3,"quadOut")
        movimiento({3},3,"cubeOut")
    elseif curStep == 1424 then
        tween("dad",{alpha = 0, angle = -45},crochet*0.001*4,"cubeIn")
        movimiento({-10},4,"cubeIn")
    elseif curStep == 1440 then
        posiciones("game")
        tween("dad",{alpha = 1 , angle = 0},crochet*0.001*2,"cubeOut")
    end
  
   -- midlesroll

    if curStep == 928 or curStep == 1600 then
        for i = 0, 7 do
            if i <= 3 then
                if not middlescroll then
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + 320, crochet * 0.001 * 2, 'cubeOut')
                end
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
            else
                tween("defaultStrum"..i, {alpha = 0.1}, crochet * 0.001 * 2, 'linear')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + 100*downscroll,crochet*0.001*2, 'cubeOut')
            end
        end
    elseif curStep == 1048  or curStep == 1720 then
        if not middlescroll then
            set("ratingsGroup.x",-280)
        end
        for i = 0, 7 do
            
            if i >= 4 then
                if not middlescroll then
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] - 320, crochet * 0.001 * 2, 'cubeOut')
                end
                tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
            else
                tween("defaultStrum"..i, {alpha = 0.1}, crochet * 0.001 * 2, 'linear')
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + 100*downscroll,crochet*0.001*2, 'cubeOut')
            end
        end
    elseif curStep == 1184 or curStep == 1856 or curStep == 1984 or  curStep == 2112 then
        set("ratingsGroup.x",0)
        for i = 0, 7 do
            tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
            tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
        end
    end


   --end
    if curStep >= 928 and curStep < 928+128
    or curStep >= 1600 and curStep < 1856  then 
        if curStep % 16 == 6 then
            tweenShader("mirror2","zoom",0.8,crochet*0.001*0.5,"cubeIn")
            tweenShader("mirror2","x",0.05,crochet*0.001*0.5,"cubeIn")
            tweenShader("mirror2","y",-0.02,crochet*0.001*0.5,"cubeIn")
        elseif curStep % 16 == 8 then
            tweenShader("mirror2","zoom",1,crochet*0.001*1,"cubeOut")
            tweenShader("mirror2","x",0,crochet*0.001*1,"backOut")
            tweenShader("mirror2","y",0,crochet*0.001*1,"backInOut")
            for i = 0, 7 do
                local qxdddddd = (i <= 3) and -45 * reversaaa or 45 * reversaaa
                setActorProperty(i, 'angle', qxdddddd)
                tweenActorProperty(i, 'angle', 0, crochet * 0.001 * 3, 'cubeOut')
            end
            
            reversaaa = -reversaaa
            

        end
    end

    if curStep >= 1072 and curStep < 1184 or
    curStep >= 1872 and curStep < 1984 
    or curStep >= 2000 and curStep < 2112  then
        if curStep % 16 == 0 or curStep % 16 == 8 or curStep % 16 == 11 or curStep % 16 == 14 then
            zoom, blur = 0.92, 5
        end
    
        if curStep % 16 == 4 or curStep % 16 == 12 then
            if altState == nil then altState = false end  
            local angle = altState and -15 or 15
            local x = altState and -0.07 or 0.07
            local y = altState and 0.03 or -0.03
            setShaderProperty("mirror2", "zoom", 0.8)
            setShaderProperty("bump", "angle", angle)
            setShaderProperty("bump", "x", x)
            setShaderProperty("bump", "y", y)
            tweenShader("mirror2", "zoom", 1, crochet * 0.001 * 1, "cubeOut")
            tweenShader("bump", "angle", 0, crochet * 0.001 * 1, "cubeOut")
            tweenShader("bump", "x", 0, crochet * 0.001 * 1, "backOut")
            tweenShader("bump", "y", 0, crochet * 0.001 * 1, "backInOut")
            altState = not altState
        end
    end
    
    bumpmid(32)

    bumpmidos(160)
    bumpmidos(288)
    bumpmidos(416)
    bumpmidos(544)
    bumpmidos(672)
    bumpmidos(800)
    bumpmidos(928)


    bumpmidos(1600)
    bumpmidos(1728)
    drop(928)
    drop(1600)
    drop(1728)
    dropbf(1072)

    dropbf(1872)
    dropbf(2000)
    bumpmitres(1184)
    bumpmitres(1248)
    bumpmitres(1312)
    bumpmitres(1376)
    bumpmitres(1440)
    bumpmitres(1504)

    bumpmitres(2112)
    bumpmitres(2176)
end

function bumpmid(s)

        if curStep == s + 0 or curStep == s + 12 or curStep == s + 32 or curStep == s + 38
        or curStep == s + 44 or curStep == s + 60 or curStep == s + 64 or curStep == s + 70
        or curStep == s + 76 or curStep == s + 84 or curStep == s + 92 or curStep == s + 96
        or curStep == s + 102 or curStep == s + 108 or curStep == s + 118 or curStep == s + 124
        or curStep == s + 126 then
            zoom,blur = 0.9,5
        elseif curStep == s + 16 or curStep == s + 48 or curStep == s + 72 or curStep == s + 88
        or curStep == s + 104 or curStep == s + 114 or curStep == s + 120 then
            zoom,blur = 1.1,5
        end
    
end

function bumpmidos(s)
    if lol then
        if curStep == s + 20 or curStep == s + 32 or curStep == s + 44 or curStep == s + 52
        or curStep == s + 60 or curStep == s + 64 or curStep == s + 84 or curStep == s + 92
        or curStep == s + 96 or curStep == s + 102 or curStep == s + 108 or curStep == s + 116
        or curStep == s + 120 or curStep == s + 124 or curStep == s + 126 then
            zoom,blur = 0.9,5
        end
    end
end

function bumpmitres(s)
    if qperroqqq then
        if curStep == s or curStep == s + 6 or curStep == s + 12 or curStep == s + 20
        or curStep == s + 28 or curStep == s + 32 or curStep == s + 38 or curStep == s + 44
        or curStep == s + 52 or curStep == s + 60 or curStep == s + 62  then
            zoom,blur = 0.9,5
        end
        if curStep == s or curStep == s + 32 or curStep == s + 48  then
            bloom(4,1,crochet,2,"linear")
        elseif curStep == s+28 then
            bloom(4,1,crochet,1,"linear")
        end
    end

end

local oyesiri = 1
function drop(s)
    oyesiri = -oyesiri
        if curStep == s then
            tweenShader("mirror2","barrel",1,crochet*0.001*3,"cubeOut")
            mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
            lascosasdelhud(0,crochet,4,"cubeOut")
            mirror(true,true,"x","x",-2*oyesiri,0,2,crochet,"cubeInOut")
        elseif curStep == s+4 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
            mirror(false,true,"","angle",0,-25*oyesiri,1,crochet,"cubeIn")
        elseif curStep == s+8 or curStep == s+40 or curStep == s+72 then
            mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        elseif curStep == s+12 then
            mirror(false,true,"","angle",0,90*oyesiri,1,crochet,"cubeIn")
        elseif curStep == s+16 then
            mirror(true,true,"angle","angle",-60*oyesiri,0,1,crochet,"cubeOut")
        elseif curStep == s+76 then
            mirror(false,true,"","zoom",0,1.2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-90*oyesiri,1,crochet,"cubeIn")
        elseif curStep == s+80 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        elseif curStep == s+24 then
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            mirror(true,true,"y","y",-2*oyesiri,0,2,crochet,"cubeOut")
            mirror(true,true,"angle","angle",45*oyesiri,0,2,crochet,"cubeOut")
        elseif curStep == s+28 or curStep == s+92 then
            mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        elseif curStep == s+32 or curStep == s+96 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        elseif curStep == s+88 then
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            mirror(true,true,"angle","angle",-45*oyesiri,0,2,crochet,"cubeOut")
            mirror(true,true,"y","y",-2,0,2,crochet,"cubeOut")
        elseif curStep == s+44 or curStep == s+108 then
            mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,-10*oyesiri,0.5,crochet,"cubeIn")
            mirror(true,true,"x","x",0,0.5*oyesiri,0.5,crochet,"cubeIn")
            tweenShader("bars","effect",0.2,crochet*0.001*0.5,"cubeIn")

        elseif curStep == s+48 or curStep == s+112 then
            mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,10*oyesiri,0.5,crochet,"cubeIn")
            mirror(false,true,"","x",0,1*oyesiri,0.5,crochet,"cubeIn")
            tweenShader("bars","effect",0.2,crochet*0.001*0.5,"cubeIn")

        elseif curStep == s+46 or curStep == s+50 or curStep == s+110 or curStep == s+114 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
            tweenShader("bars","effect",0.07,crochet*0.001*0.5,"cubeOut")
       
        elseif curStep == s+56 then
            mirror(false,true,"","angle",0,-90*oyesiri,2,crochet,"cubeIn")
            mirror(false,true,"","x",0,1.25*oyesiri,0.5,crochet,"cubeOut")
            
        elseif curStep == s+58 then
            mirror(false,true,"","x",0,1.5*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+60 then
            mirror(false,true,"","x",0,1.75*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+62 then
            mirror(false,true,"","x",0,2*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+64 then
            tweenShader("bars","angle1",-0.3,crochet*0.001*2,"cubeOut")
            bloom(4,1,crochet,4,"cubeOut")
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(true,true,"angle","angle",60*oyesiri,0,2,crochet,"cubeOut")
        elseif curStep == s+120 then
            if lolito then
            tweenShader("greyscale","strength",0.5,crochet*0.001*2,"cubeIn")
            mirror(false,true,"","zoom",0,2,2,crochet,"cubeIn")
            end
            mirror(false,true,"","x",0,0.75*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+122 then
            mirror(false,true,"","x",0,0.5*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+124 then
            mirror(false,true,"","x",0,0.25*oyesiri,0.5,crochet,"cubeOut")
        elseif curStep == s+126 then
            mirror(false,true,"","x",0,0,0.5,crochet,"cubeOut")
        elseif curStep == s+128 then
            tweenShader("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
            if lolito then
            tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
            end
        end
    
    
end
function dropbf(s)
    oyesiri = -oyesiri
    if curStep == s then
        tweenShader("mirror2","barrel",1,crochet*0.001*3,"cubeOut")
    end
    if curStep == s+4 or curStep == s+52 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20*oyesiri,1,crochet,"cubeIn")
    elseif curStep == s+8 or curStep == s+56 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",40*oyesiri,0,2,crochet,"cubeOut")
    elseif curStep == s+12 or curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == s+16 or curStep == s+64 then
       -- mirror(false,true,"","x",0,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20*oyesiri,1,crochet,"cubeOut")
    elseif curStep == s+20 or curStep == s+68 then
        mirror(false,true,"","x",0,1*oyesiri,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20*oyesiri,1,crochet,"cubeIn")
    elseif curStep == s+24 or curStep == s+72 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20*oyesiri,1,crochet,"cubeOut")
    elseif curStep == s+28 or curStep == s+76 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20*oyesiri,1,crochet,"cubeIn")
    elseif curStep == s+32 or curStep == s+80 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == s+36 or curStep == s+84 then
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
    elseif curStep == s+38 or curStep == s+86 then
        mirror(false,true,"","angle",0,40*oyesiri,0.5,crochet,"cubeIn")
    elseif curStep == s+40 or curStep == s+88 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","x",0,0.75*oyesiri,0.5,crochet,"cubeOut")
    elseif curStep == s+42 or curStep == s+90 then
        mirror(false,true,"","x",0,0.5*oyesiri,0.5,crochet,"cubeOut")
     --   mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
    elseif curStep == s+44 or curStep == s+92 then
        mirror(false,true,"","x",0,0.25*oyesiri,0.5,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    --    mirror(false,true,"","angle",0,45,1,crochet,"cubeIn")
    elseif curStep == s+46 or curStep == s+94 then
        mirror(false,true,"","x",0,0,0.5,crochet,"cubeOut")
    elseif curStep == s+48 then
        tweenShader("bars","angle1",-0.3,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",-45*oyesiri,0,1,crochet,"cubeOut")
        tweenShader("mirror2","barrel",0,crochet*0.001*16,"cubeOut")
    end
end