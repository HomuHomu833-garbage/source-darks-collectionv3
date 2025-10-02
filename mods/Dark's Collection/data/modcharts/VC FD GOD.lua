function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
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



function createPost()
  for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end

   
    makeAnimatedSprite('barrasq', 'barrasq', 0,0)
    addActorAnimation('barrasq', 'barrasq', 'wea pa separar', 52, true)
    playActorAnimation('barrasq', 'barrasq', true)
    setObjectCamera("barrasq", 'hud')
    setActorAlpha(0, 'barrasq')

    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))



    makeSprite('Shaggy', 'Final Destination/Shaggy', 500,750, 1.25)  
    setObjectCamera("Shaggy", 'hud')
    set("Shaggy.angle",-45)
   


    local shaders = { 
    {"pixel", "MosaicEffect", {strength = 0}},
    {"chess", "chess", {transparency = 0,direction = 1 , chessSize = 0.01}},
    {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"mirror", "BarrelBlurEffect", {zoom = 0.5, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
   --{"GlitchWave", "GlitchWave", {greyscale = 1 , glitch = 0,wave = 0,glitchLine = 0}},
    {"bars", "bars", {effect = 0.6,effect2 = 0, angle1 = 0 , angle2 = 0}},
    {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"jitter", "JitterGlitchDS", {gAmnt = 0, scale = 15 , chaos = 1,speed = 1}},
    {"fish", "EyeFishEffect", {power = 0.2}},
    {"vignette", "vignette", {strength = 15, size = 0.06,red= 255,blue = 175 ,green = 0}},
    {"bloom", "BloomEffect", {contrast = 1 , brightness = -0.1}},
    {"ca", "ChromAbEffect", {strength = 0.003}}
    
}

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)

        
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
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
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
time,a,sxm,bf,speed,angle,cam = 0,0,false,false,3,2,false
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
shaggy,matt  = false,false
barsCount = 0
function update(elapsed)
    time = time + elapsed
    setShaderProperty('chess', 'iTime', time)
    setShaderProperty('jitter', 'iTime', time)
    if sxm then
        set("camFollow.x",700)
        set("camFollow.y",650)
        set("defaultCamZoom", 0.72)
    end

    if shaggy then     
        set("camFollow.x", getActorX("dadCharacter0")+200)
        set("camFollow.y", getActorY("dadCharacter0")+450)
        set("defaultCamZoom", 0.75)
    end
    if matt then     
        set("camFollow.x", getActorX("dadCharacter1")+250)
        set("camFollow.y", getActorY("dadCharacter1")+150)
        set("defaultCamZoom", 0.8)
    end
    if bf then
        set("camFollow.x",1600)
        set("camFollow.y",750)
        set("defaultCamZoom", 1)
    end
    if cam then
        set("camFollow.x",1450)
        set("camFollow.y",650)
        set("defaultCamZoom", 0.72)
    end
    if perroxd then
    a = a + (elapsed / (1 / 120))
    setShaderProperty('bump', 'angle', math.sin(a / 100 * speed) * 5 + angle)
    end

    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.005)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end
    y = lerp(y, 0, elapsed * 5)
    setShaderProperty('mirror2', 'y',y)
    x = lerp(x, 0, elapsed * 5)
    setShaderProperty('mirror2', 'x',x)
    zoom = lerp(zoom, 1, elapsed * 5)
    setShaderProperty('bump', 'zoom',zoom)

    bloom = lerp(bloom, 1, elapsed * 5)
    setShaderProperty('bloom', 'contrast',bloom)
end
function startSong()
    tweenShader("bars", "effect",0.1, crochet * 0.004, "cubeOut")
    st(true, true, 'pixel', 'strength', 'strength', 15, 0, 4, crochet, "backInOut")
    mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    mirror(false,true,"","x",0,4,4,crochet,"cubeOut")
   
