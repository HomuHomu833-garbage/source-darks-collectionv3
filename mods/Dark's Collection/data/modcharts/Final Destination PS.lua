function hud(s, step, c, ease)
    tween("healthBar", {alpha = s}, step * 0.001 * c, ease)
    tween("healthBarBG", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP1", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP2", {alpha = s}, step * 0.001 * c, ease)
    tween("scoreTxt", {alpha = s}, step * 0.001 * c, ease)
    tween("timeBar", {alpha = s}, step * 0.001 * c, ease)
    tween("ratingText", {alpha = s}, step * 0.001 * c, ease)
end
function createPost()
      hud(0, crochet, 1, 'cubeOut')
      makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.001, 'chessnose')
    setActorLayer('chessnose', getActorLayer('girlfriend'))
    local shaders = {
        {"distorcion", "DistortionEffect", {size = 0.2}},
        {"mandela", "FDPaperShader", {strength = 0,backgroundFadeDistance = 3.5}},
        {"pixel", "MosaicEffect", {strength = 0}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}}, 
        {"mirror", "BarrelBlurEffect", {zoom = 1.5, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"bars", "bars", {effect = 0.55,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 20, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"fish", "EyeFishEffect", {power = 0.2}},
        {"titleeffect", "coloreffect", {money = 0}},
        {"greyscale", "GreyscaleEffect", {strength = 0}},
        {"ca", "ChromAbBlueSwapEffect", {strength = 0.002}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = 0,effect = 0, strength = 0}},
        {"Sunrays", "Sunrays", {strength = 1}}
        
        
     }
 
    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        if name ~= "bump" and name ~= "mirror2" and name ~= "mirror"
        and name ~= "bars" and name ~= "fish" and name ~= "Sunrays"
         and name ~= "pixel"  and name ~= "mandela" and name ~= "ca"
        and name ~= "distorcion"  then
            setCameraShader('hud', name)
        end 
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
    
    set("dadCharacter0.x",getActorX("dadCharacter0")-500)
    set("dadCharacter1.x",getActorX("dadCharacter1")-500)
    set("dadCharacter0.alpha",0)
    set("dadCharacter1.alpha",0)
    set("boyfriend.alpha",0)

    setActorShader("chessnose","mandela")
    removeCameraShader("game","mandela")
        setProperty('', 'centerCamera', true)
end
local perlinX,perlinY ,time = 0, 0, 0
local perlinSpeed,perlinXRange,perlinYRange = 2, -0.009, 0.009
locura,sxm,bf = true,false,false
function update(elapsed)
    time = time + elapsed
        setShaderProperty("titleeffect","uTime",time)
    setShaderProperty("Sunrays","iTime",time)
        setShaderProperty("distorcion","iTime",time)
    setShaderProperty("mandela","iTime",time*1.5)
    zoom = lerp(zoom, 1, elapsed * 6)
    setShaderProperty('bump', 'zoom', zoom)
     angle = lerp(angle, 0, elapsed*6)
    setShaderProperty('bump', 'angle', angle)
    distorcion = lerp(distorcion, 0, elapsed * 6)
    setShaderProperty('distorcion', 'size', distorcion)
    if locura then
    x = lerp(x, 0, elapsed * 6)
    y = lerp(y, 0, elapsed * 6)
    angle = lerp(angle,0,elapsed*6)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    setShaderProperty('bump', 'x', x + perlinOffsetX)
    setShaderProperty('bump', 'y', y + perlinOffsetY)
    end
    if sxm then
        set("camFollow.x",800)
        set("camFollow.y",750)
        set("defaultCamZoom", 0.8)
    end
    if bf then
        set("camFollow.x",1700)
        set("camFollow.y",1000)
        set("defaultCamZoom", 1)
    end
end


