local sprites = {
    --{'uno', 'Songs IMGS/Final Destination VIP/mortals', 220, 40,0.6,"other"},--250
 -- {'dos', 'Songs IMGS/Final Destination VIP/untapped', 250, 130,0.6,"other"},--250
  -- {'i made it', 'Songs IMGS/Final Destination VIP/i made it', 250, 220,0.6,"other"},--250
    -- {'render', 'Songs IMGS/Final Destination VIP/render', 250, 90,1.2,"other"},
      --  {'a', 'Songs IMGS/Final Destination VIP/1', 100, 1000,3,"other"},--250--250
}
local characters = {"dadCharacter0", "dadCharacter1","boyfriend"}
local yPositions = {1050, 1000, 1040}  --1050,1000,1040 -- 150 , 400, 440
local xPositions = {5, 13, 9} --5,13,10  -- 16,0 -- 2, 0,16
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
function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters, axis)
    axis = axis or "y"
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local valor = nuevaPos * 50
        local props = {}
        props[axis] = valor
        if moverDadCharacters then
            if i <= 2 then
                tween(characters[i], props, crochet * 0.001 * duration, ease)
            end
        else
            if i > 2 then
                tween(characters[i], props, crochet * 0.001 * duration, ease)
            end
        end
    end
end

function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
lol = false
function createPost()
      for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end

    setProperty('', 'cameraSpeed', 1.5)
    hud(0, crochet, 8, 'cubeOut')

    -- Fondo negro
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0.5, 'blackBG')
    setActorLayer('blackBG', getActorLayer('dadCharacter0'))

    -- Sprites en perspectiva
    for _, s in ipairs(sprites) do
        makePerspectiveSprite(s[1], s[2], s[3], s[4], s[5])
        setObjectCamera(s[1], s[6])
        setActorLayer(s[1], layershit)
        if s[1] ~= 'render' then
            set(s[1] .. ".angleY", 90)
        end
    end

    setActorColor("render", 0, 0, 0)
    set("render.y", 850)
    local shaders = {
        {"fuego", "FireworMania", {opacity=0.5, GlowFix=0.2, strength=1, hue=0.7, sat=1, val=0.5, speed= 2.5}, "camera"},
        {"glowBorder", "glowBorder", {transparency=0.4, transparency2=0.4}, "both"},
        {"color", "SwapManiaColor", {hueShift=0.04, strength=0.9,blendOverlay = true}, "camera"},
        {"Sunrays", "Sunrays", {strength=2, brightness=1.15}, "camera"},
        {"greyscale", "greyscale", {strength=1}, "camera"},
        {"tvdist", "tvdist", {greyscale=0, vertMovementOpt=0, bottomStaticOpt=0, scalinesOpt=0, horzFuzzOpt=0, rgbOffsetOpt=0}, "camera"},
        {"mirror3", "BarrelBlurEffect", {zoom=1, angle=0, x=0, y=0, barrel=0, Xdirection=0, Ydirection=0, doChroma=false}, "camera"},
        {"mirror", "BarrelBlurEffect", {zoom=1, angle=15, x=0, y=-0.75, barrel=-1, Xdirection=0, Ydirection=0, doChroma=false}, "camera"},
        {"luz", "flashlight", {posX=0, posY=0, strength=0, sizeX=0, sizeY=0, flashSaturation=0, lightIntensity=0, darkness=0, animationType=0}, "camera"},
        {"bloom", "BloomEffect", {contrast=1, brightness=-1, effect=15, strength=0}, "camera"},
        {"blur", "AnotherBlur", {amt=0}, "camera"},
        {"bars", "bars", {effect=0, effect2=0, angle1=0, angle2=0}, "camera"},
        {"mirror2", "BarrelBlurEffect", {zoom=1, angle=0, x=0, y=0, dist=0, Xdirection=0, Ydirection=0}, "camera"},
        {"fish", "EyeFishEffect", {power=0}, "camera"},
        {"bump", "BarrelBlurEffect", {zoom=1, angle=0, x=0, y=0, barrel=0, doChroma=false}, "camera"},
        {"jitter", "JitterGlitchDS", {gAmnt=0, scale=25, chaos=0.85, speed=0.81}, "camera"},
        {"ca", "ChromAbEffect", {strength=0.0025}, "camera"},
        {"vidrio", "BreakGlassMania", {u_pointCount=35, zoom=1, strength=0}, "actor:a"}
    }
    local exclude = {
        bump = true,
        greyscale = true,
        mirror = true,
        wiggle = true,
        bars = true,
        color = true,
        bloom = true,
        blur = true,
        glowBorder = true,
        luz = true,
        vignette = true,
        tvdist = true,
        fuego = true
    }
    for _, sh in ipairs(shaders) do
        local name, effect, props, target = sh[1], sh[2], sh[3], sh[4] or "camera"
        initShader(name, effect)
        if target == "camera" or target == "both" then
            setCameraShader('game', name)
            if target == "both" and not exclude[name] then
                setCameraShader('other', name)
            end
        elseif string.find(target, "actor:") then
            local actorName = string.sub(target, 7)
            setActorShader(actorName, name)
        end
        for prop, val in pairs(props) do
            setShaderProperty(name, prop, val)
        end
    end
    for _, car in ipairs({"dadCharacter0", "dadCharacter1", "boyfriend"}) do
        set(car .. ".alpha", 0)
        if car == "boyfriend" then
            set(car .. ".x", getActorX(car) + 800)
        else
            set(car .. ".y", getActorY(car) - 1250)
        end
    end
end
function startSong()
    tween("dadCharacter0", {y = getActorY("dadCharacter0") + 1250, alpha = 1}, crochet * 0.004, "quadOut")
    mirror(false, true, "", "barrel", 0, 0, 16, crochet, "cubeOut")
    mirror(false, true, "", "angle", 0, 0, 16, crochet, "cubeOut")
    mirror(false, true, "", "y", 0, 0, 16, crochet, "cubeOut")
    tweenShader('greyscale', 'strength', 0.5, crochet * 0.032)
    tweenShader('bloom', 'brightness', -0.1, crochet * 0.008, "cubeOut")
    tweenShader('bars', 'effect', 0.1, crochet * 0.008, "cubeOut")
    tweenShader('bars', 'angle1', 15, crochet * 0.008, "cubeOut")
end
function toggleTVandLuz(state)
    local values = state and {
        greyscale = {strength = 0.8},
        tvdist = {
            vertMovementOpt = 0,bottomStaticOpt = 0.5,scalinesOpt = 1,horzFuzzOpt = 1,rgbOffsetOpt = 1.2
        },
        luz = {
            posX = 0.5, posY = 0.5, strength = 1, sizeX = 2.2, sizeY = 2.2,
            flashSaturation = 0.5, lightIntensity = 3.2,
            darkness = 0.25, animationType = 4
        }
    } or {
        greyscale = {strength = 0},
        tvdist = {
            vertMovementOpt = 0,
            bottomStaticOpt = 0,
            scalinesOpt = 0,
            horzFuzzOpt = 0,
            rgbOffsetOpt = 0
        },
        luz = {
            posX = 0.5, posY = 0.5, strength = 0, sizeX = 0, sizeY = 0,
            flashSaturation = 0, lightIntensity = 0,
            darkness = 0, animationType = 0
        }
    }

    for shader, props in pairs(values) do
        for prop, val in pairs(props) do
            setShaderProperty(shader, prop, val)
        end
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
luna,sxm, bf, shaggy, matt = false,false, false, true, false
local perlinX, perlinY, perlinZ, time = 0, 0, 0, 0
local perlinSpeed, perlinXRange, perlinYRange, perlinZRange = 2, 0.075, 0.075, 5