end
swap,perro = 1,0
function stepHit()
    swap = swap * -1
    if curStep == 8 then
    
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 16 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        perlinCaRange = 0.06
        perroxd = true
    elseif curStep == 112 then
          tween("blackBG",{alpha = 0.8},crochet*0.008,"cubeIn")
        flashCamera("game","",crochet*0.002)
        tweenShader("mirror3", "zoom",2.5, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "angle",25, crochet * 0.002, "cubeOut")
     elseif curStep == 120 or curStep == 136 then
         tweenShader("mirror3", "zoom",1, crochet * 0.002, "cubeIn")
        tweenShader("mirror3", "angle",0, crochet * 0.002, "cubeIn")
     elseif curStep == 144 then
         tween("blackBG",{alpha = 0},crochet*0.004,"cubeOut")
         flashCamera("game","",crochet*0.002)
     elseif curStep == 128 then
         tweenShader("mirror3", "zoom",2.5, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "angle",-25, crochet * 0.002, "cubeOut")
    elseif curStep == 64 or curStep == 176 then
        mirror(true, true, "x", "x", 0, 1, 6, crochet, "cubeInOut")
    elseif curStep == 126 or curStep == 208 then
        mirror(true, true, "x", "x", 1, 2, 6, crochet, "cubeInOut")
    elseif curStep == 240 then
        bf = false
        perroxd = false
        setShaderProperty('bump', 'angle',0)
             tweenShader("bloom", "brightness", 1, crochet * 0.008, "cubeIn")
        sxm = true
        mirror(false, true, "", "zoom", 0, 4, 8, crochet, "cubeIn")
        tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeOut")
        tweenShader("bump", "x", 0, crochet * 0.002, "backOut")
        tweenShader("bump", "y", 0, crochet * 0.002, "backInOut")
        tween("blackBG", {alpha = 0.7}, crochet * 0.008, "cubeIn")
    elseif curStep == 264 then
         tweenShader("fish", "power", 0.75,crochet*0.002,"quadIn")
         st(true, true, 'mirror3', 'angle', 'angle', 360, 0, 2, crochet, "quadOut")
    end
        if curStep >= 240 and curStep < 264 then
      
            local stepModulo = (curStep < 256) and 4 or 2

            if curStep % stepModulo == 0 then

                local offset = (math.floor(curStep / stepModulo) % 2 == 0) and 0.15 or -0.15

                st(true, true, 'mirror3', 'x', 'x', offset, 0, 1, crochet, "quadOut")
            end
        end

    if curStep >= 16 and curStep < 240 then
        swap = swap * -1
        if curStep % 8 == 4 then
            swap = swap * -1
            tweenShader("mirror2", "zoom", 0.87, crochet * 0.001, "cubeIn")
            tweenShader("bump", "x", 0.1 * swap, crochet * 0.001, "cubeIn")
            tweenShader("bump", "y", -0.03, crochet * 0.001, "cubeIn")
        elseif curStep % 8 == 0 then
            zoom, bloom= 0.8, 2  
            tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeOut")
            tweenShader("bump", "x", 0, crochet * 0.001, "backOut")
            tweenShader("bump", "y", 0, crochet * 0.001, "backInOut")
        end
        if curStep % 64 == 0 then
            bf = false
            sxm = true
        elseif curStep % 64 == 32 then
            bf = true
            sxm = false
        end
    end
    if curStep == 256 then
        tweenShader("bump", "barrel",2, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect",0.6, crochet * 0.004, "cubeIn")
        tweenShader("pixel", "strength", 50, crochet * 0.004, "cubeIn")
    elseif curStep == 264 then
        tweenShader("bump", "barrel",-2, crochet * 0.002, "cubeIn")
    elseif curStep == 272 then
         tweenShader("fish", "power", 0.25,crochet * 0.002, "cubeOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "cubeOut")
        setProperty('', 'cameraSpeed', 3)
        mirror(true,true,"zoom","zoom",0.5,1.1,4,crochet,"quadOut")
        tweenShader("mirror2", "barrel",1, crochet * 0.004, "cubeOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+1000},crochet*0.0035,"cubeIn")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")-1000},crochet*0.0035,"cubeIn")
        mirror(true,true,"x","x",0,1,3,crochet,"cubeOut")
        tweenShader("pixel", "strength", 0, crochet * 0.008, "cubeOut")
        tweenShader("bump", "barrel", 0, crochet * 0.004, "cubeOut")
        tweenShader("bars", "effect",0.05, crochet * 0.002, "cubeOut")
        lascosasdelhud(0,crochet,4,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        set("boyfriend.alpha",0)
        matt,sxm = true,false
        perlinCaRange = 0
      --   tweenShader("chess", "transparency", 0.1, crochet * 0.004, "cubeOut")
    end
    

    if curStep == 272 then
         mirror(false, true, "", "angle", 0, 25, 2, crochet, "quadOut")
    elseif curStep == 280 then
         tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
          tweenShader("bars", "angle1",-90, crochet * 0.002, "quadIn")
         mirror(false, true, "", "angle", 0, -180, 3, crochet, "quadIn")
    elseif curStep == 288 then
         tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
         mirror(true, true, "angle", "angle", 180, 0, 4, crochet, "quadOut")
         matt,shaggy = false,true
    
        posiciones("game")
        tween("dadCharacter1", {x = getActorX("dadCharacter1") - 1000}, crochet * 0.004, "cubeIn")
        tween("dadCharacter0", {x = getActorX("dadCharacter0") + 1000}, crochet * 0.004, "cubeIn")
    elseif curStep == 292 then
        st(true, true, 'mirror3', 'y', 'y', 0, 1, 4, crochet, "quadInOut")
    elseif curStep == 296 then
        tweenShader("fish", "power", 1,crochet * 0.002, "quadIn")
         tweenShader("bloom", "brightness", 1, crochet * 0.002, "quadIn")
    elseif curStep == 304 then
        tweenShader("fish", "power", 0.2,crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "quadOut")
        mirror(false, true, "", "angle", 0, -25, 2, crochet, "quadOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"quadOut")
    
        tween("dadCharacter1", {x = getActorX("dadCharacter1") + 1000}, crochet * 0.004, "cubeOut")
        tween("dadCharacter0", {x = getActorX("dadCharacter0") - 1000}, crochet * 0.004, "cubeOut")

        shaggy,sxm = false
    elseif curStep == 316 then
          st(true, true, 'mirror3', 'y', 'y', 1, 2, 4, crochet, "quadInOut")
    elseif curStep == 312 then
        tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
        tweenShader("bars", "angle1",0, crochet * 0.002, "quadIn")
        mirror(false, true, "", "angle", 0, 0, 2, crochet, "quadIn")
        mirror(false,true,"","zoom",0,1.1,2,crochet,"quadIn")
    elseif curStep == 320 then
        posiciones("hud", 50)
        tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
        mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "quadOut")
        mirror(false, true, "", "angle", 0, 25, 1, crochet, "quadOut")
        movimiento({-1, 4, 0}, 3, "quadOut", true)
        tween("dadCharacter1", {angle = 45}, crochet * 0.0035, "cubeIn")
        tween("dadCharacter0", {angle = -45}, crochet * 0.0035, "cubeIn")
        tween("blackBG", {alpha = 0}, crochet * 0.0035, "cubeOut")
        tweenShader("jitter", "gAmnt",0.1, crochet * 0.002, "quadOut")
    elseif curStep == 326 then
         mirror(false, true, "", "zoom", 0, 2, 1, crochet, "quadOut")
        mirror(false, true, "", "angle", 0, 65, 1, crochet, "quadOut")
    elseif curStep == 328 or curStep == 392 then
      --  mirror(false, true, "", "zoom", 0, 3, 1, crochet, "cubeOut")
    elseif curStep == 332 then
        mirror(false, true, "", "zoom", 0, 1, 1, crochet, "quadIn")
        mirror(false, true, "", "angle", 0, 180, 1, crochet, "quadIn")

        tween("dadCharacter1", {alpha = 0}, crochet * 0.002, "cubeIn")
        tween("dadCharacter0", {alpha = 0}, crochet * 0.002, "cubeIn")
        movimiento({35, 35, 0}, 2, "cubeIn", true)
    
    elseif curStep == 336 then
        posiciones("game")
        tweenShader("jitter", "gAmnt",0, crochet * 0.002, "quadOut")
        st(true, true, 'mirror3', 'x', 'x', -1, 0, 4, crochet, "quadOut")
        mirror(true, true, "angle", "angle", -180,0, 3, crochet, "quadOut")
       -- tweenShader("mirror2", "barrel", 1, crochet * 0.004, "cubeOut")
        setActorAlpha(0.7, 'blackBG')
        set("dadCharacter0.angle", 0)
        set("dadCharacter1.angle", 0)
        bf, sxm = true, false
       -- mirror(true, true, "angle", "angle", 180, 0, 4, crochet, "cubeOut")
        flashCamera("hud", "", crochet * 0.002, "cubeOut")
        set("boyfriend.alpha", 1)
       -- mirror(true, true, "x", "x", 0, -1, 4, crochet, "cubeOut")
        tween("boyfriend", {x = getActorX("boyfriend") + 500}, crochet * 0.0035, "cubeIn")
    elseif curStep == 344 then
        tweenShader("fish", "power", 1,crochet * 0.002, "quadIn")
         mirror(false, true, "", "zoom", 0, 0, 4, crochet, "quadIn")
        tweenShader("bloom", "brightness", 1, crochet * 0.002, "quadIn")
    end
    
    if curStep == 352 then--bf
        posiciones("game")
        tweenShader("fish", "power", 0.2,crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "quadOut")
         -- mirror(true, true, "zoom", "zoom", 0.5, 1.1, 4, crochet, "quadOut")
        --mirror(true, true, "angle", "angle", 45, 0, 4, crochet, "quadOut")
        mirror(false, true, "", "zoom", 0, 1.25, 2, crochet, "quadOut")
        mirror(false, true, "", "angle", 0, 45, 2, crochet, "quadOut")
       -- mirror(true, true, "x", "x", 1, 0, 4, crochet, "quadOut")
        tween("boyfriend",{x = getActorX("boyfriend")-500},crochet*0.0035,"cubeIn")
    elseif curStep == 360 then
          mirror(false, true, "", "zoom", 0, 0.8, 2, crochet, "quadIn")
        mirror(false, true, "", "angle", 0, -25, 2, crochet, "quadIn")
        st(true, true, 'mirror3', 'y', 'y', 0, -1, 4, crochet, "quadInOut")
         tweenShader("bars", "effect",0.7, crochet * 0.002, "quadIn")
          tweenShader("bars", "angle1",90, crochet * 0.002, "quadIn")
    elseif curStep == 368 then
        tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
        mirror(false, true, "", "zoom", 0, 1.1, 1, crochet, "quadOut")  
         mirror(false, true, "", "angle", 0, 0, 2, crochet, "quadOut")
        tween("boyfriend",{x = getActorX("boyfriend")+500},crochet*0.0035,"cubeOut")
    elseif curStep == 372 then
         mirror(false, true, "", "zoom", 0, 0.8, 1, crochet, "quadIn")        -- mirror(true, true, "x", "x", 0, -1, 5, crochet, "quadInOut")
    elseif curStep == 376 then
        mirror(false, true, "", "angle", 0, 90, 2, crochet, "quadIn")
        mirror(false, true, "", "zoom", 0, 1.1, 2, crochet, "quadOut")
        tweenShader("bloom", "brightness", 1, crochet * 0.002, "quadIn")
        tweenShader("fish", "power", 1,crochet * 0.002, "quadIn")
    end
    if curStep == 384 then
          tweenShader("jitter", "gAmnt",0.1, crochet * 0.002, "quadOut")
         mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "quadOut")
        mirror(true, true, "angle", "angle", 0, -45, 1, crochet, "quadOut")
        posiciones("hud",50)
         tweenShader("fish", "power", 0.2,crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "quadOut")
        movimiento({0,0,7}, 3, "quadOut", false)
        tween("blackBG",{alpha = 0},crochet*0.0035,"cubeOut")
    elseif curStep == 388 then
          st(true, true, 'mirror3', 'y', 'y', -1, -2, 4, crochet, "quadInOut")
    elseif curStep == 390 then
         mirror(false, true, "", "zoom", 0, 2, 1, crochet, "quadOut")
        mirror(false, true, "", "angle", 0, -125, 1, crochet, "quadOut")
    elseif curStep == 392 then
         tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
          tweenShader("bars", "angle1",0, crochet * 0.002, "quadIn")
     elseif curStep == 396 then
         mirror(false, true, "", "zoom", 0, 1, 1, crochet, "quadIn")
        mirror(false, true, "", "angle", 0, -180, 1, crochet, "quadIn")
        tween("boyfriend",{alpha = 0},crochet*0.002,"cubeIn")
        movimiento({0,0,30}, 2, "cubeIn", false)
        x,zoom = 0.1,0.8
    elseif curStep == 400 then--sxm
          tweenShader("jitter", "gAmnt",0, crochet * 0.002, "quadOut")
          tweenShader("bars", "effect", 0.05, crochet * 0.002, "quadOut")
        posiciones("game")
        mirror(true, true, "angle", "angle", 180,0, 3, crochet, "quadOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-1000,y = getActorY("dadCharacter1")-300},crochet*0.004,"cubeIn")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+1000,y = getActorY("dadCharacter0")-300},crochet*0.004,"cubeIn")
        set("dadCharacter1.alpha",1)
        set("dadCharacter0.alpha",1)
        setActorAlpha(0.7, 'blackBG')
        bf,sxm = false,true
        
        flashCamera("hud","",crochet*0.002, "cubeOut")
   -- elseif curStep == 404 then
          -- st(true, true, 'mirror3', 'x', 'x', 0, 1, 5, crochet, "quadInOut")
    elseif curStep == 408 then
        speed = 5
        angle = 2
          mirror(false, true, "", "zoom", 0, 1.5, 1, crochet, "quadOut")
          tweenShader("bloom", "brightness", 1, crochet * 0.002, "quadIn")
        tweenShader("fish", "power", 1,crochet * 0.002, "quadIn")
    elseif curStep == 412 then
        st(true, true, 'mirror3', 'y', 'y', 0, 1, 3, crochet, "quadInOut")
          mirror(false, true, "", "zoom", 0, 1.1, 1, crochet, "quadIn")
    elseif curStep == 416 then
        posiciones("game")
        tweenShader("bars", "effect",0.05, crochet * 0.002, "quadOut")
         tweenShader("fish", "power", 0.2,crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "quadOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+1000,y = getActorY("dadCharacter1")-300},crochet*0.004,"cubeIn")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")-1000,y = getActorY("dadCharacter0")-300},crochet*0.004,"cubeIn")
    elseif curStep == 424 then
        tweenShader("bars", "effect",0.7, crochet * 0.002, "quadIn")
          tweenShader("bars", "angle1",-90, crochet * 0.002, "quadIn")
    elseif curStep == 428 then
        st(true, true, 'mirror3', 'y', 'y', 1, 2, 2, crochet, "quadInOut")
    elseif curStep == 432 then
         posiciones("game")
        tweenShader("bars", "effect",0, crochet * 0.002, "cubeOut")
       -- mirror(true,true,"y","y",-1,-2,4,crochet,"cubeOut")
       tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
       setShaderProperty("mirror3","zoom",0.7)
     --   setShaderProperty("mirror3","y",0)
         mirror(true,true,"zoom","zoom",1.5,2.5,2,crochet,"cubeOut")
        mirror(true,true,"x","x",-0.5,-0.5,2,crochet,"cubeOut")
        mirror(false,true,"y","y",0.5,0.5,2,crochet,"cubeOut")
        set("dadCharacter0.x",get("dadCharacter0.x")+200)
         set("dadCharacter1.x",get("dadCharacter1.x")-200)
          set("dadCharacter0.y",get("dadCharacter0.y")-1000)
         set("dadCharacter1.y",get("dadCharacter1.y")+1000)
          tween("blackBG",{alpha = 1},crochet*0.004,"quadOut")
        tween("dadCharacter1",{y = getActorY("dadCharacter1")-1000},crochet*0.002,"quadOut")
        tween("dadCharacter0",{y = getActorY("dadCharacter0")+1000},crochet*0.002,"quadOut")
        matt,sxm = false,true
    elseif curStep == 440 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"quadIn")
         tweenShader("bloom", "brightness", 1, crochet * 0.002, "quadIn")
        tweenShader("fish", "power", 1,crochet * 0.002, "quadIn")
    elseif curStep == 448 then
        posiciones("hud",50)
         tweenShader("mirror2", "barrel",1, crochet * 0.002, "quadOut")
         mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
          mirror(false,true,"","angle",0,180,4,crochet,"quadIn")
        mirror(true,true,"x","x",0,0,2,crochet,"quadOut")
        mirror(false,true,"y","y",-0.5,0,4,crochet,"quadOut")
          setShaderProperty("mirror3","zoom",1)
        tween("blackBG",{alpha = 0.7},crochet*0.004,"quadOut")
         tweenShader("fish", "power", 0.2,crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "quadOut")
       -- mirror(true,true,"x","x",1,4,6,crochet,"quadInOut")
        setActorFlipX(1,'dadCharacter0')
        movimiento({11,1,1}, 3.5, "cubeOut", true, "x")
        movimiento({-1,4,0}, 3.5, "cubeOut", true)
        tween("blackBG",{alpha = 0},crochet*0.0035,"cubeOut")
        tween("barrasq",{alpha = 1},crochet*0.002,"cubeOut")
        --tweenShader("bars", "effect",0, crochet * 0.002, "cubeOut")
