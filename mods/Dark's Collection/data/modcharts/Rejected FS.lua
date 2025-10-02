function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
 baseXDad = 0
 baseYDad = 0
 baseXBF = 0
 baseYBF = 0
function createPost()
    hud(0, crochet, 1, 'cubeOut')
      local shaders = { 
      {"glowBorder", "glowBorder", {transparency = 0.7, transparency2 = 1}},
      {"speedlines", "speedlines", {transparency = 1}},
       {"bars2", "bars", {effect = 0,effect2 = 0, angle1 = 0 , angle2 = 0}},
      {"mirror2", "PincushNewEffect", {zoom = 3, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
       {"bars", "bars", {effect = 0.51,effect2 = 0, angle1 = 0 , angle2 = 0}},
      {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"Glitchy", "Glitchy", {AMT = 0, SPEED = 0.25}},
      {"fish", "EyeFishEffect", {power = 0}},
       {"titleeffect", "coloreffect", {money = 0}},
      {"scanline", "ScanlineEffect", {strength = 0.1, pixelsBetweenEachLine = 5}},
      {"sketch", "sketch", {strength = 0, speed = 15}},
      {"bloom", "BloomEffect", {contrast = 1 , brightness = -0.1}}
  }
      for _, shader in ipairs(shaders) do
          local name, effect, queso = shader[1], shader[2], shader[3]
          initShader(name, effect)
          setCameraShader('game', name)
  
          if name ~= "bump" and name ~= "fish" 
          and name ~= "mirror" and name ~= "mirror2"
          and name ~= "bars" and name ~= "glowBorder"
          and name ~= "sketch" and name ~= "speedlines" and name ~= "bars2" then
              setCameraShader('hud', name)
          end 
          for prop, value in pairs(queso) do
              setShaderProperty(name, prop, value)
          end
      end
      set("undefinedSprite1.alpha",0)
      setBlendMode("undefinedSprite1",'overlay')
        baseXDad = getActorX("dad")
        baseYDad = getActorY("dad")
        baseXBF = getActorX("boyfriend")
        baseYBF = getActorY("boyfriend")
  end
cam,matt,bf,time = true,false,false,0
a,perroxd,speed,angle = 0,false,4.5,3
lol,elfuturoeshoy = 0,true
perlinX, perlinY = 0, 0
perlinlol,perlinSpeed, perlinXRange, perlinYRange = false,4, -0.05, -0.1
volando = false
function update(elapsed)
    time = time + elapsed
    setShaderProperty("glowBorder","iTime",time)
    setShaderProperty("sketch","iTime",time)
    setShaderProperty("speedlines","iTime",time)
    setShaderProperty("Glitchy","iTime",time)
    setShaderProperty("titleeffect","uTime",time*5)
    barrel = lerp(barrel, 0, elapsed * 4)
    setShaderProperty('mirror2', 'barrel',barrel)
    if elfuturoeshoy then
    angle = lerp(angle, 0, elapsed * 8)
    setShaderProperty('mirror', 'angle',angle)
    x = lerp(x, 0, elapsed * 8)
    setShaderProperty('mirror', 'x',x)
    end
    if cam then
        set("camFollow.x",730)
        set("camFollow.y", 250)
    elseif matt then
        set("camFollow.x", get("dad.x") + 250)
        set("camFollow.y", get("dad.y") + 300)
    elseif bf then
        set("camFollow.x", get("boyfriend.x") + 200)
        set("camFollow.y", get("boyfriend.y") + 150)
    end
    if perroxd then
        a = a + (elapsed / (1 / 120))
        setShaderProperty('bump', 'angle', math.sin(a / 100 * speed) * 5 + angle)
    else 
        setShaderProperty('bump', 'angle',0)
    end
    if perlinlol then
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    setShaderProperty('bump', 'x',  perlinOffsetX)
    setShaderProperty('bump', 'y',  perlinOffsetY)
    end
    lol = lol + (elapsed * 2.5 * -360)
    if lol > 360 then
        lol = lol - 360
    end
    set('undefinedSprite1.angle', lol)

    
    if volando then
         setActorPos(baseXDad + ((math.sin(time*2) + 1) / 2) * 300 - 50, baseYDad + math.sin(time) * -100, "dad")
         setActorPos(baseXBF + ((math.sin(time*2) + 1) / 2) * -300 + 50, baseYBF + math.sin(time) * 100, "boyfriend")
        set("dad.angle", math.sin(time) * 15)
        set("boyfriend.angle", math.sin(time) * -15)
    else
        setActorPos(baseXDad, baseYDad, "dad")
        setActorPos(baseXBF, baseYBF, "boyfriend")
        set("dad.angle", 0)
        set("boyfriend.angle", 0)
    end

    
 
    
end
function startSong()
    tweenShader("mirror2", "zoom", 1, crochet * 0.032, "cubeIn")
    tweenShader("bars", "effect", 0.3, crochet * 0.016, "")
end
function stepHit()
   -- if curStep < 544 then
    if curStep % 8 == 0 then
        barrel = -3
    end
    if curStep >= 800 and curStep < 1056 or curStep >= 1600 and curStep < 1856 then
        if curStep % 4 == 0 then
            triggerEvent("add Camera Zoom","-0.15")
        end
    end

    if curStep >= 256 and curStep < 928 or curStep >= 960 then
        if curStep % 8 == 0 then
            set("defaultCamZoom", math.random() * 0.3 + 0.7)
        end
    end
    if curStep == 64 then
        tweenShader("bars", "effect", 0.1, crochet * 0.016, "cubeIn")
    elseif curStep == 128 then
        angle = -10
         flashCamera("game","",crochet*0.002)
    elseif curStep == 256 then
        set("defaultCamZoom", 0.9)
    elseif curStep == 288 then
        hud(1, crochet, 4, 'cubeOut')
        set("defaultCamZoom", 0.7)
        tweenShader("bars", "effect", 0, crochet * 0.004, "cubeOut")
    elseif curStep == 376 then
        triggerEvent('screen shake', (crochet*0.002)..',0.012')
        tweenShader("mirror", "zoom", 2.5, crochet * 0.0015, "cubeOut")
    elseif curStep == 384 then
        tweenShader("mirror", "zoom", 1, crochet * 0.0005, "cubeOut")
    elseif curStep == 408 then
        triggerEvent('screen shake', (crochet*0.002)..',0.012')
        tweenShader("mirror2", "zoom", 2, crochet * 0.001, "cubeOut")
        tweenShader("fish", "power", 2, crochet * 0.002, "cubeIn")
        tweenShader("mirror2", "angle", -180, crochet * 0.002, "cubeIn")
    elseif curStep == 416 then
        tweenShader("mirror2", "zoom", 1, crochet * 0.0005, "cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.0005, "cubeOut")
        tweenShader("fish", "power", 0, crochet * 0.002, "cubeOut")
        flashCamera("game","",crochet*0.002)
    elseif curStep == 536 then
        tweenShader("mirror2", "angle", -180, crochet * 0.002, "cubeIn")
    elseif curStep == 544 or curStep == 1328 then
        tweenShader("bars", "effect", 0.1, crochet * 0.008, "cubeOut")
        setShaderProperty("mirror2","zoom",3)
        setShaderProperty("mirror2","angle",90)
        tweenShader("mirror2", "zoom", 1, crochet * 0.028, "cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.020, "cubeOut")
        flashCamera("game","",crochet*0.002)
        setShaderProperty("sketch","strength",1)
    elseif curStep == 664 or curStep == 1448 then
        tweenShader("mirror2", "zoom", 2, crochet * 0.001, "cubeOut")
    elseif curStep == 670 or curStep == 1454 then
        tweenShader("fish", "power", 1, crochet * 0.00045, "cubeIn")
        tweenShader("mirror2", "zoom", 1, crochet * 0.0005, "cubeIn")
    elseif curStep == 672 or curStep == 1456 then
        cam = false
        triggerEvent('screen shake', (crochet*0.032)..',0.015')
        tweenShader("fish", "power", 0.3, crochet * 0.0005, "cubeOut")
        setShaderProperty("sketch","strength",0)
        bumpflash(15,true,true,false)
    elseif curStep == 704 or curStep == 1488 then
        bumpflash(-15,true,false,true)
    elseif curStep == 736 or curStep == 1520 then
        bumpflash(15,true,true,false)
    elseif curStep == 752 or curStep == 1536 then
        bumpflash(-15,false)
    elseif curStep == 768 or curStep == 1552 then
        bumpflash(15,true,false,true)
    elseif curStep == 784 or curStep == 1568 then
        tweenShader("mirror2", "zoom", 3, crochet * 0.002, "cubeOut")
    elseif curStep == 792 or curStep == 1576 then
        tweenShader("mirror2", "angle", 180, crochet * 0.0019, "cubeIn")
        tweenShader("fish", "power", 1, crochet * 0.002, "cubeIn")
    end
    if curStep == 1456 then
                setShaderProperty("titleeffect","money",0.9)
    elseif curStep == 1584 then
        flashCamera("hud","",crochet*0.001)
                setShaderProperty("bars","effect",0.55)
    end
    if curStep == 800 or curStep == 1600 then
        hud(0, crochet, 2, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.032)..',0.012')
        tweenShader("mirror2", "zoom", 1.3, crochet * 0.0005, "cubeOut")
        tweenShader("fish", "power", 0.1, crochet * 0.0005, "cubeOut")
        flashCamera("game","",crochet*0.002)
        tweenShader("mirror2", "angle", 0, crochet * 0.0005, "cubeOut")
        set("undefinedSprite1.alpha",0.9)
        setShaderProperty("speedlines","transparency",0)
                        setShaderProperty("bars","effect",0.1)
        perroxd,elfuturoeshoy = true,false
        cam = true
        bf,matt = false,false
           setShaderProperty("bloom","contrast",1)
        setProperty('', 'cameraSpeed', 3)
        setShaderProperty("Glitchy","AMT",0.07)
        volando = true
    elseif curStep == 816 or curStep == 1616 then
        perroxd = false
        tweenShader("mirror", "angle", 180, crochet * 0.001, "cubeOut")
    elseif curStep == 820 or curStep == 1620 then
        tweenShader("bloom", "contrast", 3, crochet * 0.001, "cubeIn")
        tweenShader("mirror", "angle", 0, crochet * 0.001, "cubeOut")
    elseif curStep == 824 or curStep == 1624 then
        tweenShader("mirror2", "zoom", 2, crochet * 0.001, "cubeOut")
        tweenShader("bars", "effect", 0.25, crochet * 0.001, "cubeOut")
        tweenShader("mirror", "x", 8, crochet * 0.0035, "cubeOut")
    elseif curStep == 834 or curStep == 1634 then
        perroxd = true
        tweenShader("bloom", "contrast", 1, crochet * 0.001, "cubeOut")
        tweenShader("bars", "effect", 0.1, crochet * 0.001, "cubeOut")
        tweenShader("mirror2", "zoom", 1.3, crochet * 0.001, "cubeOut")
    elseif curStep == 928 then
        perroxd,cam,matt = false,false,true
        flashCamera("hud","",crochet*0.002)
        setShaderProperty("sketch","strength",1)
        set("defaultCamZoom", 1)
    elseif curStep == 936 then
        elfuturoeshoy,angle = true,10
    elseif curStep == 944 then
        tweenShader("bars", "effect", 0, crochet * 0.001, "cubeOut")
        tweenShader("mirror2", "zoom", 3, crochet * 0.001)
        tweenShader("mirror2", "y", -4, crochet * 0.002)
    elseif curStep == 948 then
        tweenShader("bars", "effect", 0.25, crochet * 0.001, "cubeIn")
        tweenShader("mirror2", "zoom", 2, crochet * 0.001, "cubeIn")
    elseif curStep == 952 then
        elfuturoeshoy = false
        flashCamera("hud","",crochet*0.002)
        tweenShader("mirror", "x", 12, crochet * 0.0035, "cubeInOut")
    elseif curStep == 958 then
        tweenShader("bars", "effect", 0, crochet * 0.0005, "cubeOut")
    elseif curStep == 960 then
        triggerEvent('screen shake', (crochet*0.024)..',0.012')
        perroxd,perlinlol,cam,matt = true,true,true,false
        flashCamera("game","",crochet*0.002)
        setShaderProperty("sketch","strength",0)
        tweenShader("bars", "effect", 0.1, crochet * 0.004, "cubeOut")
        tweenShader("mirror2", "zoom", 1.3, crochet * 0.001, "cubeOut")
    elseif curStep == 992+32 then
        tweenShader("mirror2", "zoom", 20, crochet * 0.008, "cubeIn")
    elseif curStep == 1056 then
        perroxd,perlinlol,elfuturoeshoy = false,false,true
        flashCamera("hud","",crochet*0.002)
        tweenShader("bars", "effect", 0.1, crochet * 0.004, "cubeOut")
        tweenShader("mirror2", "zoom", 1, crochet * 0.0005, "cubeOut")
        setProperty('', 'cameraSpeed', 1)
        set("undefinedSprite1.alpha",0)
        volando = false
        setShaderProperty("speedlines","transparency",1)
        setShaderProperty("Glitchy","AMT",0)
        tweenShader("fish", "power", 0, crochet * 0.0005, "cubeOut")
    end
    if curStep == 1184 then
        angle = -10
    elseif curStep == 1310 then
        setShaderProperty("bloom","contrast",0)
    elseif curStep == 1328 then
        setShaderProperty("bloom","contrast",1)
    elseif curStep == 1724 then
         tweenShader("mirror2", "zoom", 20, crochet * 0.001, "cubeIn")
    elseif curStep == 1728 then
        setShaderProperty("titleeffect","money",1.1)
       perlinlol = true
        setShaderProperty("mirror","x",0)
         flashCamera("hud","",crochet*0.001)
        setShaderProperty("bars","effect",0)
        setShaderProperty("bars2","effect",0.1)
    elseif curStep == 1856 then
        perroxd,perlinlol,elfuturoeshoy = false,false,true
        flashCamera("hud","",crochet*0.002)
        setShaderProperty("titleeffect","money",0)
        tweenShader("bars", "effect", 0.1, crochet * 0.004, "cubeOut")
        tweenShader("mirror2", "zoom", 1, crochet * 0.0005, "cubeOut")
        setProperty('', 'cameraSpeed', 1)
        set("undefinedSprite1.alpha",0)
        volando = false
        setShaderProperty("speedlines","transparency",1)
        setShaderProperty("Glitchy","AMT",0)
        tweenShader("fish", "power", 0, crochet * 0.0005, "cubeOut")
        tweenShader("bloom", "contrast", 1, crochet * 0.001, "cubeOut")
         tweenShader("bloom", "brightness", -1, crochet * 0.032, "cubeIn")
    end
    if curStep >= 1728 and curStep < 1856 then
        if curStep % 8 == 0 then
            tweenShader("bloom", "contrast", 1, crochet * 0.001, "cubeOut")
           tweenShader("mirror2", "zoom", 1.5, crochet * 0.001, "cubeOut")
        elseif curStep % 8 == 4 then
            tweenShader("bloom", "contrast", 2, crochet * 0.001, "expoIn")
            tweenShader("mirror2", "zoom", 1, crochet * 0.001, "expoIn")
        end
        if curStep % 32 == 16 then
             tweenShader("mirror", "x", 0.4, crochet * 0.001, "cubeOut")
        elseif curStep % 32 == 20 or curStep % 32 == 28 then
              tweenShader("mirror", "x", 0, crochet * 0.001, "cubeIn")
        elseif curStep % 32 == 24 then
              tweenShader("mirror", "x", -0.4, crochet * 0.001, "cubeOut")
        end
    end
    if curStep >= 288 and curStep < 536 then
        if curStep % 32 == 0 then
            angle = -10
            if curStep < 416 then x = 0.05 end
        elseif curStep % 32 == 8 or curStep % 32 == 24 then
            angle = 10
            if curStep < 416 then x = -0.05 end
        elseif curStep % 32 == 12 or curStep % 32 == 20 or curStep % 32 == 26 then
            angle = -10
        elseif curStep % 32 == 14 or curStep % 32 == 28 then
            angle = 10
        end
    end
    
end
function bumpflash(s,q,lol,lol2)
    if q then
       matt,bf = lol,lol2
    end
    flashCamera("game","",crochet*0.002)
    setShaderProperty("mirror2","angle",s)
    tweenShader("mirror2", "angle", 0, crochet * 0.004)
end