function update(elapsed)
    time = time + elapsed
    -- set("camFollow.y", 700)

    -- Movimiento de cámara oscilante
    if (curStep >= 1600 and curStep < 1664) or (curStep >= 1728 and curStep < 1792) then
        -- setProperty('', 'centerCamera', false)
        set("camFollow.x", 500 + math.sin(time) * 600)
    else
        setProperty('', 'centerCamera', true)
    end

    -- Tiempo para shaders animados
    setCustomShaderFloat("color", "iTime", time / 5)
    for _, s in pairs({"tvdist", "Sunrays", "glowBorder", "jitter", "luz","fuego"}) do
        setCustomShaderFloat(s, "iTime", time)
    end

    -- Seguimiento de cámara por personaje activo
    if shaggy then
        set("camFollow.x", getActorX("dadCharacter0") + 200)
        set("camFollow.y", getActorY("dadCharacter0") + 450)
        set("defaultCamZoom", 0.67)
    end

    if matt then
        set("camFollow.x", getActorX("dadCharacter1") + 250)
        set("camFollow.y", getActorY("dadCharacter1") + 150)
        set("defaultCamZoom", 0.8)
    end

    if sxm then
        set("camFollow.x", 100)
        set("camFollow.y", 650)
        set("defaultCamZoom", 0.67)
    end
     if luna then
        set("camFollow.x", 600)
        set("camFollow.y", 350)
        set("defaultCamZoom", 0.75)
    end
    if bf then
        set("camFollow.x", getActorX("boyfriend") + 450)
        set("camFollow.y", getActorY("boyfriend") + 600)
        set("defaultCamZoom", 0.85)
    end

    -- Suavizado del movimiento
    x = lerp(x, 0, elapsed * 8)
    y = lerp(y, 0, elapsed * 8)
    angle = lerp(angle, 0, elapsed * 8)

    -- Actualización de ruido Perlin
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    perlinZ = perlinZ + elapsed * math.random() * perlinSpeed

    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    local perlinOffsetZ = (-0.5 + perlin(0, 0, perlinZ)) * perlinZRange

    -- Aplicar ruido y rotación suave al shader "bump"
    setShaderProperty('bump', 'x', x + perlinOffsetX)
    setShaderProperty('bump', 'y', y + perlinOffsetY)
    setShaderProperty('bump', 'angle', angle + perlinOffsetZ)
end

function bloomBurst(s, t, ease, useSt)
    if useSt == nil or useSt == true then
        st(true, true, 'blur', 'amt', 'amt', 2, 0, t, stepCrochet, ease)
    end
    setShaderProperty('bloom', 'contrast', s)
    tweenShaderProperty('bloom', 'contrast', 1, stepCrochet * 0.001 * t, ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then setShaderProperty('mirror',value,valor) end
    if tween then tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease) end
end
function bloomShake(strength, time, ease, cam)
    bloomBurst(strength, strength, ease)
    screenShake(0.07, time, true, cam or "game")
end
function coloresActor(set,tueen,actor,v1,v2,v3,v4,tiempo,s,ease)
    if set then
      setActorRTXProperty(actor,"CFred",v1)
      setActorRTXProperty(actor,"CFgreen",v2)
      setActorRTXProperty(actor,"CFblue",v3)
      setActorRTXProperty(actor,"CFfade",v4)
    end
    if tueen then
         tweenActorRTXProperty(actor,"CFred",v1,tiempo*0.001*s,ease)
        tweenActorRTXProperty(actor,"CFgreen",v2,tiempo*0.001*s,ease)
         tweenActorRTXProperty(actor,"CFblue",v3,tiempo*0.001*s,ease)
        tweenActorRTXProperty(actor,"CFfade",v4,tiempo*0.001*s,ease)
    end