--mirror(false,true,"","zoom",0,5,2,crochet,"cubeOut")
       -- mirror(true,true,"angle","angle",0,-180,4,crochet,"cubeIn")
--tweenShader("mirror2", "barrel",-3, crochet * 0.004, "cubeIn")
    elseif curStep == 456 then
         tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
          tweenShader("bars", "angle1",0, crochet * 0.002, "quadIn")
    elseif curStep == 460 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
--mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
--x,zoom = 0.1,0.8
        tween("dadCharacter1",{alpha = 0},crochet*0.002,"cubeIn")
        tween("dadCharacter0",{alpha = 0},crochet*0.002,"cubeIn")
    elseif curStep == 464 then
        posiciones("game")
        flashCamera("game","",crochet*0.002)
        mirror(false,true,"","angle",0,360,3,crochet,"quadOut")
            tweenShader("bars", "effect",0.05, crochet * 0.002, "quadOut")
        setActorFlipX(0,'dadCharacter0')
       -- tweenShader("mirror2", "barrel",1, crochet * 0.004, "cubeOut")
        setActorAlpha(0.5, 'blackBG')
        setActorAlpha(0, 'barrasq')
        bf,sxm = true,false
       -- mirror(true,true,"angle","angle",180,0,4,crochet,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        set("boyfriend.alpha",1)
      --  mirror(true,true,"y","y",0,1,4,crochet,"cubeOut")
        tween("boyfriend",{x = getActorX("boyfriend")+500},crochet*0.0035,"cubeIn")
    elseif curStep == 480 then
        posiciones("game")
      --  tweenShader("bars", "effect",0, crochet * 0.002, "cubeOut")
      --  mirror(true,true,"x","x",0,-1,4,crochet,"cubeOut")
      --  mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
--mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tween("boyfriend",{x = getActorX("boyfriend")-500},crochet*0.0035,"cubeIn")
    elseif curStep == 496 then
      --  tweenShader("bars", "effect",0, crochet * 0.002, "cubeOut")
      --  mirror(true,true,"y","y",-1,0,4,crochet,"cubeOut")
      --  mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
       -- mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tween("boyfriend",{x = getActorX("boyfriend")+500},crochet*0.0035,"cubeOut")
    elseif curStep == 512 then
        posiciones("hud",50)
        tweenShader("bars", "effect",0.05, crochet * 0.002, "quadOut")
        set("dadCharacter0.alpha",1)
        movimiento({2,0,16}, 3, "quadOut", false,"x")
        movimiento({2,0,16}, 3, "quadOut", true,"x")
        movimiento({-1,0,7}, 3, "quadOut", false)
        movimiento({-1,-1,8}, 3, "quadOut", true)
        tween("barrasq",{alpha = 1},crochet*0.002,"cubeOut")
        tween("blackBG",{alpha = 0},crochet*0.0035,"cubeOut")
     --   tweenShader("bars", "effect",0.05, crochet * 0.002, "cubeOut")
     --   tweenShader("bars", "angle1",0, crochet * 0.004, "cubeOut")
      --  mirror(true,true,"x","x",-1,-4,4,crochet,"cubeOut")
       -- mirror(false,true,"","zoom",0,5,2,crochet,"cubeOut")
       -- mirror(true,true,"angle","angle",0,180,4,crochet,"cubeIn")
       -- tweenShader("mirror2", "barrel",3, crochet * 0.002, "cubeOut")
       -- tweenShader("pixel", "strength",20, crochet * 0.004, "cubeIn")
    elseif curStep == 520 then
        tweenShader("bars", "effect",0.35, crochet * 0.002, "cubeIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader("mirror2", "barrel",-3, crochet * 0.002, "cubeIn")
    elseif curStep == 528 then
        perroxd = true
        mirror(true,true,"angle","angle",-180,0,3,crochet,"cubeOut")
    end
    
    if curStep >= 272 and curStep < 512 then
        if curStep % 16 == 0 then
           x,zoom = -0.1,0.8
        elseif curStep % 16 == 8 then
            x,zoom = 0.1,0.8
        end
    end

    if curStep == 528 then
        posiciones("game")
       -- tweenShader("bars", "effect",0.05, crochet * 0.002, "quadIn")
        tweenShader("bars", "angle1",90, crochet * 0.004, "quadOut")
        set("dadCharacter1.alpha",1)
        sxm = true
        perlinCaRange = 0.06
        bf = false
        setActorAlpha(0, 'barrasq')
        setProperty('', 'cameraSpeed', 1)
        tweenShader("bars", "effect",0.1, crochet * 0.004, "cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        tweenShader("mirror2", "barrel",0, crochet * 0.004, "cubeOut")
        tweenShader("pixel", "strength",0, crochet * 0.016, "cubeOut")
        setShaderProperty("bloom","brightness", -0.1)
    end
    if curStep == 576 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-25,1,crochet,"cubeOut")
        
    elseif curStep == 580 or curStep == 588 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == 584 then
        mirror(false,true,"","angle",0,25,1,crochet,"cubeOut")
          tweenShader("bars", "angle1",90, crochet * 0.002, "cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","x",0,2,2,crochet,"cubeIn")
    elseif curStep == 592 then
        tween("blackBG",{alpha = 0.75},crochet*0.006,"quadOut")
        tweenShader("bars", "angle1",180, crochet * 0.004, "quadOut")
        mirror(false,true,"","angle",0,25,6,crochet,"cubeOut")
        tweenShader("mirror3", "x",0.4, crochet * 0.006, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 616 then
        tween("blackBG",{alpha = 0},crochet*0.002,"quadIn")
         tweenShader("mirror3", "x",0, crochet * 0.002, "quadIn")
         mirror(false,true,"","angle",0,-25,2,crochet,"quadIn")
    elseif curStep == 624 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","y",0,0.5,1,crochet,"cubeOut")
    elseif curStep == 632 then
        mirror(false,true,"","y",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
    elseif curStep == 640 then
        mirror(false,true,"","y",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
    elseif curStep == 648 then
        mirror(false,true,"","y",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
    elseif curStep == 656 then
        mirror(false,true,"","x",0,4,6,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeOut")
    --ueva parte
    elseif curStep == 664 then
        mirror(false,true,"","y",0,3,2,crochet,"cubeIn")
    elseif curStep == 672 then
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
    elseif curStep == 676 then
        mirror(false,true,"","x",0,5,1,crochet,"cubeIn")
    elseif curStep == 752 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShader("bars", "effect", 0.25, crochet * 0.002, "backOut")
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("bars", "effect", 0.35, crochet * 0.002, "backOut")
    elseif curStep == 768 then
        tweenShader("bars", "effect", 0.1, crochet * 0.004, "cubeInOut")
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
        tweenShader("bump", "barrel", 5, crochet * 0.002, "cubeOut")
    elseif curStep == 776 then
         mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader("bump", "barrel", -5, crochet * 0.002, "cubeIn")
    elseif curStep == 784 then
        lascosasdelhud(1,crochet,4,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        tweenShader("bump", "barrel", 0, crochet * 0.004, "cubeOut")
        tweenShader("mirror2", "barrel", 0, crochet * 0.004, "cubeOut")
         setStageColorSwap('hue', 0)
    end    
    if curStep == 816 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 824 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(true,true,"x","x",0,3,4,crochet,"cubeIn")
    elseif curStep == 832 then
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
    elseif curStep == 840 then
        mirror(true,true,"y","y",0,20,8,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 848 then
        tweenShader("bars", "angle1", 90,crochet*0.002,"cubeOut")
         tweenShader("bars", "effect", 0.3,crochet*0.004,"cubeOut")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("fish", "power", 0.5, crochet * 0.002, "cubeOut")
    elseif curStep == 856 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader("fish", "power", 0.2, crochet * 0.002, "cubeIn")
    elseif curStep == 864 then
        mirror(true,true,"x","x",3,2,4,crochet,"cubeInOut")
    elseif curStep == 872 then
         tweenShader("bars", "effect", 0,crochet*0.002,"cubeIn")
    elseif curStep == 880 then
         setShaderProperty("bars","angle2",90)
          tweenShader("bars", "effect2", 0.15, crochet * 0.008, "cubeOut")
    end

    if curStep == 880 or curStep == 896 or curStep == 944 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",3,1,4,crochet,"cubeOut")
    elseif curStep == 888 or curStep == 904 or curStep == 976 then
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 912 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeOut")
    elseif curStep == 920 then
        mirror(true,true,"y","y",0,1,2,crochet,"cubeIn")
    elseif curStep == 952 then
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 960 then
        mirror(false,true,"","y",0,2,2,crochet,"cubeOut")
    elseif curStep == 968 then
        tweenShader("bars", "effect2", 0, crochet * 0.002, "cubeIn")

        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end
    
    if curStep == 976 then
         tweenShader("bars", "angle1", 0, crochet * 0.000001)
        mirror(false,true,"","zoom",0,2.5,8,crochet,"cubeIn")
        tweenShader("bars", "effect",0.3, crochet * 0.008, "cubeIn")
    elseif curStep == 1008 then
        x = -0.2
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
    elseif curStep == 1016 then
        x = 0.2
        mirror(true,true,"angle","angle",180,0,4,crochet,"cubeOut")
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
    elseif curStep == 1024 then
        x = -0.2
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 1032 then
        x = 0.2
             tweenShader("bloom", "brightness", 1, crochet * 0.002, "cubeIn")
        mirror(true,true,"angle","angle",-180,0,4,crochet,"cubeOut")
        mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "cubeIn")
    elseif curStep == 1040 then
        perroxd = false
        setShaderProperty('bump', 'angle',0)
        tween("blackBG",{alpha = 0.5},crochet*0.0016,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        lascosasdelhud(0,crochet,4,"cubeOut")
        tweenShader("bloom", "brightness", 0, crochet * 0.002, "cubeOut")
    elseif curStep == 1096 or curStep == 1176 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeIn")
    elseif curStep == 1104 or curStep == 1120 then
        mirror(true,true,"zoom","zoom",3,1,2,crochet,"cubeOut")
    elseif curStep == 1112 or curStep == 1208 then
        mirror(true,true,"x","x",1,2,2,crochet,"cubeIn")
    elseif curStep == 1128 then
        mirror(true,true,"angle","angle",180,0,4,crochet,"cubeOut")
    elseif curStep == 1136 or curStep == 1200 or curStep == 1232 then
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
    elseif curStep == 1144 or curStep == 1216 or curStep == 1248 then
        mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
    elseif curStep == 1152 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 1160 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
    elseif curStep == 1164 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 1168 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,3,crochet,"cubeOut")
    elseif curStep == 1184 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    elseif curStep == 1196 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeIn")
    end
    if curStep == 1200 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    end
    
    if curStep == 1208 then
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
    elseif curStep == 1224 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 1232 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
    elseif curStep == 1248 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1256 then
        mirror(false,true,"","angle",0,10,2,crochet,"cubeIn")
        mirror(true,true,"x","x",0,1,2,crochet,"cubeIn")
    elseif curStep == 1264 then
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShader("bars", "effect",0.25, crochet * 0.002, "cubeOut")
        mirror(false,true,"","x",0,2,2,crochet,"cubeIn")
    elseif curStep == 1272 then
        mirror(false,true,"","x",0,3,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,10,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShader("bars", "effect",0.3, crochet * 0.002, "cubeOut")
    elseif curStep == 1280 then
    
        mirror(false,true,"","x",0,4,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShader("bars", "effect",0.35, crochet * 0.002, "cubeOut")
         tween("Shaggy",{y = 200,angle = 0},crochet*0.002,"cubeOut")
    elseif curStep == 1288 then
        perroxd = false
        tween("Shaggy",{y = 750,angle = 45},crochet*0.002,"cubeIn")
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
             tweenShader("bloom", "brightness", 1, crochet * 0.002, "cubeIn")
        tweenShader("pixel", "strength", 50, crochet * 0.002, "cubeIn")
        tweenShader("bars", "effect",0, crochet * 0.002, "cubeIn")
    elseif curStep == 1292 then
        tweenShader("fish", "power", 0, crochet * 0.002, "cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1296 then
        tween("blackBG",{alpha = 0},crochet*0.002,"cubeOut")
        tweenShader("pixel", "strength", 0, crochet * 0.004, "cubeOut")
        tweenShader("bars", "angle2", 90, crochet * 0.004, "cubeOut")
        tweenShader("bars", "effect2", 0.15, crochet * 0.004, "cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        tweenShader("bloom", "brightness", -0.1, crochet * 0.002, "cubeOut")
         setStageColorSwap('hue', 0)
        mirror(false,true,"","zoom",0,0.8,6,crochet,"cubeIn")
        sxm ,bf,shaggy = false,false,true
        tween("dadCharacter1",{x = getActorX(" dadCharacter1")-1000,alpha = 0},crochet*0.006,"cubeIn")
    end
    if curStep == 1320 then
        tweenShader("bars", "angle2", 180, crochet * 0.004, "cubeOut")
        tweenShader("bars", "effect2", 0, crochet * 0.004, "cubeOut")
    elseif curStep == 1352 then
         tweenShader("bars", "angle1", 90, crochet * 0.004, "cubeOut")
        tweenShader("bars", "effect", 0.5, crochet * 0.002, "cubeIn")
    end
    if curStep == 1316 or curStep == 1364 then
        mirror(false,true,"","angle",0,15,1,crochet,"cubeIn")
    elseif curStep == 1320 or curStep == 1372 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",3,1,2,crochet,"cubeOut")
    elseif curStep == 1328 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
    elseif curStep == 1380 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
    elseif curStep == 1336 or curStep == 1384 then
        st(true, true, 'bars', 'effect', 'effect', 0.35, 0.15, 2, crochet, "cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        mirror(true,true,"zoom","zoom",3,1.25,2,crochet,"cubeOut")
        x = 0.1
    elseif curStep == 1340 or curStep == 1348 or curStep == 1388 or curStep == 1400 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == 1344 or curStep == 1392 then
        x = -0.1
        mirror(true,true,"zoom","zoom",3,1.25,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 1352 then
        -- tweenShader("bars", "angle2", 0.8, crochet * 0.002, "cubeIn")
       --   tweenShader("bars", "angle1", 45, crochet * 0.002, "cubeIn")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,2,2,crochet,"cubeIn")
    elseif curStep == 1356 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 1360 then
        bf,shaggy = true,false
         tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
         -- tweenShader("bars", "angle1", 15, crochet * 0.002, "cubeOut")
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
    end
    
    if curStep == 1392 then
          tweenShader("bars", "angle1", 0, crochet * 0.002, "cubeOut")
       -- tweenShader("bars", "effect2", 0.2, crochet * 0.002, "cubeOut")
          tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 1400 then
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeIn")
        mirror(true,true,"zoom","zoom",3,1.25,2,crochet,"cubeOut")
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
    elseif curStep == 1408 then
        mirror(false,true,"","angle",0,15,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 1412 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 1416 then
         tweenShader("bars", "angle1", -90, crochet * 0.002, "cubeIn")
          tweenShader("bars", "effect", 0, crochet * 0.002, "cubeIn")
         tween("dadCharacter1",{x = getActorX("dadCharacter1")+1400,alpha = 1},crochet*0.006,"cubeInOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1424 then
        sxm,bf = true,false
        setShaderProperty("bars","angle2",90)
          tweenShader("bars", "effect2", 0.15, crochet * 0.008, "cubeOut")
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
        mirror(true,true,"y","y",0,2,4,crochet,"cubeIn")
    elseif curStep == 1436 then
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
    elseif curStep == 1440 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 1448 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeIn")
    elseif curStep == 1456 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
    elseif curStep == 1464 then
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 1472 then
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
    elseif curStep == 1480 then
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 1488 then
         tweenShader("bars", "angle2", 0, crochet * 0.004, "cubeOut")
          tweenShader("bars", "effect2", 0, crochet * 0.004, "cubeOut")
        mirror(true,true,"zoom","zoom",3,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,2,2,crochet,"cubeOut")    
    elseif curStep == 1492 then
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
    elseif curStep == 1496 or curStep == 1504 then
        mirror(true,true,"zoom","zoom",3,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 1500 then
        mirror(false,true,"","angle",0,15,1,crochet,"cubeIn")
   
    elseif curStep == 1512 then
        
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeIn")
        tweenShader("bars", "effect", 0.35, crochet * 0.002, "cubeIn")
        tweenShader("bars", "angle1", 0, crochet * 0.002, "cubeIn")
         tweenShader("bars", "angle2", 0, crochet * 0.002, "cubeIn")
        tweenShader("bars", "effect2", 0, crochet * 0.002, "cubeIn")
        tweenShader("fish", "power", 0.35, crochet * 0.002, "cubeIn")
    elseif curStep == 1520 or curStep == 1536 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
        tweenShader("bump", "angle", 10, crochet * 0.002, "cubeOut")
    elseif curStep == 1528 then
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
        tweenShader("bump", "angle", -10, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,10,6,crochet,"cubeIn")
             tweenShader("bloom", "brightness", 1, crochet * 0.006, "cubeIn")
    elseif curStep == 1544 then
        tweenShader("bars", "effect", 0.6, crochet * 0.002, "cubeIn")
        tweenShader("fish", "power", 0.2, crochet * 0.002, "cubeIn")
        mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
        tweenShader("bump", "angle", 0, crochet * 0.002, "cubeOut")
    elseif curStep == 1552 then
        tweenShader("bars", "effect", 0.1, crochet * 0.004, "cubeOut")
        mirror(true,true,"zoom","zoom",0.5,1,8,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,8,crochet,"cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        st(true, true, 'bloom', 'brightness', 'brightness', 0, -1, 8, crochet, "cubeIn")
        tweenShader("mirror2", "zoom", 1, crochet * 0.004, "cubeOut")
        tweenShader("bump", "x", 0, crochet * 0.004, "cubeOut")
        tweenShader("bump", "y", 0 * 0.004, "cubeOut")
    elseif curStep == 1592 then
        zoom,bloom = 0.7,2
        tweenShader("bloom", "brightness", -0.1, crochet * 0.004, "cubeOut")
    elseif curStep == 1600 then
        zoom,bloom = 1.25,2
        tweenShader("bars", "effect", 0.6, crochet * 0.003, "cubeIn")
    elseif curStep == 1608 then
             tweenShader("bloom", "brightness", 1, crochet * 0.002, "cubeIn")
        -- tweenShader("fish", "power", 0, crochet * 0.002, "")
    elseif curStep == 1616 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        perlinCaRange = 0
        perroxd,speed = true,2
        bf = false
        shaggy = false
        cam = true
        tweenShader("fish", "power", 0, crochet * 0.004, "cubeOut")
        flashCamera("hud","",crochet*0.002, "cubeOut")
        tweenShader("bloom", "brightness", 0, crochet * 0.002, "cubeOut")
        set("dadCharacter1.alpha",0)
        set("dadCharacter0.alpha",0)
        set("dadCharacter1.x",getActorX("boyfriend")+900)--+300
        set("dadCharacter0.x",getActorX("boyfriend")-1000)-- -500
        set("dadCharacter1.y",getActorY("boyfriend")-100)
        tween("dadCharacter0",{alpha = 1 , x = getActorX("boyfriend")-550},crochet*0.004,"cubeOut")
        set("dadCharacter0.y",getActorY("boyfriend")-400)
        setActorFlipX(1,'dadCharacter1')    

        --setShaderProperty('GlitchWave',"greyscale",0.5)
 -- setShaderProperty('GlitchWave',"glitch",0.01)
   --setShaderProperty('GlitchWave',"wave",0.12)
   -- setShaderProperty('GlitchWave',"glitchLine",0.5)
    elseif curStep == 1672 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
        bloom,x = 4,0.1
        tweenShader("bars", "effect", 0.15, crochet * 0.002, "cubeOut")
    elseif curStep == 1676 then
        x = -0.1
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 1680 then
        bloom = 4
        tween("dadCharacter1",{alpha = 1 , x = getActorX("boyfriend")+350},crochet*0.004,"cubeOut")
    elseif curStep == 1736 or curStep == 1800 then
        mirror(true,true,"y","y",0,2,4,crochet,"cubeInOut")
        tweenShader("bars", "effect", 0.3, crochet * 0.002, "cubeIn")
    elseif curStep == 1712 then
        zoom,bloom = 0.7,2
    elseif curStep == 1728 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeOut") 
    elseif curStep == 1744 then
        bloom = 4
        tween("blackBG",{alpha = 0.5},crochet*0.004,"cubeOut")
        triggerEvent('screen shake', (crochet*0.064)..',0.009')
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")   
    elseif curStep == 1776 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut") 
    elseif curStep == 1792 then
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeIn") 
    elseif curStep == 1808 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeOut")  
        bloom = 4
    elseif curStep == 1840 then
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")  
    elseif curStep == 1872 then
        tween("blackBG",{alpha = 0},crochet*0.008,"cubeOut")
        mirror(false,true,"","zoom",0,0.5,8,crochet,"cubeOut")  
    elseif curStep == 1904 then
        mirror(false,true,"","zoom",0,1,8,crochet,"cubeOut")  
    elseif curStep == 1936 then
        perroxd,bloom = false,4
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+50},crochet*0.001,"cubeOut")
        tweenShader("bump", "angle", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")  
    elseif curStep == 1944 then
        tweenShader("bars", "effect", 0.15, crochet * 0.001, "cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")  
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.001,"cubeOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.001,"cubeOut")
    elseif curStep == 1952 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.001,"cubeOut")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.001,"cubeOut")
        mirror(false,true,"","zoom",0,1.75,1,crochet,"cubeOut")  
    elseif curStep == 1960 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.001,"cubeOut")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.001,"cubeOut")
        tweenShader("bars", "effect", 0.25, crochet * 0.001, "cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")  
    elseif curStep == 1968 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.001,"cubeOut")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.001,"cubeOut")
        tweenShader("bars", "effect2", 0.1, crochet * 0.001, "cubeOut")
    elseif curStep == 1976 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.001,"cubeOut")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.001,"cubeOut")
        tweenShader("bars", "effect2", 0.2, crochet * 0.001, "cubeOut")
    elseif curStep == 1984 then
        tweenShader("bars", "effect2", 0.25, crochet * 0.001, "cubeOut")
    elseif curStep == 1992 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-50},crochet*0.002,"cubeOut")
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+40},crochet*0.002,"cubeOut")
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")  
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")  
        tweenShader("bars", "effect", 0.6, crochet * 0.002, "cubeIn")
    elseif curStep == 1996 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")  
    elseif curStep == 2000 then
        flashCamera("hud","",crochet*0.002, "cubeOut")
    end
    if curStep >= 1616 and curStep < 2000 and curStep % 8 == 0 then
       zoom = 0.8
    end
    if curStep >= 1296 and curStep < 1320 
    or curStep >= 1360 and curStep < 1384 then
        if curStep % 8 == 0  then
             x = -0.07
        elseif curStep % 8 == 4 then
             x = 0.07
        end
    end
    if curStep >= 400 and curStep < 1552 then
        swap = swap * -1
    
        if curStep % 8 == 4 then
            swap = swap * -1
            tweenShader("mirror2", "zoom", 0.87, crochet * 0.001, "cubeIn")
            tweenShader("bump", "x", 0.1 * swap, crochet * 0.001, "cubeIn")
            tweenShader("bump", "y", -0.03, crochet * 0.001, "cubeIn")
    
            if curStep >= 528 and curStep < 752 or curStep >= 1040 and curStep < 1264 then
                tweenShader("bars", "effect", 0.2, crochet * 0.001, "cubeIn")
            end
    
        elseif curStep % 8 == 0 then
            st(true, true, 'chess', 'transparency', 'transparency', 0.2, 0, 2, crochet, "quadOut")
            zoom, bloom, y = 0.8, 2, 0.15 * swap
            if curStep >= 528 and curStep < 752 or curStep >= 1040 and curStep < 1264 then
                tweenShader("bars", "effect", 0.1, crochet * 0.001, "cubeOut")
                 setStageColorSwap('hue', perro)
                  perro = perro + 0.1
                if perro > 1 then
                    perro = 0.3
                end
        
                if curStep % 128 == 0 then
                    bf = false
                    sxm = true
                elseif curStep % 128 == 64 then
                    bf = true
                    sxm = false
                end
            end

            if curStep >= 752 and curStep < 1264 then
                if curStep % 64 == 0 then
                    bf = false
                    sxm = true
                elseif curStep % 64 == 32 then
                    bf = true
                    sxm = false
                end
            end
            tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeOut")
            tweenShader("bump", "x", 0, crochet * 0.001, "backOut")
            tweenShader("bump", "y", 0, crochet * 0.001, "backInOut")
        end
    end
    
    
    
    
end