local sprites = {
    {'uno-god','uno-god', -3000, 220, 0.7,"other"},
    {'dos-god','dos-god', 3000, 220, 0.7,"other"},
    {'tres-god','tres-god', -3000, 220, 0.7,"other"},
    {'cuatro-god','cuatro-god', 3000, 220, 0.7,"other"},
    {'Punch', 'Rejected VIP/Punch', 100, 1400, 1,"hud"},
    {'Sword', 'Rejected VIP/Sword', 400, 1400, 1,"hud"},
    {'Punch1', 'Rejected VIP/Punch', 680, 1400, 1,"hud"},
    {'Punch2', 'Rejected VIP/Punch', 950, 1400, 1,"hud"},
    {'bring-god', 'Rejected VIP/bring-god', 220, -1250, 0.5,"hud"},
    {'in-god', 'Rejected VIP/in-god', 590, -1260, 0.5,"hud"},
    {'the-god', 'Rejected VIP/the-god', 740, -1250, 0.5,"hud"},
    {'ruckus-god', 'Rejected VIP/ruckus-god', -1280, 250, 0.5,"hud"},
    {'like-god', 'Rejected VIP/like-god', 1680, 250, 0.5,"hud"},
    {'pico', 'Rejected VIP/Ronin', 350, 800,2,"hud"},--250
    {'finish', 'Rejected VIP/finish him', 100, 250,1.25,"hud"},
    {'troll', 'Rejected VIP/trollface', 1250, -850,3,"hud"},-- -250
    
}

function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
local characters = {"dad"}
local yPositions = {720}  
local xPositions = {7}
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
function movimiento(nuevasPosiciones, duration, ease)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetY = nuevaPos * 50
        tween(characters[i], {y = targetY},crochet*0.001*duration, ease)
    end
end
local dodgeMap = {
    singLEFT = 'dodgeLEFT',
    singDOWN = 'dodgeDOWN',
    singUP = 'dodgeUP',
    singRIGHT = 'dodgeRIGHT'
}

function playerOneSing(a, b, c, d)
    if c == "Sword VIP" or c == "Punch VIP" or c == "VC Bullet VIP" then
        playCharacterAnimation('bfCharacter1', "dodge", true)
        setCharacterPreventDanceForAnim('bfCharacter1', true)
        local anim = dodgeMap[b] 
        if anim then
            playCharacterAnimation('bfCharacter0', anim, true)
            setCharacterPreventDanceForAnim('bfCharacter0', true)
        end
    end
end
function ramdomtexto(cantidad)
    local texto = ""
    local i = 1
    while i <= cantidad do
        local separacion = math.random(1, 5) 
        for j = 1, separacion do
            if i > cantidad then break end
            local letra = string.char(math.random(65, 90)) 
            texto = texto .. letra
            i = i + 1
        end
        if i <= cantidad then
            texto = texto .. " "
        end
    end

    return texto
end

local textos = {
    {'textoRandom',ramdomtexto(100),1500, 225, 300,"hud","white"},
    {'textoRandom2',ramdomtexto(100),1500, 225, 300,"hud","white"},
    {'u','u', 500, -1200, 500,"game","black"},
    {'un','un', 200, 800, 200,"other","white"},
    {'do','do', 900, 800, 200,"other","white"},
    {'un2','un', -200, 1200, 500,"game","black"},
    {'do2','do', 800, 1200, 500,"game","black"},
    {'c','c', -100, 225, 350,"other","white"},-- -100
    {'u2','u', 100, 225, 350,"other","white"},--100
    {'a','a', 400, 225, 350,"other","white"},--400
    {'t','t', 800, 225, 350,"other","white"},--800
    {'r','r', 1000, 225, 350,"other","white"},--1000
    {'o','o', 1300, 225, 350,"other","white"},--1300
    {'bring','bring', 200, 600, 100,"other","white"},-- -100
    {'in','in', 600, 600, 100,"other","white"},--100
    {'the','the', 1000, 600, 100,"other","white"},--400
    {'bring2','bring', 200, 50, 100,"other","white"},-- -100
    {'in2','in', 600, 50, 100,"other","white"},--100
}
local qlol = '#000000'
local lastColor = qlol
local downscroll = 1
function createPost()
    makeCamera("other")
    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
       if downscrollBool then
        downscroll = -1
    end
    setActorLayer('bfCharacter1',5)
    for _, sprite in ipairs(sprites) do
        makeSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorLayer(sprite[1], layershit)
        if sprite[1] == "finish" then 
            setActorAlpha(0,sprite[1])
        end
    end
    makeAnimatedSprite('trollmatt', 'REJECTED VIP/Matt_RejectedVip', 800,-100)
    addActorAnimation('trollmatt', 'idle', 'idle', 32, true)
    playActorAnimation('trollmatt', 'idle', true)
        setActorScale(0.85, 'trollmatt')
        set('trollmatt.alpha',0)
     setObjectCamera("trollmatt", 'other')
    
    for _, text in ipairs(textos) do
        makeText(text[1], text[2], text[3], text[4], text[5])
        setCamera(text[1], text[6])
        setActorScroll(0, 0,text[1])
        setActorFont(text[1], "dumbnerd.ttf")
        setActorTextColor(text[1], text[7])
        if text[1] == 'c' or text[1] == 'u2' or text[1] == 'a' or text[1] == 't' or text[1] == 'r' or text[1] == 'o'
        or text[1] == 'bring'or text[1] == 'in' or text[1] == 'the' or text[1] == 'bring2' or text[1] == 'in2' then
            setActorAlpha(0, text[1])
        else
            setActorAlpha(1, text[1])
        end
        if text[1] == "textoRandom" or text[1] == "textoRandom2" then
            setActorLayer(text[1], layershit)
        end
    end

    makeSprite("starbust", "starbust", 0, 0, 1.66)
    actorScreenCenter('starbust')
    setActorScroll(0, 0, 'starbust')
    makeSprite('blackBG', '', 0, 0, 1)
        makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), qlol)
        actorScreenCenter('blackBG')
        setActorScroll(0, 0, 'blackBG')
        setActorAlpha(0, 'blackBG')
        setActorLayer('blackBG', getActorLayer('girlfriend'))

    local shaders = { -- mejor forma para reducir qperroxd geminis lo hizo qqqq
        --{"particles", "particlesnew", {transparency = 0.87, red = 2, blue = 0, green = 1}},
       --{"fire", "fire",{strength = 0}},
      -- {"policia", "PopoEffect", {strength = 0.5, spinspeed = 1 }},
        {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"mirror2", "PincushNewEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"mirror4", "PincushNewEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"blur", "zoomblur", {focusPower = 0, posY = -3}},
        {"zoomblur", "zoomblur", {focusPower = 0, posY = 0}},
        {"bars2", "bars", {effect = 0,angle1 = 0}},
        {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"mirrorHUD", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0}},
        {"color", "ColorOverrideEffect", {red = 1 ,blue = 1 , green = 1}},
        {"disco", "DiscoOverride", {brightness = 1 ,enableRainbow = 0}},-- 1.3 b ,S 2 g
        {"greyscale", "GreyscaleEffect", {strength = 1.0}},
        {"ca", "ChromAbEffect", {strength = 0.002}},
        {"distorcion", "DistortionEffect", {size = 0}},
        {"wiggle", "wiggle", {uSpeed = 5.2, uFrequency = 4, uWaveAmplitude = 0}},
        {"Glitchy", "Glitchy", {AMT = 0, SPEED = 0.3}},
        {"scanline", "ScanlineEffect", {strength = 0.1, pixelsBetweenEachLine = 5}},
        {"pixel", "MosaicEffect", {strength = 0}},
        {"fish", "EyeFishEffect", {power = 0}},
        {"bars", "bars", {effect = 0}},
        {"vignette", "VignetteEffect", {strength = 15, size = 0.8}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = 0}}
    }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)

        if name ~= "mirror3" and name ~= "mirror2" 
        and name ~= "zoomblur" and name ~= "mirror" 
        and name ~= "bars2" and name ~= "disco" 
        and name ~= "pixel" and name ~= "bloom"
        and name ~= "color" then
            setCameraShader('hud', name)
        end
    
        if name == "mirror" or name == "pixel"
        or name == "Glitchy" or name == "fish"
        or name == "color" or name == "bump"
        or name == "greyscale" or name == "bloom" then
        setCameraShader('other', name)
        end
    
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
    set("bfCharacter1.alpha",0)
    set("camHUD.zoom", 2)
    set("camHUD.alpha", 0.1)
    setCamZoom(0.7)
    setProperty('', 'cameraSpeed', 3)
    for i = 0, 3 do
        setActorProperty(i, 'alpha', 0)
        if not middlescroll then
            --setActorProperty(i, "x", _G["defaultStrum"..i.."X"] + 320)
            setActorProperty(i + 4, "x", _G["defaultStrum"..(i + 4).."X"] - 320)
        end
    end
end
function coloresmode(q,l,value1,value2,value3,value4,value5,value6,s,ease)
    if q then
        setShaderProperty("color", "red", value1)
        setShaderProperty("color", "blue", value2)
        setShaderProperty("color", "green", value3)
    end
    if l then
        tweenShader('color',"red",value4, crochet*0.001*s,ease)
        tweenShader('color',"green",value5, crochet*0.001*s,ease)
        tweenShader('color',"blue",value6, crochet*0.001*s,ease)
    end
end
local matt, bf, cam,final,pico = false, false, false,false,false
local perlinX, perlinY, time = 0, 0, 0
local perlinSpeed, perlinXRange, perlinYRange = 2, 0.075, 0.075
local zoom, angle, x, blur = 1, 0, 0, 0
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
local opacidad = angle
function update(elapsed)
    time = time + elapsed
    if qlol ~= lastColor then
        makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), qlol)
        lastColor = qlol
        actorScreenCenter('blackBG')
    end
    for _, shader in ipairs({"Glitchy","wiggle","distorcion","disco"}) do
        setCustomShaderFloat(shader, "iTime", time)
    end
    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.002)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end

    if cam then
        set("camFollow.x", 1640)
        set("camFollow.y", 1770)
    elseif matt then
        set("camFollow.x", get("dad.x") + 370)
        set("camFollow.y", get("dad.y") + 370)
    elseif bf then
        set("camFollow.x", get("boyfriend.x") + 150)
        set("camFollow.y", get("boyfriend.y") + 70)
    elseif pico then
        set("camFollow.x", get("bfCharacter1.x") + 200)
        set("camFollow.y", get("bfCharacter1.y") + 150)
    elseif final then
        set("camFollow.x", 1640)
        set("camFollow.y", 650)
    end
    if curStep >= 4288 and curStep < 4416 or curStep >= 4800 and curStep < 4928 
    or curStep >= 7360 and curStep < 7424 or curStep >= 7744 and curStep < 7936
    or curStep >= 8000 and curStep < 8256 then
        set("camFollow.x",850)
        set("camFollow.y",1600)
    end
    blur = lerp(blur, 0, elapsed * 8)
        setShaderProperty('blur', 'focusPower', blur)
    if curStep < 5696 or (curStep >= 6944 and curStep < 7528) or curStep >= 7552 and curStep < 10848 then
        zoom = lerp(zoom, 1, elapsed * 8)
        setShaderProperty('bump', 'zoom', zoom)
        angle = lerp(angle, 0, elapsed * 8)
        setShaderProperty('bump', 'angle', angle)
            
       

        x = lerp(x, 0, elapsed * 8)
        y = lerp(y, 0, elapsed * 8)
        perlinX = perlinX + elapsed * math.random() * perlinSpeed
        perlinY = perlinY + elapsed * math.random() * perlinSpeed
        local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
        local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
        setShaderProperty('bump', 'x', x + perlinOffsetX)
        setShaderProperty('bump', 'y', y + perlinOffsetY)
    end
    angle1 = lerp(angle1, 0, elapsed * 8)
    setShaderProperty('mirror4', 'angle', angle1)
        
    x1 = lerp(x1, 0, elapsed * 8)
    setShaderProperty('mirror4', 'x', x1)

    barrel = lerp(barrel, 0, elapsed * 8)
    setShaderProperty('bump', 'barrel',barrel)
    if curStep >= 3264 and curStep < 3352 then
        blooms = lerp(blooms, 1, elapsed * 8)
        setShaderProperty('bloom', 'contrast', blooms)
    end

    set("trollmatt.y", getActorY("trollmatt") + math.sin(time * 2) * 0.85)
    set("trollmatt.x", getActorX("trollmatt") + math.sin(time) * math.cos(time * 2) * 0.85)

    if curStep >= 10880 and curStep < 11096 then
        x2 = lerp(x2, -50, elapsed * 8)
        angle2 = lerp(angle2, 0, elapsed * 8)
        set("trollmatt.x", x2 )
        set("trollmatt.angle", angle2)
    end


end

function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror2',value,valor)
    end
    if tween then
        tweenShader('mirror2',value2,valor2, speed*0.001*s,ease)
    end
end
function zoomblur(a, s, ease, b)
    tweenShader('zoomblur', 'focusPower', a, crochet * 0.001 * s, ease)
    
    if b ~= nil then
        setShaderProperty('zoomblur', 'posY', b)
    end
end