end

    
function stepHit()
    if curStep == 24 then
          tween("boyfriend",{x = getActorX("boyfriend")-1000,alpha = 1},crochet*0.002,"quadIn")
          tween("dadCharacter0",{x = getActorX("dadCharacter0")+200},crochet*0.002,"quadIn")
    elseif curStep == 32 then
        shaggy = false  setProperty('', 'centerCamera', true)
         set("defaultCamZoom", 0.7)
         tweenShader('mirror2','zoom',0.7,crochet*0.008,"quadIn")
         tweenShader('bars','effect',0.2,crochet*0.008,"quadIn")
         tweenShader('bars','angle1',25,crochet*0.008,"quadIn")
          -- tween("boyfriend",{x = getActorX("boyfriend")-1200,alpha = 1},crochet*0.004,"quadOut")
    elseif curStep == 48 then
        --setActorColor("camGame",255,255,255)
        tweenShader('mirror2','dist',-0.3,crochet*0.004,"cubeIn")
    elseif curStep == 56 then
         mirror(false, true, "", "zoom", 0, 3, 1, crochet, "cubeOut")
    elseif curStep == 60 then
        tweenShader('mirror2','y',2,crochet*0.004,"quadInOut")
         mirror(false, true, "", "zoom", 0, 1, 1, crochet, "cubeIn")
    elseif curStep == 64 then
         tween("dadCharacter0",{x = getActorX("dadCharacter0")-200},crochet*0.004,"quadOut")
        tween("boyfriend",{x = getActorX("boyfriend")+200},crochet*0.004,"quadOut")
           tweenShader('bars','effect',0.05,crochet*0.008,"cubeOut")
         tweenShader('bars','angle1',0,crochet*0.008,"cubeOut")
        tweenShader('mirror2','zoom',1,crochet*0.004,"cubeOut")
        set("defaultCamZoom", 0.55)
        tweenShader('mirror2','dist',0,crochet*0.004,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
    elseif curStep == 96 then
        mirror(false, true, "", "zoom", 0, 0.8, 4, crochet, "cubeOut")
    elseif curStep == 112 then
        tweenShader('bars','effect',0.55,crochet*0.004,"cubeIn")
        tweenShader('bloom','brightness',1,crochet*0.004,"cubeIn")
        mirror(false,true,"","zoom",0,8,4,crochet,"cubeIn")
    elseif curStep == 120 then
        tweenShader('mirror2','dist',0.5,crochet*0.002,"cubeIn")
        mirror(false,true,"","angle",0,-90,2,crochet,"cubeIn")
    elseif curStep == 128 then
          tween("dadCharacter1",{y = getActorY("dadCharacter1")+1250,alpha = 1},crochet*0.006,"quadOut")
        tweenShader('bars','angle1',0,crochet*0.008,"cubeOut")
        matt = true
       st(true,true,'mirror2','dist','dist',-0.5,0,16,crochet,"cubeOut")
        tweenShader('bars','effect',0,crochet*0.004,"quadOut")
        bloomBurst(8,8,"quadOut",false)
        st(true,true,'bloom','brightness','brightness',1,0,4,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.25,1,8,crochet,"cubeOut")
        mirror(true,true,"angle","angle",90,0,8,crochet,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.064,"cubeIn")
    elseif curStep == 256 then
        bf,shaggy = false,true
         mirror(false,true,"","x",0,-0.5,4,crochet,"cubeOut")
        mirror(false,true,"","Xdirection",0,1.25,4,crochet,"cubeOut")
    elseif curStep == 272 or curStep == 336 then
        for _,v in pairs({"x","angle","Xdirection"}) do mirror(false,true,"",v,0,0,4,crochet,"quadIn") end
        tweenShader('bump','barrel',0,crochet*0.004,"cubeIn")
    elseif curStep == 288 or curStep == 352 then
         bloomBurst(8,16,"cubeOut",false)
          tweenShader('bars','effect',0.15,crochet*0.002,"cubeOut")
        mirror(false,true,"","zoom",0,0.9,3,crochet,"cubeOut")
        mirror(true,true,"angle","angle",25,0,4,crochet,"cubeOut")
    elseif curStep == 300 or curStep == 364 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
          tweenShader('bars','effect',0.1,crochet*0.001,"cubeIn")
     elseif curStep == 304 then
        coloresActor(false,true,"dadCharacter0",255,25,0,0,crochet,4,"cubeIn")
         tween("blackBG",{alpha=1},crochet*0.004,"cubeIn")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-25,0,2,crochet,"cubeOut")
     elseif curStep == 308 or curStep == 316 then
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
     elseif curStep == 312 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",25,0,2,crochet,"cubeOut")
     elseif curStep == 320 then
        lol = false
         coloresActor(false,true,"dadCharacter0",255,25,0,1,crochet,2,"cubeOut")
         tween("blackBG",{alpha=0.45},crochet*0.002,"cubeOut")
        bf,shaggy = true,false
        tweenShader('bump','barrel',-1,crochet*0.004,"cubeOut")
         bloomBurst(8,8,"quadOut",false)
        mirror(true,true,"angle","angle",0,-15,4,crochet,"cubeOut")
          mirror(false,true,"","x",0,0.5,4,crochet,"cubeOut")
        mirror(false,true,"","Xdirection",0,-1.25,4,crochet,"cubeOut")
     elseif curStep == 368 then
         tweenShader('bump','barrel',-2,crochet*0.004,"cubeIn")
                 mirror(false,true,"","angle",0,90,4,crochet,"cubeIn")
         fadeCamera("other","#FFFFFF",crochet*0.004,false,false)
         mirror(false,true,"","zoom",0,13,4,crochet,"cubeIn")
     elseif curStep == 376 then
        tweenShader('bloom','brightness',-1,crochet*0.002,"cubeIn")
     elseif curStep == 384 then
        bf = false set("defaultCamZoom", 0.55)
         mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        tweenShader('bloom','brightness',0,crochet*0.002,"cubeOut")
         tweenShader('bump','barrel',0,crochet*0.004,"cubeOut")
        mirror(true,true,"zoom","zoom",0.25,1,8,crochet,"cubeOut")
        tweenShader('bars','effect',0.05,crochet*0.0001,"cubeOut")
        mirror(true,true,"y","y",1,0,6,crochet,"cubeOut")
        fadeCamera("other","#FFFFFF",crochet*0.002,true,true)
         hud(0, crochet, 4, 'cubeOut')
         tweenShader('bars','effect',0.17,crochet*0.004,"quadOut")
          tweenShader('bars','angle1',10,crochet*0.004,"quadOut")
         tweenShader('fish','power',0.15,crochet*0.002,"cubeOut") 
     elseif curStep == 448 then
          tweenShader('bars','angle1',-10,crochet*0.002,"quadOut")
    elseif curStep == 496 then
          tweenShader('bars','angle1',10,crochet*0.004,"cubeIn")
     elseif curStep == 512 then
          tweenShader('bars','angle1',0,crochet*0.002,"quadOut")
    end
