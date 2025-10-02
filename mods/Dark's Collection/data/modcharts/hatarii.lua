function hud(s, step, c, ease)
    local hbAlpha = s
    if s == 1 then
        hbAlpha = 0.8
    end

    tween("healthBar", {alpha = hbAlpha}, step * 0.001 * c, ease)
    tween("healthBarBG", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP1", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP2", {alpha = s}, step * 0.001 * c, ease)
    tween("scoreTxt", {alpha = s}, step * 0.001 * c, ease)
    tween("timeBar", {alpha = s}, step * 0.001 * c, ease)
    tween("ratingText", {alpha = s}, step * 0.001 * c, ease)
end
local characters = {"dadCharacter0", "dadCharacter1","boyfriend"}
local yPositions = {80, 180, 40}  
local xPositions = {-10, -10, 30} --0,0,16
local originalPositions = {}

function posiciones(context, spacing)
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "perro" then        
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
            if i <= 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end
function createPost()
     for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
    makeCamera("perro")
    setActorAlpha(0,"dadCharacter0")
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('gfCharacter0'))
    set("dadCharacter1.x", get("dadCharacter0.x") + 50)
    set("dadCharacter1.y", get("dadCharacter0.y") +15)
     hud(0, crochet, 1, 'cubeOut')
      local shaders = { 
        {"vector", "hardhitariivector", {strength = 0.2}},
        {"PlayStationWaves", "PlayStationWaves", {strength = 0}},
        {"distorcion", "DistortionEffect", {size = 0.2}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"mirror", "BarrelBlurEffect", {zoom = 3.5, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"fish", "EyeFishEffect", {power = 0.3}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
         {"bars", "bars", {effect = 0.6,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"titleeffect", "coloreffect", {money = 0}},
        {"greyscale", "GreyscaleEffect", {strength = 0}},
        {"vignette", "VignetteEffect", {strength = 15, size = 0.2}},
        {"blur", "zoomblur", {focusPower = 5, posY = -2}},
        {"bloom", "BloomEffect", {contrast = 1 , brightness = 0,effect = 0, strength = 0.5}}
     }
        initShader('mirror0', 'PincushNewEffect')--
        setCameraShader('perro', 'mirror0')
        setShaderProperty('mirror0', 'zoom', 1)
        setShaderProperty('mirror0', 'angle',0)
        setShaderProperty('mirror0', 'x', 1)
        setShaderProperty('mirror0', 'y', 0)
        setShaderProperty('mirror0', 'barrel', 0)
        setShaderProperty('mirror0', 'doChroma', true)
        
      for _, shader in ipairs(shaders) do
          local name, effect, properties = shader[1], shader[2], shader[3]
          initShader(name, effect)
          setCameraShader('game', name)
         -- setCameraShader('perro', name)
          if name ~= "bump" and name ~= "fish" and name ~= "vector" 
          and name ~= "mirror2" and name ~= "mirror"
          and name ~= "bars" and name ~= "blur"
          and name ~= "bloom" and name ~= "distorcion" and name ~= "PlayStationWaves" then
              setCameraShader('hud', name)
          end 
        --   if name ~= "vector" and name ~= "vignette" then
        --      setCameraShader('perro', name)
         -- end 
          for prop, value in pairs(properties) do
              setShaderProperty(name, prop, value)
          end
      end
      setCameraShader('perro', "greyscale")
      setCameraShader('perro', "distorcion")
      setCameraShader('perro', "bloom")
      setCameraShader('perro', "mirror")
      setCameraShader('perro', "bump")
      setCameraShader('perro', "titleeffect")
      setCameraShader('perro', "blur")
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
local perlinX, perlinY, time = 0, 0, 0
local perlinSpeed, perlinXRange, perlinYRange = 2, 0.075, 0.075
qso,cam = true,false
function update(elapsed)
    time = time + elapsed
    setShaderProperty('distorcion', 'iTime',time)
    setShaderProperty('vector', 'iTime',time)
    setShaderProperty('PlayStationWaves', 'iTime',time)
        if curStep < 1216 then
        zoom = lerp(zoom, 1, elapsed * 8)
        setShaderProperty('bump', 'zoom', zoom)
        end
        angle = lerp(angle, 0, elapsed * 8)
        setShaderProperty('bump', 'angle', angle)
         x = lerp(x, 0, elapsed * 6)
        setShaderProperty('mirror2', 'x', x)
        if qso then
        distorcion = lerp(distorcion, 0, elapsed * 6)
        setShaderProperty('distorcion', 'size', distorcion)
        brightness = lerp(brightness, 0, elapsed * 6)
        setShaderProperty('bloom', 'brightness', brightness)
        end

         if cam then
            set("camFollow.x",600)
            set("camFollow.y",200)
        end
        x = lerp(x, 0, elapsed * 8)
        y = lerp(y, 0, elapsed * 8)
        perlinX = perlinX + elapsed * math.random() * perlinSpeed
        perlinY = perlinY + elapsed * math.random() * perlinSpeed
        local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
        local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
        setShaderProperty('bump', 'x', x + perlinOffsetX)
        setShaderProperty('bump', 'y', y + perlinOffsetY)
         if curStep >= 768 and curStep < 880 then
            x1 = lerp(x1,originalPositions["dadCharacter0"].x - 130, elapsed * 8)
            set("dadCharacter0.x", x1)
         end
            
        if curStep >= 800 and curStep < 896 then
            x2 = lerp(x2,originalPositions["boyfriend"].x + 150, elapsed * 8)
            set("boyfriend.x", x2)
         end
end

function songStart()
    mirror(false,true,"","zoom",0,1,28,crochet,"quadOut")
    tweenShader('bars','effect',0,crochet*0.036,'quadOut')
     tweenShader('fish','power',0,crochet*0.028,'quadOut')
     tweenShader('blur','focusPower',0,crochet*0.028,'quadOut')
end
bumpotro ={144,176,272,300,320,332,348,432,512,528,544,560,592,608,624,640,656,672,688
,704,720,736,752,768,784,800,816,832,848,864,880,896}
lol,perroxd = 1,true
function stepHit()
    if curStep >= 768 and curStep < 832 or curStep >= 864 and curStep < 880 then
        if curStep % 4 == 0 then
             x1 =  originalPositions["dadCharacter0"].x + 70
        end
    end
     if curStep >= 800 and curStep < 880 then
        if curStep % 4 == 0 then
             x2 =  originalPositions["boyfriend"].x - 170
        end
    end
    for i = 1, #bumpotro do
        if curStep == bumpotro [i]-4 then
         mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        elseif curStep == bumpotro [i] then
          mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        end
    end
    if curStep == 112 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShader('fish','power',0.2,crochet*0.001,'cubeOut')
    elseif curStep == 120 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        tweenShader('fish','power',0,crochet*0.002,'cubeIn') 
    elseif curStep == 128 or curStep == 160 or curStep == 192 
    or curStep == 224 or curStep == 256 then
        distorcion,brightness,zoom = 0.5,-0.5,0.6
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 152 or curStep == 184 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")   
    elseif curStep == 156 or curStep == 188 then
        lol = -lol
        x = -0.1*lol
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeIn")
     elseif curStep == 158 or curStep == 190 then
        lol = -lol
        x = 0.1*lol
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
    end
    if curStep == 204 or curStep == 236 then
          mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 208 or curStep == 240 then
        lol = -lol
         tweenShader('fish','power',0.3,crochet*0.002,'cubeOut') 
         setShaderProperty("mirror2","angle",-360*lol)
         tweenShader('mirror2','angle',0,crochet*0.004,'cubeInOut') 
          mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 212 or curStep == 220 or curStep == 244 or curStep == 252 or curStep == 396 or curStep == 404 or curStep == 412 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 216 or curStep == 248 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    end
    if curStep == 220 or curStep == 252 or curStep == 412 then
          tweenShader('fish','power',0,crochet*0.001,'cubeIn') 
    elseif curStep == 248 then
         mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
         tweenShader('mirror2','y',-2,crochet*0.003,'cubeInOut') 
    elseif curStep == 256 then
         hud(1, crochet, 4, 'cubeOut')
         mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
    elseif curStep == 284 then
         tweenShader('fish','power',0.3,crochet*0.0005,'cubeOut') 
          mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
    elseif curStep == 286 then
            tweenShader('fish','power',0,crochet*0.0005,'cubeIn') 
            mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
    elseif curStep == 288 or curStep == 416 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 316 then
         tweenShader('bars','effect',0.55,crochet*0.001,'cubeIn') 
    elseif curStep == 320 then
         tweenShader('bars','effect',0,crochet*0.002,'cubeOut')
    elseif curStep == 360 then
        brightness,perroxd = -0.5,false
         tweenShader('bars','effect',0.17,crochet*0.001,'cubeOut') 
         tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut') 
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 364 then
         tweenShader('greyscale','strength',0,crochet*0.001,'cubeIn') 
         tweenShader('bars','effect',0,crochet*0.001,'cubeIn') 
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 368 or curStep == 384 then
        perroxd = true
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 376 then
         brightness,perroxd = -0.5,false
         tweenShader('fish','power',0.2,crochet*0.001,'cubeOut') 
         tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut') 
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 380 then
         tweenShader('greyscale','strength',0,crochet*0.001,'cubeIn') 
         tweenShader('fish','power',0.3,crochet*0.0005,'cubeOut') 
          mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
    elseif curStep == 382 then
        tweenShader('fish','power',0,crochet*0.0005,'cubeIn') 
          mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
    end
    if curStep == 456 then
        qso = false
          tweenShader('bloom','brightness',-0.2,crochet*0.002,'cubeIn') 
          tweenShader('distorcion','size',0.2,crochet*0.002,'cubeIn') 
    elseif curStep == 464 then
        qso = true
    elseif curStep == 504 then
        qso = false
        tweenShader('bars','effect',0.55,crochet*0.002,'cubeIn') 
        tweenShader('distorcion','size',0.3,crochet*0.002,'cubeIn') 
    end
    if curStep == 400 then
         tweenShader('fish','power',0.3,crochet*0.002,'cubeOut') 
         setShaderProperty("mirror2","angle",-360*lol)
         tweenShader('mirror2','angle',0,crochet*0.004,'cubeInOut') 
          mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 408 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
    elseif curStep == 444 then
        perroxd = false
         tweenShader('bars','effect',0.55,crochet*0.001,'cubeIn') 
         tweenShader('greyscale','strength',1,crochet*0.0005,'cubeOut') 
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
    elseif curStep == 446 then
         tweenShader('greyscale','strength',0,crochet*0.0005,'cubeIn') 
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
    elseif curStep == 448 then
        perroxd = true
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut') 
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 456 or curStep == 488 then
        tweenShader('fish','power',0.3,crochet*0.001,'cubeOut') 
          mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut") 
    elseif curStep == 460 then
         tweenShader('greyscale','strength',1,crochet*0.0005,'cubeOut') 
         mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
         tweenShader('bars','effect',0.2,crochet*0.0005,'cubeOut') 
          tweenShader('fish','power',0,crochet*0.001,'cubeIn') 
    elseif curStep == 462 then
        tweenShader('bars','effect',0,crochet*0.0005,'cubeIn') 
        tweenShader('greyscale','strength',0,crochet*0.0005,'cubeIn') 
    elseif curStep == 464 then
         tweenShader('fish','power',0.3,crochet*0.001,'cubeOut') 
          mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 468 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 472 then
        setShaderProperty("mirror2","angle",-360)
         tweenShader('mirror2','angle',0,crochet*0.003,'cubeInOut') 
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
         perroxd = false
    elseif curStep == 476 then
        tweenShader('fish','power',0,crochet*0.001,'cubeIn') 
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 480 or curStep == 496 then
         if curStep == 480 then
            perroxd = true
        end
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")  
    elseif curStep == 492 then
         perroxd = false
         tweenShader('fish','power',0,crochet*0.001,'cubeIn') 
         tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut') 
         mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
           tweenShader('bars','effect',0.2,crochet*0.0005,'cubeOut') 
    elseif curStep == 494 then
         tweenShader('bars','effect',0,crochet*0.0005,'cubeIn') 
    end
    if curStep == 512 then
        perroxd,qso,cam = true,true,true
        hud(0, crochet, 4, 'cubeOut')
         setActorAlpha(1, 'blackBG')
         setShaderProperty("PlayStationWaves", "strength", 0.75)
         tweenShader('bars','effect',0,crochet*0.002,'cubeOut') 
        tweenShader('greyscale','strength',0,crochet*0.001,'cubeOut') 
        setActorAlpha(0,"gfCharacter0")
        setActorAlpha(0,"gfCharacter1")
        posiciones("perro",50)
        setActorScaleXY(1.65,1.15, "boyfriend")
        setActorScaleXY(1.5, 1.5, "dadCharacter1")
        setActorScaleXY(1.5, 1.5, "dadCharacter0")
        setActorAlpha(0,"dadCharacter0")
        movimiento({0,0,0}, 3, "cubeOut", true)
         for i = 0, 7 do
                if i <= 3 then
                    if not middlescroll then
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + 640, crochet * 0.004, 'cubeOut')
                    end
                else
                    if not middlescroll then
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] - 640, crochet * 0.004, 'cubeOut')
                    end
                end
            end
    elseif curStep == 544 then
        movimiento({-10,0,15}, 3, "cubeOut", false)
    end
    if curStep >= 512 and curStep < 896 then
        if curStep >= 640 then
            if curStep % 8 == 0 then
                setShaderProperty("titleeffect", "money", 0.9)
                tweenShader('titleeffect', 'money', 1, crochet * 0.002, 'cubeOut')
            end
        else
            if curStep % 8 == 0 then
                setShaderProperty("titleeffect", "money", 1)
                tweenShader('titleeffect', 'money', 0.85, crochet * 0.002, 'cubeOut')
            end
        end
    end

    if curStep == 624 then
        movimiento({0,-5,0}, 2, "cubeOut", true)
        tween("dadCharacter1", {alpha = 0}, crochet*0.002, "cubeIn")
    elseif curStep == 632 then
         tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut')
          tween("dadCharacter0", {alpha = 1}, crochet*0.002)
    elseif curStep == 636 then
         tweenShader('greyscale','strength',0,crochet*0.001,'cubeIn')
    elseif curStep == 864 then
          tweenShader('blur','focusPower',5,crochet*0.004) 
    elseif curStep == 880 then
        movimiento({-5,-5,20}, 2, "cubeOut", true)
        tween("dadCharacter0", {alpha = 0}, crochet*0.002, "cubeIn")
        movimiento({-5,-5,20}, 2, "cubeOut", false)
        tween("boyfriend", {alpha = 0}, crochet*0.002, "cubeIn")
        tween("blackBG", {alpha = 0}, crochet*0.004, "cubeIn")
         tweenShader('PlayStationWaves','strength',0,crochet*0.003,'cubeIn') 
         --qso = false
        -- tweenShader('bloom','brightness',-0.2,crochet*0.004,"cubeIn") 
    elseif curStep == 896 then
         tweenShader('blur','focusPower',0,crochet*0.002,"cubeOut") 
         setActorScaleXY(1.55, 0.9, "dadCharacter0")
         setActorScaleXY(1, 0.75, "boyfriend")
        qso = true
        for i = 0, 7 do   
             tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.004, 'cubeOut')
        end
        brightness = -0.5
        setActorAlpha(1, 'dadCharacter0')
        setActorAlpha(1, 'boyfriend')
        setActorAlpha(1, 'gfCharacter0')
        setActorAlpha(1, 'gfCharacter1')
        
        posiciones("game")
    end
    if curStep == 568 then
        tweenShader('fish','power',0.3,crochet*0.001,'cubeOut') 
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 572 then
        tweenShader('fish','power',0,crochet*0.001,'cubeIn') 
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 576 or curStep == 608 then
         setShaderProperty("titleeffect","money",1)
        tweenShader('titleeffect','money',0.85,crochet*0.002,'quadOut')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1120 then
        tweenShader('bars', 'effect', 0.55, crochet * 0.008, 'cubeIn')
    elseif curStep == 1152 then
        tween("camHUD", {alpha = 0}, crochet * 0.016)
         tweenShader('blur','focusPower',8,crochet*0.032,"cubeIn") 
        tweenShader('greyscale', 'strength', 1, crochet * 0.001, 'cubeOut')
        tweenShader('bars', 'effect', 0, crochet * 0.008, 'cubeOut')
    elseif curStep == 1216 then
         tweenShader('bars','effect',0.55,crochet*0.012,"cubeIn") 
          tweenShader('bump','zoom',4,crochet*0.014,"cubeIn") 

    end
    if curStep >= 220 and curStep < 224 or curStep >= 316 and curStep < 320 then
        x = (curStep % 2 == 0) and -0.1 or 0.1
    end
    if curStep >= 896 then
        if curStep < 1152 then
              if curStep % 64 == 0 then
            distorcion, brightness = 0.3, -0.5
              end
        end
        if curStep % 16 == 0 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        end
        if curStep % 16 == 12 then
            mirror(false,true,"","zoom",0,0.5,1,crochet,"cubein")
        end
    end
    if curStep >= 256 and curStep < 896 then
        if perroxd then
            local stepMod = curStep % 64
            if stepMod == 0
            or stepMod == 12
            or stepMod == 20
            or (stepMod == 24 and curStep < 512)
            or stepMod == 32
            or stepMod == 38
            or stepMod == 44
            or stepMod == 52
            or stepMod == 58 then
                distorcion, brightness, zoom = 0.3, -0.5, 0.5
                triggerEvent('screen shake', (stepCrochet * 0.002) .. ',0.015')
            end
        end
    end


    

end