function st(set,tween,shader,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty(shader,value,valor)
    end
    if tween then
        tweenShader(shader,value2,valor2, speed*0.001*s,ease)
    end
end
function texto(actor,alpha,s,ease)
    tween(actor, {alpha = alpha}, 0.001)
    tween(actor, {alpha = 0}, crochet*0.001*s,ease)
end
function songStart()
    bloom(0,1,crochet,32,"cubeIn")
    --tweenShader('blur', 'strengthX', 0, crochet*0.001*56, 'linear')
    tween('camHUD',{alpha = 1}, crochet*0.001*56, 'linear')
    mirror(false,true,"","angle",0,-20,32,crochet,"cubeInOut")
end
local swap = 1
function stepHit()
    local section = math.floor(curStep/16)
    if section > 0 and section < 15 then
        if curStep % 64 == 16 then
            mirror(true,true,"x","x",-2,0,8,crochet,"cubeInOut")
            
        elseif curStep % 64 == 48 then
            st(true,true,'mirror3','y','y',-2,0,8,crochet,"cubeInOut")
           
        end
    end
    if (curStep > 512 and curStep < 1536 or curStep > 2048 and curStep < 2592) and curStep % 64 == 0 then local k = (curStep % 128 == 0) bf = not k matt = k
    end
    
    if curStep == 128 then mirror(false,true,"","angle",0,0,24,crochet,"cubeInOut") set("defaultCamZoom", 0.5) 
    elseif curStep == 232 or curStep == 248 then angle = 20 end
    if curStep == 240 then angle = -20
    elseif curStep == 248 then mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut") tweenShader('vignette', 'size', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 252 then mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut") angle = -20
    elseif curStep == 256 then cam = false  set("defaultCamZoom", 0.6) 
    elseif curStep == 512 then set("defaultCamZoom", 0.6) end     
    if (curStep >= 512 and curStep < 1536 or curStep >= 2048 and curStep < 2304
    or curStep >= 2592 and curStep < 2720) then if curStep % 8 == 0 then zoom = 0.87 end
    end
    if curStep == 992 or curStep == 1504 or curStep == 2272 or curStep == 5152 or curStep == 6944 or curStep == 7968 or curStep == 8352 or curStep == 8688 or curStep == 9024  then tween('uno-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1000 or curStep == 1512 or curStep == 2280 or curStep == 5160 or curStep == 6952 or curStep == 7976 or curStep == 8360 or curStep == 8696 or curStep == 9032 then tween('dos-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut') tween('uno-god',{x = -3000}, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 1008 or curStep == 2288 or curStep == 6960 or curStep == 8368 or curStep == 9040 then tween('tres-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut') tween('dos-god',{x = 3000}, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 1016 or curStep == 2296 or curStep == 6968 or curStep == 8376 or curStep == 8568 or curStep == 8352 or curStep == 9048 then tween('cuatro-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut') tween('tres-god',{x = -3000}, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 1024 or curStep == 2304 or curStep == 6976 or curStep == 8384 or curStep == 8576 or  curStep == 8704 or curStep == 9056 then tween('cuatro-god',{x = 3000}, stepCrochet*0.001*8, 'cubeInOut')end
    if curStep == 1520 or curStep == 5168 or curStep == 7984 or curStep == 8704 then tween('dos-god',{x = 3000}, stepCrochet*0.001*8, 'cubeInOut')
    end
    if curStep == 1152 then bloom(4,1,crochet,4,"cubeOut") setShaderProperty('mirror', 'y', -1) tweenShader('mirror', 'y', 0, crochet*0.001*4, 'cubeOut')
    end
    if (curStep >= 1152 and curStep < 1152+24) then if curStep % 8 == 0 then  mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn") elseif curStep % 8 == 4 then  mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut") end
    end
    if curStep == 2048 or curStep == 3104 or curStep == 3904 then hud(1, crochet, 8, 'cubeOut')
    end
    if (curStep >= 2560 and curStep <= 2586 and (curStep - 2560) % 4 == 0) then
        local direction = ((curStep - 2560) % 8 == 0) and -0.15 or 0.15
        st(true,true,'mirror3','x','x',direction,0,1,crochet,"cubeOut")
    end

    if (curStep >= 2816 and curStep < 3104) then
        local flip = ((math.floor((curStep - 2816) / 32) % 2) == 0) and 1 or -1
        if curStep % 16 == 0 then
            angle = 15 * flip
            x = -0.1
        elseif curStep % 16 == 8 then
            angle = -15 * flip
            x = 0.1
        end
    end
    if curStep == 3272 or curStep == 3284 or curStep == 3292 or curStep == 3296 or curStep == 3344 then
        angle = 15 
         x = -0.1
         blooms = 3
    elseif curStep == 3280 or curStep == 3288 or curStep == 3294 or curStep == 3328 then
        angle = -15 
        x = 0.1
        blooms = 3
    end
    if curStep == 3328 then
        mirror(false, true, "", "zoom", 0, 2.5, 2, crochet, "cubeOut")
        tweenShader('fish', 'power', 0.2, crochet * 0.002, 'cubeOut')
        tweenShader('mirror3', 'y', 3, crochet * 0.008, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 3352 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeIn")
        tweenShader('fish', 'power', 0, crochet * 0.002, 'cubeIn')
    end
    if curStep == 2560 or curStep == 3360 or curStep == 4160 then hud(0, crochet, 8, 'cubeOut')end--invalidad
    if curStep == 2592 then
        tweenShader('fish', 'power', 0.2, crochet * 0.004, 'cubeOut')
        tweenShader('wiggle', 'uWaveAmplitude', 0.02, crochet * 0.002, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet * 0.001 * 512) .. ',0.012')
    elseif curStep == 2672 then
        tweenShader('mirrorHUD', 'angle', 0,crochet*0.004, 'cubeOut')
        tweenShader('mirrorHUD', 'x', 0, crochet*0.004, 'cubeOut')
        tweenShader('mirror3', 'y', 3, crochet*0.004, 'cubeIn')
    elseif curStep == 2704 then
        tweenShader('mirror3', 'y', 2, crochet*0.004, 'cubeIn')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 2712 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")    
    elseif curStep == 2800 then  
        tweenShader('mirror3', 'y', 3, crochet*0.004, 'cubeIn')
    elseif curStep == 2816 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        tweenShader('mirrorHUD', 'zoom', 2,crochet*0.002, 'cubeOut')
        tweenShader('greyscale', 'strength', 1,crochet*0.001, 'cubeOut')
        zoomblur(5,4,"cubeOut",0)
    elseif curStep == 2840 then
        tweenShader('mirrorHUD', 'zoom', 1,crochet*0.002, 'cubeIn')
        tweenShader('mirror3', 'y', 2, crochet*0.002, 'cubeIn')
    elseif curStep == 2848 then
        setShaderProperty('Glitchy', 'AMT', 0)
        zoomblur(0,2,"cubeOut",0)
        bf = true
        matt = false
    elseif curStep == 2960 then
        tweenShader('mirrorHUD', 'zoom', 2.5,crochet*0.002, 'cubeOut')
    elseif curStep == 2968 then
        tweenShader('mirrorHUD', 'zoom', 1,crochet*0.002, 'cubeIn')
    elseif curStep == 3072 then
        tweenShader('mirrorHUD', 'zoom', 2,crochet*0.002, 'cubeOut')
        zoomblur(5,4,"cubeOut",0)
    elseif curStep == 3088 then
        tweenShader('mirrorHUD', 'zoom', 1,crochet*0.004, 'cubeIn')
        zoomblur(2,4,"cubeIn",10)
    elseif curStep == 3104 then
      zoom , perlinCaRange , bf = 0.8 ,0 ,false
      tweenShader('fish', 'power', 0, crochet * 0.004, 'cubeOut')
      tweenShader('wiggle', 'uWaveAmplitude', 0, crochet * 0.002, 'cubeOut')
        zoomblur(0,2,"cubeOut",10)
        bloom(4, 1, crochet, 4, "cubeOut")
        set("blackBG.alpha", 0)
        set("defaultCamZoom", 0.6)
        setShaderProperty('greyscale', 'strength', 0.0)
    end
    if curStep >= 2976 and curStep < 3104 then
        if curStep % 16 == 0 then 
           st(true,true,'mirror3','x','x',0,2,3,crochet,"cubeInOut")
        end
    end

    if curStep >= 2592 and curStep < 3104 then
        local a = curStep % 32
        if curStep >= 2704 and curStep < 2848 and a == 8 then
            st(true, true, 'mirror3', 'x', 'x', 0, 2, 3, crochet, "cubeInOut")
        end
    
        if (curStep >= 2720 and curStep < 2816) or (curStep >= 2976 and curStep < 3072) then
            local zoomValue = (curStep % 8 == 0) and 1.35 or (curStep % 8 == 4) and 0.87
            if zoomValue then
                tweenShader('mirrorHUD', 'zoom', zoomValue, crochet * 0.001, (zoomValue == 1.35) and 'cubeOut' or 'cubeIn')
                if zoomValue == 1.35 then
                    zoomblur(0, 1, "cubeOut", 10)
                    st(true, true, 'zoomblur', 'focusPower', 'focusPower', 2, 0, 1, crochet, "cubeOut")
                end
            end
            if curStep % 8 == 0 then zoom = 0.8 end
        end
        if curStep < 2720 and curStep % 16 == 0 then
            local hudZoom = (curStep % 32 == 0) and 1 or 1.2
            tween("camHUD", {zoom = hudZoom}, stepCrochet * 0.008, (curStep % 32 == 0) and 'cubeOut' or 'cubeIn')
        end
        if curStep < 2672 and (a == 0 or a == 16) then
            local angle, xPos = (a == 0) and 15 or -15, (a == 0) and 0.12 or -0.12
            tweenShader('mirrorHUD', 'angle', angle, stepCrochet * 0.016, 'cubeOut')
            tweenShader('mirrorHUD', 'x', xPos, stepCrochet * 0.016, 'cubeOut')
        end
        if a % 8 == 0 then
            local xValue = (a >= 16) and 0.1 or -0.1
            setShaderProperty('mirror3', 'x', xValue)
            tweenShader('mirror3', 'x', 0, crochet * 0.001, 'cubeOut')
            if a == 16 then
                tweenShader('greyscale', 'strength', 1.0, stepCrochet * 0.0155, 'cubeIn')
            end
        end
        if a == 0 then
            bloom(4, 1, crochet, 4, "cubeOut")
            set("blackBG.alpha", 0)
            tween("blackBG", {alpha = 0.8}, crochet * 0.0075, 'cubeIn')
            setShaderProperty('greyscale', 'strength', 0.0)
        end
    end
    
    if curStep == 4416 or curStep == 4576 or curStep == 6208 or curStep == 6976 or curStep == 7104 or curStep == 7232
    or curStep == 7584 or curStep == 7616 or curStep == 8352 or curStep == 8416 or curStep == 8640 then
        bf = false
        matt = true
    elseif curStep == 4544 or curStep == 4608 or curStep == 5952 or curStep == 7040 or curStep == 7168 or curStep == 7296
    or curStep == 7552 or curStep == 7600 or curStep == 7680 or curStep == 7936 or curStep == 8384 or curStep == 8576 or curStep == 8704 then
        bf = true
        matt = false
    elseif curStep == 6464 then
    end

    --rev
    if curStep == 4416 or curStep == 4424 then
        angle = 15 
         x = -0.1
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
         setShaderProperty('distorcion', 'size', 0.008)
    elseif curStep == 4420 then
        angle = -15 
        x = 0.1
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    end
    if curStep == 4424 then
        st(true,true,"mirror3","x","x",20,0,8,crochet,"cubeInOut")
        zoomblur(2,2,"cubeIn",10)
    elseif curStep == 4432 then
        bloom(4, 1, crochet, 4, "cubeOut")
        zoomblur(0,4,"cubeOut",10)
        tween("blackBG", {alpha = 0.8}, crochet * 0.004, 'cubeIn')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,4,crochet,"cubeIn")
        setShaderProperty('greyscale', 'strength', 1)
        setShaderProperty('Glitchy', 'AMT', 0.15) 
    --    tweenShader('mirror3', 'x', 20, stepCrochet * 0.016, 'cubeOut')
    elseif curStep == 4440 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 4448 then
        tween("blackBG", {alpha = 0}, crochet * 0.001, 'cubeOut')
        mirror(true,true,"y","y",0,-2,3,crochet,"cubeInOut")
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0.5)
    elseif curStep == 4456 then
        mirror(true,true,"x","x",0,2,3,crochet,"expoInOut")
        angle = 15 
        x = -0.1
    elseif curStep == 4464 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        st(true,true,'mirror3','y','y',-2,0,2,crochet,"cubeIn")
        tweenShader('greyscale', 'strength', 1, stepCrochet * 0.008, 'cubeIn')
        tweenShader('fish', 'power', 0, stepCrochet * 0.008, 'cubeIn')
        zoomblur(2,2,"cubeIn",10)
    elseif curStep == 4468 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 4472 then
        zoomblur(0,2,"cubeOut",0)
        tween("blackBG", {alpha = 0.5}, crochet * 0.002, 'cubeOut')
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    elseif curStep == 4476 then
        bloom(1, 0, crochet, 1, "cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 4480 then
        bloom(0, 1, crochet, 2, "cubeOut")
        zoom = 0.8
        setShaderProperty('Glitchy', 'AMT', 0.05) 
    elseif curStep == 4488 then
        st(true,true,'zoomblur','focusPower','focusPower',5,0,2,crochet,"cubeOut")
        mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
    elseif curStep == 4500 then
        st(true,true,'zoomblur','focusPower','focusPower',5,0,2,crochet,"cubeOut")
        mirror(false,true,"","y",0,2,2,crochet,"cubeOut")
    elseif curStep == 4512 or curStep == 4608 then
        tweenShader('mirrorHUD','zoom',2.5,crochet*0.002,'cubeOut')
        tweenShader('fish','power',0.2,crochet*0.002,'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0.2) 
        triggerEvent('screen shake', (stepCrochet*0.016)..',0.01')
        tween("blackBG", {alpha = 0.8}, crochet * 0.004, 'cubeOut')
        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeOut')
    elseif curStep == 4520 then
        tweenShader('mirrorHUD','zoom',1,crochet*0.002,'cubeIn')
    elseif curStep == 4528 then
        tweenShader('zoomblur','focusPower',0,crochet*0.001,'cubeOut')
        mirror(false,true,"","y",0,3,4,crochet,"cubeIn")
        tween("blackBG", {alpha = 0}, crochet * 0.001, 'cubeOut')
    elseif curStep == 4544 then
        st(true,true,'zoomblur','focusPower','focusPower',5,2,8,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        tween("blackBG", {alpha = 0.8}, crochet * 0.004, 'cubeIn')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 4568 then
        tweenShader('mirror3', 'y', 1, stepCrochet * 0.008, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 4592 or curStep == 4600 then
        st(true,true,'greyscale','strength','strength',0,1,2,crochet,"cubeIn")
        bloom(3, 1, crochet, 2, "cubeOut")
    end
    if curStep == 4600 then
        mirror(false,true,"","y",0,4,2,crochet,"cubeIn")
    elseif curStep == 4632 then
        tweenShader('mirror3', 'y', 0, stepCrochet * 0.008, 'cubeIn')
        tweenShader('mirrorHUD','zoom',1,crochet*0.002,'cubeIn')
    elseif curStep == 4640 then
        bloom(2, 1, crochet, 4, "cubeOut")
    elseif curStep == 4656 then
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tween("blackBG", {alpha = 0}, crochet * 0.004, 'cubeIn')
        mirror(false,true,"","angle",0,-180,4,crochet,"cubeIn")
        tweenShader('zoomblur','focusPower',0,crochet*0.002,'cubeOut')
    elseif curStep == 4664 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        zoomblur(2,2,"cubeIn",10)
    elseif curStep == 4672 then
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenShader('greyscale', 'strength', 0, stepCrochet * 0.001, 'cubeOut')
        zoomblur(0,2,"cubeOut",10)
        setShaderProperty('distorcion', 'size', 0)
    end
    if curStep == 4488 or curStep == 4552 or curStep == 4616 then
        tweenActorProperty("Punch", 'y',400, stepCrochet*0.001*4, 'cubeOut')
        angle = 15 
        x = -0.1
        bloom(2, 1, crochet, 2, "cubeOut")
        st(true,true,'greyscale','strength','strength',0,1,2,crochet,"cubeOut")
    elseif curStep == 4496 or curStep == 4560 or curStep == 4624 then
        tweenActorProperty("Punch", 'y',1400, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 4500 or curStep == 4564 or curStep == 4628 then
        tweenActorProperty("Punch2", 'y',400, stepCrochet*0.001*4, 'cubeOut')
        angle = -15 
        x = 0.1
        bloom(2, 1, crochet, 2, "cubeOut")
        st(true,true,'greyscale','strength','strength',0,1,2,crochet,"cubeOut")
    elseif curStep == 4508 or curStep == 4572 or curStep == 4636 then
        tweenActorProperty("Punch2", 'y',1400, stepCrochet*0.001*8, 'cubeInOut')
    end
    if curStep == 4528 or curStep == 4536 then
        angle = 15 
        x = -0.1
        bloom(2, 1, crochet, 1, "linear")
    elseif curStep == 4532 or curStep == 4540 then
        angle = -15 
        x = 0.1
        bloom(2, 1, crochet, 1, "linear")
    end
    if (curStep >= 4480 and curStep < 4512) or (curStep >= 4544 and curStep < 4608) then
        if curStep >= 4576 and curStep < 4608 and curStep % 16 == 0 then
            angle, x = 15, -0.1
        elseif curStep >= 4576 and curStep < 4608 and curStep % 16 == 8 then
            angle, x = -15, 0.1
        end
        if curStep % 8 == 0 then
            tweenShader('mirrorHUD', 'zoom', 0.8, stepCrochet * 0.004, 'cubeIn')
        elseif curStep % 8 == 4 then
            tweenShader('mirrorHUD', 'zoom', 1, stepCrochet * 0.004, 'cubeOut')
        end
    end
    
    -----

    if curStep >= 4928 and curStep < 5040 or curStep >= 5056 and curStep < 5167 then
        if curStep % 32 == 8 then
            mirror(true,true,"y","y",-2,0,4,crochet,"cubeInOut")
        end
        if curStep >= 5056 and curStep < 5164 then
            if curStep % 32 == 12 then
                st(true,true,"mirror","x","x",-2,0,3,crochet,"cubeInOut")
            end
        end
        if curStep % 16 == 0 then
            tweenShader('Glitchy', 'AMT', 0.15, crochet * 0.001, 'cubeOut')
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            tween("blackBG", {alpha = 0}, crochet * 0.001, 'cubeOut')
            bloom(2, 1, crochet, 4, "cubeOut")
            tweenShader('greyscale', 'strength', 0, stepCrochet * 0.008, 'cubeOut')
           -- tweenShader('zoomblur', 'focusPower', 0, stepCrochet * 0.004, 'cubeOut')
        elseif curStep % 16 == 8 then
           -- tweenShader('zoomblur', 'focusPower', 5, stepCrochet * 0.008, 'cubeIn')
            tweenShader('greyscale', 'strength', 1, stepCrochet * 0.008, 'cubeIn')
            mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
            tween("blackBG", {alpha = 0.8}, crochet * 0.002, 'cubeIn')
        end
    end
    if curStep == 5040 then
        angle = 15 
        x = -0.1
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenShader('fish','power',0.5,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD', 'zoom', 2.5, stepCrochet * 0.008, 'cubeOut')
    elseif curStep == 5044 or curStep == 5052  or curStep == 5172 then
        angle = -15 
        x = 0.1
    elseif curStep == 5048 then
        angle = 15 
        x = -0.1
        tweenShader('fish','power',0.2,crochet*0.002,'cubeIn')
        tweenShader('mirrorHUD', 'zoom', 1, stepCrochet * 0.008, 'cubeIn')
    elseif curStep == 5168 then
        angle = 15 
        x = -0.1
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 5176 then
        angle = 15 
        x = -0.1
        mirror(false,true,"","x",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
    elseif curStep == 5180 then
        angle = -15 
        x = 0.1
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
    elseif curStep == 5184 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
    end
    --dechillq
    if curStep == 5664 then
        bloom(1, 0, crochet, 7, "cubeIn")
    elseif curStep == 5696 then
        set("blackBG.alpha",1)
        set("dad.alpha",0)
        set("boyfriend.alpha",0)
        tweenShader('vignette','size',0.5,crochet*0.001,'cubeOut')
        bloom(2, 1, crochet, 4, "cubeOut")
        tweenShader('mirrorHUD','zoom',1.2,crochet*0.001,'cubeOut')
       -- tweenShader('fire','strength',0.1,crochet*0.001,'cubeOut')
        tweenShader('wiggle', 'uSpeed', 8, crochet * 0.001, 'cubeOut')
        tweenShader('wiggle', 'uWaveAmplitude', 0.02, crochet * 0.001, 'cubeOut')
    elseif curStep == 5728 or curStep == 5760 or curStep == 5792 or curStep == 5808 
    or curStep == 5824 or curStep == 5872 then
        bloom(2, 1, crochet, 4, "cubeOut")
    elseif curStep == 5888 then
        tween("boyfriend",{alpha = 1},crochet*0.016,'cubeIn')
        bloom(2, 1, crochet, 4, "cubeOut")
        tweenShader('mirrorHUD','zoom',1,crochet*0.016,'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.016,'cubeIn')
        perlinCaRange = 0.06
    elseif curStep == 5920 then
       -- tweenShader('particles','transparency',0.87,crochet*0.008,'cubeIn')
        tween("blackBG",{alpha = 0},crochet*0.008,'cubeIn')
        bloom(1, 2, crochet, 8, "cubeIn")
        tweenShader('vignette','size',0,crochet*0.008,'cubeIn')
    end
    
    if curStep == 5936 or curStep == 5968 or curStep == 6128 or curStep == 6160 then
        tweenShader('bump', 'angle', -180, crochet * 0.004, 'cubeIn')
        tweenShader('bump', 'zoom', 1, crochet * 0.004, 'cubeIn')
    elseif curStep == 5952 or curStep == 6144 then
        tweenShader('bump', 'zoom', 1.25, crochet * 0.004, 'cubeOut')
        tweenShader('bump', 'angle', -360, crochet * 0.004, 'cubeOut')
    elseif curStep >= 5984 and curStep <= 6112 then
        if curStep % 32 == 0 then
        tweenShader('bump', 'zoom', 1.25, crochet * 0.004, 'cubeOut')
        tweenShader('bump', 'angle', 0, crochet * 0.004, 'cubeOut')
        elseif curStep % 32 == 16 then
            tweenShader('bump', 'zoom', 1, crochet * 0.004, 'cubeIn')
         end
   
    end

    
    if curStep == 6000 then
        tweenShader('mirrorHUD','y',2,crochet*0.008,'expoInOut')
    elseif curStep == 6032 then
        tweenShader('mirrorHUD','y',0,crochet*0.008,'expoInOut')
    elseif curStep == 6064 then
        tweenShader('bump','x',2,crochet*0.008,'expoInOut')
    elseif curStep == 6096 then
        tweenShader('bump','x',0,crochet*0.008,'expoInOut')
    elseif curStep == 6176 then
        tweenShader('bump','angle',0,crochet*0.004,'cubeOut')
        tween("dad",{alpha = 1},crochet*0.008,'cubeIn')
        for i = 0, 7 do
            tween('defaultStrum'..i, {alpha = 0}, crochet * 0.008, 'cubeIn')
        end
        
    end

    if curStep == 6192 or curStep == 6320 then
        mirror(false,true,"","zoom",0,2,4,crochet,"expoIn")
        mirror(false,true,"","angle",0,5,4,crochet,"expoIn")
    elseif curStep == 6224 or curStep == 6288 or curStep == 6352 then
        mirror(false,true,"","zoom",0,1.25,4,crochet,"expoIn")
        mirror(false,true,"","angle",0,-5,4,crochet,"expoIn")
    elseif curStep == 6256 or curStep == 6384 then
        mirror(false,true,"","zoom",0,1,4,crochet,"expoIn")
        mirror(false,true,"","angle",0,5,4,crochet,"expoIn")
    elseif curStep == 6416 or curStep == 6672 then
        mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,4,crochet,"cubeIn")
    elseif curStep == 6432 then
        mirror(false,true,"","zoom",0,3,8,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,8,crochet,"cubeIn")
        tweenShader('bloom','brightness',-0.5,crochet*0.008,'cubeIn')
        for i = 4, 7 do
            tween('defaultStrum'..i, {alpha = 1}, crochet * 0.008, 'cubeIn')
        end
    elseif curStep == 6464 then
        bf = false
        matt = false
        mirror(false,true,"","zoom",0,1.5,4,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,4,crochet,"cubeOut")
        tweenShader('bloom','brightness',0,crochet*0.004,'cubeOut')
    elseif curStep == 6480 or curStep == 6544 or curStep == 6608 then
        mirror(false,true,"","angle",0,-5,4,crochet,"cubeIn")
    elseif curStep == 6496 or curStep == 6560 then
        mirror(false,true,"","zoom",0,1.1,4,crochet,"cubeOut")
    elseif curStep == 6512 or curStep == 6576 or curStep == 6640 then
        mirror(false,true,"","angle",0,5,4,crochet,"cubeIn")
    elseif curStep == 6528 or curStep == 6656 then
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
    elseif curStep == 6592 then
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
    elseif curStep == 6624 then
        mirror(false,true,"","zoom",0,1.2,4,crochet,"cubeOut")
    elseif curStep == 6688 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tweenShader('mirrorHUD','zoom',3.15,crochet*0.008,'quadOut')
    elseif curStep == 6704 then -- blaco
        zoomblur(0,0,"",0)
        tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn')
        tweenShader('zoomblur','focusPower',4,crochet*0.004,'cubeIn')
        tweenShader('bloom','brightness',-0.05,crochet*0.004,'cubeIn')
        qlol = '#FFFFFF'
        tween("blackBG",{alpha = 0.5},crochet*0.004,'cubeIn')
    elseif curStep == 6720 then
        tween("blackBG",{alpha = 0},crochet*0.016,'cubeOut')
        bloom(2, 1, crochet, 4, "cubeOut")
    elseif curStep == 6752 then
        tweenShader('mirrorHUD','zoom',3,crochet*0.002,'quadOut')
    elseif curStep == 6784 then
        tweenShader('mirrorHUD','zoom',0.9,crochet*0.040,'linear')
        tweenShader('greyscale','strength',0,crochet*0.048,'cubeIn')
    elseif curStep == 6912 then
        tweenShader('bloom','brightness',0,crochet*0.016,'cubeIn')
    elseif curStep == 6944 then
        tweenShader('fish','power',0.8,crochet*0.008,'cubeIn')
        tweenShader('mirrorHUD','zoom',4,crochet*0.008,'cubeIn')
        tweenShader('zoomblur','focusPower',0,crochet*0.008,'cubeIn')
        tweenShader('Glitchy','AMT',0.15,crochet*0.008,'cubeIn')
       -- tweenShader('fire', 'strength', 0, crochet*0.001*8, 'cubeIn')
    elseif curStep == 6960 then
        bloom(1, 10, crochet, 4, "cubeIn")
        tweenShader('wiggle','uWaveAmplitude',0,crochet*0.004,'cubeIn')
    elseif curStep == 6976 then
        tweenShader('Glitchy','AMT',0,crochet*0.002,'cubeOut')
        tweenShader('fish','power',0.2,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','zoom',1,crochet*0.002,'cubeOut')
        bloom(10, 1, crochet, 4, "cubeOut")
        perlinCaRange = 0
    end
    if curStep == 6944 or curStep == 6960 then
        angle = 15
        x = -0.1
    elseif curStep == 6952 or curStep == 6968 then
        angle = -15
        x = 0.1
    end
    if curStep >= 6752 and curStep < 6944 and curStep % 32 == 0 then
        bloom(2, 1, crochet, 3, "cubeOut")
    end
    if curStep >= 5952 and curStep < 6689  then
        if curStep % 32 == 0 then

            bloom(4, 1, crochet, 4, "cubeOut")
            tween("blackBG",{alpha = 0},crochet*0.001,'cubeOut')
            tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
            zoomblur(0,0,"",10)
            st(true,true,"zoomblur","focusPower","focusPower",1.5,0,2,crochet,'cubeOut')
        elseif curStep % 32 == 16 then
            tween("blackBG",{alpha = 0.7},crochet*0.004,'cubeIn')
            tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn')
        end
    end

    -- invalid 2 

    if curStep == 6980 then
        x,y,angle = 0.1,0.2,5
    elseif curStep == 6984 then
        x,angle = -0.1,-5
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShader('fish','power',0.5,crochet*0.001,'cubeOut')
        tweenShader('vignette','size',0.5,crochet*0.001,'cubeOut')
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2, 'cubeIn')
    elseif curStep == 6988 then
        x = 0.1
        tweenShader('vignette','strength',0,crochet*0.001,'cubeIn')
        tweenShader('fish','power',0.2,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 6992 then
        tweenShader('vignette','strength',15,crochet*0.001,'cubeOut')
        tweenShader('vignette','size',0,crochet*0.001,'cubeOut')
        st(true,true,"mirror3","angle","angle",15,0,1,crochet,'cubeOut')
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
    elseif curStep == 6996 then
        x = 0.1
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
    elseif curStep == 7000 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        st(true,true,"mirror3","angle","angle",-15,0,1,crochet,'cubeOut')
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 7004 then
        mirror(true,true,"y","y",0,1,1,crochet,"cubeIn")
    elseif curStep == 7008 then
        angle = -15
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*2, 'cubeOut')
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == 7012 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeIn")
        angle = -15
        tweenShader('greyscale','strength',0.5,crochet*0.001,'cubeIn')
    elseif curStep == 7016 then
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2, 'cubeIn')
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 7024 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShader('fish','power',0.5,crochet*0.002,'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.004,'cubeIn')
        tweenShader('bloom','brightness',0.5,crochet*0.004,'cubeIn')
        st(true,true,"mirror3","x","x",0,1,2,crochet,'cubeOut')
    elseif curStep == 7032 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 7040 then
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*8, 'cubeIn')
        tweenShader('bloom','brightness',0,crochet*0.002,'cubeOut')
        st(true,true,"mirror3","x","x",0,0,0.1,crochet,'cubeOut')
        tweenShader('mirrorHUD','x',-0.15,crochet*0.0025,'cubeOut')
        mirror(true,true,"y","y",1,2,0.1,crochet,"cubeOut")
        tweenShader('fish','power',0.2,crochet*0.001,'cubeOut')
        st(true,true,"zoomblur","focusPower","focusPower",4,0,4,crochet,'cubeOut')
        zoom = 0.8
        setShaderProperty('Glitchy', 'AMT', 0)
    elseif curStep == 7056 then
        bloom(4, 1, crochet, 4, "cubeOut")
        st(true,true,"zoomblur","focusPower","focusPower",4,0,4,crochet,'cubeOut')
        tweenShader('mirrorHUD','x',0.15,crochet*0.0025,'cubeOut')
        tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn')
        qlol = '#000000'
        tween("blackBG",{alpha = 0.5},crochet*0.004, 'cubeIn')
    elseif curStep == 7072 then
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenShader('mirrorHUD','x',0,crochet*0.0025,'cubeOut')
        tweenShader('fish','power',0.5,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','zoom',2.5,crochet*0.002,'cubeOut')
        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeOut')
        perlinCaRange = 0.06
    elseif curStep == 7088 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        bloom(2, 8, crochet, 4, "cubeIn")
        tweenShader('greyscale','strength',0,crochet*0.004,'cubeIn')
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
        tweenShader('zoomblur','focusPower',0,crochet*0.004,'cubeIn')
        tween("blackBG",{alpha = 0},crochet*0.004, 'cubeIn')
    elseif curStep == 7096 then
        mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
        tweenShader('fish','power',0.2,crochet*0.002,'cubeIn')
        tweenShader('mirrorHUD','zoom',0.8,crochet*0.002,'cubeIn')
        
    elseif curStep == 7104 then
        perlinCaRange = 0
        bloom(8, 1, crochet, 2, "cubeOut")

        tweenShader('mirrorHUD','zoom',1.2,crochet*0.002,'cubeOut')
        tweenShader('wiggle', 'uSpeed', 5.2, crochet * 0.002, 'cubeOut')
        tweenShader('wiggle', 'uWaveAmplitude', 0.02, crochet * 0.002, 'cubeOut')
    elseif curStep == 7116 then
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('mirrorHUD','zoom',1.5,crochet*0.001,'cubeOut')
        tweenShader('mirrorHUD','angle',-180,crochet*0.003,'cubeIn')
    elseif curStep == 7120 then
        tweenShader('mirrorHUD','zoom',1,crochet*0.002,'cubeIn')
    elseif curStep == 7128 then
        setShaderProperty('Glitchy', 'AMT', 0) 
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        tweenShader('mirrorHUD','zoom',1.5,crochet*0.001,'cubeOut')
        tweenShader('mirrorHUD','angle',-360,crochet*0.002,'cubeOut')
    elseif curStep == 7132 then
        tweenShader('mirrorHUD','zoom',1,crochet*0.001,'cubeIn')
        tweenShader('fish','power',0.5,crochet*0.001,'cubeIn')
        mirror(true,true,"x","x",0,2,3,crochet,"cubeInOut")
    elseif curStep == 7136 then
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 7148 or curStep == 7312 then
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 7160 then
        setShaderProperty('Glitchy', 'AMT', 0) 
        tweenShader('fish','power',0.2,crochet*0.002,'cubeIn')
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        tweenShader('mirrorHUD','zoom',2,crochet*0.001,'cubeOut')
        st(true,true,"mirrorHUD","angle","angle",0,-15,1,crochet,'cubeOut')
        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeIn')
    elseif curStep == 7164 then
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('mirrorHUD','zoom',0.8,crochet*0.001,'cubeIn')
    elseif curStep == 7168 then
        perlinCaRange = 0.06
        tween("blackBG",{alpha = 1},crochet*0.008, 'cubeIn')
        bloom(8, 1, crochet, 4, "cubeOut")
        st(true,true,"mirrorHUD","angle","angle",15,0,2,crochet,'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        tweenShader('mirrorHUD','zoom',1.2,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','angle',0,crochet*0.002,'cubeOut')
        setActorColor('dad', 255, 255, 255)
    elseif curStep == 7176 then
        mirror(true,true,"x","x",0,2,12,crochet,"cubeInOut")
    elseif curStep == 7200 then
        perlinCaRange = 0
        tweenShader('wiggle', 'uWaveAmplitude', 0, crochet * 0.004, 'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0.2) 
        tweenShader('bars','effect',0.2,crochet*0.008,'cubeIn')
        tweenShader('greyscale','strength',1,crochet*0.008,'cubeIn')
        tweenShader('mirrorHUD','angle',-180,crochet*0.008,'cubeIn')
    elseif curStep == 7216 then
        tween("blackBG",{alpha = 0},crochet*0.004, 'cubeIn')
        tweenShader('mirrorHUD','zoom',10,crochet*0.004,'cubeIn')
    elseif curStep == 7232 then
        bloom(4, 1, crochet, 4, "cubeOut")
        setActorColor('dad', 0, 0, 0)
        perlinCaRange = 0.06
        tweenShader('zoomblur','focusPower',0,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','zoom',1.5,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','angle',-360,crochet*0.002,'cubeOut')
    end
    if curStep == 7236 then
        mirror(true,true,"x","x",0,-1,1,crochet,"cubeIn")
    elseif curStep == 7244 then
        mirror(true,true,"y","y",0,1,1,crochet,"cubeIn")
    elseif curStep == 7252 then
        mirror(true,true,"x","x",-1,-2,1,crochet,"cubeIn")
    elseif curStep == 7260 then
        mirror(true,true,"y","y",1,2,1,crochet,"cubeIn")
    elseif curStep == 7264 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*2, 'cubeOut')
    elseif curStep == 7272 then
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
    elseif curStep == 7280 then
        angle = 25
        tween("Punch", {y = 400},crochet*0.001*1, 'expoOut')
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == 7284 or curStep == 7296 then
        tween("Punch", {y = 1400} , stepCrochet*0.004, 'cubeInOut')
    elseif curStep == 7286 then
        angle = -25
        tween("Punch2", {y = 400},crochet*0.001*1, 'expoOut')
    elseif curStep == 7292 then
        angle = 25
        tween("Punch", {y = 400},crochet*0.001*1, 'expoOut')
    elseif curStep == 7290 then
        tween("Punch2", {y = 1400} , stepCrochet*0.004, 'cubeInOut')
    end
    if curStep == 7296 then
        st(true,true,"mirror3","x","x",0,3,8,crochet,'cubeInOut')
        tween("blackBG",{alpha = 1},crochet*0.004, 'cubeIn')
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
        tweenShader('mirrorHUD','zoom',1,crochet*0.002,'cubeOut')
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut')
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeOut')
    elseif curStep == 7312 then
        mirror(true,true,"angle","angle",0,-200,4,crochet,"cubeIn")
    elseif curStep == 7328 then
        perlinCaRange = 0.06
        bloom(2, 1, crochet, 4, "cubeOut")
        set("blackBG.alpha",0)
        tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn')
        tween("blackBG",{alpha = 1},crochet*0.004, 'cubeIn')
        st(true,true,"mirror3","x","x",3,0,8,crochet,'cubeInOut')
        mirror(false,true,"","angle",0,-180,4,crochet,"cubeOut")
        tweenShader('Glitchy','AMT',0.15,crochet*0.008,'cubeIn')
        removeCameraShader("hud","bars")
    elseif curStep == 7344 then
      
        tween("blackBG",{alpha = 0},crochet*0.004, 'cubeIn')
        tweenShader('bars','effect',0.2,crochet*0.004,'cubeIn')
        mirror(false,true,"","angle",0,-380,4,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
       -- tween("blanco",{alpha = 0.5},crochet*0.004, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*4, 'cubeOut')
    elseif curStep == 7352 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 7360 then
        bf = false
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenShader('zoomblur','focusPower',0,crochet*0.001,'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
       -- tween("blanco",{alpha = 0},crochet*0.002, 'cubeOut')
    end
    if curStep == 7368 then
        st(true,true,"mirror3","y","y",0,2,4,crochet,'cubeInOut')
        tween("dad", {y = getActorY("dad")+800}, crochet * 0.002, "cubeIn")
        tween("blackBG",{alpha = 1},crochet*0.002, 'cubeIn')
    elseif curStep == 7376 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        setActorColor('dad', 255, 255, 255)
        tween("dad", {y = getActorY("dad")-800}, crochet * 0.002, "cubeOut")
        tweenShader('bars', 'effect', 0.1, crochet * 0.004, 'cubeOut')
    elseif curStep == 7384 or curStep == 7400 or curStep == 7888 then
        local qperroxd = (curStep == 7888) and 4 or 2
        tween("dad", {y = getActorY("dad")+800}, crochet * 0.001*qperroxd, "cubeIn")
    end
    if curStep == 7384 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeIn")
        st(true,true,"mirror3","y","y",2,1.5,4,crochet,'cubeInOut')
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
    elseif curStep == 7392 then
        tween("dad", {y = getActorY("dad")-1300}, crochet * 0.002, "cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","x",0,0.5,0.1,crochet,"cubeOut")
    elseif curStep == 7400 then
        st(true,true,"mirror3","y","y",1.5,2,4,crochet,'cubeInOut')
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeIn')
    elseif curStep == 7408 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","x",0,0,0.1,crochet,"cubeOut")
        tween("dad", {y = getActorY("dad")-300}, crochet * 0.002, "cubeOut")
    elseif curStep == 7416 then
        zoom = 0.5
        tweenShader('bars','effect',0,crochet*0.002,'linear')
    end
    if curStep == 7424 then
        posiciones("game")
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(8, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-15,4,crochet,"cubeOut")
        tweenShader('fish','power',0,crochet*0.001,'cubeOut')
        set("blackBG.alpha",0)
        st(true,true,"mirror3","y","y",0,1,0.01,crochet,'cubeOut')
        st(true, true, "greyscale", "strength", "strength", 1, 0, 8, crochet, 'cubeIn')
        tween("blackBG",{alpha = 0.9},crochet*0.007, 'cubeIn')
    elseif curStep == 7440 or curStep == 7472 then
        local zoomValue = (curStep == 7472) and 1.5 or 1
        mirror(false, true, "", "zoom", 0, zoomValue, 4, crochet, "cubeIn")
        tweenShader("mirror3", "y", 0, crochet * 0.004, "cubeIn")
        mirror(false, true, "", "angle", 0, 0, 4, crochet, "cubeIn")
        tweenShader("fish", "power", 0, crochet * 0.004, "cubeIn")
    elseif curStep == 7456 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,4,crochet,"cubeOut")
        set("blackBG.alpha",0)
        tweenShader('fish','power',0.4,crochet*0.004,'cubeOut')
        tweenShader('bars','effect',0.2,crochet*0.007,'cubeIn')
        st(true, true, "greyscale", "strength", "strength", 1, 0, 8, crochet, 'cubeIn')
        tween("blackBG",{alpha = 0.9},crochet*0.007, 'cubeIn')
    end
    if curStep == 7488 then
        set("blackBG.alpha",0)
        tween("blackBG",{alpha = 1},crochet*0.0017, 'cubeIn')
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0) 
        setActorColor('dad', 0, 0, 0)
        matt = true
    elseif curStep == 7496 then
        set("blackBG.alpha",0)
        bloom(4, 0, crochet, 2, "cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 7504 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut')
        angle = -15
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2, 'cubeIn')
        x = 0.1
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 7512 then
        angle = 15
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2, 'cubeIn')
        x = -0.1
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 7520 then
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(4, 1, crochet, 2, "cubeOut")
        setCameraShader("hud","bars")
        tween("blackBG",{alpha = 1},crochet*0.0027, 'cubeIn')
        mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,380,3,crochet,"cubeIn")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2.7, 'cubeIn')
    elseif curStep == 7532 then
        setActorColor('dad', 255, 255, 255)
        set("blackBG.alpha",0)
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('bump','zoom',2,crochet*0.002,'cubeOut')
        tweenShader('bars','effect',0.25,crochet*0.002,'cubeOut')
        mirror(false,true,"","angle",0,360,4,crochet,"cubeOut")
    elseif curStep == 7536 then
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1.7, 'cubeIn')
        tween("blackBG",{alpha = 1},crochet*0.0017, 'cubeIn')
        tweenShader('mirrorHUD','x',-0.25,crochet*0.002,'cubeIn')
    elseif curStep == 7544 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        setActorColor('dad', 255, 255, 255)
        set("blackBG.alpha",0)
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('mirrorHUD','x',0,crochet*0.002,'cubeOut')
        tweenShader('bump','zoom',1.5,crochet*0.002,'cubeOut')
        tweenShader('bars','effect',0.2,crochet*0.002,'cubeOut')
    elseif curStep == 7552 then
        angle,x = -15,0.1
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(2, 1, crochet, 2, "cubeOut")
        tweenShader('zoomblur','focusPower',5,crochet*0.001,'cubeOut')
        st(true, true, "greyscale", "strength", "strength", 0, 1, 2, crochet, 'cubeIn')
        tweenShader('bump','zoom',1,crochet*0.002,'cubeOut')
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut')
    elseif curStep == 7560 then
        angle,x = 15,-0.1
        bloom(2, 1, crochet, 2, "cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 1, 2, crochet, 'cubeIn')
    elseif curStep == 7568 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('bars2','effect',0.27,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShader('mirror','angle',10,crochet*0.002,'cubeOut')
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        tweenShader('zoomblur','focusPower',0,crochet*0.002,'cubeOut')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*3.7, 'cubeIn')
        tween("blackBG",{alpha = 1},crochet*0.0037, 'cubeIn')
    elseif curStep == 7576 then
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeIn')
        tweenShader('mirror','angle',-10,crochet*0.002,'cubeIn')
    elseif curStep == 7584 then
        setShaderProperty('Glitchy', 'AMT', 0) 
        tweenShader('mirror','x',1,crochet*0.002,'cubeOut')
        bloom(4, 1, crochet, 3, "cubeOut")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2.7, 'cubeIn')
        set("blackBG.alpha",0)
        tween("blackBG",{alpha = 1},crochet*0.0027, 'cubeIn')
    elseif curStep == 7596 then
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2.7, 'cubeIn')
        set("blackBG.alpha",0)
        tween("blackBG",{alpha = 1},crochet*0.0027, 'cubeIn')
        tweenShader('mirror','angle',10,crochet*0.002,'cubeOut')
        tweenShader('mirror','x',2,crochet*0.002,'cubeOut')
        bloom(4, 1, crochet, 3, "cubeOut")
    elseif curStep == 7608 then
        bloom(4, 1, crochet, 3, "cubeOut")
        tweenShader('bars2','effect',0.2,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        set("blackBG.alpha",0)
        tween("blackBG",{alpha = 1},crochet*0.002, 'cubeIn')
    elseif curStep == 7612 then
        tweenShader('mirror','x',0,crochet*0.003,'cubeInOut')
    elseif curStep == 7616 then
        perlinCaRange = 0
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.002, 'cubeOut')
        tween("blackBG",{alpha = 0},crochet*0.002, 'cubeOut')
        tweenShader('mirror','angle',0,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('fish','power',0,crochet*0.002,'cubeOut')
    elseif curStep == 7624 then
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.27,crochet*0.002,'cubeOut')
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
    elseif curStep == 7628 then
        st(true,true,"mirror","y","y",-2,0,3,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
    elseif curStep == 7632 then
        tweenShader('bars2','effect',0.2,crochet*0.002,'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('mirror','angle',-25,crochet*0.002,'cubeOut')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
    end
    if curStep == 7640 or curStep == 7704 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeIn")
        tweenShader('bars2', 'effect', 0, crochet * 0.002, 'cubeIn')
        tweenShader('mirror', 'angle', 25, crochet * 0.002, 'cubeIn')
        tweenShader('fish', 'power', 0, crochet * 0.002, 'cubeIn')
    end
    if curStep == 7640 then
        tween("blackBG", {alpha = 0.8}, crochet * 0.002, 'cubeIn')
    end
    if curStep == 7648 then
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        bloom(2, 1, crochet, 2, "cubeOut")
        tween("blackBG", {alpha = 0}, crochet * 0.0001, 'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0) 
        tweenShader('mirror','angle',0,crochet*0.002,'cubeOut')
        coloresmode(true,false,0,1.4,2)
        x,angle,blur = 0.1,-15,5

    elseif curStep == 7656 then
        bloom(2, 1, crochet, 2, "cubeOut")
        x,angle,blur = -0.1,15,5
        coloresmode(true,false,0.75,3,1.3)
    elseif curStep == 7664 then
        angle,blur = -15,5
        coloresmode(true,false,1.5,0.2,1.7)
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.27,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 7668 then
        angle,blur = 15,5
        coloresmode(true,false,0.35,0.3,1.7)
    elseif curStep == 7672 then
        angle,blur = -15,5
        coloresmode(true,false,1,1,1)
        tweenShader('fish','power',0,crochet*0.002,'cubeIn')
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 7680 then
        zoom = 1.5
        setShaderProperty('Glitchy', 'AMT', 0) 
        bloom(2, 1, crochet, 4, "cubeOut")

        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeOut')
    elseif curStep == 7688 then
        tweenShader('zoomblur','focusPower',0,crochet*0.002,'cubeOut')
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.25,crochet*0.001,'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 7692 then
        tweenShader('bars2','effect',0.2,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
    elseif curStep == 7696 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('mirror','angle',-25,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 7712 then
        setShaderProperty('Glitchy', 'AMT', 0) 
        tweenShader('mirror','angle',0,crochet*0.002,'cubeOut')
        x,angle = -0.1,15
        bloom(2, 1, crochet, 2, "cubeOut")
    elseif curStep == 7720 then
        x,angle = 0.1,-15
        bloom(2, 1, crochet, 2, "cubeOut")
        perlinCaRange = 0.035
    elseif curStep == 7728 then
        setShaderProperty('Glitchy', 'AMT', 0.15) 
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.27,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 7736 then
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 7744 then
        bf = false
        setActorColor("dad",255,255,255)
        tweenShader('fish','power',0,crochet*0.002,'cubeOut')
        bloom(8, 1, crochet, 4, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0) 
        setShaderProperty('bloom', 'brightness', -0.15) 
        tweenShader('mirror3','zoom',1,crochet*0.002,'cubeOut')
    elseif curStep == 7824 then
        tweenShader('pixel','strength',25,crochet*0.012,'cubeIn')
    elseif curStep == 7840 then
        tweenShader('fish','power',0.2,crochet*0.008,'cubeIn')
        tween("blackBG", {alpha = 1}, crochet * 0.007, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.008, 'cubeIn')
    elseif curStep == 7872 then
        perlinCaRange = 0.06
        mirror(false,true,"","zoom",0,0.5,8,crochet,"cubeOut")
        set("defaultCamZoom", 0.6) 
        tween("blackBG", {alpha = 0}, crochet * 0.0001, 'cubeOut')
        setShaderProperty('distorcion', 'size', 0.005)
        setShaderProperty('disco', 'enableRainbow', 0.7)
        setShaderProperty('disco', 'brightness', 1.8)
        setShaderProperty('Glitchy', 'AMT', 0.2) 
        bloom(4, 1, crochet, 2, "cubeOut")
        setShaderProperty('bloom', 'brightness', 0) 
        tweenShader('pixel','strength',0,crochet*0.002,'cubeOut')
        setShaderProperty('greyscale', 'strength', 0) 
        tween("textoRandom", {x = -15000}, crochet * 0.001 * 8, 'linear')
        triggerEvent('screen shake', (crochet * 0.002) .. ',0.012')
    elseif curStep == 7880 or curStep == 7896 then
        tweenShader('disco','brightness',0,crochet*0.002,'cubeIn')
    elseif curStep == 7888 then
        tweenShader('disco','brightness',2,crochet*0.001,'cubeOut')
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "pixel", "strength", "strength", 100, 0, 2, crochet, 'cubeOut')
    end

    if curStep == 7904 then
        perlinCaRange,blur = 0,5
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('fish','power',0.35,crochet*0.002,'cubeOut')
        tweenShader('mirror','angle',5,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
        tween("u", {y = 150}, crochet * 0.002, 'cubeOut')
        tweenShader('disco','enableRainbow',0,crochet*0.008,'cubeOut')
        tweenShader('disco','brightness',1,crochet*0.001,'cubeOut')
        setShaderProperty('distorcion', 'size', 0)
    elseif curStep == 7908 then
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
        tweenShader('pixel','strength',5,crochet*0.001,'cubeIn')
    elseif curStep == 7912 then
        tweenShader('fish','power',0.2,crochet*0.002,'cubeOut')
        st(true, true, "mirror", "y", "y", 0, 0.5, 2, crochet, 'cubeOut')
        tweenShader('pixel','strength',0,crochet*0.008,'linear')
        tweenShader('mirror','angle',-5,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.45,crochet*0.002,'cubeOut')
        tween("un", {y = 500}, crochet * 0.001, 'cubeOut')
        tween("u", {y = -1200}, crochet * 0.002, 'cubeIn')
    elseif curStep == 7916 then
        tween("do", {y = 500}, crochet * 0.001, 'cubeOut')
    elseif curStep == 7920 then
        tween("un", {y = 800}, crochet * 0.002, 'cubeIn')
        tween("do", {y = 800}, crochet * 0.002, 'cubeIn')
        tweenShader('mirror','angle',0,crochet*0.002,'cubeIn')
        tweenShader('fish','power',0,crochet*0.002,'cubeIn')
        tweenShader('mirror','y',0,crochet*0.002,'cubeIn')
        tweenShader('bars2','effect',0.2,crochet*0.002,'cubeIn')
    elseif curStep == 7924 then
        mirror(false,true,"","x",0,0.1,2,crochet,"cubeOut")
        blur = 5
        tween("un2", {y = 150}, crochet * 0.002, 'cubeOut')
        coloresmode(false,true,0,0,0,0,0,0,3,"cubeIn")

    elseif curStep == 7928 then
        tween("do2", {y = 150}, crochet * 0.002, 'cubeOut')
        mirror(false,true,"","x",0,0,2,crochet,"cubeIn")
    elseif curStep == 7936 then
        destroy("un2")
        setShaderProperty('Glitchy', 'AMT', 0.15)
        tweenShader('Glitchy','AMT',0,crochet*0.009,'linear')
        perlinCaRange = 0.06
        destroy("do2")
        tween("blackBG", {alpha = 1}, 0.001)
        tween("blackBG", {alpha = 0.25}, crochet * 0.008, "linear")
        tweenShader('zoomblur','focusPower',5,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShader('fish','power',0.2,crochet*0.002,'cubeOut')
        coloresmode(false,true,0,0,0,1,1,1,12,"linear")
        local letras = {
            {id = "c", x = 150},
            {id = "u2", x = 300},
            {id = "a", x = 450},
            {id = "t", x = 630},
            {id = "r", x = 780},
            {id = "o", x = 950}
        }
        for i = 1, #letras do
            local letra = letras[i]
            tween(letra.id, {x = letra.x}, crochet * 0.004, 'cubeOut')
            set(letra.id .. ".alpha", 0)
            tween(letra.id, {alpha = 1}, 0.001)
            tween(letra.id, {alpha = 0}, crochet * 0.008, "cubeOut")
        end
    end
    if curStep == 7968 or curStep == 7976 then
        bloom(4, 1, crochet, 2, "cubeOut")
        local qqqq = (curStep == 7976) and 10 or -10 
        local qqqq2 = (curStep == 7976) and 0.6 or 0.8
        tweenShader('bars2','effect',0,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,qqqq2,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,qqqq,2,crochet,"cubeOut")
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0)
    elseif curStep == 7984 then
        bloom(4, 1, crochet, 4, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0.25)
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
        zoom = 0.8
        tweenShader('pixel','strength',50,crochet*0.004,'linear')
        tweenShader('fish','power',0.4,crochet*0.002,'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 7992 then
        tweenShader('zoomblur','focusPower',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tween("blackBG", {alpha = 0}, crochet * 0.002, "cubeIn")
    end
    if curStep >= 7744 and curStep < 7872  then
        if curStep % 16 == 0 then
             zoom = 0.8
             set("defaultCamZoom", 0.8) 
             blur = 5
        end
        if curStep % 32 == 0 then
            set("defaultCamZoom", 0.7) 
            bloom(4, 1, crochet, 4, "cubeOut")
        end
    end
    if curStep >= 7232 and curStep < 7264 and curStep % 8 == 0 then
        st(true, true, "zoomblur", "focusPower", "focusPower", 5, 0, 1, crochet, 'cubeOut')
        st(true, true, "greyscale", "strength", "strength", 1, 0, 2, crochet, 'cubeIn')
        zoom = 0.87
    end
    
    if curStep == 7140 or curStep == 7142 or curStep == 7148  or curStep == 7150 or curStep == 7156  or curStep == 7158  then
        x = -0.08
    elseif curStep == 7144 or curStep == 7146  or curStep == 7152  or curStep == 7154 then
        x = 0.08
    end
    if (curStep >= 7360 and curStep < 7424) or (curStep >= 7872 and curStep < 7904) or (curStep >= 8656 and curStep < 8664) or (curStep >= 8672 and curStep < 8680) then
        if curStep >= 8656 then
            if curStep % 4 == 0 then
                x = 0.05
            elseif curStep % 4 == 2 then
                x = -0.05
            end
        else
            if curStep % 8 == 0 or curStep % 8 == 2 then
                x = 0.05
            elseif curStep % 8 == 4 or curStep % 8 == 6 then
                x = -0.05
            end
        end
    end
 
    if curStep >= 7040 and curStep < 7104 or curStep >= 7176 and curStep < 7200
    or curStep >= 7264 and curStep < 7280 or curStep >= 7424 and curStep < 7488 then
        if curStep % 8 == 0 then 
            tweenShader('mirror3','zoom',1,crochet*0.001,'cubeOut')
            zoom = 0.87
        end
        if curStep % 8 == 4 then 
            tweenShader('mirror3','zoom',0.8,crochet*0.001,'cubeIn')
        end
    end


    if (curStep >= 8000 and curStep < 8128) or (curStep >= 8224 and curStep < 8256) or (curStep >= 8384 and curStep < 8448) then
        if curStep % 16 == 0 or curStep % 16 == 8 then
            y = (curStep % 16 == 0) and -0.1 or 0.1
    
            if curStep >= 8096 and curStep < 8128 then
                angle1 = (curStep % 16 == 0) and 15 or -15
                x1 = y
            end
    
            if curStep >= 8128 and curStep < 8256 then
                blur = 3
            end
        end
    end
    if curStep >= 8064 and curStep < 8096 and curStep % 8 == 0 then
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.002, 'cubeIn')
    end
    
    
    if curStep == 8000 then--paper parte peak
        setShaderProperty('disco', 'brightness', 2)
        setShaderProperty('disco', 'enableRainbow', 0.7)
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        bloom(8, 1, crochet, 2, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('pixel','strength',0,crochet*0.008,'cubeOut')
        tween("dad", {y = getActorY("dad")-800}, crochet * 0.002, "cubeOut")
        triggerEvent('screen shake', (stepCrochet* 0.512) .. ',0.015')
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeOut")
    elseif curStep == 8008 then
        angle = -15
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('fish','power',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeIn")
        tween("dad", {y = getActorY("dad")+800}, crochet * 0.002, "cubeIn")
    elseif curStep == 8016 then
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0.15)
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
        tweenShader('bars2','angle1',0.4,crochet*0.002,'cubeOut')
        tweenShader('fish','power',0.35,crochet*0.004,'cubeIn')
        tweenShader('mirror','x',-0.1,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,10,2,crochet,"cubeOut")
        tween("dad", {y = getActorY("dad")-800}, crochet * 0.002, "cubeOut")
    elseif curStep == 8024 then
        tweenShader('mirror','x',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeIn")
        mirror(true,true,"x","x",0,1,3,crochet,"cubeInOut")
    elseif curStep == 8028 or curStep == 8040 then
        tween("blackBG", {alpha = 0.5}, crochet * 0.001, "cubeIn")
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
    elseif curStep == 8032 then
        bloom(4, 1, crochet, 3, "cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShader('mirror','angle',5,crochet*0.002,'cubeOut')
        tweenShader('bars2','angle1',0,crochet*0.002,'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
    elseif curStep == 8044 then
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('mirror','angle',-10,crochet*0.002,'cubeOut')
        st(true, true, "mirror", "x", "x", 0, 1, 2, crochet, 'cubeOut')
    elseif curStep == 8056 then
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        tweenShader('fish','power',0.1,crochet*0.002,'cubeIn')
        tween("blackBG", {alpha = 0}, crochet * 0.002, "cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShader('mirror','angle',0,crochet*0.002,'cubeIn')
        tweenShader('bars2','effect',0.05,crochet*0.001,'cubeOut')
    elseif curStep == 8060 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeIn")
        tweenShader('bars2','effect',0.1,crochet*0.001,'cubeIn')
    elseif curStep == 8064 then
        bloom(8, 1, crochet, 2, "cubeOut")
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        tweenShader('mirror','x',1.25,crochet*0.001,'cubeOut')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShader('mirror','angle',10,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
    elseif curStep == 8068 then
        tweenShader('mirror','x',0.9,crochet*0.001,'cubeIn')
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
    elseif curStep == 8072 then
        blur = 5
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShader('mirror','angle',0,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.17,crochet*0.002,'cubeOut')
    elseif curStep == 8076 then
        tweenShader('mirror','x',1,crochet*0.001,'cubeIn')
    elseif curStep == 8080 then
        blur = 5
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        tweenShader('mirror','angle',-10,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.1,crochet*0.002,'cubeOut')
    elseif curStep == 8088 then
        blur = 5
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('mirror','angle',0,crochet*0.002,'cubeOut')
        tween("blackBG", {alpha = 0.7}, crochet * 0.002, "cubeIn")
        tweenShader('bars2','effect',0,crochet*0.002,'cubeOut')
    elseif curStep == 8096 then
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0.15)
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        tweenShader('bars2','effect',0.1,crochet*0.002,'cubeOut')
    elseif curStep == 8104 then
        mirror(true,true,"x","x",-1,1,3,crochet,"cubeInOut")
    elseif curStep == 8108 then
        st(true,true,"mirror3","y","y",0,-1,2,crochet,"cubeOut")
    elseif curStep == 8120 then
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        st(true,true,"mirror3","y","y",-1,0,2,crochet,"cubeOut")
        tween("blackBG", {alpha = 0}, crochet * 0.002, "cubeIn")
    elseif curStep == 8128 then
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShader('mirror','angle',-15,crochet*0.002,'cubeOut')
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('pixel','strength',15,crochet*0.002,'linear')
    elseif curStep == 8136 then
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader('mirror','angle',90,crochet*0.002,'cubeIn')
        tweenShader('disco','brightness',0,crochet*0.002,'cubeIn')
    elseif curStep == 8144 then
        tweenShader('disco','brightness',2,crochet*0.002,'cubeOut')
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShader('bars2','effect',0.4,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
        tweenShader('mirror','angle',360,crochet*0.003,'cubeOut')
        tweenShader('pixel','strength',0,crochet*0.003,'linear')
    elseif curStep == 8152 then
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tween("blackBG", {alpha = 1}, crochet * 0.002, "cubeIn")
    elseif curStep == 8160 then
        x,angle,blur = -0.1,15,5
        bloom(4, 1, crochet, 2, "cubeOut")
        setActorColor("dad",255,255,255)
        setShaderProperty('Glitchy', 'AMT', 0.15)
    elseif curStep == 8168 or curStep == 8180 then
        zoom = 0.8
        coloresmode(false,true,0,0,0,0,0,0,0.5,"cubeIn")
    elseif curStep == 8172 then
        coloresmode(false,true,0,0,0,1,1,1,2,"cubeOut")
        x,angle,blur = 0.1,-15,5
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    elseif curStep == 8184 then
        x,angle,blur = -0.1,15,5
        coloresmode(false,true,0,0,0,1,1,1,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 8188 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        x,angle,blur = 0.1,-15,5
    elseif curStep == 8192 then
        tween("blackBG", {alpha = 0.7}, crochet * 0.002, "cubeOut")
        st(true, true, "pixel", "strength", "strength", 10, 0, 4, crochet, 'cubeOut')
        st(true, true, "greyscale", "strength", "strength", 1, 0, 5.5, crochet, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-180,2,crochet,"quadOut")
    elseif curStep == 8200 then
        mirror(false,true,"","angle",0,20,4,crochet,"cubeIn")
        zoomblur(5,4,"cubeIn",-3)
    elseif curStep == 8216 then
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        zoomblur(0,2,"cubeOut",-3)
    elseif curStep == 8224 then
        setShaderProperty('Glitchy', 'AMT', 0.2)
        tweenShader('bars2','effect',0.25,crochet*0.004,'cubeOut')
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.008,'cubeIn')
    elseif curStep == 8240 then
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.002, 'cubeIn')
    elseif curStep == 8248 then
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        zoomblur(5,2,"cubeIn",0)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
    elseif curStep == 8256 then
        setShaderProperty('Glitchy', 'AMT', 0)
        bloom(4, 1, crochet, 2, "cubeOut")
        bf = true
    elseif curStep == 8352 then
        setShaderProperty('mirror', 'x', 0)
        setShaderProperty('mirror2', 'x', 0)
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "mirror", "angle", "angle", 0, -15, 2, crochet, 'cubeOut')
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
    elseif curStep == 8360 then
        tweenShader('mirror','angle',15,crochet*0.002,'cubeIn')
    elseif curStep == 8376 then
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeIn')
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeIn")
        tweenShader('mirror','angle',0,crochet*0.002,'cubeIn')
        zoomblur(0,2,"cubeIn",0)
        tweenShader('mirrorHUD', 'zoom', 1, crochet * 0.001,'cubeOut')
    elseif curStep == 8416 then
        tweenShader('fish','power',0.3,crochet*0.002,'cubeOut')
        tweenShader('mirror','zoom',2.5,crochet*0.002,'cubeOut')
    elseif curStep == 8432 then
        tweenShader('fish','power',0.1,crochet*0.004,'cubeIn')
        tweenShader('mirror','zoom',1,crochet*0.004,'cubeIn')
        
    elseif curStep == 8448 then
        blur = 5
        tween("textoRandom2", {x = -15000}, crochet * 0.001 * 16, 'linear')
        zoomblur(5,2,"cubeOut",0)
        bloom(8, 1, crochet, 4, "cubeOut")
        tweenShader('bars2','effect',0,crochet*0.004,'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0.15)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
        tweenShader('fish','power',0.3,crochet*0.004,'cubeOut')
    elseif curStep == 8472 then
        tweenShader('mirror3','zoom',0.5,crochet*0.008,'cubeOut')
        mirror(false,true,"","y",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 8480 then
        barrel = -1.5
        bloom(4, 1, crochet, 4, "cubeOut")
        blur = 5
        tweenShader('mirror3','zoom',1,crochet*0.008,'cubeIn')
    elseif curStep == 8496 then
        blur = 5
        tweenShader('bloom','brightness',0.25,crochet*0.004,'cubeIn')
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == 8512 then
        blur = 5
        posiciones("game")
        perlinCaRange = 0
        setShaderProperty('Glitchy', 'AMT', 0)
        mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
        tweenShader('fish','power',0.1,crochet*0.002,'cubeOut')
        zoomblur(0,2,"cubeOut",0)
        tweenShader('bloom','brightness',0,crochet*0.002,'cubeOut')
        bloom(8, 1, crochet, 4, "cubeOut")
        tween("blackBG", {alpha = 0}, crochet * 0.002, "cubeOut")
        setShaderProperty('disco', 'brightness', 1)
        setShaderProperty('disco', 'enableRainbow', 0)
        destroy(textos)
    end
    if (curStep >= 8256 and curStep < 8448) then
        if curStep < 8376 then
            local zoomValue = (curStep % 8 == 0) and 1 or (curStep % 8 == 4) and 0.87
            if zoomValue then
                tweenShader('mirrorHUD', 'zoom', zoomValue, crochet * 0.001, (zoomValue == 1) and 'cubeOut' or 'cubeIn')
            end
        end
        if curStep % 16 == 0 or curStep % 16 == 8 then
            if curStep >= 8352 then
                x1 = (curStep % 16 < 8) and 0.1 or -0.1
            else
                x1 = (curStep % 32 < 16) and 0.1 or -0.1
            end
        end
        if curStep >= 8352 and curStep < 8384 then
            if curStep % 16 == 0 then
                mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
            elseif curStep % 16 == 8 then
                mirror(false,true,"","y",0,1,2 ,crochet,"cubeOut")
            end
        else
            if curStep % 32 == 0 then
                mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
                tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
                bloom(4, 1, crochet, 4, "cubeOut")
            elseif curStep % 32 == 8 then
                tweenShader('greyscale','strength',1,crochet*0.006,'cubeIn')
            elseif curStep % 32 == 16 then
                mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
            end
        end
        
    end
    if curStep >= 8384 and curStep < 8448 then
        if curStep % 32 == 0 or curStep % 32 == 12 then
            texto("bring",1,2,"linear")
        elseif curStep % 32 == 4 or curStep % 32 == 16 then
            texto("in",1,2,"linear")
        elseif curStep % 32 == 8 or curStep % 32 == 20 then
            texto("the",1,2,"linear")
        elseif curStep % 32 == 24  then
            texto("bring2",1,2,"linear")
        elseif curStep % 32 == 28 then
            texto("in2",1,2,"linear")
        end
    end
    if curStep >= 8448 and curStep < 8512 then

      
		if curStep % 16 == 0 then 
			tweenShaderProperty('mirror2', 'angle', 10, crochet*0.001, 'cubeOut')
		elseif curStep % 16 == 8 then 
			tweenShaderProperty('mirror2', 'angle', -10, crochet*0.001, 'cubeOut')
		end
		if curStep % 8 == 4 then 
			tweenShaderProperty('mirror2', 'angle', 0, crochet*0.001, 'cubeIn')
		end
    end

    if curStep == 8640 then
        zoom,blur = 0.8,5
        bloom(4, 1, crochet, 4, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
        mirror(true,true,"zoom","zoom",0.6,1,2,crochet,"cubeIn")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
    elseif curStep == 8644 then
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
    elseif curStep == 8648 then
        bloom(2, 1, crochet, 2, "linear")
        angle,x,blur = 15,-0.1,5
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
        coloresmode(true,false,0.75,3,1.3)
    elseif curStep == 8652 then
        angle,x,blur = -15,0.1,5
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",1,0.6,1,crochet,"cubeIn")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
    elseif curStep == 8656 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenShader('bars2','effect',0.15,crochet*0.001,'cubeOut')
        tweenShader('fish','power',0.35,crochet*0.001,'cubeOut')
    elseif curStep == 8660 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShader('bars2','effect',0,crochet*0.001,'cubeIn')
        tweenShader('fish','power',0,crochet*0.001,'cubeIn')
    elseif curStep == 8664 then
        setShaderProperty('Glitchy', 'AMT', 0)
        bloom(4, 1, crochet, 2, "cubeOut")
        angle,x,blur = 15,-0.1,5
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
        coloresmode(true,true,1.5,0.2,1.7,1,1,1,2,"")
    elseif curStep == 8668 then
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
    elseif curStep == 8672 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        tweenShader('fish','power',0.35,crochet*0.001,'cubeOut')
    elseif curStep == 8676 then
        tweenShader('fish','power',0,crochet*0.001,'cubeIn')
    elseif curStep == 8680 then
        blur = 5
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
    elseif curStep == 8684 then
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    end
    if curStep == 8688 then
        x,blur = 0.1,5
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,0.9,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 0.7, 2, crochet, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        coloresmode(true,true,0,1.4,2,0.75,3,1.3,2,"cubeIn")
        tweenShader('fish','power',0.2,crochet*0.001,'cubeOut')
    elseif curStep == 8692 or curStep == 8700 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        tweenShader('fish','power',0,crochet*0.001,'cubeIn')
    elseif curStep == 8696 then
        x,blur = -0.1,5
        coloresmode(true,true,1.5,0.2,1.7,0,1.2,2,2,"cubeIn")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        st(true, true, "greyscale", "strength", "strength", 0, 0.7, 2, crochet, 'cubeIn')
        bloom(4, 1, crochet, 2, "cubeOut")
        mirror(false,true,"","zoom",0,0.9,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        tweenShader('fish','power',0.2,crochet*0.001,'cubeOut')
    elseif curStep == 8704 then
        zoomblur(5,2,"cubeOut",0)
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        coloresmode(true,true,1,1,1,0.75,3,1.3,2,"cubeIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 1, 2, crochet, 'cubeIn')
        mirror(false,true,"","x",0,0,3,crochet,"cubeOut")
    elseif curStep == 8720 then
        bloom(4, 1, crochet, 2, "cubeOut")
        x,blur = 0.1,5
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        st(true, true, "greyscale", "strength", "strength", 0, 0.8, 2, crochet, 'cubeIn')
    elseif curStep == 8724 or curStep == 8732 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == 8728 then
        x,blur = -0.1,5
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 0.8, 2, crochet, 'cubeIn')
        coloresmode(true,true,0,1.2,2,1.5,0.2,1.7,2,"cubeIn")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 8736 then
        x,blur = 0.1,5
        zoomblur(0,2,"cubeOut",0)
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 0.8, 2, crochet, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenShader('bars2','effect',0.15,crochet*0.001,'cubeOut')
        tweenShader('fish','power',0.35,crochet*0.001,'cubeOut')
    elseif curStep == 8744 then
        x,blur = -0.1,5
        coloresmode(true,true,0.75,3,1.3,1,1,1,2,"cubeIn")
        bloom(4, 1, crochet, 2, "cubeOut")
        st(true, true, "greyscale", "strength", "strength", 0, 1, 2, crochet, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShader('bars2','effect',0.25,crochet*0.001,'cubeOut')
    elseif curStep == 8752 then
        x = 0.1
        bloom(4, 1, crochet,4, "cubeOut")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader('bars2','effect',0.35,crochet*0.002,'cubeOut')
        setShaderProperty("Glitchy","AMT",0.15)
        triggerEvent('screen shake', (stepCrochet*0.016)..',0.012')
    elseif curStep == 8756 then
        x = -0.1
    elseif curStep == 8760 then
        zoomblur(2.5,2,"cubeIn",10)
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
        tweenShader('bars2','effect',0,crochet*0.002,'cubeIn')
        tweenShader('fish','power',0,crochet*0.002,'cubeIn')
    elseif curStep == 8768 then
        dad,bf = false,false
        setActorColor("dad",255,255,255)
        setShaderProperty("Glitchy","AMT",0)
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
    end
    if curStep == 9056 then
        matt = true
        setShaderProperty("Glitchy","AMT",0.2)
        triggerEvent('screen shake', (stepCrochet*0.256)..',0.012')
    elseif curStep == 9072 or curStep == 9328 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShader('bars2','effect',0.2,crochet*0.002,'cubeOut')
    elseif curStep == 9088 or curStep == 9120 or curStep == 9152 or curStep == 9184 or curStep == 9440 then
         tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
    elseif curStep == 9104 or curStep == 9360 then
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 9136 or curStep == 9392 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        tweenShader('bars2','effect',0.1,crochet*0.002,'cubeOut')
    elseif curStep == 9168 or curStep == 9424 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('bars2','effect',0,crochet*0.002,'cubeOut')
    elseif curStep == 9200 or curStep == 9232 or curStep == 9264 or curStep == 9296 or curStep == 9456 
    or curStep == 9488 or curStep == 9520 or curStep == 9552 then
         mirror(false,true,"","y",0,0.5,2,crochet,"cubeOut")
     elseif curStep == 9216 or curStep == 9280 or curStep == 9472 or curStep == 9536 then
         mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
         bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 9248 or curStep == 9312 or curStep == 9504 or curStep == 9568 then
         mirror(false,true,"","y",0,0,2,crochet,"cubeOut")
         bloom(4, 1, crochet, 2, "cubeOut")
    end
    if curStep == 9184 or curStep == 9440 then
        zoomblur(5,1,"cubeOut")
        coloresmode(true,false,1,1,1)
        setShaderProperty('disco', 'brightness', 2)
        setShaderProperty('disco', 'enableRainbow', 0.7)
    elseif curStep == 9312 or curStep == 9568 then
       setShaderProperty('disco', 'brightness', 1)
       zoomblur(0,1,"cubeOut")
        setShaderProperty('disco', 'enableRainbow', 0)
    elseif curStep == 9552 then
          mirror(false,true,"","zoom",0,10,4,crochet,"cubeIn")
    end
    if curStep == 9568 then
        matt,barrel = false,-2

        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
         tweenActorColor('dad',0,0,0,255,255,255,crochet*0.002, 'cubeOut')
    end
    if curStep == 9088 or curStep == 9344 then
        coloresmode(true,false,0.25,0.3,1.7)
    elseif curStep == 9120 or curStep == 9376 then
        coloresmode(true,false,0.75,3,1.3)
     elseif curStep == 9152 or curStep == 9408 then
        coloresmode(true,false,0,3,1.1)
    end
    if curStep == 9808 then -- pico part
        tween("pico", {y = 0}, crochet * 0.002, "quadOut")
        tween("bfCharacter1",{alpha = 1},crochet*0.004)
    elseif curStep == 9816 then
        tween("pico", {y = 800 , angle = 15}, crochet * 0.002, "cubeIn")
    elseif curStep == 9824 then
        hud(0, crochet, 8, 'cubeOut')
         tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeOut')
         setShaderProperty("Glitchy","AMT",0)
          tweenShader('bloom','brightness',-0.05,crochet*0.002,'cubeOut')
        perlinCaRange = 0.06
        flashCamera("hud","",crochet*0.002)
        setShaderProperty('distorcion', 'size', 0.008)
         tweenShader('greyscale','strength',0.5,crochet*0.002,'cubeOut')
        setShaderProperty('mirror', 'x', 1)
        pico,matt,cam = true,false,false
    elseif curStep == 9832 or curStep == 9864 or curStep == 9896 or curStep == 9928 or curStep == 9960
    or curStep == 9992 or curStep == 10024 or curStep == 10084 or curStep == 10120 or curStep == 10152 
    or curStep == 10184 then
        st(true,true,"mirror3","x","x",0,2,3,crochet,"cubeInOut")
          zoomblur(2.5,2,"cubeIn",-5)
    end
    if curStep == 9832 or curStep == 9896 or curStep == 9960 or curStep == 10024 then
        tweenShader('mirror3','angle',-5,crochet*0.002,'cubeIn')
    elseif curStep == 9840 or curStep == 9872 or curStep == 9904 or curStep == 9936 or curStep == 9968
    or curStep == 10000 or curStep == 10032 or curStep == 10096 or curStep == 10128 or curStep == 10160 then
        zoomblur(0,2,"cubeOut",10)
         tweenShader('mirror3','angle',0,crochet*0.002,'cubeOut')
    elseif curStep == 9864 or curStep == 9928 or curStep == 9992 then
       tweenShader('mirror3','angle',5,crochet*0.002,'cubeIn')
    end
    if curStep == 9920 or curStep == 10080 then
        set("defaultCamZoom", 0.7) 
    elseif curStep == 9936 then
        set("defaultCamZoom", 0.8)
    elseif curStep == 9944 or curStep == 10304 then
        set("defaultCamZoom", 0.9) 
    elseif curStep == 10208 then
        pico,matt = false,true
    elseif curStep == 10232 then
        pico,matt = true,false
    end
    if curStep == 9856 or curStep == 9888 or curStep == 9920 or curStep == 9936 or curStep == 9944 or curStep == 9952 or curStep == 9984
    or curStep == 10016 or curStep == 10048 then
         bloom(4, 1, crochet, 2, "")zoom = 0.8
    elseif curStep == 10112 or curStep == 10144 or curStep == 10176 or curStep == 10256 then
        bloom(4, 1, crochet, 2, "")
    elseif curStep == 10192 then
         coloresmode(true,true,0.75,3,1.3,1,1,1,4,"cubeOut")
          tweenShader('bloom','brightness',0,crochet*0.004,'cubeOut')
        zoomblur(0,4,"cubeOut",10)
        bf = false
        mirror(true,true,"angle","angle",180,0,4,crochet,"cubeOut")
    end
    if curStep == 9944 then
        st(true,true,"mirror3","x","x",0,2,2,crochet,"cubeOut")
    elseif curStep == 9952 then
        y = 0.1
         tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeOut')
        tweenShader('bars2','effect',0.25,crochet*0.002,'cubeOut')
         mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
     elseif curStep == 9984 then
        y = 0.1
        tweenShader('bars2','effect',0.1,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
     elseif curStep == 10016 then   
         y = 0.1
        tweenShader('bars2','effect',0.3,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 10048 then   
         y = 0.1
           zoomblur(2.5,4,"cubeIn",10)
          tweenShader('fish', 'power', 0, crochet*0.002, 'cubeOut')
         coloresmode(true,false,0.75,3,1.3)
        tweenShader('bars2','effect',0,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 10056 then
         mirror(true,true,"x","x",0,-30,8,crochet,"cubeInOut")
    elseif curStep == 10064 then
        --                      r  b  g  r g b
          coloresmode(true,true,0.75,3,1.3,0.25,1.7,0.3,4,"cubeIn")
          zoomblur(0,4,"cubeOut",10)
         tweenShader('fish', 'power', 0.35, crochet*0.002, 'cubeOut')
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 10072 then
         mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == 10080 then
         coloresmode(true,true,0.25,0.3,1.7,0.75,1.3,3,4,"cubeOut")
        tweenShader('fish', 'power', 0, crochet*0.002, 'cubeOut')
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 10176 then
        tweenShader('bloom','brightness',-0.2,crochet*0.004,'cubeIn')
    elseif curStep == 10200 then
        tweenShader('bloom','contrast',4,crochet*0.002,'cubeIn')
    elseif curStep == 10208 then
        tweenShader('bloom','contrast',1,crochet*0.002,'cubeOut')
    elseif curStep == 10304 or curStep == 10312 then

        tweenShader('greyscale','strength',0.5,crochet*0.002,'cubeOut')
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == 10308 or curStep == 10316 then
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
    elseif curStep == 10320 then
        bloom(4, 1, crochet, 2, "")
         tweenShader('bloom','brightness',-1,crochet*0.004,'cubeIn')
        tweenShader('pixel', 'strength', 50, crochet*0.004, 'cubeIn')
        st(true,true,"mirror3","y","y",0,1,4,crochet,"cubeOut")
         mirror(false,true,"","zoom",0,3,4,crochet,"cubeOut")
         tween("bfCharacter1",{alpha = 0},crochet*0.004)
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 10336 then
        set("defaultCamZoom", 0.6) 
        pico,bf = false,false
         bloom(4, 1, crochet, 2, "") zoomblur(0, 2, "cubeOut", 0)
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('bloom','brightness',0,crochet*0.002,'cubeOut')
        tweenShader('pixel', 'strength', 0, crochet*0.002, 'cubeOut')
        st(true,true,"mirror3","y","y",0,0,0.1,crochet,"cubeOut")
    elseif curStep == 10576 then
        texto("finish",1,4,"")
        barrel = -2
    end
    if curStep == 10834 or curStep == 10838 or curStep == 10841 or curStep == 10843 or curStep == 10845 or curStep == 10847 then
        setShaderProperty('bars', 'effect', 0.55)
    elseif curStep == 10836 or curStep == 10840 or curStep == 10842 or curStep == 10844 or curStep == 10846 or curStep == 10848 then
        setShaderProperty('bars', 'effect', 0)
    end
    if curStep == 10824 then
         tween("troll",{x = -250},crochet*0.002,"cubeIn")
        tweenShader('fish', 'power', 0, crochet*0.002, 'cubeIn')
    elseif curStep == 10832 then
        bf,matt,final = false,false,true
        tween("other",{zoom = 2},crochet*0.002,"cubeIn")
          tweenShader('distorcion', 'size', 0.05, crochet*0.0035, 'cubeIn')
           tweenShader('Glitchy', 'AMT', 1, crochet*0.0035, 'cubeIn')
    elseif curStep == 10846 then
        setCameraShader("other","ca")
        setCameraShader("other","disco")
        setCameraShader("other","distorcion")
     --    removeCameraShader("hud","bump")
    elseif curStep == 10848 then -- finallllll
        hud(0, crochet, 8, 'cubeOut')
        destroy("troll")
        setShaderProperty('vignette', 'strength', 15)
        setShaderProperty('vignette', 'size', 0.5)
        zoomblur(0, 2, "cubeOut", 0)
         bloom(8, 1, crochet, 2, "") 
        setShaderProperty('Glitchy', 'AMT', 0)
        setShaderProperty('distorcion', 'size', 0.008)
        tween("other",{zoom = 1},crochet*0.004,"cubeOut")
        set("trollmatt.alpha",1)
        triggerEvent('screen shake', (stepCrochet*0.512)..',0.012')
         tween("trollmatt",{x = -50},crochet*0.004,"cubeOut")
         perlinCaRange = 0.02
           tweenShader('bars2', 'effect', 0.07, crochet*0.004, 'cubeOut')
        for i = 0, 3 do
        setActorProperty(i, 'x', 0)
            if middlescroll then
                --setActorProperty(i, "x", _G["defaultStrum"..i.."X"] + 320)
                tweenActorProperty(i + 4, "x", _G["defaultStrum"..(i + 4).."X"] + 320,crochet*0.004,"cubeOut")
            else
                tweenActorProperty(i + 4, "x", _G["defaultStrum"..(i + 4).."X"] + 0,crochet*0.004,"cubeOut")
            end
        end
    end
    if curStep == 10848 then
         tweenShader('mirror', 'angle', -10, crochet*0.004, 'cubeOut')
    elseif curStep == 10864 or curStep == 10928 or curStep == 10992 or curStep == 11056 then
        tweenShader('greyscale', 'strength', 1, crochet*0.004,"cubeIn")
           tween("blackBG", {alpha = 0.5}, crochet * 0.004, "cubeIn")
         bloom(4, 1, crochet, 2, "") 
        tweenShader('mirror', 'angle', 0, crochet*0.004, 'cubeIn')
    elseif curStep == 10880 or curStep == 11008 then
         blur,x2,angle2 = 5,350,45
        mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         mirror(true,true,"y","y",0,-0.5,2,crochet,"cubeOut")
    elseif curStep == 10892 or curStep == 11020 then
         blur,x2,angle2 = 5,350,45
        mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         mirror(false,true,"","y",0,-1,2,crochet,"cubeOut")
     elseif curStep == 10904 or curStep == 10968 or curStep == 11096 then
        mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         blur,x2,angle2 = 5,350,45
         mirror(false,true,"","y",0,0,2,crochet,"cubeOut")

    elseif curStep == 10944 or curStep == 11072 or curStep == 11088 then
           blur,x2,angle2 = 5,350,45
                mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         mirror(true,true,"y","y",0,0.5,2,crochet,"cubeOut")
    elseif curStep == 10956 or curStep == 11080 then
              blur,x2,angle2 = 5,350,45
                mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
     elseif curStep == 11032 then
             blur,x2,angle2 = 5,350,45
                mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
         mirror(false,true,"","y",0,0,1,crochet,"cubeOut")
     elseif curStep == 11036 then
            mirror(true,true,"y","y",0.2,0,1,crochet,"cubeOut")
    end
    if curStep == 10880 or curStep == 10944 or curStep == 11008 then
        tween("blackBG", {alpha = 0}, crochet * 0.004, "cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet*0.001)
         bloom(4, 1, crochet, 2, "") 
         setShaderProperty('disco', 'brightness', 2)
        setShaderProperty('disco', 'enableRainbow', 0.87)
        setShaderProperty('Glitchy', 'AMT', 0.25)
    elseif curStep == 10904 or curStep == 10968 or curStep == 11032 then
        tweenShader('greyscale', 'strength', 1, crochet*0.002)
        tweenShader('Glitchy', 'AMT', 0, crochet*0.002)
     elseif curStep == 10912 or curStep == 11040 then
        tweenShader('disco', 'brightness', 1, crochet*0.004,"cubeOut")
        tweenShader('disco', 'enableRainbow', 0, crochet*0.004,"cubeOut")
         bloom(4, 1, crochet, 2, "") 
         tweenShader('bump', 'x', 1, crochet*0.002,"cubeOut")
         tweenShader('mirror', 'angle', -10, crochet*0.004,"cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet*0.001)
    end
    if curStep == 10968 then
         tweenShader('bump', 'x', -0.2, crochet*0.002,"cubeIn")
    elseif curStep == 10976 then
         tweenShader('disco', 'brightness', 1, crochet*0.004,"cubeOut")
        tweenShader('disco', 'enableRainbow', 0, crochet*0.004,"cubeOut")
         bloom(4, 1, crochet, 2, "") 
         tweenShader('bump', 'x', 0, crochet*0.002,"cubeOut")
         tweenShader('mirror', 'angle', -10, crochet*0.004,"cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet*0.001)
    elseif curStep == 11064 or curStep == 11080 or curStep == 11096 then
         tweenShader('bump', 'x', 0, crochet*0.002,"cubeInOut")
    elseif curStep == 11088 then
          bloom(4, 1, crochet, 2, "") 
         tweenShader('bump', 'x', 1, crochet*0.002,"cubeInOut")
    elseif curStep == 11072 then
         tween("blackBG", {alpha = 0.5}, crochet * 0.002, "cubeOut")
        bloom(4, 1, crochet, 2, "") 
          tweenShader('bump', 'x', 1, crochet*0.002,"cubeInOut")
           setShaderProperty('disco', 'brightness', 2)
        setShaderProperty('disco', 'enableRainbow', 0.87)
        setShaderProperty('Glitchy', 'AMT', 0.25)
    end
    if curStep == 11096 then
        tweenShader('bars2', 'effect', 0, crochet*0.002,"cubeInOut")
         tween("trollmatt", {x = -850}, crochet * 0.002, "cubeIn")
         for i = 3, 7 do
            tweenActorProperty(i, "x", _G["defaultStrum"..(i).."X"] -320,crochet*0.002,"cubeOut")
        end
    elseif curStep == 11104 then
         tweenShader('bump', 'y', -0.5*downscroll, crochet*0.002,"cubeOut")
        tweenShader('bump', 'zoom', 4, crochet*0.080,"cubeIn")
           tweenShader('distorcion', 'size', 0.05, crochet*0.080, 'cubeIn')
    elseif curStep == 11296 then
        fadeCamera("hud","white",crochet*0.001*16,"cubeIn",true)
    elseif curStep == 11360 then
        tweenShader('bars', 'effect', 0.55, crochet*0.008,"cubeOut")
    end



    if curStep >= 9056 and curStep < 9184 or curStep >= 9312 and curStep < 9439 then
        if curStep % 32 == 0 or curStep % 32 == 8 then
           tweenActorColor('dad',255,255,255,0,0,0,crochet*0.002, 'cubeIn')
        end
        if curStep % 32 == 0 then
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut')
        elseif curStep % 32 == 16 then
            mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
            tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
        elseif curStep % 32 == 20 or curStep % 32 == 28 then
             mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        elseif curStep % 32 == 24 then
            mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
        end
    end

    if curStep >= 9184 and curStep < 9304 or curStep >= 9440 and curStep < 9560 then
        if curStep % 32 == 0 then
            mirror(false,true,"","angle",0,-15,0.9,crochet,"cubeOut")
        elseif curStep % 32 == 4 or curStep % 32 == 12 then
             mirror(false,true,"","angle",0,0,0.9,crochet,"cubeIn")
        elseif curStep % 32 == 8 then
            mirror(false,true,"","angle",0,15,0.9,crochet,"cubeOut")
    
        end
    end
        if curStep >= 9056 and curStep < 9184 or curStep >= 9312 and curStep < 9440 then
             if curStep % 16 == 0 then
                angle1,x1,blur = 15,-0.1,2
                bloom(2, 1, crochet, 2, "cubeOut")
            end
            if curStep % 16 == 8 then
                bloom(2, 1, crochet, 2, "cubeOut")
                angle1,x1,blur = -15,0.1,2
            end
            if curStep % 64 == 24 then
                st(true,true,"mirror","x","x",1,2,2,crochet,"cubeIn")
            elseif curStep % 64 == 56 then
                st(true,true,"mirror","x","x",2,3,2,crochet,"cubeIn")
            end
        end
    
    parte1(256,true)
    parte1(3904,false)
    parte2giro(540)
    parte2giro(1180)
    parte2giro(2076)
    parte3(640,true)
    parte3(704,false)
    parte3(896,true)
    parte3(960,false)
    parte3(1280,true)
    parte3(1344,false)
    parte3(1408,true)
    parte3(1472,false)
    parte3(9696,true)
    parte3(9760,false)
    parte4salto(768,true)
    parte4salto(832,false)
    parte4salto(1024,true)
    parte4salto(1088,false)
    parte4salto(2176,true)
    parte4salto(2240,false)

    parte4salto(9568,true)
    parte4salto(9632,false)
    parte3(10208,true)
    parte3(10272,false,true)

    parte5(2304,true)
    parte5(8768,false)
    parte6(8512)
    parte6(8576)
    drop(1536,true,true)
    drop(1792,false,true)
    drop(5184,true,true)
    drop(5440,false,false)
    nk(3360,true)
     nk(10336,false)
    rev(4160)
    rev(4672)
end

function parte1(s,y)
    if curStep == s then bloom(4,1,crochet,4,"cubeOut")mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")mirror(true,true,"angle","angle",-180,0,3.5,crochet,"cubeOut")
        mirror(true,true,"barrel","barrel",-8,0,5,crochet,"cubeOut")setShaderProperty('greyscale', 'strength', 0.5)matt = false
    elseif curStep == s+32 or curStep == s+96 or curStep == s+128+32 then zoom = 0.8
    elseif curStep == s+64 or curStep == s+128+64 then zoom = 0.7 bloom(4,1,crochet,4,"cubeOut") blur = 5
    elseif curStep == s+112 or curStep == s+128+80 then mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut") tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+120 or curStep == s+128+88 then mirror(false,true,"","zoom",0,0.7,2,crochet,"expoIn")
    elseif curStep == s+124 then tweenShader('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+128 then tweenShader('greyscale', 'strength', 0.5, crochet*0.001*1, 'cubeOut')tweenShader('fish', 'power', 0, crochet*0.001*4, 'cubeOut')
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut") zoomblur(2.5,1,"cubeOut",10) bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == s+132 then
        zoomblur(0,1,"cubeIn",0)
    elseif curStep == s+128+16 then angle = -15 blur = 5
    elseif curStep == s+128+96 then setShaderProperty('Glitchy', 'AMT', 0.1) 
     tweenShader('mirrorHUD', 'zoom', 0.5, stepCrochet*0.001*32, 'cubeIn')tweenShader('greyscale', 'strength', 0, stepCrochet*0.001*32, 'cubeIn')
     tweenShader('mirror', 'barrel', -2, stepCrochet*0.001*31, 'cubeIn')triggerEvent('screen shake', (stepCrochet*0.001*32)..',0.005')
    elseif curStep == s+128+128 then setShaderProperty('mirror', 'barrel', 0.0) bloom(4,1,crochet,4,"cubeOut") tweenShader('mirrorHUD', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeOut') zoomblur(0,2,"cubeOut")
    if y then setShaderProperty('mirror', 'y', -2) tweenShader('mirror', 'y', 0, crochet*0.001*4, 'cubeInOut')end
    end
    if curStep == s+128+96 then
        zoomblur(5,1,"cubeOut")
        tween('uno-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut')
    
    elseif curStep == s+128+104 then
        tween('dos-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut')
        tween('uno-god',{x = -3000}, stepCrochet*0.001*8, 'cubeInOut')
        
    elseif curStep == s+128+112 then
        tween('tres-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut')
        tween('dos-god',{x = 3000}, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == s+128+120 then
        tween('cuatro-god',{x = 370}, stepCrochet*0.001*8, 'cubeOut')
        tween('tres-god',{x = -3000}, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == s+128+128 then
        tween('cuatro-god',{x = 3000}, stepCrochet*0.001*8, 'cubeInOut')
    end
    if (curStep >= s+128+96 and curStep < s+128+96+32) then
        if curStep % 16 == 0 then
            bloom(4,1,crochet,2,"cubeOut")
            setShaderProperty('mirrorHUD', 'angle',15)
            tweenShader('mirrorHUD', 'angle',0, crochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 8 then
            bloom(4,1,crochet,2,"cubeOut")
            setShaderProperty('mirrorHUD', 'angle',-15)
            tweenShader('mirrorHUD', 'angle',0, crochet*0.001*2, 'cubeOut')
        end
        if curStep % 16 == 4 then
            mirror(true,true,"x","x",2,0,2,crochet,"cubeInOut")
        elseif curStep % 16 == 12 then
            mirror(true,true,"x","x",-2,0,2,crochet,"cubeInOut")
        end
    end
end
function parte2giro(q)
    if curStep == q or curStep == q+64 then--1180 y 1244
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0)
    elseif curStep == q+12 or curStep == q+76 then--1192 y 2256
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(true,true,"y","y",-2,0,4,crochet,"cubeInOut")
        setShaderProperty('Glitchy', 'AMT', 0.15)
    elseif curStep == q+20 or curStep == q+32 then
        angle = 15
        x = -0.1
        tweenShader('fish', 'power', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == q+26 then
        angle = -15
        x = 0.1
    elseif curStep == q+36 then
        mirror(true,true,"barrel","barrel",-2,0,4,crochet,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenFadeIn("blackBG",0.5,crochet*0.001*4,"cubeOut")
        zoomblur(4,4,"cubeOut")
    elseif curStep == q+58 then--604 y 1248
        tweenShader('greyscale', 'strength', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == q+78 then--624 y 1268
        tweenShader('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
        angle = -15
        x = 0.1
        tweenShader('fish', 'power', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == q+78+6 then--630 y 1274
        angle = 15
        x = -0.1
    elseif curStep == q+78+12 then--1276
        
        mirror(true,true,"y","y",-2,0,4,crochet,"cubeInOut")
        angle = -15
        tweenFadeIn("blackBG",0,crochet*0.001*4,"cubeOut")
        zoomblur(0,2,"cubeOut")
    end
end
function parte3(s, q, locura)
    if locura == nil then locura = false end

    if curStep == s then
        bloom(4,1,crochet,4,"cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0) 
        if not q then 
            zoomblur(4,1,"cubeOut",0)
        end
    end

    if (curStep >= s and curStep < s+33) then
        if q then
            if curStep % 16 == 0 then
                angle = 15
                blur = 5
            elseif curStep % 16 == 6 then
                angle = -15
                blur = 5
            end
        else 
            if curStep % 16 == 0 then
                angle = 15
                blur = 5
            elseif curStep % 16 == 8 then
                angle = -15
                blur = 5
            end
        end
    end

    if curStep == s+8 then
        setShaderProperty('mirror3', 'y', 2)
        tweenShader('mirror3', 'y', 0, crochet*0.001*3, 'cubeInOut')
        if not q then
            mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
            tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeIn')
            tween("blackBG",{alpha = 0.5},crochet*0.001*2, 'cubeIn')
        end
    elseif curStep == s+16 then
        if q then
            tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeOut')
            mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        else 
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut") 
        end
        tweenShader('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == (q and s+24 or s+22) then
        setShaderProperty('mirror', 'x', 0)
        tweenShader('mirror', 'x', 1, crochet*0.001*1.5, 'cubeOut')
        tweenShader('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
        tween("blackBG",{alpha = 0},crochet*0.001*2, 'cubeOut')
    elseif curStep == s+28 then
        setShaderProperty('mirror3', 'y', -2)
        tweenShader('mirror3', 'y', 0, crochet*0.001*2, 'cubeOut')
        if q then
            tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeOut')
        end
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
    elseif curStep == s+32 then
        setShaderProperty('mirror', 'x', 1)
        tweenShader('mirror', 'x', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+36 then
        if q then
            mirror(false,true,"","zoom",0,0.55,1,crochet,"cubeIn")
        end
    end

    if q then
        if curStep == s+40 then
            angle = -15
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
            x = -0.1
        elseif curStep == s+44 then
            mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
            tweenShader('fish', 'power', 0.2, crochet*0.001*2, 'cubeIn')
        elseif curStep == s+48 or curStep == s+50 then
            angle = 15
            x = -0.05
            setShaderProperty('Glitchy', 'AMT', 0.15)
        elseif curStep == s+56 or curStep == s+58 then
            angle = -15
            x = 0.05
        end
        if curStep == s+56 then
            setShaderProperty('mirror3', 'y', -2)
            tweenShader('mirror3', 'y', 0, crochet*0.001*4, 'cubeInOut')
        elseif curStep == s+64 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
            tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeOut')
            setShaderProperty('Glitchy', 'AMT', 0)
        end
    elseif not locura then

        if curStep == s+32 then
            bloom(4,1,crochet,2,"linear")
            setShaderProperty('Glitchy', 'AMT', 0.15)
            tween("blackBG",{alpha = 0.5},crochet*0.001*4, 'cubeOut')
        elseif curStep == s+36 then
            mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
        elseif curStep == s+40 then
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        elseif curStep == s+44 then
            setShaderProperty('mirror', 'x', -2)
            tweenShader('mirror', 'x', 0, crochet*0.001*2, 'cubeInOut')
        elseif curStep == s+48 then
            angle = 15
            x = -0.05
            mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
            tweenShader('greyscale', 'strength', 1, crochet*0.001*4, 'cubeIn')
            tweenShader('fish', 'power', 0.4, crochet*0.001*1, 'cubeOut')
        elseif curStep == s+52 then
            angle = -15
            x = 0.05
        elseif curStep == s+56 then
            angle = 15
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            mirror(true,true,"x","x",0,1,1,crochet,"cubeOut")
            x = -0.05
        elseif curStep == s+60 then
            angle = -15
            mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
            x = -0.05
        elseif curStep == s+64 then
            tween("blackBG",{alpha = 0},crochet*0.001*2, 'cubeOut')
            mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
            tweenShader('greyscale', 'strength', 0, crochet*0.001*1, 'cubeOut')
            tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeOut')
            zoomblur(0,1,"cubeOut")
        end
    end
end

function parte4salto(s,q)
    if curStep == s then setShaderProperty('mirror', 'y', 0) tweenShader('mirror', 'y', 1, crochet*0.001*2, 'cubeOut') bloom(4,1,crochet,2,"linear")
    if q then   zoomblur(0,1,"cubeOut") else zoomblur(4,1,"cubeOut") end
    elseif curStep == s+4 or curStep == s+12 or curStep == s+20 then  mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn") 
    elseif curStep == s+8 then tweenShader('mirror', 'y', 2, crochet*0.001*2, 'cubeOut') mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut") setShaderProperty('Glitchy', 'AMT', 0)
    elseif curStep == s+16 then mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut") tweenShader('fish', 'power', 0.2, crochet*0.001*1, 'cubeOut') setShaderProperty('Glitchy', 'AMT', 0.1)
        angle = 15--784
    elseif curStep == s+24 then mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut") angle = -15 setShaderProperty('Glitchy', 'AMT', 0.1)--784 
    elseif curStep == s+28 then mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn") angle = -15 setShaderProperty('Glitchy', 'AMT', 0)--784
    elseif curStep == s+32 or curStep == s+44 then angle = 15
    elseif curStep == s+38 then angle = -15
    end
    if curStep == s+38 then mirror(false,true,"","zoom",0,0.6,1,crochet,"cubeOut")
    elseif curStep == s+44 then mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
    elseif curStep == s+48 then mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut") tweenShader('fish', 'power', 0.4, crochet*0.001*1, 'cubeOut') setShaderProperty('Glitchy', 'AMT', 0.1)
    elseif curStep == s+56 then mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn") tweenShader('fish', 'power', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == s+20 then setShaderProperty('Glitchy', 'AMT', 0)
    elseif curStep == s+64 then zoomblur(0,1,"cubeOut") zoom = 0.8
    end
    if curStep >= s+48 and curStep < s+64 and curStep % 4 == 0 then
        local value = (curStep % 8 == 0) and 0.15 or -0.15
        setShaderProperty('mirror3', 'x', value)
        tweenShader('mirror3', 'x', 0, crochet * 0.001, 'cubeOut')
    end
    
end
function parte5(s,q) -- 2304
    local a = curStep % 32
    if (curStep >= s and curStep < s + 160) or (curStep >= s + 176 and curStep < s + 224) then
        if a == 0 then
            bloom(2, 1, crochet, 4, 'cubeOut')
            setShaderProperty('greyscale', 'strength', 0.0)
            mirror(false, true, "", "zoom", 0, 1, 4, crochet, "cubeOut")
            zoomblur(0, 4, "cubeOut")
        elseif a == 16 then
            tweenShader('greyscale', 'strength', 1, stepCrochet * 0.015, 'linear')
            mirror(false, true, "", "zoom", 0, 0.7, 4, crochet, "cubeIn")
        end
    end

    if curStep == s + 56 or curStep == s + 120 or curStep == s + 184 then
        mirror(true, true, "y", "y", -2, 0, 4, crochet, "cubeInOut")
        zoomblur(2.5, 2, "cubeIn", 10)
    elseif curStep == s + 160 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        bloom(2, 1, crochet, 4, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0.0)
        triggerEvent('screen shake', (stepCrochet * 0.032) .. ',0.009')
    elseif curStep == s + 192 then
        setShaderProperty('Glitchy', 'AMT', 0)
    end
    if q  then
        if curStep == s + 224 then
            bloom(2, 1, crochet, 4, 'cubeOut')
            setShaderProperty('greyscale', 'strength', 0.0)
            mirror(false, true, "", "zoom", 0, 3, 8, crochet, "cubeOut")
            mirror(false, true, "", "angle", 0, 180, 8, crochet, "cubeOut")
            tweenShader('fish', 'power', 0.2, crochet * 0.008, 'cubeOut')
            zoomblur(2, 8, "cubeOut", 10)
        elseif curStep == s + 240 then
            tweenShader('greyscale', 'strength', 1, stepCrochet * 0.016, 'cubeIn')
        elseif curStep == s + 256 then
            bloom(2, 1, crochet, 4, 'cubeOut')
        elseif curStep == s + 272 then
            mirror(false, true, "", "zoom", 0, 1, 4, crochet, "cubeIn")
            mirror(false, true, "", "angle", 0, 360, 4, crochet, "cubeIn")
            tweenShader('fish', 'power', 0, crochet * 0.004, 'cubeIn')
        elseif curStep == s + 288 then
            perlinCaRange = 0.06
            zoomblur(0, 1, "cubeOut", 0)
            setShaderProperty('greyscale', 'strength', 0.0)
            flashCamera("game", "white", crochet * 0.003)
        end
    else
        if curStep == s + 224 then--8992
            bloom(2, 1, crochet, 4, 'cubeOut')
            setShaderProperty('greyscale', 'strength', 0.0)
            mirror(false, true, "", "zoom", 0, 3, 4, crochet, "cubeOut")
            tweenShader('fish', 'power', 0.2, crochet * 0.004, 'cubeOut')
            zoomblur(0, 2, "cubeOut", 0)
        elseif curStep == s + 248 then--9016
            zoomblur(5, 2, "cubeIn", 0)
            tweenShader('greyscale', 'strength', 1, crochet * 0.002, 'cubeIn')
            mirror(false, true, "", "zoom", 0, 0.8, 2, crochet, "cubeIn")
        elseif curStep == s + 256 then
            bloom(2, 1, crochet, 4, 'cubeOut')
        end
        if curStep == s+256 or curStep == s+272 then
            tweenShader('mirror', 'angle',-10, crochet*0.001*1, 'smootherstepout')
        elseif curStep == s+ 260 or curStep == s+268 or curStep == s+276 then
            tweenShader('mirror', 'angle',0, crochet*0.001*1, 'cubeIn')
        elseif curStep == s+ 264 or curStep == s+280 then
            tweenShader('mirror', 'angle',10, crochet*0.001*1, 'smootherstepout')
        elseif curStep == s+ 284 then
            mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeIn")
            tweenShader('mirror', 'angle',0, crochet*0.001, 'cubeIn')
            zoomblur(0, 1, "cubeIn", 0)
        end
    end
end

function drop(s,q,r)
    if curStep == s then
        zoomblur(0,2,"cubeOut",0)
        tweenShader('fish', 'power', 0.2, crochet * 0.004, 'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0)
        bloom(4, 1, crochet, 4, 'cubeOut')
        tween('blackBG', {alpha = 0.5}, crochet * 0.004, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet * 0.256) .. ',0.009')
        matt, bf = q, not q
        perlinCaRange, hudValue = 0.06, 0
        hud(hudValue, crochet, 8, 'cubeOut')
        tweenShader('wiggle', 'uWaveAmplitude', 0.02, crochet * 0.004, 'cubeOut')
    end
    if curStep >= s and curStep < (s + (q and 224 or 248)) then
        if curStep % 8 == 0 then
            tweenShader('mirrorHUD', 'zoom', 0.8, stepCrochet * 0.004, 'cubeIn')
        elseif curStep % 8 == 4 then
            tweenShader('mirrorHUD', 'zoom', 1, stepCrochet * 0.004, 'cubeOut')
        end
    end
    

    if (curStep == s+64 or curStep == s+96 or curStep == s+120 or curStep == s+184) and not q then
        angle, x = -15, 0.1
    elseif (curStep == s+108 or curStep == s+128 or curStep == s+188 or curStep == s+204) and not q then
        tweenShader('mirror3', 'y', 0, crochet * 0.001 * 2, 'cubeOut')
        angle, x = 15, -0.1
    end

    if curStep == s + 16 then
        mirror(false, true, '', 'zoom', 0, 2, 2, crochet, 'cubeOut')
        tweenShader('greyscale', 'strength', 1, crochet * 0.004, 'cubeIn')
        tweenShader('mirror3', 'y', 1, crochet * 0.004, 'cubeIn')
    elseif curStep == s+20 then 
        if not q then 
            angle, x = 15, -0.1 
        end
    elseif curStep == s+24 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "expoIn")
        if not q then 
            angle, x = -15, 0.1 
        end
    elseif curStep == s+32 or (curStep == s+96 and q) then
        bloom(4, 1, crochet, 4, "cubeOut")
        angle, x = 15, -0.1
    elseif (curStep == s+44) or ((curStep == s+80 or curStep == s+108 or curStep == s+188) and q) then
        tweenShader('mirror3', 'y', 0, crochet * 0.001 * 2, 'cubeOut')
        angle, x = -15, 0.1
    elseif (curStep == s+56) or ((curStep == s+72 or curStep == s+120 or curStep == s+136 or curStep == s+184) and q) then
        angle, x = 15, -0.1
    elseif curStep == s+64 or curStep == s+128 then
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
        tweenShader('greyscale', 'strength', 0, crochet * 0.001 * 1, 'cubeOut')
        bloom(2, 1, crochet, 4, "cubeOut")
    elseif curStep == s+88 then
        mirror(false, true, "", "zoom", 0, 2, 1, crochet, "cubeOut")
        tweenShader('greyscale', 'strength', 1, crochet * 0.001 * 2, 'cubeIn')
        tweenShader('mirror3', 'y', 1, crochet * 0.001 * 2, 'cubeIn')
        tween("blackBG", {alpha = 0.5}, crochet * 0.001 * 2, 'cubeIn')
        if not q then 
            angle, x = 15, -0.1 
        end
    elseif curStep == s+92 or curStep == s+156 or ((curStep == s+220 or curStep == s+252) and q) then 
        mirror(false, true, "", "zoom", 0, 1, 1, crochet, "expoIn")
    elseif curStep == s+140 then
        if q then
            angle, x = -15, 0.1
        end
        tweenShader('mirror3', 'y', 1, crochet * 0.001 * 5, 'cubeIn')
    elseif curStep == s+152 then
        angle, x = 15, -0.1
        mirror(false, true, "", "zoom", 0, 2, 1, crochet, "cubeOut")
        tweenShader('greyscale', 'strength', 1, crochet * 0.001 * 2, 'cubeIn')
        tween("blackBG", {alpha = 0.5}, crochet * 0.001 * 2, 'cubeIn')
    elseif curStep == s+160 then
        bloom(4, 1, crochet, 4, "cubeOut")
        angle, x = -15, 0.1
    end
    if curStep == s+172 or ((curStep == s+248 or curStep == s+252) and q) then
        angle, x = 15, -0.1
        tweenShader('mirror3', 'y', 0, crochet * 0.001 * 2, 'cubeOut')
    elseif curStep == s+192 or ((curStep == s+256) and q)  then
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
        tweenShader('greyscale', 'strength', 0, crochet * 0.001 * 1, 'cubeOut')
        bloom(2, 1, crochet, 4, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
        zoomblur(0,1,"cubeOut")
        angle, x = -15, 0.1
    elseif curStep == s+212 then
        angle, x = -15, 0.1
        if q then
            tweenShader('mirror3', 'y', 1, crochet * 0.001 * 3, 'cubeIn')
            zoomblur(5.5,3,"cubeIn")
        end
    elseif curStep == s+216 then
        if q then
            angle, x = 15, -0.1
            mirror(false, true, "", "zoom", 0, 2, 1, crochet, "cubeOut")
            tweenShader('greyscale', 'strength', 1, crochet * 0.001 * 2, 'cubeIn')
            tweenShader('mirror3', 'y', 1, crochet * 0.001 * 2, 'cubeIn')
            tween("blackBG", {alpha = 0.5}, crochet * 0.001 * 2, 'cubeIn')
        end
    end
    if not q then
        if curStep == s+224 then
            if r then
            bloom(2, 1, crochet, 4, "cubeOut")
            end
            mirror(false, true, "", "zoom", 0, 3, 8, crochet, "cubeIn")
            tweenShader('greyscale', 'strength', 1, crochet * 0.001 * 8, 'cubeOut')
            zoomblur(2.5,8,"cubeIn",10)
        elseif curStep == s+240 then
            if r then
            tweenShader('fish', 'power', 0, crochet * 0.001 * 4, 'cubeIn')
            end
            tweenShader('mirror3', 'y', 1, crochet * 0.001 * 2, 'cubeOut')
        elseif curStep == s+248 then
            tweenShader('mirror3', 'y', 2, crochet * 0.001 * 2, 'cubeOut')
        elseif curStep == s+256 then
            mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeOut")
            if r then
            st(true,true,"mirror","y","y",-2,0,2,crochet,"cubeInOut")
            bloom(4, 1, crochet, 4, "cubeOut")
            tweenShader('greyscale', 'strength', 0, crochet * 0.001 * 4, 'cubeOut')
            tweenShader('wiggle', 'uWaveAmplitude', 0, crochet * 0.001 * 4, 'cubeOut')
            tween("blackBG", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
            end
            perlinCaRange = 0.0
            zoomblur(0,3,"cubeOut",0)
            bf = false
        end
    end
    if q and curStep >= s + 224 and curStep < s + 248 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        if curStep % 16 == 0 then
            angle, x = -20, 0.1
        elseif curStep % 16 == 8 then
            angle, x = 20, -0.1
        end
        if curStep % 8 == 0 then
            mirror(false, true, "", "zoom", 0, 2, 1, crochet, "cubeOut")

        elseif curStep % 8 == 4 then
            mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeIn")
        end
    end 
    
end
function nk(s,q)
    if curStep == s then
        tweenShader('mirror3', 'y', 2, stepCrochet * 0.001, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('distorcion', 'size', 0.008)
        zoom, perlinCaRange = 0.8, 0.08
        bloom(2, 1, crochet, 4, "cubeOut")
        matt = true
        bf = false
        triggerEvent('screen shake', (stepCrochet * 0.512) .. ',0.001')

    elseif curStep == s + 8 or curStep == s + 72 then
        mirror(true, true, "angle", "angle", 0, -15, 2, crochet, "cubeIn")
        mirror(true, true, "x", "x", 0, 2, 4, crochet, "expoInOut")
        zoomblur(2, 2, "cubeIn", 10)

    elseif curStep == s + 16 or curStep == s + 48 or curStep == s + 80 or curStep == s + 112 then
        mirror(false, true, "", "angle", 0, 0, 2, crochet, "cubeOut")
        zoomblur(0, 2, "cubeOut", 10)
        bloom(2, 1, crochet, 4, "cubeOut")

    elseif curStep == s + 40 or curStep == s + 104 then
        zoom = 0.8
        mirror(true, true, "angle", "angle", 0, 15, 2, crochet, "cubeIn")
        mirror(true, true, "x", "x", 0, 2, 4, crochet, "expoInOut")
        zoomblur(2, 2, "cubeIn", 10)

    elseif curStep == s + 64 or curStep == s + 192 or curStep == s + 296 or curStep == s + 320 or curStep == s + 424 or curStep == s + 448 or curStep == s + 480 then
        zoom = 0.8
    end

    if curStep == s + 120 then
        tweenShader('fish', 'power', 0.2, crochet * 0.002, 'cubeInOut')
        mirror(true, true, "y", "y", 0, -2, 4, crochet, "cubeInOut")
    end

    if curStep == s + 136 or curStep == s + 168 or curStep == s + 200 or curStep == s + 264 or curStep == s + 296 or curStep == s + 328 or curStep == s + 360 or curStep == s + 392 or curStep == s + 424 or curStep == s + 456 or curStep == s + 488 then
        zoomblur(2, 2, "cubeIn", 10)
        mirror(true, true, "x", "x", 0, 2, 4, crochet, "expoInOut")
  elseif (curStep == s + 144 or curStep == s + 176 or curStep == s + 208 or curStep == s + 272 or curStep == s + 304 or curStep == s + 336 or curStep == s + 400 or curStep == s + 432 or curStep == s + 464 or (curStep == s + 496 and q)) then
        zoomblur(0, 2, "cubeOut", 10)
        bloom(2, 1, crochet, 4, "cubeOut")

    elseif curStep == s + 232 then
        zoomblur(2, 2, "cubeIn", 10)
    elseif curStep == s + 240 then
        zoomblur(0, 2, "cubeOut", 10)
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 2.5, 2, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, 180, 2.5, crochet, "cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == s + 248 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeIn")
    elseif curStep == s + 256 then
        flashCamera("game", "white", crochet * 0.002)
        bloom(4, 1, crochet, 4, "cubeOut")
        zoom = 0.75
        setShaderProperty('greyscale', 'strength', 0)
    end

    if curStep == s + 352 then
        zoomblur(2, 4, "cubeIn", 10)
        setShaderProperty("mirror", "x", -50)
        tweenShader('mirror', 'x', 0, crochet * 0.011, 'expoInOut')
    elseif curStep == s + 368 then
        zoomblur(0, 4, "cubeOut", 10)
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == s + 384 then
        matt = true
        bf = false
        mirror(false, true, "", "angle", 0, 0, 2, crochet, "quadOut")
    end

    if curStep == s + 216 or curStep == s + 224 or curStep == s + 226 or curStep == s + 232 or curStep == s + 234 then
        x = -0.15
    elseif curStep == s + 220 or curStep == s + 228 or curStep == s + 230 or curStep == s + 236 or curStep == s + 238 then
        x = 0.15
    end

    if curStep == s + 128 then
        matt = false
        bf = true
    end
    if q then
        if curStep == s + 480 then tweenShader('bloom', 'brightness', -1, crochet * 0.008, 'cubeIn')
        elseif curStep == s + 512 then mirror(false, true, "", "angle", 0, 180, 8, crochet, "cubeIn")tweenShader('bloom', 'brightness', 0, crochet * 0.008, 'cubeOut')
            tweenShader('greyscale', 'strength', 1, crochet * 0.0075, 'cubeIn')setShaderProperty('Glitchy', 'AMT', 0.15)perlinCaRange = 0 setShaderProperty('distorcion', 'size', 0)
            matt = false bf = false
        elseif curStep == s + 528 then mirror(false, true, "", "zoom", 0, 20, 4, crochet, "cubeIn")zoomblur(2, 4, "cubeIn", 10)
        elseif curStep == s + 544 then zoomblur(0, 2, "cubeOut", 10)setShaderProperty('Glitchy', 'AMT', 0)tweenShader('fish', 'power', 0, crochet * 0.002, 'cubeOut')end
    else
        if curStep == s+480 then
        tweenShader('bloom', 'contrast', 0, crochet * 0.004, 'cubeIn')
        end
    end
end


function rev(s)
    if curStep == s then
        perlinCaRange = 0.05
        zoom = 0.8
        matt = true
        bf = false
       -- tweenShader('fire', 'strength', 0.1, crochet * 0.002, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeOut")
    elseif curStep == s+4 then
        mirror(false, true, "", "zoom", 0, 0.7, 1, crochet, "cubeIn")
    elseif curStep == s+8 then
        tweenShader('fish', 'power', 0.2, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, -15, 1, crochet, "cubeOut")
        mirror(true, true, "x", "x", 0, 2, 3, crochet, "expoInOut")
        tweenShader('greyscale', 'strength', 1, crochet * 0.0015, 'cubeIn')
        zoomblur(2, 2, "cubeIn", 10)
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*2, 'cubeIn')
    elseif curStep == s+12 then
        mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeIn")
        mirror(false, true, "", "angle", 0, 15, 1, crochet, "cubeIn")
    elseif curStep == s+16 then
        bloom(4, 1, crochet, 4, "cubeOut")
        setShaderProperty('greyscale', 'strength', 0.0)
        zoomblur(0, 2, "cubeOut", 10)
    elseif curStep == s+20 then
        mirror(false, true, "", "angle", 0, 0, 1, crochet, "cubeOut")
        mirror(true, true, "y", "y", 0, 2, 2, crochet, "cubeInOut")
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeIn')
        zoomblur(2, 1, "cubeIn", 10)
    elseif curStep == s+24 then
        tweenShader('greyscale', 'strength', 0, crochet * 0.0001, 'cubeOut')
        zoomblur(0, 1, "cubeOut", 10)
    elseif curStep == s+28 then
        mirror(false, true, "", "zoom", 0, 0.7, 1, crochet, "cubeIn")
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeIn')
    elseif curStep == s+32 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, -15, 1, crochet, "cubeOut")
        bloom(4, 1, crochet, 4, "cubeOut")
    elseif curStep == s+36 then
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
        mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeIn")
    elseif curStep == s+40 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        mirror(false, true, "", "angle", 0, 0, 1, crochet, "cubeOut")
        x = -0.1
    elseif curStep == s+44 then
        x = 0.1
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
        tween("blackBG", {alpha = 0.9}, crochet * 0.001 * 1, 'cubeIn')
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeIn')
    elseif curStep == s+48 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('fish', 'power', 0, crochet * 0.001, 'cubeOut')
        tweenShader('mirrorHUD', 'zoom', 2, crochet * 0.001, 'cubeOut')
    end
    if curStep >= s+48 and curStep < s+64 and curStep % 4 == 0 then
        local value = (curStep % 8 == 0) and 0.2 or -0.2
        setShaderProperty('mirror3', 'x', value)
        tweenShader('mirror3', 'x', 0, crochet * 0.001, 'cubeOut')
        setShaderProperty('zoomblur', 'focusPower', 2)
        tweenShader('zoomblur', 'focusPower', 0, crochet * 0.001, 'cubeOut')
    end
    if curStep == s+48 then
        tween("Punch", {y = 400},crochet*0.001*1, 'expoOut')
    elseif curStep == s+52 then
        bloom(2, 1, crochet, 2, "cubeOut")
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
        tween("Sword", {y = 400},crochet*0.001*1, 'expoOut')
    elseif curStep == s+56 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        tween("Punch1", {y = 400},crochet*0.001*1, 'expoOut')
        tween("Punch", {y = 1400} , stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == s+60 then
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
        tween("Punch2", {y = 400},crochet*0.001*1, 'expoOut')
        tween("Sword",{y = 1400}, stepCrochet*0.001*8, 'cubeInOut')
        tweenShader('mirrorHUD', 'zoom', 1, crochet * 0.001, 'cubeIn')
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeIn')
        bloom(2, 1, crochet, 2, "cubeOut")
    elseif curStep == s+64 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        zoom = 0.8
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        tween("Punch1",{y = 1400}, stepCrochet*0.001*8, 'cubeInOut')
        tween("Punch2", {y = 1400} , stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == s+68 then
        mirror(true, true, "x", "x", 0, 2, 2, crochet, "cubeInOut")
    elseif curStep == s+76 then
        tween("blackBG", {alpha = 1}, crochet * 0.001 * 1, 'cubeIn')
        tweenShader('fish', 'power', 0.2, crochet * 0.001, 'cubeIn')
        mirror(false, true, "", "angle", 0, -15, 1, crochet, "cubeIn")
    elseif curStep == s+80 then
        setShaderProperty('Glitchy', 'AMT', 0.15)
        mirror(false, true, "", "angle", 0, 0, 1, crochet, "cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == s+84 or curStep == s+92 then
        x = -0.1
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
    elseif curStep == s+88 then
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
        angle,x = -15,0.1
    end
    if curStep == s+92 then
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 1)
    elseif curStep == s+96 then
        tweenShader('greyscale', 'strength', 1, crochet * 0.004, 'cubeIn')
        mirror(false, true, "", "zoom", 0, 2.5, 2, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, -45, 4, crochet, "cubeIn")
        bloom(4, 1, crochet, 4, "cubeOut")
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001*1, 'cubeOut')
    elseif curStep == s+104 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeIn")
    elseif curStep == s+112 then
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        bloom(4, 1, crochet, 4, "cubeOut")
        mirror(false, true, "", "angle", 0, 0, 2, crochet, "cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
    end
    if curStep == s+96 or curStep == s+98 or curStep == s+104 or curStep == s+108 then
        setShaderProperty('mirror3', 'x', 0.15)
        tweenShader('mirror3', 'x', 0, stepCrochet * 0.002, 'cubeOut')
    elseif curStep == s+100 or curStep == s+102 or curStep == s+106 or curStep == s+110 then
        setShaderProperty('mirror3', 'x', -0.15)
        tweenShader('mirror3', 'x', 0, stepCrochet * 0.002, 'cubeOut')
    end
    if curStep == s+116  or curStep == s+122 then
        angle,x = 15,-0.1
        mirror(false, true, "", "zoom", 0, 0.8, 1, crochet, "cubeIn")
    elseif curStep == s+120 or curStep == s+124 then
        angle,x = -15,0.1
    end
    if curStep == s+120 then
        zoomblur(2, 2, "cubeIn", 10)
        mirror(true, true, "y", "y", 0, 2, 2, crochet, "cubeInOut")
    elseif curStep == s+124 then
        tween("blackBG", {alpha = 1}, crochet * 0.001 * 1, 'cubeIn')
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*1, 'cubeIn')
    elseif curStep == s+128 then -- 4228
        zoomblur(0, 2, "cubeOut", 10)
        matt = false
    elseif curStep == s+136 then
        barrel = -2
        tweenShader('greyscale', 'strength', 1, crochet * 0.002, 'cubeIn')
    elseif curStep == s+144 then
        bloom(2, 1, crochet, 4, "cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        mirror(true, true, "y", "y", -0.5, 0, 2, crochet, "cubeOut")
    end
    if curStep == s+152 then
        angle,x = 15,-0.1
        setActorColor('dad', 232, 233, 25)
        bloom(8,1,crochet,1,"linear")
        set('dad.x',getActorX("dad")-500)
        addActorTrail("dad",5,12,0.2,0.02) 
    elseif curStep == s+156 then
        angle,x = -15,0.1
        set('dad.x',getActorX("dad")+1000)
		bloom(8,1,crochet,1,"linear")
    elseif curStep == s+160 then
        angle = -15
        setActorColor('dad', 120, 32, 220)
        tweenActorColor('dad',120,32,220,0,0,0,crochet*0.001*4, 'cubeOut')
		set('dad.x',getActorX("dad")-500)
		bloom(8,1,crochet,4,"cubeOut")
		removeActorTrail('dad')
    elseif curStep == s+176 then--4336
        bloom(8,1,crochet,4,"cubeOut")
        angle = 15
        setActorColor('dad', 120, 32, 220)
        tweenActorColor('dad',120,32,220,0,0,0,crochet*0.001*4, 'cubeOut')
        tweenShader('greyscale', 'strength', 1, crochet * 0.004, 'cubeIn')
    elseif curStep == s+192 then
        setActorColor('dad', 255, 255, 255)
        tweenActorColor('dad',255,255,255,0,0,0,crochet*0.001*4, 'cubeOut')
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == s+200 then
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == s+224 then--4384
        mirror(true, true, "y", "y", 0, 0.5, 2, crochet, "cubeOut")
        tweenShader('Glitchy', 'AMT', 0.15, stepCrochet * 0.008, 'cubeOut')
    end
    if curStep == s+228 then
        bloom(4,1,crochet,4,"cubeOut")
        tween("bring-god", {y = 150}, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+232 then
        tween("in-god", {y = 150}, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+236 then
        tween("the-god", {y = 150}, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+240 then--4440
        posiciones("hud",50)
        mirror(true, true, "angle", "angle", 15, 0, 1, crochet, "cubeOut")
        mirror(true, true, "x", "x", -0.1, 0, 1, crochet, "cubeOut")
        movimiento({0}, 3, "cubeOut", true)
        tween("blackBG", {alpha = 0}, crochet * 0.001 * 4, 'cubeIn')
        tweenShader('fish', 'power', 0.4, crochet * 0.004, 'cubeIn')
        mirror(false, true, "", "zoom", 0, 2, 2, crochet, "cubeOut")
        bloom(1,5,crochet,4,"cubeIn")
        tween("ruckus-god",{x = 220} , stepCrochet*0.001*4, 'cubeOut')
        tweenActorColor('dad',0,0,0,255,255,255,crochet*0.001, 'cubeOut')
    elseif curStep == s+244 or curStep == s+252 then
        mirror(true, true, "angle", "angle", -15, 0, 1, crochet, "cubeOut")
        mirror(true, true, "x", "x", 0.1, 0, 1, crochet, "cubeOut")
    elseif curStep == s+248 then
        mirror(true, true, "angle", "angle", 15, 0, 1, crochet, "cubeOut")
        mirror(true, true, "x", "x", -0.1, 0, 1, crochet, "cubeOut")
        mirror(false, true, "", "zoom", 0, 4, 2, crochet, "cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet * 0.002, 'cubeIn')
        tween("like-god",{x = 670}, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+256 then
        mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeOut")
        mirror(true, true, "y", "y", 0.5, 0, 2, crochet, "cubeOut")
        bloom(5,1,crochet,4,"cubeOut")
        setShaderProperty('Glitchy', 'AMT', 0)
        tweenShader('fish', 'power', 0.2, crochet * 0.002, 'cubeOut')
        tween("bring-god",{y = -1250}, stepCrochet*0.001*4, 'expoOut')
        tween("in-god",{y = -1250}, stepCrochet*0.001*4, 'expoOut')
        tween("the-god",{y = -1280} , stepCrochet*0.001*4, 'expoOut')
        tween("ruckus-god",{x = -1280} , stepCrochet*0.001*4, 'expoOut')
        tween("like-god",{x = 1680}, stepCrochet*0.001*4, 'expoOut')
      --  tweenShader('fire', 'strength', 0, crochet * 0.002, 'cubeOut')
        posiciones("game")
    end
    if curStep >= s+160 and curStep < s+224 then
        if curStep % 8 == 0 then
            tweenShader('mirrorHUD', 'zoom', 0.8, stepCrochet * 0.004, 'cubeIn')
        elseif curStep % 8 == 4 then
            tweenShader('mirrorHUD', 'zoom', 1, stepCrochet * 0.004, 'cubeOut')
        end
    end
    
    
end
function parte6(s)
    if curStep == s then
        setShaderProperty("Glitchy","AMT",0)
        bloom(8,1,crochet,2,"cubeOut")
        blur,x = 5,-0.1
        mirror(false, true, "", "zoom", 0, 1.25, 2, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, -15, 1, crochet, "cubeOut")
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.002, 'cubeIn')
        zoomblur(0,2,"cubeOut",0)
    elseif curStep == s+4 or curStep == s+12 then
        local lol = (curStep == s+12) and 0 or 1 
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeIn')
        tweenShader('disco', 'brightness', lol, crochet * 0.0007, 'cubeIn')
        mirror(false, true, "", "angle", 0, 0, 1, crochet, "cubeIn")
    elseif curStep == s+8 then
        x = 0.1
        coloresmode(true,false,0,1.4,2)
        tweenShader('disco', 'brightness', 1, crochet * 0.001, 'cubeOut')
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.0015, 'cubeIn')
        bloom(2,1,crochet,2,"cubeOut")
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 1.5, 2, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0, 15, 1, crochet, "cubeOut")
    elseif curStep == s+16 then
        coloresmode(true,false,1,1,1)
        bloom(8,1,crochet,2,"cubeOut")
        blur = 5
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0, 1.25, 2, crochet, "cubeOut")
        tweenShader('bars2', 'effect', 0.1, crochet * 0.002, 'cubeOut')
        setActorColor("dad",255,255,255)
        tweenShader('disco', 'brightness', 1, crochet * 0.001, 'cubeOut')
    elseif curStep == s+20 then
        bloom(2,1,crochet,2,"cubeOut")
        setActorColor("dad",0,0,0)
        setShaderProperty("Glitchy","AMT",0.15)
        triggerEvent('screen shake', (stepCrochet*0.004)..',0.012')
        coloresmode(true,true,0.35,0.3,1.7,0.75,3,1.3,1,"cubeIn")
    elseif curStep == s+24 then
        blur = 3
        coloresmode(false,true,0,0,0,1,1,1,2,"cubeIn")
        setShaderProperty("Glitchy","AMT",0)
        mirror(false, true, "", "zoom", 0,2.5, 1, crochet, "cubeOut")
        tweenShader('bars2', 'effect', 0.3, crochet * 0.001, 'cubeOut')
        tweenShader('fish', 'power', 0.35, crochet * 0.001, 'cubeOut')
        tweenActorColor('dad', 0, 0, 0, 255, 255, 255, crochet * 0.001, 'cubeOut')
    elseif curStep == s+28 then
        tweenShader('fish', 'power', 0, crochet * 0.001, 'cubeIn')
        mirror(false, true, "", "zoom", 0,0.8, 1, crochet, "cubeIn")
        tweenShader('bars2', 'effect', 0, crochet * 0.001, 'cubeIn')
    elseif curStep == s+32 then
        mirror(false, true, "", "zoom", 0,1, 1, crochet, "cubeOut")
        angle,x,blur = 15,-0.1,5
        coloresmode(true,false,1.3,0,2.3)--verde naranja
        bloom(2,1,crochet,2,"cubeOut")
        setActorColor("dad",0,0,0)
    elseif curStep == s+36 or curStep == s+44 then
        tweenShader('disco', 'brightness', 0, crochet * 0.0007, 'cubeIn')
        mirror(false, true, "", "zoom", 0,0.6, 1, crochet, "cubeIn")
    elseif curStep == s+40 then
        coloresmode(true,true,0.75,1.3,3,1,1,1,1,"cubeIn")
        st(true,true,"mirror3","y","y",2,0,3,crochet,"cubeInOut")
        mirror(false, true, "", "zoom", 0,1, 1, crochet, "cubeOut")
        angle,x = -15,0.1
        bloom(2,1,crochet,2,"cubeOut")
        tweenShader('disco', 'brightness', 1, crochet * 0.001, 'cubeOut')
    elseif curStep == s+48 then
        blur = 5
        tweenShader('disco', 'brightness', 1, crochet * 0.001, 'cubeOut')
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.002, 'cubeIn')
        setShaderProperty("Glitchy","AMT",0.15)
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0,2, 1, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0,-15, 1, crochet, "cubeOut")
        bloom(2,1,crochet,2,"cubeOut")
        zoomblur(5,1,"cubeOut",0)
    elseif curStep == s+52 or curStep == s+60 then
        mirror(false, true, "", "angle", 0,0, 1, crochet, "cubeIn")
    elseif curStep == s+56 then
        texto("blackBG",0.7,2,"cubeIn")
        coloresmode(true,true,0.75,3,1.3,1,1,1,2,"cubeIn")
        tweenActorColor('dad', 255, 255, 255, 0, 0, 0, crochet * 0.002, 'cubeIn')
        tweenShader('greyscale', 'strength', 0, crochet * 0.001, 'cubeOut')
        mirror(false, true, "", "zoom", 0,0.8, 1, crochet, "cubeOut")
        mirror(false, true, "", "angle", 0,15, 1, crochet, "cubeOut")
    end
end