parte1(384,true)
   parte1(448,false)
    local cycle = (curStep >= 240) and 1 or 0
    local dir = (cycle == 1) and -1 or 1  
    if curStep == 176 or curStep == 240 then
               tweenShader('fish','power',0.5,crochet*0.004,"cubeIn") 
         tween("blackBG",{alpha=1},crochet*0.004,"cubeIn")
          coloresActor(false,true,"dadCharacter1",25,112,255,0,crochet,3,"cubeIn")
           coloresActor(false,true,"boyfriend",238,92,164,0,crochet,3,"cubeIn")
        tweenShader('mirror2','zoom',1.5,crochet*0.001,"quadOut")
        tweenShader('mirror2','angle',15 * dir,crochet*0.001,"quadOut")
    elseif curStep == 182 or curStep == 246 then
        tweenShader('mirror2','zoom',1.75,crochet*0.001,"quadOut")
        tweenShader('mirror2','angle',-15 * dir,crochet*0.001,"quadOut")
    elseif curStep == 186 or curStep == 250 then
        tweenShader('bump','barrel',-2,crochet*0.0015,"quadIn")
        tweenShader('mirror2','angle',90 * dir,crochet*0.0015,"quadIn")
        tweenShader('mirror2','zoom',2.25,crochet*0.0015,"quadIn")
    elseif curStep == 192 or curStep == 256 then
              tweenShader('fish','power',0,crochet*0.004,"cubeOut") 
             coloresActor(false,true,"dadCharacter1",25,112,255,1,crochet,4,"cubeOut")
            coloresActor(false,true,"boyfriend",238,92,164,1,crochet,4,"cubeOut")
         tween("blackBG",{alpha=0.45},crochet*0.002,"cubeOut")
         if curStep == 192 then matt,bf = false,true end
        tweenShader('bump','barrel',0,crochet*0.004,"cubeOut")
         st(true,true,'mirror2','dist','dist',-0.35,0,8,crochet,"cubeOut")
        st(true,true,'mirror2','zoom','zoom',0.25,1,8,crochet,"cubeOut")
        st(true,true,'mirror2','angle','angle',-90 * dir,0,8,crochet,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
    end
    if curStep == 512 then

    elseif curStep == 524 then
        tweenShader('mirror3','x',1,crochet*0.003,"quadInOut")
    elseif curStep == 528 then
        shaggy = true
    elseif curStep == 532 then
         mirror(false, true, "", "zoom", 0, 0.7, 1, crochet, "backIn")
    elseif curStep == 536 then
         mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeOut")
        angle = 15
    elseif curStep == 544 then
        tweenShader('bars','angle1',0,crochet*0.004,"cubeOut")
         tweenShader('bump','barrel',-1,crochet*0.008,"cubeIn")
         mirror(false, true, "", "zoom", 0, 1.5, 2, crochet, "cubeOut")
    elseif curStep == 548 then
         tweenShader('mirror3','x',2,crochet*0.003,"quadInOut")
    elseif curStep == 556 then
        mirror(false, true, "", "zoom", 0, 2.5, 1, crochet, "cubeIn")
     elseif curStep == 560 then
        tweenShader('bloom','brightness',1,crochet*0.004,"cubeIn")
        mirror(false, true, "", "angle", 0, 180, 4, crochet, "cubeIn")
        mirror(false, true, "", "zoom", 0, 3, 2, crochet, "cubeOut")
     elseif curStep == 568 then
         mirror(false, true, "", "zoom", 0, 0.25, 2, crochet, "cubeIn")
         tweenShader('mirror3','y',4,crochet*0.004,"cubeInOut")
          tweenShader('bars','effect',0.55,crochet*0.002,"cubeIn")
     elseif curStep == 572 then
          tweenShader('color','hueShift',0.2,crochet*0.001,"cubeIn")
     elseif curStep == 576 then
        angle,x = 15,0.1  bloomBurst(4,8,"quadOut",false)
        shaggy = false
          tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
        tweenShader('bars','effect',0.1,crochet*0.002,"cubeOut")
         tweenShader('bloom','brightness',0,crochet*0.002,"cubeIn")
        mirror(true, true, "angle", "angle", -90, 0, 2, crochet, "cubeOut")
        mirror(false, true, "", "zoom", 0, 1, 3, crochet, "cubeOut")
     elseif curStep == 584 then
         tweenShader('mirror3','x',3,crochet*0.003,"quadInOut")
     elseif curStep == 588 then
         tweenShader('color','hueShift',0.4,crochet*0.001,"cubeIn")
        mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "cubeIn")
        mirror(false, true, "", "x", 0, 0.3, 1, crochet, "cubeIn")
         mirror(false, true, "", "angle", 0, -25, 1, crochet, "cubeIn")
         tweenShader('bars','effect',0.15,crochet*0.001,"cubeIn")
     elseif curStep == 592 or curStep == 608 then
        mirror(false, true, "", "x", 0, 0, 1, crochet, "cubeOut")
         mirror(false, true, "", "angle", 0, 0, 1, crochet, "cubeOut")
        angle,x = -15,-0.1  bloomBurst(4,8,"quadOut",false)
     elseif curStep == 600 then
         tweenShader('mirror3','x',4,crochet*0.003,"quadInOut")
        elseif curStep == 604 then
             tweenShader('color','hueShift',0.6,crochet*0.001,"cubeIn")
        mirror(false, true, "", "zoom", 0, 2.5, 1, crochet, "cubeIn")
        mirror(false, true, "", "x", 0, -0.3, 1, crochet, "cubeIn")
         mirror(false, true, "", "angle", 0, 25, 1, crochet, "cubeIn")
         tweenShader('bars','effect',0.25,crochet*0.001,"cubeIn")
        elseif curStep == 616 then
            angle = 15,-0.1
        elseif curStep == 620 then
             tweenShader('color','hueShift',1,crochet*0.005,"cubeInOut")
            luna= true
            setProperty('','cameraSpeed',1)
           mirror(false, true, "", "zoom", 0, 0.7, 5, crochet, "cubeInOut") 
        elseif curStep == 624 then
            tweenShader('bump','barrel',-2,crochet*0.004,"cubeIn")
              tweenShader('bloom','brightness',1,crochet*0.004,"cubeIn")
             tweenShader('mirror3','zoom',1,crochet*0.001,"quadOut")
             mirror(true, true, "y", "y", 0, -2, 4, crochet, "quadIn") 
        elseif curStep == 632 then
                     tweenShader('fish','power',0,crochet*0.002,"cubeIn") 
             tweenShader('bars','effect',0.55,crochet*0.002,"cubeIn")
        elseif curStep == 640 then
                     tweenShader('fish','power',0.15,crochet*0.004,"cubeOut") 
            luna = false   set("defaultCamZoom", 0.55)
              hud(1, crochet, 8, 'cubeOut')
              mirror(true, true, "y", "y", 1, 0, 4, crochet, "cubeOut") 
             tweenShader('bloom','brightness',0,crochet*0.002,"cubeOut")
           -- setShaderProperty("bars","angle1",90)
             tweenShader('bars','effect',0,crochet*0.004,"cubeOut")
             tweenShader('bump','barrel',0,crochet*0.004,"cubeOut")
              mirror(true, true, "zoom", "zoom", 0, 1, 6, crochet, "cubeOut") 
              
     end
    if curStep >= 384 and curStep < 624 then
        if curStep % 8 == 0 then
            tweenShader('mirror3','zoom',1,crochet*0.001,"quadOut")
        elseif curStep % 8 == 4 then
           tweenShader('mirror3','zoom',0.8,crochet*0.001,"cubeIn")
        end
    end

    if curStep >= 128 and curStep < 288 then
        if curStep % 32 == 0 then
            lol = false
          elseif curStep % 32 == 20 then
            local sign = (math.floor(curStep / 32) % 2 == 0) and 1 or -1
            mirror(false, true, "", "zoom", 0, 0.7, 1, crochet, "quadIn")
            mirror(false, true, "", "angle", 0, 15 * sign, 1, crochet, "quadIn")
        elseif curStep % 32 == 24 then
            lol = true
            mirror(false, true, "", "angle", 0, 0, 2, crochet, "quadOut")
            mirror(false, true, "", "zoom", 0, 1, 2, crochet, "quadOut")
            
        end
    end
    drop(1152)
    mitadtext(1408)
