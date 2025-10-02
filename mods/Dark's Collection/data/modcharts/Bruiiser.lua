local sprites = {
    {'punch1','Songs IMGS/Bruiiser/puno', -300,1500,3.5,"game"},
    {'punch2','Songs IMGS/Bruiiser/puno', 900,1500,3.5,"game"},
    {'lol','Songs IMGS/Bruiiser/puño', 70,500,1,"hud"},

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
function createPost()
    set("camHUD.alpha",0)
        hud(0, crochet, 1, 'cubeOut')
    for _, sprite in ipairs(sprites) do
        makePerspectiveSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorScroll(0,0,sprite[1])
        if sprite[1] == "text" then
            set(sprite[1] .. ".angleX", 90)
        elseif sprite[1] == "blue2" then
            set(sprite[1] .. ".alpha", 0)
        end
        if sprite[6] == "hud" then
            setActorLayer(sprite[1], layershit)
        end
    end
    local shaders = { 
        {"color", "SwapManiaColor", {hueShift = 0,saturationBoost = 0.5,strength = 0.25,brightnessBoost= 0.5 , blendOverlay = true}},
        {"speedlines", "speedlines", {transparency = 1}},
        {"mirror", "BarrelBlurEffect", {zoom = 0.7, angle = 0, x = 0, y = -0.15, barrel = 0, doChroma = true}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, dist = 0, doChroma = true}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = -0.1}},
        {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"zoomblur", "zoomblur", {focusPower = 5, posX = 0}},
        {"greyscale", "greyscale", {strength = 1}},
        {"pez", "EyeFishEffect", {power = 0.1}},
        {"atest", "atest", {invert1 = 0,move = 0,center1X = 0, center2X = 1 , center1Y = 1, center2Y = 1,zoom1 = 1.2 , zoom2 = 1.2 ,strength = 1}},
        {"bars", "bars", {effect = 0.07,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"ca", "ChromAbEffect", {strength = 0.002}}
    }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
     setCameraShader('hud', "ca")
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(1, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
    set("boyfriend.alpha", 0)
    set("gf.alpha", 0)
    set("dad.alpha", 0)
    set("undefinedSprite5.alpha", 0)
    set("undefinedSprite5.angle", -25)
    set("undefinedSprite6.alpha", 0)
    set("undefinedSprite6.angle", 25)
    setProperty("","centerCamera",true)

    setCamZoom(0.42)
end
function camaraloca(invert1,center1X, center2X , center1Y, center2Y,zoom1 , zoom2)
    setShaderProperty("atest","invert1",invert1)
    setShaderProperty("atest","center1X",center1X)
    setShaderProperty("atest","center2X",center2X)
    setShaderProperty("atest","center1Y",center1Y)
    setShaderProperty("atest","center2Y",center2Y)
    setShaderProperty("atest","zoom1",zoom1)
    setShaderProperty("atest","zoom2",zoom2)
end
function startSong()
    tween("camHUD",{alpha = 1},crochet*0.004)
    bloom(0,1,crochet,4,"cubeOut")
    tweenShader("greyscale","strength",0,crochet*0.016)
    tweenShader("atest","move",0.5,crochet*0.016)
    tweenShader("zoomblur","focusPower",0,crochet*0.016)
    tween("blackBG", {alpha = 0.5}, crochet*0.004,"quadOut")
    tween("undefinedSprite6", {alpha = 1}, crochet*0.004,"quadIn")
    tween("undefinedSprite6", {angle = 0}, crochet*0.006,"quadInOut")
    mirror(false,true,"","zoom",0,1,4,crochet,"quadOut")
    mirror(false,true,"","y",0,0,16,crochet,"quadOut")
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
function st(set,tween,shader,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty(shader,value,valor)
    end
    if tween then
        tweenShader(shader,value2,valor2, speed*0.001*s,ease)
    end
end
local perlinX, perlinY, perlinZ, time = 0, 0, 0, 0
local perlinSpeed = 0.9
local targetPerlinSpeed = perlinSpeed
local perlinSpeedLerpRate = 0
local perlinXRange, perlinYRange, perlinZRange = 0.1, 0.1, 7
local x, y, angle = 0, 0, 0
matt,bf = false,false
function update(elapsed)
    time = time + elapsed
    setShaderProperty("color","iTime",time/1.5)
    setShaderProperty("speedlines","iTime",time/5)
    if matt then
        set("defaultCamZoom", 1) 
        set("camFollow.x", get("dad.x") +150)
        set("camFollow.y", get("dad.y"))
    elseif bf then
        set("defaultCamZoom", 0.8) 
        set("camFollow.x", get("boyfriend.x")+250)
        set("camFollow.y", get("boyfriend.y")+150)
    end

    yspr = lerp(yspr, 500, elapsed * 8)
    set('lol.y', yspr)
    aspr = lerp(aspr, 0.5, elapsed * 8)
    set('lol.alpha', aspr)
    anspr = lerp(anspr, 0, elapsed * 8)
    set('lol.angle', anspr)

    x = lerp(x, 0, elapsed * 6)
    y = lerp(y, 0, elapsed * 6)
    angle = lerp(angle,0,elapsed*6)
    perlinSpeed = lerp(perlinSpeed, targetPerlinSpeed, elapsed * perlinSpeedLerpRate)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    perlinZ = perlinZ + elapsed * math.random() * perlinSpeed

    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    local perlinOffsetZ = (-0.5 + perlin(0, 0, perlinZ)) * perlinZRange
    setShaderProperty('mirror3', 'x', x + perlinOffsetX)
    setShaderProperty('mirror3', 'y', y + perlinOffsetY)
    setShaderProperty('mirror3', 'angle', angle + perlinOffsetZ)
end
function playerOneSing(a,b,c,d)
    
    if c == "RedeptiiomPunch" then
        aspr = 1
        anspr = 25
    end
    
end
function stepHit()
    if curStep >= 64 and curStep < 192 
        and not (curStep >= 144 and curStep < 148) or curStep >= 320 and curStep < 704 or curStep >= 1088 and curStep < 1216 and not (curStep >= 1168 and curStep < 1176) then
            if curStep % 64 == 0 or curStep % 64 == 12 or curStep % 64 == 18 or curStep % 64 == 28
            or curStep % 64 == 32 or curStep % 64 == 38 or curStep % 64 == 44 or curStep % 64 == 52
            or curStep % 64 == 60 then
                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
                st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
                st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
            end
        end


    if curStep >= 64 then
        if curStep % 8 == 0 then
            yspr = 450
        end
    end
    if curStep == 16 then
        -- bloom(0,1,crochet,4,"cubeOut")
         tween("blackBG", {alpha = 0.25}, crochet*0.004,"quadOut")
        tween("undefinedSprite5", {alpha = 1}, crochet*0.004,"quadIn")
        tween("undefinedSprite5", {angle = 0}, crochet*0.006,"quadInOut")
    elseif curStep == 32 then
       -- bloom(0,1,crochet,4,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.004,"quadIn")
        tween("blackBG", {alpha = 0}, crochet*0.004,"quadIn")
    elseif curStep == 48 then
        tween("punch1", {y = 0}, crochet*0.001,"quadOut")
        tweenShader("bars","effect",0.2,crochet*0.001,"backOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"backOut")
        tweenShader("mirror3","barrel",-2,crochet*0.004,"quadIn")
    elseif curStep == 52 then
        tween("punch1", {angleY = 90}, crochet*0.001,"quadOut")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
         tweenShader("bars","effect",0.1,crochet*0.001,"quadIn")
    elseif curStep == 56 then
         tweenShader("pez","power",0.35,crochet*0.002,"quadOut")
        tween("punch2", {y = 0}, crochet*0.001,"quadOut")
        tweenShader("bars","effect",0.25,crochet*0.001,"quadOut")
        tweenShader("bars","angle1",90,crochet*0.003,"quadOut")
         mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
     elseif curStep == 60 then
        tween("punch2", {angleY = 90}, crochet*0.001,"quadOut")
         tweenShader("bars","effect",0,crochet*0.001,"quadIn")
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 64 then
        setCamZoom(0.55)
            hud(1, crochet,4, 'cubeOut')
        tweenShader("mirror3","barrel",0,crochet*0.004,"quadOut")
        tweenShader("bars","effect2",0.1,crochet*0.002,"quadOut")
        setShaderProperty("bars","angle2",90)
        mirror(false,true,"","zoom",0,1,3,crochet,"quadOut")
        tween("dad", {alpha = 1}, crochet*0.004,"quadOut")
        tween("boyfriend", {alpha = 1}, crochet*0.004,"quadOut")
        flashCamera("game","",crochet*0.002)
         tweenShader("pez","power",0.1,crochet*0.001,"quadOut")
    end
    if curStep == 80 then
        set("defaultCamZoom", 0.8)
    elseif curStep == 88 or curStep == 344 then
        tween("blackBG", {alpha = 0.5}, crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         tweenShader("pez","power",0.35,crochet*0.001,"quadOut")
    elseif curStep == 92 or curStep == 348 then
         tweenShader("pez","power",0.1,crochet*0.001,"quadIn")
            tweenShader("mirror2","x", (curStep == 92 and 2 or 0), crochet*0.0025,"quadInOut")  
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 96 or curStep == 352 then
        set("defaultCamZoom", 0.55)
        tween("blackBG", {alpha = 0}, crochet*0.002,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == 108 or curStep == 364 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn") 
    elseif curStep == 112 or curStep == 368 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut") 
    elseif curStep == 128 then
         set("defaultCamZoom", 0.8)
          bloom(2,1,crochet,3,"cubeOut")
    elseif curStep == 144 then
        tweenShader("bars","effect2",0.25,crochet*0.001,"quadIn")
         mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")
         tweenShader("greyscale","strength",1,crochet*0.001,"quadIn")
    elseif curStep == 148 or curStep == 152 then
         do perritoxd = (curStep == 148) and bloom(2,1,crochet,3,"cubeOut") end
        st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
        st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
        st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
        st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
        do perritoxd = (curStep == 152) and tweenShader("bars","effect2",0, crochet*0.002, "quadIn") tweenShader("pez","power",0.35,crochet*0.001,"quadOut") end
        do perritoxd = (curStep == 152) and mirror(false, true, "", "angle", 0, 360, 1, crochet, "quadInOut") end


    elseif curStep == 156 then
        tweenShader("pez","power",0.1,crochet*0.001,"quadIn")
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        tweenShader("greyscale","strength",0,crochet*0.001,"quadIn")
    elseif curStep == 160 then
        set("defaultCamZoom", 0.55)
        bloom(2,1,crochet,3,"cubeOut")
        tweenShader("bars","effect2",0.07,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == 184 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
        tween("blackBG", {alpha = 0.5}, crochet*0.002,"quadIn")
    elseif curStep == 192 then
            hud(0, crochet, 2, 'cubeOut')
        mirror(false,true,"","zoom",0,1,4,crochet,"quadOut")
        set("defaultCamZoom", 0.6)
        bloom(2,1,crochet,3,"cubeOut")
        st(true, true, 'zoomblur', 'focusPower', 'focusPower', 8, 4, 3, crochet, "quadOut")
    elseif curStep == 224 then
        bf = true
    elseif curStep == 256 then
        bf,matt = false,true
    elseif curStep == 288 then
        bf,matt = false,false
         set("defaultCamZoom", 0.6)
    elseif curStep == 304 then
        mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,4,crochet,"quadOut")
    elseif curStep == 312 then
        tweenShader("bars","effect2",0.25,crochet*0.001,"quadOut")
        tweenShader("bars","angle2",180,crochet*0.003,"quadOut")
         mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
         tween("blackBG", {alpha = 0}, crochet*0.002,"quadIn")
    elseif curStep == 316 then
        tweenShader("bars","effect2",0,crochet*0.001,"quadIn")
    elseif curStep == 320 then
        hud(1, crochet, 4, 'cubeOut')
        tweenShader("greyscale","strength",0,crochet*0.002,"quadOut")
        tweenShader("mirror3","barrel",0,crochet*0.002,"quadOut")
        set("defaultCamZoom", 0.55)
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
        tweenShader("bars","effect",0.1,crochet*0.002,"quadOut")
        setShaderProperty("bars","angle1",0)
    elseif curStep == 376 then
        mirror(true,true,"y","y",0,2,3.5,crochet,"backInOut")
    elseif curStep == 384  or curStep == 400 then
        tweenShader("bars","effect",0.25,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         bloom(2,1,crochet,3,"cubeOut")
    elseif curStep == 388 or curStep == 404 then
        tweenShader("bars","effect",0.3,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
    elseif curStep == 392 or curStep == 408 then
         tweenShader("pez","power",0.35,crochet*0.001,"quadOut")
         tweenShader("bars","effect",0.35,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(true,true,"y","y",0,2,3.5,crochet,"backInOut")
    elseif curStep == 396 or curStep == 412 then
         tweenShader("pez","power",0.1,crochet*0.001,"quadIn")
        tweenShader("bars","effect",0,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    end
    if curStep == 408 then
        tweenShader("mirror2","angle",-25,crochet*0.001,"quadOut")
    elseif curStep == 412 then
        tweenShader("greyscale","strength",1,crochet*0.0005,"quadOut")
        tweenShader("mirror2","angle",25,crochet*0.001,"quadIn")
    elseif curStep == 416 then
         bloom(2,1,crochet,3,"cubeOut")
         tweenShader("greyscale","strength",0,crochet*0.0005,"quadOut")
        tweenShader("bars","effect",0.1,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tweenShader("mirror2","angle",0,crochet*0.002,"quadOut")
    elseif curStep == 432 then
        tweenShader("mirror2","x",-4,crochet*0.0045,"quadInOut")
    elseif curStep == 440 then
         tweenShader("pez","power",0.35,crochet*0.001,"quadOut")
        tweenShader("bars","effect",0,crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
          tweenShader("greyscale","strength",1,crochet*0.001,"quadOut")
    elseif curStep == 444 then
         tweenShader("greyscale","strength",0,crochet*0.001,"quadIn")
         tweenShader("pez","power",0.1,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 448 then
        matt = true
            hud(0, crochet, 4, 'cubeOut')
        flashCamera("game","",crochet*0.002)
         tween("blackBG", {alpha = 0.7}, crochet*0.008)
         tweenShader("mirror2","zoom",0.7,crochet*0.008,"quadIn")
         tweenShader("greyscale","strength",0.5,crochet*0.008)
         bloom(2,1,crochet,3,"cubeOut")
         tweenShader("bars","effect",0.1,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        triggerEvent('screen shake', (crochet * 0.008) .. ',0.01')
    elseif curStep == 480 then
        tween("blackBG", {alpha = 0.5}, crochet*0.001,"quadOut")
         tweenShader("mirror2","zoom",0.8,crochet*0.001,"quadOut")
         tweenShader("greyscale","strength",0.3,crochet*0.001,"quadOut")
    elseif curStep == 486 then
        tween("blackBG", {alpha = 0.25}, crochet*0.001,"quadOut")
         tweenShader("mirror2","zoom",0.9,crochet*0.001,"quadOut")
         tweenShader("greyscale","strength",0.15,crochet*0.001,"quadOut")
    elseif curStep == 492 then
        matt = false
        set("defaultCamZoom", 0.55)
        tween("blackBG", {alpha = 0}, crochet*0.001,"quadOut")
         tweenShader("mirror2","zoom",1,crochet*0.001,"quadOut")
         tweenShader("greyscale","strength",0,crochet*0.001,"quadOut")
    elseif curStep == 504 then
        tweenShader("mirror2","x",-2,crochet*0.003,"backInOut")
    elseif curStep == 512 then
        bf = true
        tweenShader("bars","effect",0.2,crochet*0.004,"quadOut")
        tweenShader("bars","angle1",90,crochet*0.003,"quadOut")
        mirror(false,true,"","zoom",0,1.25,8,crochet,"quadOut")
        triggerEvent('screen shake', (crochet * 0.016) .. ',0.01')
        flashCamera("game","",crochet*0.002)
    elseif curStep == 536 then
        tweenShader("bars","effect",0,crochet*0.002,"quadIn")
    elseif curStep == 544 then
         tweenShader("pez","power",0.25,crochet*0.004,"quadOut")
        mirror(false,true,"","zoom",0,2,4,crochet,"quadOut")
        setShaderProperty("bars","angle2",90)
        tweenShader("bars","effect2",0.25,crochet*0.004,"quadOut")
        camaraloca(1,2,0,0.7,0.7,1.2,1.2)
    elseif curStep == 572 or curStep == 604 then
        tweenShader("atest","move",0,crochet*0.001,"quadIn")
         tweenShader("pez","power",0.1,crochet*0.001,"quadIn")
    elseif curStep == 576 then
         tweenShader("bars","effect2",0.1,crochet*0.003,"quadIn")
        tweenShader("pez","power",0.1,crochet*0.003,"quadIn")
        mirror(false,true,"","zoom",0,1,3,crochet,"quadIn")
    elseif curStep == 584 then
        tweenShader("atest","move",0.5,crochet*0.001,"quadIn")
    elseif curStep == 588 then
        bf = false
        bloom(2,1,crochet,3,"cubeOut")
        set("defaultCamZoom", 0.55)
        camaraloca(0,0,1,1,1,1.2,1.2)
    elseif curStep == 600 then
         mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         tweenShader("mirror2","y",2,crochet*0.003,"backInOut")
    end
    if curStep == 604 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
    elseif curStep == 608 then
      tweenShader("greyscale","strength",1,crochet*0.0005,"quadOut")
    elseif curStep == 610 then
       -- mirror(true,true,"zoom","zoom",3,1,1.5,crochet,"quadIn")
    elseif curStep == 612 then
        tweenShader("atest","move",0.5,crochet*0.0005,"quadIn")
    elseif curStep == 616 then
         tweenShader("bars","effect2",0.25,crochet*0.002,"quadOut")
        tweenShader("pez","power",0.35,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        tweenShader("greyscale","strength",0,crochet*0.0005,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
    elseif curStep == 624 then
        mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
         tweenShader("mirror2","x",0,crochet*0.0045,"quadInOut")
    elseif curStep == 632 then
        tweenShader("bars","effect2",0,crochet*0.002,"quadIn")
         tweenShader("bars","angle2",0,crochet*0.002,"quadIn")
         tweenShader("pez","power",0.1,crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
    elseif curStep == 640 then
         tweenShader("bars","effect",0.1,crochet*0.002,"quadOut")
        tweenShader("bars","angle1",0,crochet*0.003,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
     elseif curStep == 648 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
     elseif curStep == 652 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"backOut")
    elseif curStep == 656 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"backOut")
    elseif curStep == 660 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
        mirror(false,true,"","y",0,2,2,crochet,"quadIn")
    elseif curStep == 668 then
        tweenShader("bars","effect",0.2,crochet*0.001,"quadOut")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
     elseif curStep == 672 or curStep == 1184 then
        tweenShader("greyscale","strength",1,crochet*0.008,"quadIn")
         tweenShader("pez","power",0.25,crochet*0.004,"quadOut")
        mirror(false,true,"","zoom",0,2.5,4,crochet,"quadOut")
        tweenShader("bars","effect",0.3,crochet*0.008,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
        st(true, true, 'mirror2', 'x', 'x', 0, -2, 10, crochet, "quadInOut")
     elseif curStep == 672+32 or curStep == 1216 then
         tweenShader("pez","power",0,crochet*0.008,"quadOut")
        bloom(2,1,crochet,3,"cubeOut")
        perlinSpeed = 0.5
     elseif curStep == 752 then
        perlinSpeed = 0
        mirror(false,true,"","zoom",0,1,16,crochet,"quadIn")
        tweenShader("bars","effect",0.2,crochet*0.016,"quadIn")
     elseif curStep == 816 then
        tweenShader("bars","effect",0.1,crochet*0.002,"quadOut")
     elseif curStep == 820 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")

     elseif curStep == 824 then
        tweenShader("greyscale","strength",0,crochet*0.002,"quadIn")
         triggerEvent('screen shake', (crochet * 0.001) .. ',0.03')
     elseif curStep == 828 then
         tweenShader("bars","effect",0,crochet*0.001,"quadIn")
                mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
     elseif curStep == 832 then
        perlinSpeed = 0.25
        setShaderProperty("color","hueShift",1.1)
        setShaderProperty("speedlines","transparency",0)
        bloom(2,1,crochet,3,"cubeOut")
     elseif curStep == 896 then
        mirror(false,true,"","zoom",0,0.8,4,crochet,"quadOut")
     elseif curStep == 920 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
    elseif curStep == 924 then
        mirror(false,true,"","zoom",0,0.6,5,crochet,"quadOut")
     elseif curStep == 940 then
        tweenShader("color","strength",1,crochet*0.005,"quadIn")
         tweenShader("pez","power",0.25,crochet*0.004,"quadOut")
        tweenShader("bars","effect",0.2,crochet*0.004,"quadOut")
        mirror(false,true,"","zoom",0,2,3,crochet,"quadOut")
         st(true, true, 'mirror2', 'y', 'y', 0, -2, 4.5, crochet, "quadInOut")
          tweenShader("speedlines","transparency",1,crochet*0.003,"quadIn")
     elseif curStep == 956 then
        tweenShader("pez","power",0,crochet*0.001,"quadIn")
        tweenShader("bars","effect",0.1,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
     elseif curStep == 960 then
          setShaderProperty("speedlines","transparency",0)
        bloom(2,1,crochet,3,"cubeOut")
     elseif curStep == 1016 then
         mirror(false,true,"","zoom",0,0.6,2,crochet,"quadIn")
     elseif curStep == 1024 then
         mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
     elseif curStep == 1068 then
         tweenShader("bars","effect",0.2,crochet*0.001,"quadIn")
        tweenShader("pez","power",0.15,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
     elseif curStep == 1072 then
           setShaderProperty("speedlines","transparency",1)
        bloom(2,1,crochet,2,"cubeOut")
     elseif curStep == 1076 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeIn")
     elseif curStep == 1080 then
         tweenShader("bars","effect",0.1,crochet*0.002,"quadIn")
         tweenShader("color","strength",0,crochet*0.002,"quadIn")
        tweenShader("pez","power",0.1,crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadIn")
        mirror(false,true,"","angle",0,180,2,crochet,"quadIn")
     elseif curStep == 1088 then
            hud(1, crochet, 4, 'cubeOut')
         bloom(2,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,360,2,crochet,"quadOut")
     elseif curStep == 1100 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")
     elseif curStep == 1104 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadIn")
     elseif curStep == 1116 then
        angle = 15
        tweenShader("bars","effect",0.2,crochet*0.001,"backOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"backOut")
     elseif curStep == 1120 then
        angle = -15
        tweenShader("bars","effect",0.25,crochet*0.001,"backOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"backOut")
    elseif curStep == 1126 then
        tweenShader("bars","effect",0.1,crochet*0.0015,"quadOut")
        mirror(false,true,"","zoom",0,1,1.5,crochet,"quadOut")
    elseif curStep == 1132 then
        tweenShader("bars","effect",0.2,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadOut")
    elseif curStep == 1136 then
        tweenShader("bars","effect",0.2,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadIn")
    elseif curStep == 1136 then
        tweenShader("bars","effect",0.1,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
    elseif curStep == 1144 then
         st(true, true, 'mirror2', 'x', 'x', -2, 0, 3.5, crochet, "backInOut")
        tweenShader("bars","effect",0.3,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
    elseif curStep == 1148 then
        tweenShader("bars","effect",0.1,crochet*0.001,"quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 1152 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
         bloom(2,1,crochet,3,"cubeOut")
        perlinSpeed = 0.5
    elseif curStep == 1170 then
         tweenShader("bars","effect2",0.1,crochet*0.0005,"cubeIn")
         tweenShader("mirror2","zoom",2,crochet*0.0005,"cubeIn")
         mirror(false,true,"","x",0,0.2,0.5,crochet,"cubeIn")
     elseif curStep == 1172 then
        angle = 10
        mirror(false,true,"","x",0,-0.2,1,crochet,"cubeIn")
         tweenShader("bars","effect2",0.2,crochet*0.001,"cubeIn")
         st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                    st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
     elseif curStep == 1176 then
        angle = -10
        st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                    st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
        mirror(false,true,"","x",0,0.2,1,crochet,"cubeIn")
         tweenShader("bars","effect2",0.3,crochet*0.001,"cubeIn")
     elseif curStep == 1180 then
        angle = 10
         tweenShader("mirror2","zoom",1,crochet*0.001,"cubeIn")
        mirror(false,true,"","x",0,0,1,crochet,"cubeIn")
         tweenShader("bars","effect2",0,crochet*0.001,"cubeIn")
     elseif curStep == 1184 then
         bloom(2,1,crochet,3,"cubeOut")
     elseif curStep == 1264 then
         angle = 10
          mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        tweenShader("bars","effect",0.2,crochet*0.001,"quadOut")
     elseif curStep == 1272 then
         angle = -10
           mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShader("bars","effect",0.1,crochet*0.001,"quadOut")
     elseif curStep == 1280 then
        bloom(2,1,crochet,3,"cubeOut")
     elseif curStep == 1324 then
        tweenShader("mirror2","zoom",2,crochet*0.001,"cubeIn")
         tweenShader("bars","effect",0.3,crochet*0.001,"cubeIn")
     elseif curStep == 1328 then
        tweenShader("mirror2","zoom",1,crochet*0.002,"cubeIn")
         tweenShader("bars","effect",0.2,crochet*0.002,"cubeIn")
         tweenShader("mirror3","zoom",1,crochet*0.002,"quadOut")
            tweenShader("greyscale","strength",0,crochet*0.004,"quadOut")
            tweenShader("mirror3","barrel",0,crochet*0.004,"quadOut")
     elseif curStep == 1336 then
        tweenShader("mirror2","zoom",1.5,crochet*0.002,"quadOut")
     elseif curStep == 1376 then
        tweenShader("mirror2","zoom",6,crochet*0.006,"quadInOut")
     elseif curStep == 1392 then
          tweenShader("bars","effect",0.55,crochet*0.003,"quadOut")
    end
    if curstep == 1216 then
            hud(0, crochet, 4, 'cubeOut')
    end

    if curStep >= 832 and curStep < 1088 then
        if curStep < 960 then
            if curStep % 4 == 0 then
                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                    st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
            end
        else
             if curStep % 16 == 0 or curStep % 16 == 10 then
                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 5, 0, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'zoom', 'zoom', 0.87, 1, 1, crochet, "quadOut")
                    st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                    st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
            end
        end
        
    end
    if curStep >= 192 and curStep < 321 then
        if curStep % 32 == 0  then
            tweenShader("mirror3","zoom",1,crochet*0.002,"quadOut")
            tweenShader("greyscale","strength",0,crochet*0.002,"quadOut")
            tweenShader("mirror3","barrel",0,crochet*0.002,"quadOut")
        elseif curStep % 32 == 28 then
            tweenShader("mirror3","zoom",0.8,crochet*0.001,"quadIn")
            tweenShader("greyscale","strength",0.5,crochet*0.001,"quadIn")
            tweenShader("mirror3","barrel",-1,crochet*0.001,"quadIn")
        end
    end
    if curStep >= 1280 and curStep < 1328 then
        if curStep % 16 == 0  then
            tweenShader("mirror3","zoom",1,crochet*0.002,"quadOut")
            tweenShader("greyscale","strength",0,crochet*0.002,"quadOut")
            tweenShader("mirror3","barrel",0,crochet*0.002,"quadOut")
        elseif curStep % 16 == 12 then
            tweenShader("mirror3","zoom",0.8,crochet*0.001,"quadIn")
            tweenShader("greyscale","strength",0.5,crochet*0.001,"quadIn")
            tweenShader("mirror3","barrel",-1,crochet*0.001,"quadIn")
        end
    end
end