function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShader('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function startSong()
    bloom(0,1,crochet,4,"")
    tweenShader("fish", "power", 0, crochet * 0.004, "cubeIn")
    tweenShader("bars", "effect", 0, crochet * 0.004, "quadOut")
    tweenShader("mirror2", "angle", -20, crochet * 0.004, "cubeIn")
    mirror(false,true,"","zoom",0,0.8,4,crochet,"cubeIn")
end
bumpalto = {12,14,32,40,46,48,60,62,64,72,76,78,88,96,108,110,112,116,120,124,128,132,136,140,960,968,974,976,988,990,992,1000,1004,1006,1008,1024,1032
,1038,1040,1052,1054,1056,1064,1068,1070,1072,1080,1086,1088,1096,1100,1102,1104,1108,1112,1115,1118,1120,1124,1128,1131,1134,1135}
x1 = {1138,1142,1148,1152,1824,1856,1888}
x2 = {1136,1140,1144,1150,1808,1840,1872,1904}
function stepHit()
    for i = 1, #bumpalto do
        if curStep == bumpalto [i] then
            zoom = 0.7
        end
    end
    for i = 1, #x1 do
        if curStep == x1 [i] then
            x = 0.15
        end
    end
    for i = 1, #x2 do
        if curStep == x2 [i] then
            x = -0.15
        end
    end
    if curStep == 1904 then
           triggerEvent('screen shake',(crochet*0.004)..',0.01')
    elseif curStep == 1912 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 1920 then
         triggerEvent('screen shake',(crochet*0.004)..',0.005')
          mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
          bloom(1,0,crochet,3,"")
    end
    if curStep == 16 then
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+500,alpha = 1},crochet*0.002,"cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 32 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+500,alpha = 1},crochet*0.002,"cubeOut")
    elseif curStep == 48 then
         set("boyfriend.x",getActorX("boyfriend")+500)
        tween("boyfriend",{x = getActorX("boyfriend")-500,alpha = 1},crochet*0.002,"cubeOut")
    elseif curStep == 128 then
        tweenShader("fish", "power", 0.2, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        perro = false
    elseif curStep == 136 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
        tweenShader("pixel", "strength", 100, crochet * 0.002, "cubeIn")
    elseif curStep == 144 then
        perro = true
          hud(1, crochet, 4, 'cubeOut')
                  setProperty('', 'centerCamera', false)
        --  tweenShader("bars", "effect", 0.07, crochet * 0.004, "quadOut")
        tweenShader("pixel", "strength", 0, crochet * 0.002, "cubeOut")
        tweenShader("fish", "power", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    end
    
    if curStep == 80 then
        set("defaultCamZoom", 0.8)
    elseif curStep == 144 then
        set("defaultCamZoom", 0.6)
    end
    if curStep >= 16 and curStep < 656 or curStep >= 1152 and curStep < 1536 then
        if curStep < 145 then
            if curStep % 16 == 0 then
                bloom(2,1,crochet,2,"")
            end
        else
            if curStep % 8 == 0 then
                 set("defaultCamZoom", math.random() * 0.25 + 0.6)
            end
        end
    end
    if curStep >= 128 and curStep < 398 then
        if perro then
            if curStep % 32 == 0 or curStep % 32 == 4 or curStep % 32 == 6 or curStep % 32 == 10
            or curStep % 32 == 14 or curStep % 32 == 15 or curStep % 32 == 16 or curStep % 32 == 19 
            or curStep % 32 == 22 or curStep % 32 == 26 or curStep % 32 == 30 then
                zoom,x = 0.8,-0.03
            end
        end
    end
    if curStep >= 1152 and curStep < 1280 then
       
            if curStep % 32 == 0 or curStep % 32 == 3 or curStep % 32 == 6 or curStep % 32 == 10
            or curStep % 32 == 14 or curStep % 32 == 16 or curStep % 32 == 19 or curStep % 32 == 22 
            or curStep % 32 == 26 or curStep % 32 == 30 or curStep % 32 == 31 then
                zoom,x = 0.8,-0.03
            end
        
    end
    if curStep == 272 or curStep == 528 or curStep == 592 or curStep == 1152 or curStep == 1408 or curStep == 1472 then
        sxm = true
        bf = false
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 304 or curStep == 560 or curStep == 624 or curStep == 1184 or curStep == 1440 or curStep == 1504 then
        bf = true
        sxm = false
    end
    
    if curStep == 464 or curStep == 592 or curStep == 1008 or curStep == 1072 or curStep == 1088 or curStep == 1104 or curStep == 1120 
    or curStep == 1304 or curStep == 1472 then
        bloom(2,1,crochet,2,"")
    elseif curStep == 512 or curStep == 1392 then
         tweenShader("fish", "power", 0.1, crochet * 0.001)
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-25,1,crochet,"cubeOut")
    elseif curStep == 516 or curStep == 1396 then
         tweenShader("fish", "power", 0.25, crochet * 0.001,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 520 or curStep == 1400 then
         tweenShader("fish", "power", 0.2, crochet * 0.001,"cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-45,1,crochet,"cubeOut")
    elseif curStep == 524 or curStep == 1404 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,45,1,crochet,"cubeOut")
    elseif curStep == 528 or curStep == 1408 then
         bloom(2,1,crochet,2,"")
        mirror(true,true,"angle","angle",-180,0,2,crochet,"cubeOut")
    elseif curStep == 640 or curStep == 1520 then
        sxm = false
        bf = false
        setProperty('', 'cameraSpeed', 1)
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    elseif curStep == 648 or curStep == 1528 then
         tween("dadCharacter0",{alpha = 0},crochet*0.002,"cubeIn")
          tween("dadCharacter1",{alpha = 0},crochet*0.002,"cubeIn")
           tween("boyfriend",{alpha = 0},crochet*0.002,"cubeIn")
          tweenShader("titleeffect", "money", 0, crochet * 0.0015,"cubeIn")
           tweenShader("fish", "power", 1, crochet * 0.002,"cubeIn")
        mirror(false,true,"","zoom",0,6,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-25,2,crochet,"cubeIn")
    end
    if curStep == 1528 then
         tweenShader("pixel", "strength",100, crochet * 0.002,"cubeIn")
    elseif curStep == 1536 then
         tweenShader("pixel", "strength",0, crochet * 0.001,"cubeOut")
        setShaderProperty("titleeffect","money",0.65)
    end
    if curStep == 936 then
        tweenShader("greyscale", "strength", 0, crochet * 0.002,"cubeIn")
         mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
          mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
    elseif curStep == 944 then
          bloom(2,1,crochet,2,"")
             triggerEvent('screen shake',(crochet*0.016)..',0.002')
        mirror(true,true,"angle","angle",-180,0,2,crochet,"cubeOut")
          setShaderProperty("mandela", "strength", 0)
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader("greyscale", "strength", 1, crochet * 0.001,"cubeOut")
    elseif curStep == 1104 then
          triggerEvent('screen shake',(crochet*0.008)..',0.01')
              tweenShader("greyscale", "strength", 0, crochet * 0.008,"cubeIn")
    elseif curStep == 1008 then
        triggerEvent('screen shake',(crochet*0.024)..',0.005')
    elseif curStep == 1120 then
                  tweenShader("fish", "power", 0.5, crochet * 0.004,"cubeIn")
         mirror(false,true,"","zoom",0,0.2,4,crochet,"cubeIn")
    elseif curStep == 1136 then
         bloom(2,1,crochet,2,"")
        tweenShader("greyscale", "strength", 1, crochet * 0.001,"cubeOut")
          tweenShader("fish", "power", 0.2, crochet * 0.002,"cubeOut")
         mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
          mirror(false,true,"","angle",0,180,1,crochet,"cubeOut")
    elseif curStep == 1144 then
          tweenShader("fish", "power", 0.1, crochet * 0.002,"cubeIn")
         mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
          mirror(false,true,"","angle",0,370,2,crochet,"cubeIn")
    elseif curStep == 1152 then
         bloom(2,1,crochet,2,"")
         hud(1, crochet, 4, 'cubeOut')
        tweenShader("greyscale", "strength", 0, crochet * 0.001,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
          mirror(true,true,"angle","angle",10,0,2,crochet,"cubeOut")
    end

    if curStep >= 400 and curStep < 512 or curStep >= 528 and curStep < 640 or curStep >= 1280 and curStep < 1392
    or curStep >= 1408 and curStep < 1520 then
        if curStep % 4 == 0 then
            distorcion = 0.1
             setShaderProperty("fish", "power", 0.25)
            mirror(false,true,"","zoom",0,1.15,0.5,crochet,"cubeOut")
             tweenShader("fish", "power", 0, crochet * 0.001)
        elseif curStep % 4 == 2 then
            mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
        end
        if curStep >= 464 and curStep < 512 or curStep >= 592 and curStep < 640 or curStep >= 1344 and curStep < 1392
        or curStep >= 1472 and curStep < 1520  then
            local flip = ((math.floor((curStep - 128) / 8) % 2) == 0) and 1 or -1
            if curStep % 8 == 0 then
                angle = 15 * flip
                x = -0.1
            elseif curStep % 8 == 4 then
                angle = -15 * flip
                x = 0.1
            end
        end
    end
    if curStep >= 656 and curStep < 720 or curStep >= 1536 and curStep < 1600 then
       if curStep % 4 == 0 then
        zoom = 0.75
       end
    end
    if curStep >= 720 and curStep < 912 or curStep >= 1600 and curStep < 1792 then
        local stepInSection = curStep % 32
        if stepInSection == 0 or stepInSection == 4 or stepInSection == 8 or stepInSection == 11 
        or stepInSection == 14 or stepInSection == 16 or stepInSection == 20 or stepInSection == 24
         or stepInSection == 27 or stepInSection == 30 or stepInSection == 31 then
            zoom = 0.75
        end
    end

    perro1(144)
    parte2(272)
    parte2(1152)
    drop(656)
    drop(1536)
end
function perro1(s)
    if curStep == s+56 then
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
        tweenShader("fish", "power", 0.1, crochet * 0.0005, "cubeOut")
        distorcion = 0.1
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,0.5,crochet,"cubeOut")
        tweenShader("fish", "power", 0.2, crochet * 0.0005, "cubeOut")
         distorcion = 0.1
    elseif curStep == s+62 then
        tweenShader("fish", "power", 0, crochet * 0.0005, "cubeIn")
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeIn")
    elseif curStep == s+64 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
          bloom(2,1,crochet,2,"")
    end

    if curStep == s+88 or curStep == s+92 or curStep == s+96 then
        setShaderProperty("fish", "power", 0.25)
    end
    if curStep == s+88 then
         distorcion = 0.1
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
        tweenShader("fish", "power", 0, crochet * 0.001)
    elseif curStep == s+92 then
         distorcion = 0.1
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
        tweenShader("fish", "power", 0, crochet * 0.001)
    elseif curStep == s+96 then
        tweenShader("fish", "power", 0, crochet * 0.001)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,2,crochet,"cubeOut")
        distorcion = 0.1
    end
    if curStep == s+120 then
         tweenShader("pixel", "strength", 100, crochet * 0.002, "cubeIn")
        x = -0.2 distorcion = 0.1 mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        tweenShader("fish", "power", 0.1, crochet * 0.001, "cubeOut")
         tweenShader("bars", "effect", 0.1, crochet * 0.001, "cubeOut")
    elseif curStep == s+124 then
         tweenShader("bars", "effect", 0.15, crochet * 0.001, "cubeOut")
         x = 0.2 distorcion = 0.1 mirror(false,true,"","zoom",0,1.5,0.8,crochet,"cubeOut")
        tweenShader("fish", "power", 0.2, crochet * 0.001, "cubeOut")
    elseif curStep == s+128 then
          tweenShader("fish", "power", 0, crochet * 0.001, "cubeOut")
        setShaderProperty("mirror", "zoom", 1)
          bloom(2,1,crochet,2,"")
        tweenShader("pixel", "strength", 0, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect", 0, crochet * 0.002, "cubeOut")
    end
end
function parte2(s)--272
    if curStep == s+16  then
         mirror(true,true,"y","y",0,2,2,crochet,"cubeInOut")
    elseif curStep == s+20  then
        tweenShader("fish", "power", 0.2, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "zoom", 1.25, crochet * 0.002, "cubeOut")
    elseif curStep == s+24 then
        tweenShader("mirror2", "angle", 180, crochet * 0.002, "cubeIn")
    
    elseif curStep == s+28 then
        tweenShader("fish", "power", 0, crochet * 0.001, "cubeIn")
        tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeIn")
    elseif curStep == s+32 then--304
        tweenShader("mirror2", "angle", 360, crochet * 0.001, "cubeOut")
    elseif curStep == s+44 then
        distorcion = 0.1
        tweenShader("fish", "power", 0.1, crochet * 0.001, "cubeOut")
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",180,0,1,crochet,"cubeOut")
    elseif curStep == s+48 then
         tweenShader("fish", "power", 0, crochet * 0.0005, "cubeOut")
         mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == s+56 then
         tweenShader("bars", "effect", 0.1, crochet * 0.001, "cubeOut")
        tweenShader("fish", "power", 0.25, crochet * 0.001, "cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        tweenShader("mirror2", "x", 1, crochet * 0.0009, "cubeOut")
        mirror(true,true,"angle","angle",15,0,1,crochet,"cubeOut")
        locura = false
    elseif curStep == s+60 then
         tweenShader("bump", "y", 2, crochet * 0.001, "cubeOut") 
         mirror(false,true,"","angle",0,90,0.5,crochet,"cubeOut")
        tweenShader("bars", "effect", 0.2, crochet * 0.0005, "cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShader("mirror2", "angle", 450, crochet * 0.0009, "cubeOut") 
       tweenShader("mirror2", "x", 0, crochet * 0.00001, "cubeOut")
    elseif curStep == s+62 then
        tweenShader("bars", "effect", 0.55, crochet * 0.00045, "cubeIn")
        mirror(false,true,"","angle",0,-90,0.45,crochet,"cubeIn")
    elseif curStep == s+64 then
        flashCamera("hud","gray",crochet*0.001)
        setShaderProperty("mirror","angle",0)
        bf,locura = false,true
        setShaderProperty("bars","effect2",0.55)
        setShaderProperty("bars","effect",0)
        setShaderProperty("mirror2","angle",0)
        tweenShader("fish", "power", 0, crochet * 0.001, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader("bars", "effect2", 0, crochet * 0.002, "cubeOut")
    elseif curStep == s+80 then
        tweenShader("fish", "power", 0.2, crochet * 0.001, "cubeOut")     
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    elseif curStep == s+86 then
        tweenShader("fish", "power", 0, crochet * 0.0005, "cubeIn")
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == s+88 then
        mirror(true,true,"angle","angle",25,0,1,crochet,"cubeOut")
    elseif curStep == s+92 then
        mirror(true,true,"angle","angle",-25,0,1,crochet,"cubeOut")
    elseif curStep == s+96  then
         tweenShader("fish", "power", 0.25, crochet * 0.0015, "cubeOut")     
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"cubeOut")
         mirror(false,true,"","angle",0,-25,1.5,crochet,"cubeOut")
    elseif curStep == s+108 then
         tweenShader("fish", "power", 0, crochet * 0.001, "cubeIn")     
         mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
     elseif curStep == s+112 then
         tweenShader("fish", "power", 0.25, crochet * 0.0015, "cubeOut")     
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"cubeOut")
         mirror(false,true,"","angle",0,25,1.5,crochet,"cubeOut")
     elseif curStep == s+120 then
         tweenShader("fish", "power", 0.15, crochet * 0.001, "cubeOut")    
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
         mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
     elseif curStep == s+124 then
         tweenShader("fish", "power", 0, crochet * 0.001, "cubeOut")    
        tweenShader("bars", "effect", 0.55, crochet * 0.001, "cubeIn")
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
         mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
     elseif curStep == s+126 then
          mirror(false,true,"","angle",0,-90,0.5,crochet,"cubeIn")
     elseif curStep == s+128 then
        setShaderProperty("titleeffect", "money", 1.1)
        flashCamera("hud","gray",crochet*0.001)
        mirror(true,true,"angle","angle",180,0,1,crochet,"cubeOut")
        tweenShader("bars", "effect", 0, crochet * 0.002, "cubeOut")
    end
end
function drop(s)
    if curStep == s+24 then
         tweenShader("fish", "power", 0.35, crochet * 0.002, "cubeOut")
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut") 
              mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
    elseif curStep == s+28 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn") 
    elseif curStep == s+32 then
         tweenShader("fish", "power", 0.1, crochet * 0.001, "cubeOut")
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut") 
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    elseif curStep == s+40 then
         mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn") 
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut") 
        mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
    elseif curStep == s+56 then
        tweenShader("fish", "power", 1, crochet * 0.002, "cubeIn")
         mirror(false,true,"","zoom",0,10,2,crochet,"cubeIn") 
            mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
    elseif curStep == s+64 then
         bloom(2,1,crochet,2,"")
        tweenShader("fish", "power", 0.1, crochet * 0.0001,"cubeOut")
        mirror(false,true,"","zoom",0,1,0.1,crochet,"cubeOut") 
        mirror(false,true,"","angle",0,0,0.1,crochet,"cubeOut")
    elseif curStep == s+96+16 then
        locura = false
        tweenShader("bump", "x",8, crochet * 0.005, "cubeInOut")
         mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut") 
         tweenShader("bars", "effect", 0.1, crochet * 0.001, "cubeOut")
        tweenShader("mirror2", "angle", -10, crochet * 0.001, "cubeOut")
    elseif curStep == s+104+16 then
         tweenShader("mirror2", "angle", 10, crochet * 0.002, "cubeIn")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"quadOut") 
         tweenShader("bars", "effect", 0.2, crochet * 0.002, "quadOut")
    elseif curStep == s+112+16 then
         bloom(2,1,crochet,2,"")
         locura = true
          tweenShader("bars", "effect", 0, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut") 
    end
    if curStep == s+144 or curStep == s+176 or curStep == s+208 then
        x = 0.2
    elseif curStep == s+160 or curStep == s+192 or curStep == s+224 then
        x = -0.2
    end
    if curStep == s+192 then
             bloom(2,1,crochet,2,"")
    elseif curStep == s+224 then
        tweenShader("greyscale", "strength", 1, crochet * 0.008, "cubeIn")
        mirror(false,true,"","zoom",0,1.5,8,crochet,"cubeIn") 
        mirror(false,true,"","angle",0,-45,8,crochet,"cubeIn") 
    elseif curStep == s+256 then
         mirror(false,true,"","angle",0,0,2,crochet,"cubeOut") 
         bloom(2,1,crochet,2,"")
    end
    if curStep == s then

        lol = true
        set("defaultCamZoom", 0.6)
            tween("dadCharacter0",{x = getActorX("dadCharacter0")+330,alpha = 1},crochet*0.003,"cubeOut")
            tween("dadCharacter1",{x = getActorX("dadCharacter1")+530,alpha = 1},crochet*0.003,"cubeOut")
            hud(0, crochet, 4, 'cubeOut')
           setShaderProperty("mandela", "strength", 0.5)
         bloom(2,1,crochet,2,"")
        tweenShader("fish", "power", 0, crochet * 0.0001,"cubeOut")
        mirror(false,true,"","zoom",0,1,0.1,crochet,"cubeOut") 
        mirror(false,true,"","angle",0,0,0.1,crochet,"cubeOut")
    elseif curStep == s+32 or curStep == s+128+32 then
        tween("dadCharacter0",{x = getActorX("dadCharacter0")-330},crochet*0.003,"cubeOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-530},crochet*0.003,"cubeOut")
        tween("boyfriend",{alpha = 1},crochet*0.003,"cubeOut")
    elseif curStep == s+128 then
        sxm = false
        bf = false
        setProperty('', 'cameraSpeed', 1)
        set("defaultCamZoom", 0.6)
        tween("boyfriend",{alpha = 0},crochet*0.003,"cubeOut")
         tween("dadCharacter0",{x = getActorX("dadCharacter0")+330,alpha = 1},crochet*0.003,"cubeOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+530,alpha = 1},crochet*0.003,"cubeOut")
    elseif curStep == s+128+128 then
         sxm = false
         lol = false
        bf = false
        setProperty('', 'cameraSpeed', 1)
        set("defaultCamZoom", 0.6)
    end
    if curStep == s+64 or curStep == s+128+64 then
        sxm = true
        bf = false
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == s+96 or curStep == s+128+96 then
        bf = true
        sxm = false
    end
end

lol = false
function playerTwoSing(data, time, type)
    if lol then
		trailfd("dadCharacter1",data)
        trailfd("boyfriend",data)
        trailfd("dadCharacter0",data)
    end
end
local trailCount = 0
local trailLimit = 150
function trailfd(baseSprite, data)
    destroySprite('trail'..trailCount)
    makeSpriteCopy('trail'..trailCount, baseSprite)
    local duration = stepCrochet * 0.001 * 16
    tweenFadeOut('trail'..trailCount, 0, duration, 'trailFinish')
    tweenScaleX('trail'..trailCount, 1.2, duration, 'cubeInOut', 'trailFinish')
    tweenScaleY('trail'..trailCount, 1.2, duration, 'cubeInOut')
    local angle = data * (math.pi / 2)
    tweenActorProperty('trail'..trailCount, 'x', 150 * math.sin(angle), duration, 'cubeIn')
    tweenActorProperty('trail'..trailCount, 'y', 150 * math.cos(angle), duration, 'cubeIn')
    setActorLayer('trail'..trailCount, getActorLayer(baseSprite) - 1)

    trailCount = trailCount + 1
    if trailCount >= trailLimit then 
        trailCount = 0
    end
end