end
function parte1(s, q)
    if curStep == s+16 then
        tweenShader('fish','power',0.25,crochet*0.001,"cubeOut") 
        coloresActor(false,true,"dadCharacter0",255,25,0,0,crochet,1,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,0,crochet,1,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,0,crochet,1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        y, angle = 0.3, 25
        bloomBurst(4,8,"quadOut",false)
        mirror(true,true,"Ydirection","Ydirection",1.5,0,2,crochet,"cubeOut")
        st(true,true,'mirror2','dist','dist',0,-0.2,1,crochet,"cubeOut")
        if q then
            st(true,true,'color','hueShift','hueShift',0.8,1,2,crochet,"linear")
        else
            st(true,true,'color','hueShift','hueShift',-0.1,0.25,2,crochet,"linear")
        end
    elseif curStep == s+20 or curStep == s+28 then
        tweenShader('fish','power',0,crochet*0.001,"cubeIn") 
        coloresActor(false,true,"dadCharacter0",255,25,0,1,crochet,1,"cubeIn")
        coloresActor(false,true,"dadCharacter1",25,112,255,1,crochet,1,"cubeIn")
        coloresActor(false,true,"boyfriend",238,92,164,1,crochet,1,"cubeIn")
        tweenShader('mirror2','dist',0,crochet*0.001,"cubeIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == s+24 then
        tweenShader('fish','power',0.25,crochet*0.001,"cubeOut") 
         coloresActor(false,true,"dadCharacter0",255,25,0,0,crochet,1,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,0,crochet,1,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,0,crochet,1,"cubeOut")
        mirror(true,true,"Ydirection","Ydirection",-1.5,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        y, angle = -0.3, -25
        bloomBurst(4,8,"quadOut",false)
        st(true,true,'mirror2','dist','dist',0,-0.2,1,crochet,"cubeOut")
        if q then
            st(true,true,'color','hueShift','hueShift',0.25,0,2,crochet,"linear")
        else
            st(true,true,'color','hueShift','hueShift',0.5,0,2,crochet,"linear")
        end

    elseif curStep == s+32 then
        if q then
        matt = true
        angle, x = 15, 0.1
         mirror(false,true,"","Xdirection",0,1.5,1,crochet,"quadOut")
         mirror(false,true,"","y",0,1,2,crochet,"quadOut")
          mirror(false,true,"","x",0,-0.3,3,stepCrochet,"quadOut")
        else
            mirror(false,true,"","angle",0,15,4,stepCrochet,"quadOut")
             mirror(false,true,"","x",0,-0.5,4,stepCrochet,"quadOut")
        end
        tweenShader('mirror2','dist',0,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif (curstep == s+35 or curStep == s+41) and q  then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        mirror(false,true,"","x",0,0,3,stepCrochet,"cubeIn")
    elseif (curStep == s+36 or curStep == s+44 )and not q then
        mirror(false,true,"","angle",0,0,4,stepCrochet,"cubeIn")
             mirror(false,true,"","x",0,0,4,stepCrochet,"cubeIn")
    elseif curStep == s+38 and q then
        angle, x = -15, -0.1
        mirror(false,true,"","Xdirection",0,-1.5,1,crochet,"quadOut")
        mirror(false,true,"","x",0,0.3,3,stepCrochet,"quadOut")
    elseif curStep == s+40 and not q then
         mirror(false,true,"","angle",0,-15,4,stepCrochet,"quadOut")
             mirror(false,true,"","x",0,0.5,4,stepCrochet,"quadOut")
    elseif curStep == s+44 and q then
        mirror(false,true,"","Xdirection",0,0,2,crochet,"quadOut")
        mirror(false,true,"","x",0,-2,2,crochet,"quadOut")
        angle, x = 15, 0.1
        mirror(false,true,"","y",0,2,3,crochet,"quadOut")
    elseif curStep == s+48 then
          tweenShader('fish','power',0.25,crochet*0.004,"cubeIn") 
        if q then
        tweenShader('mirror2','zoom',2.5,crochet*0.002,"cubeOut")
        mirror(true,true,"barrel","barrel",-1,0,2,crochet,"cubeOut")
        else
            mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
              mirror(false,true,"","angle",0,180,4,crochet,"quadInOut")
             tweenShader('bump','barrel',-1,crochet*0.004,"cubeIn")
             st(true,true,'mirror2','x','x',-2,0,4,crochet,"cubeIn")

        end
    elseif curStep == s+52 and not q then
        
       -- mirror(false,true,"","zoom",0,2.5,1,crochet,"quadIn")

    elseif curStep == s+56 then
        if q then
        setShaderProperty("jitter","gAmnt",0.15)
        tweenShader('bump','barrel',-1,crochet*0.002,"cubeIn")
        tweenShader('mirror2','zoom',0.8,crochet*0.002,"cubeIn")
        tweenShader('mirror2','angle',-25,crochet*0.002,"cubeIn")
        else
              mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
            end
    elseif curStep == s+60 and not q then
       --   mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        tweenShader('blur','amt',2,crochet*0.001,"cubeIn")
    elseif curStep == s+64  then
               tweenShader('fish','power',0.15,crochet*0.002,"quadOut") 
        if q then
        matt, bf = false, true
        setShaderProperty("jitter","gAmnt",0)
        bloomBurst(8,8,"quadOut",false)
        tweenShader('bump','barrel',0,crochet*0.002,"quadOut")
        tweenShader('mirror2','zoom',1,crochet*0.002,"quadOut")
        tweenShader('mirror2','angle',0,crochet*0.002,"quadOut")
        else
            bloomBurst(8,8,"quadOut",false)
            bf = false
            tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
           -- tweenShader('mirror3','zoom',1,crochet*0.004,"cubeOut")
            mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
            tweenShader('blur','amt',0,crochet*0.002,"cubeOut") 
            mirror(false,true,"","angle",0,360,3,crochet,"cubeOut")
        end
    end

    if q and curStep >= s+56 and curStep < s+64 and curStep % 2 == 0 then
        local sign = (math.floor(curStep / 2) % 2 == 0) and 0.15 or -0.15
        mirror(true,true,"x","x",sign,0,0.5,crochet,"quadOut")
    end
end
function drop(s)
    if curStep >= s and curStep < s+256 then
        if curStep % 16 == 0 then
             tweenShader('greyscale','strength',0,crochet*0.002,"cubeOut") 
        elseif curStep % 16 == 8 then
             tweenShader('greyscale','strength',1,crochet*0.002,"cubeIn") 
        end
         if curStep % 8 == 0 then
            tweenShader('mirror3','zoom',1,crochet*0.001,"quadOut")
        elseif curStep % 8 == 4 then
           tweenShader('mirror3','zoom',0.87,crochet*0.001,"cubeIn")
        end
    end
    if curStep >= s+48 and curStep < s+64 then
        if curStep % 8 == 0 then
            st(true,true,'mirror3','y','y',-0.1,0,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
            st(true,true,'mirror3','y','y',0.1,0,1,crochet,"cubeOut")
        end
    end
    if curStep >= s+160 and curStep < s+176 then
        if curStep % 4 == 0 then
            angle = 10
        elseif curStep % 4 == 2 then
            angle = -10
        end
    end
    if curStep == s then
      --  set("dadCharacter0.y",getActorY("dadCharacter0")+1000)
      --  set("dadCharacter1.y",getActorY("dadCharacter1")+1000)
       -- tween("dadCharacter0",{y = getActorY("dadCharacter0")-1000},crochet*0.003,"cubeOut")
       -- tween("dadCharacter1",{y = getActorY("dadCharacter1")-1000},crochet*0.003,"cubeOut")
        lol = true setShaderProperty("jitter","gAmnt",0.005)
        flashCamera("game","",crochet*0.002)
                setShaderProperty('color','hueShift',1.1)
        shaggy = true  screenShake(0.008,256,false,"game")
         tweenShader('bars','effect',0.1,crochet*0.004,"cubeOut") 
         tweenShader('bump','barrel',-2,crochet*0.004,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
         mirror(false,true,"","angle",0,25,2,crochet,"cubeOut")
       st(true,true,'mirror3','y','y',-4,0,4,crochet,"cubeOut")
    elseif curStep == s+8 or curStep == s+72 then
                mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
              mirror(false,true,"","angle",0,-25,2,crochet,"cubeIn")
    elseif curStep == s+16 then
         tween("blackBG",{alpha = 1},crochet*0.004,"cubeIn")
        tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
             mirror(false,true,"","angle",0,0,2,crochet,"cubeOut") 
            angle,x = 15,0.1
    elseif curStep == s+20 or curStep == s+28 then
    
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == s+24 then
        angle,x = -15,-0.1
         tweenShader('mirror2','x',2,crochet*0.004,"cubeInOut")
         mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+32 then
        angle,y = 15,0.1  mirror(true,true,"Ydirection","Ydirection",1.5,0,2,crochet,"cubeOut")
         mirror(false,true,"","angle",0,360,3,crochet,"cubeOut")
         coloresActor(false,true,"dadCharacter0",255,25,0,0,crochet,4,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,0,crochet,4,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,0,crochet,4,"cubeOut")
        tweenShader('mirror2','dist',-0.25,crochet*0.004,"cubeIn")
         tween("blackBG",{alpha = 0.45},crochet*0.002,"cubeOut")
           mirror(false,true,"","zoom",0,1.5,3,crochet,"cubeOut")
            tweenShader('bars','effect',0.2,crochet*0.003,"cubeOut") 
    elseif curStep == s+40 then
          angle,y = -15,-0.1  mirror(true,true,"Ydirection","Ydirection",-1.5,0,2,crochet,"cubeOut")
         tween("blackBG",{alpha = 0.9},crochet*0.002,"cubeIn")
    elseif curStep == s+44 then
        tweenShader('bars','effect',0.3,crochet*0.001,"cubeIn") 
         tweenShader('bump','barrel',-1,crochet*0.001,"cubeIn")
         mirror(true,true,"angle","angle",0,-45,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeIn")
    elseif curStep == s+48 then
        angle = 15
          mirror(false,true,"","angle",0,-90,1,crochet,"cubeIn")
    elseif curStep == s+52 then
        angle = -15
         mirror(false,true,"","zoom",0,3,1,crochet,"cubeIn")
          mirror(false,true,"","angle",0,-135,1,crochet,"cubeIn")
    elseif curStep == s+56 then
        
        angle = 15
         tweenShader("bloom","brightness",1,crochet*0.002,"cubeIn")
        tweenShader("jitter","gAmnt",0.03,crochet*0.0017,"cubeIn")
        tweenShader('bars','angle1',-90,crochet*0.002,"cubeIn") 
        tweenShader('bars','effect',0.55,crochet*0.002,"cubeIn") 
         tweenShader('mirror2','x',2,crochet*0.004,"cubeInOut")
          mirror(false,true,"","angle",0,-180,1,crochet,"cubeIn")
           tweenShader('bump','barrel',0,crochet*0.002,"cubeIn")
    elseif curStep == s+60 then
        angle = -15
         mirror(false,true,"","zoom",0,4,1,crochet,"cubeIn")
          mirror(false,true,"","angle",0,-360,1,crochet,"cubeIn")
    elseif curStep == s+64 then
        shaggy,bf = false,true
        tweenShader("bloom","brightness",0,crochet*0.001,"cubeOut")
        setShaderProperty("jitter","gAmnt",0.005)
           coloresActor(false,true,"dadCharacter0",255,25,0,1,crochet,1,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,1,crochet,1,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,1,crochet,1,"cubeOut")
         tween("blackBG",{alpha = 0.45},crochet*0.004,"cubeIn")
        tweenShader('mirror2','dist',0,crochet*0.002,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
        tweenShader('bump','barrel',-2,crochet*0.004,"cubeIn")
         mirror(true,true,"zoom","zoom",1,2.5,2,crochet,"cubeOut")
         mirror(false,true,"","angle",0,25,2,crochet,"cubeOut")
       st(true,true,'mirror3','y','y',4,0,4,crochet,"cubeOut")
           tweenShader('bars','effect',0.1,crochet*0.004,"cubeOut") 
    elseif curStep == s+80 then
        tweenShader('bars','effect',0.25,crochet*0.004,"cubeIn") 
       tween("blackBG",{alpha = 1},crochet*0.004,"cubeIn")
       st(true,true,'mirror3','x','x',0,1,2,crochet,"cubeOut")
        tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut") 
        angle,x = 15,0.1
    elseif curStep == s+84 then
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+88 then
        angle,x = -15,-0.1
        bloomBurst(8,8,"quadOut",false)
        tweenShader('mirror3','x',2,crochet*0.002,"cubeOut")
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+92 then
       -- st(true,true,'mirror3','y','y',-2,0,3,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,10,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,90,1,crochet,"cubeIn")
    elseif curStep == s+96 then--1248
         tweenShader('bars','angle1',0,crochet*0.003,"cubeOut")
         coloresActor(false,true,"boyfriend",238,92,164,0,crochet,1,"cubeOut")
        tweenShader('bump','barrel',-1,crochet*0.002,"cubeOut")
          mirror(true,true,"zoom","zoom",0.25,1.5,4,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-90,0,4,crochet,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
    elseif curStep == s+108 then
        angle = 15
        st(true,true,'mirror3','y','y',-2,0,3,crochet,"cubeInOut")
    elseif curStep == s+112 then
        angle = -15
         coloresActor(false,true,"boyfriend",238,92,164,1,crochet,4,"cubeIn")
         tween("blackBG",{alpha = 0.45},crochet*0.004,"cubeIn")
          tweenShader('mirror2','dist',-0.35,crochet*0.004,"cubeIn")
         mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == s+120 then
        angle = 15
         tweenShader("bloom","brightness",1,crochet*0.002,"cubeIn")
        tweenShader("jitter","gAmnt",0.03,crochet*0.0017,"cubeIn")
         tweenShader("bars","effect",0.55,crochet*0.002,"cubeIn")
        mirror(false,true,"","angle",0,90,2,crochet,"cubeIn")
         mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        --st(true,true,'mirror2','x','x',-2,0,2,crochet,"quadIn")
    elseif curStep == s+124 then
        mirror(false,true,"","zoom",0,5,1,crochet,"cubeIn")
    elseif curStep == s+128 then --1280
        tweenShader("bloom","brightness",0,crochet*0.001,"cubeOut")
        bf ,shaggy = false,true   setShaderProperty("jitter","gAmnt",0.005)
        tweenShader('mirror2','dist',0,crochet*0.002,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
        tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
         mirror(true,true,"zoom","zoom",1,2,1,crochet,"cubeOut")
         mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
      -- st(true,true,'mirror3','y','y',-4,0,4,crochet,"cubeOut")
           tweenShader('bars','effect',0.1,crochet*0.004,"cubeOut") 
            st(true,true,'mirror3','x','x',0,1,2,crochet,"cubeOut")
    elseif curStep == s+132 then
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+136 then
                    st(true,true,'mirror3','x','x',1,2,2,crochet,"cubeOut")
         bloomBurst(8,8,"quadOut",false)
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+140 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == s+144 then
         mirror(false,true,"","angle",0,-180,4,crochet,"cubeIn")
        tweenShader("bars","effect",0.35,crochet*0.004,"cubeIn")
         mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tween("blackBG",{alpha = 1},crochet*0.004,"cubeIn")
        tweenShader('mirror2','dist',-0.3,crochet*0.004,"cubeIn")
         tweenShader('fish','power',0.35,crochet*0.004,"cubeIn") 
    elseif curStep == s+152 then
        angle = -15
         mirror(false,true,"","zoom",0,0.6,2,crochet,"cubeIn")
           st(true,true,'mirror3','y','y',0,4,4,crochet,"cubeInOut")
    --elseif curStep == s+156 then
    elseif curStep == s+160 then
        tweenShader("bars","effect",0.15,crochet*0.002,"cubeOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",90,0,4,crochet,"cubeOut")
        bloomBurst(8,8,"quadOut",false)
         setShaderProperty("jitter","gAmnt",0.01)
        coloresActor(false,true,"dadCharacter0",255,25,0,0,crochet,1,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,0,crochet,1,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,0,crochet,1,"cubeOut")
    elseif curStep == s+168 then
         mirror(false,true,"","zoom",0,5,2,crochet,"cubeIn")
        tween("blackBG",{alpha = 0.45},crochet*0.002,"cubeIn")
         tweenShader('fish','power',0.15,crochet*0.002,"cubeIn") 
    elseif curStep == s+176 then
         tweenShader('bars','angle1',90,crochet*0.004,"cubeOut")
         tweenShader('bump','barrel',-1,crochet*0.004,"cubeIn")
        mirror(true,true,"zoom","zoom",0.25,2,4,crochet,"cubeOut")
         bloomBurst(8,8,"quadOut",false)
         mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
         coloresActor(false,true,"dadCharacter0",255,25,0,1,crochet,1,"cubeOut")
        coloresActor(false,true,"dadCharacter1",25,112,255,1,crochet,1,"cubeOut")
        coloresActor(false,true,"boyfriend",238,92,164,1,crochet,1,"cubeOut")
    elseif curStep == s+184 then
         tweenShader('bars','effect',0.55,crochet*0.002,"cubeIn")
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
         tweenShader('mirror2','dist',0,crochet*0.002,"cubeIn")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeIn")
    elseif curStep == s+192 then
                posiciones("game")
          bf ,shaggy = true,false
          setShaderProperty("jitter","gAmnt",0.005)
        tweenShader('bump','barrel',0,crochet*0.002,"cubeOut")
        tweenShader('bars','effect',0.2,crochet*0.002,"cubeOut")
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(true,true,"angle","angle",90,0,4,crochet,"cubeOut")
    end
    if curStep == s+140 then
        angle = 15
    end

end
function mitadtext(s)
    if curStep == s then 
        bloomShake(4, 16, "cubeOut")
        tweenShader('blur','amt',2.5,crochet*0.002,"cubeOut") 
        tweenShader('bars','effect',0.15,crochet*0.008,"cubeOut") 
        tweenShader('greyscale','strength',1,crochet*0.002,"cubeOut") 
        set("uno.angleY",-90)
        tween("uno",{angleY = 0},crochet*0.0055,"quadOut")
        set("render.y",850)
        tween("render",{y = 90},crochet*0.008,"cubeOut")
    elseif curStep == s+16 then
        set("render.angleY",-55)
        tween("render",{angleY = 0},crochet*0.004,"cubeOut")

    elseif curStep == s+20 then tween("uno",{angleY = 90},crochet*0.006,"cubeIn")
    elseif curStep == s+32 then tweenShader('bars','effect',0,crochet*0.008,"cubeIn")
    elseif curStep == s+40 then
        tween("uno",{alpha = 0, y = 200},crochet*0.002,"cubeIn")
        set("render.angleY",55)
        tween("render",{angleY = 0},crochet*0.002,"cubeOut")

    elseif curStep == s+44 then tween("render",{y = 850},crochet*0.005,"cubeIn")


    elseif curStep == s+48 then
        tweenShader('bars','effect2',0.1,crochet*0.002,"cubeOut") 
        set("render.angleY",-55)
        tween("render",{angleY = 0},crochet*0.002,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        set("dos.angleY",-90)
        tween("dos",{angleY = 0},crochet*0.002,"cubeOut")

    elseif curStep == s+56 then 
        tweenShader('bars','effect2',0.55,crochet*0.002,"cubeIn") 
        tweenShader('blur','amt',0,crochet*0.002,"cubeIn") 
        tweenShader('greyscale','strength',0,crochet*0.002,"cubeIn") 
        mirror(false,true,"","zoom",0,13,2,crochet,"cubeIn")
        tween("dos",{angleY = 90},crochet*0.002,"cubeIn")

    elseif curStep == s+60 then tween("dos",{alpha = 0},crochet*0.002)
    elseif curStep == s+64 then
        setProperty('', 'cameraSpeed', 3)
        set("defaultCamZoom", 0.66)
        tweenShader('bars','angle2',90,crochet*0.004,"quadOut")
        tweenShader('bars','effect2',0.1,crochet*0.004,"quadOut")
        bloomShake(4, 16, "cubeOut")
        st(true,true,'bloom','brightness','brightness',1,0,4,crochet,"cubeOut")
        setShaderProperty('color','hueShift',1.1)
        mirror(true,true,"zoom","zoom",0.25,1,4,crochet,"cubeOut")

    elseif curStep == s+104 then
        st(true,true,'blur','amt','amt',2,0,2,crochet,"cubeOut")
        screenShake(0.07,8,true,"game")

    elseif curStep == s+120 then
        bloomShake(4,10,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")

    elseif curStep == s+124 then mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+128 then
        mirror(true,true,"barrel","barrel",0.25,0,3,crochet,"cubeOut")
        bloomShake(4,10,"cubeOut")
    elseif curStep == s+152 or curStep == s+344 then
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
    elseif curStep == s+160 then
        bloomShake(4,10,"cubeOut")
        mirror(false,true,"","zoom",0,1,1.5,crochet,"cubeOut")
    elseif curStep == s+176 then mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")

  
    elseif curStep == s+184 then
        mirror(false,true,"","zoom",0,10,2,crochet,"cubeIn")
        tween("blackBG",{alpha=1},crochet*0.002,"cubeIn")
        tweenShader('bars','effect2',0,crochet*0.002,"cubeIn")
        mirror(false,true,"","Ydirection",0,1,2,crochet,"cubeIn")
        tweenShader('bloom','brightness',-1,crochet*0.002,"cubeIn")

    elseif curStep == s+192 then
        mirror(true,true,"Ydirection","Ydirection",-1,0,4,crochet,"cubeOut")
        tweenShader('bars','angle2',0,crochet*0.002,"cubeOut")
        st(true,true,'bloom','brightness','brightness',1,0,4,crochet,"cubeOut")

     
        setShaderProperty('glowBorder','transparency2',0.2)
        setShaderProperty('vignette','size',0.5)
        setShaderProperty('greyscale','strength',0.8)
        setShaderProperty('tvdist','bottomStaticOpt',0.5)
        setShaderProperty('tvdist','scalinesOpt',1)
        setShaderProperty('tvdist','horzFuzzOpt',1.2)
        setShaderProperty('tvdist','rgbOffsetOpt',1)

        bloomShake(4,16,"cubeOut")
        tween("blackBG",{alpha=0.2},crochet*0.002,"cubeOut")
        setShaderProperty('color','hueShift',0.15)

        mirror(false,true,"","x",0,-0.3,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,4,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",0.25,1,4,crochet,"cubeOut")
        mirror(false,true,"","Xdirection",0,1.25,4,crochet,"cubeOut")

    elseif (curStep == s+192+16 or curStep == s+192+48 or curStep == s+192+144 or curStep == s+192+144+32) then
        for _,v in pairs({"x","angle","Xdirection"}) do
            mirror(false,true,"",v,0,0,4,crochet,"cubeIn")
        end
    elseif curStep == s+192+24 then
        tweenShader('bloom','brightness',1,crochet*0.002,"cubeIn")

    elseif (curStep == s+192+32 or curStep == s+192+144+16) then
        mirror(false,true,"","Xdirection",0,-1.25,4,crochet,"cubeOut")
        mirror(false,true,"","x",0,0.25,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,4,crochet,"cubeOut")
        tweenShader('bloom','brightness',0,crochet*0.004,"cubeOut")

    elseif (curStep == s+192+64 or curStep == s+192+40 or curStep == s+192+144+24) then
        bloomShake(4,10,"cubeOut")

    elseif curStep == s+192+96 then mirror(true,true,"angle","angle",25,0,2,crochet,"cubeOut")
    elseif curStep == s+192+104 then
        bloomShake(8,10,"cubeOut")
        mirror(true,true,"angle","angle",-25,0,2,crochet,"cubeOut")
    elseif curStep == s+192+112 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",25,0,2,crochet,"cubeOut")
    elseif curStep == s+192+116 then mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+192+120 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-25,0,2,crochet,"cubeOut")
    elseif curStep == s+192+124 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")

    elseif curStep == s+192+128 then
        bloomShake(8,16,"cubeOut")
        mirror(false,true,"","Xdirection",0,1.25,4,crochet,"cubeOut")
        mirror(false,true,"","x",0,-0.3,4,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,15,4,crochet,"cubeOut")
    end

  if curStep == s+352 then
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        
    elseif curStep == s+192+144+32 then--1776
            tween("a",{y = -200,angle = 180},crochet*0.004,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    elseif curStep == s+192+144+36 then -- 1780 
          tween("i made it",{angleY = 0},crochet*0.002,"cubeOut")
    elseif curStep == s+192+144+38 then
           tweenShader('vidrio','strength',1,crochet*0.0015,"cubeOut")
    elseif curStep == s+192+144+40 then
         -- tweenShader('Glitchy','AMT',0.3,crochet*0.001,"cubeOut") 
          tween("blackBG",{alpha = 1},crochet*0.002,"cubeOut")
              tween("camOther",{zoom = 1.55},crochet*0.002,"cubeOut")
           tweenShader('blur','amt',3,crochet*0.002,"cubeOut") 
           tweenShader('ca','strength',0.03,crochet*0.001,"cubeOut") 
          screenShake(0.07, 8, true, "game")
            screenShake(0.07, 8, true, "other")
    elseif curStep == s+192+144+44 then
         tweenShader('bloom','brightness',-1,crochet*0.001,"cubeIn") 
          tweenShader('vidrio','zoom',3,crochet*0.001,"cubeIn") 
         tweenShader('vidrio','strength',1.5,crochet*0.001,"cubeIn") 
         tween("i made it",{angleY = 90,y = 200},crochet*0.001,"cubeIn")
           tween("i made it",{alpha = 0},crochet*0.002)
             mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+192+144+48 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
               bloomBurst(8,2,"cubeOut",false)
                 screenShake(0.02, 64, false, "game")
         tween("blackBG",{alpha = 0},crochet*0.001,"cubeOut")
        tweenShader('bars','effect',0.1,crochet*0.002,"cubeOut") 
        tweenShader('ca','strength',0,crochet*0.0001,"cubeOut") 
         tweenShader('blur','amt',3,crochet*0.012,"cubeIn") 
        tweenShader('Glitchy','AMT',0,crochet*0.0001,"cubeOut") 
         st(true,true,'bloom','brightness','brightness',1,0,4,crochet,"cubeOut")
         mirror(true,true,"angle","angle",180,15,1,crochet,"cubeOut")
    elseif curStep == s+192+144+52 then
         mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
     elseif curStep == s+192+144+56 then
        bloomBurst(8,2,"cubeOut",false)
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        tweenShader('bars','effect2',0.1,crochet*0.002,"cubeOut") 
     elseif curStep == s+192+144+60 then
        mirror(false,true,"","angle",0,-75,1,crochet,"cubeIn")
     elseif curStep == s+192+144+64 then
         bloomBurst(8,2,"cubeOut",false)
          tweenShader('bars','effect',0.2,crochet*0.002,"cubeOut") 
         mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
         mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
     elseif curStep == s+192+144+68 then
        mirror(false,true,"","angle",0,15,1,crochet,"cubeIn")
    elseif curStep == s+192+144+72 then
        mirror(false,true,"","y",0,2,2,crochet,"cubeOut")
          mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShader('bars','effect2',0.2,crochet*0.002,"cubeOut") 
          bloomBurst(8,2,"cubeOut",false)
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    end
end
function playerTwoSing(data, time, type)
    if lol  then -- o cualquier condición que se cumpla solo una vez
        FDGODTrail('dadCharacter0', data)
        FDGODTrail('dadCharacter1', data)
    end
end

local trailCount = 0
local trailLimit = 10
local zigzagDir = 1
local angleShift = 5

function FDGODTrail(character, data)
    local name = 'trail' .. trailCount
    destroySprite(name)
    makeSpriteCopy(name, character)
    set(name .. ".alpha", 1)

    if character == 'dadCharacter0' then
        setActorColor(name, 255, 120, 0)
    elseif character == 'dadCharacter1' then
        setActorColor(name, 0, 220, 255)
    else
        setActorColor(name, 255, 255, 255)
    end

    tween(name, { alpha = 0 }, stepCrochet * 0.001 * 24,"cubeInOut")
    tweenScaleX(name, 2, stepCrochet * 0.001 * 16, 'cubeIn', 'trailFinish')
    tweenScaleY(name, 2, stepCrochet * 0.001 * 16, 'cubeIn')

    local angle = data * (math.pi / 2)
    local shift = math.rad(angleShift) * zigzagDir

    local offsetX = 350 * math.sin(angle + shift)
    local offsetY = 50 * math.cos(angle + shift)
    tweenActorProperty(name, 'x', offsetX, stepCrochet * 0.001 * 16,"quadIn")
    tweenActorProperty(name, 'y', offsetY, stepCrochet * 0.001 * 16,"quadIn")

    setActorLayer(name, getActorLayer(character) + 1)
    setBlendMode(name, "ADD")

    zigzagDir = -zigzagDir
    trailCount = (trailCount + 1) % trailLimit
end
