function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
local sprites = {
    {'text','D3fect/text', 220,190,0.5,"hud"},
    {'blue','D3fect/Blue', 1900,-50,0.6,"game"},--1900,-50
    {'orange','D3fect/Orange', -1900,-50,0.6,"game"},---1900,-50
    {'blue2','D3fect/Blue2', 300,70,0.45,"hud"}
}
function createPost()
      hud(0, crochet,1, 'cubeOut')
    set("dadCharacter1.alpha", 0)
    set("dadCharacter1.x", get("dadCharacter1.x")-250)
    setActorLayer("bfCharacter1",getActorLayer("bfCharacter0")-1)
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
    local shaders = { 
      
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"mirror", "BarrelBlurEffect", {zoom = 0, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, dist = 0, doChroma = true}},
        {"bloom", "BloomEffect", {contrast = 1 , brightness = 0}},
        {"mirror4", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"zoomblur", "zoomblur", {focusPower = 0, posX = 0}},
        {"bars", "bars", {effect = 0.55,effect2 = 0, angle1 = 360 , angle2 = 0}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"goodchrom", "goodchrom", {amount = 0.5}},
        {"jitter", "JitterGlitchDS", {gAmnt = 0, scale = 15 , chaos = 1,speed = 1}},-- 0 , 15 , 0.8
        {"fish", "EyeFishEffect", {power = 0.1}}
    }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
     for _, sprite in ipairs(sprites) do
        makePerspectiveSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorScroll(0,0,sprite[1])
      --  set(sprite[1]..".origin.x", get(sprite[1]..".width") / 2)
     --   set(sprite[1]..".origin.y", get(sprite[1]..".height") / 2)
 -- set(sprite[1]..".x", get(sprite[1]..".x") + get(sprite[1]..".width") / 2)
     --   set(sprite[1]..".y", get(sprite[1]..".y") + get(sprite[1]..".height") / 2)

        if sprite [1] == "orange" or sprite [1] == "blue" then
            addActorTrail(sprite[1], 100, 15, 0.4, 0.05)
        end
        if sprite[1] == "text" then
            set(sprite[1] .. ".angleX", 90)
        elseif sprite[1] == "blue2" then
            set(sprite[1] .. ".alpha", 0)
        end
        if sprite[6] == "hud" then
             setActorLayer(sprite[1], layershit)
        end
    end
end
local perlinX, perlinY, perlinZ, time = 0, 0, 0, 0
local perlinSpeed = 3.25
local targetPerlinSpeed = perlinSpeed
local perlinSpeedLerpRate = 0
local perlinXRange, perlinYRange, perlinZRange = 0.2, 0.2, 5
local x, y, angle = 0, 0, 0
cammatt,bfpico,matt = false,false,false
a,perroxd,speed = 0,false,2.5
function update(elapsed)
    time = time + elapsed
    setShaderProperty("jitter","iTime",time)
   --  setShaderProperty("ajedrez","iTime",time)

    if matt then
        set("defaultCamZoom", 0.8) 
        set("camFollow.x", get("dadCharacter0.x") +150)
        set("camFollow.y", get("dadCharacter0.y") +250)
    elseif bfpico then
        set("defaultCamZoom", 0.8) 
        set("camFollow.x", get("boyfriend.x")+250)
        set("camFollow.y", get("boyfriend.y"))
    end
    if cammatt then
        set("defaultCamZoom", 0.7) 
        set("camFollow.x", 200)
        set("camFollow.y", 250)
    end

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
    setShaderProperty('mirror4', 'x', x + perlinOffsetX)
    setShaderProperty('mirror4', 'y', y + perlinOffsetY)
    setShaderProperty('mirror4', 'angle', angle + perlinOffsetZ)

     if perroxd then
    a = a + (elapsed / (1 / 120))
    setShaderProperty('mirror2', 'angle', math.sin(a / 100 * speed) * 5)
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
function startSong()
    tweenShader("bars", "effect",0.1, crochet * 0.004, "quadOut")
    st(true, true, 'bars', 'angle1', 'angle1', 90, 0, 4, crochet, "quadOut")
    mirror(false,true,"","zoom",0,1,4,crochet,"quadOut")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function stepHit()
    if curStep < 128 or curStep >= 320 and curStep < 384 or curStep >= 512 and curStep < 640 
    or curStep >= 768 and curStep < 896 or curStep >= 1024 and curStep < 1152 then
        local relativeStep = curStep - 2
        if relativeStep % 32 == 0 or relativeStep % 32 == 6  or relativeStep % 32 == 12 or relativeStep % 32 == 20 then
            --tweenShader("bump", "zoom",1, crochet * 0.0004, "quadOut")
        elseif relativeStep % 32 == 4 or relativeStep % 32 == 10 or relativeStep % 32 == 18 or relativeStep % 32 == 30 then
           -- tweenShader("bump", "zoom",0.77, crochet * 0.0004, "quadIn")
            st(true, true, 'zoomblur', 'focusPower', 'focusPower', 8, 0, 1, crochet, "quadOut")
            st(true, true, 'bump', 'zoom', 'zoom', 0.6, 1, 1, crochet, "quadOut")
            st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
            st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
        end
    end
    if curStep == 112 then
        tween("text",{angleX = 0},crochet*0.002,"quadOut")
    elseif curStep == 120 then
        tween("text",{angleX = 65 , angleY = -90 , z = 400},crochet*0.002,"quadIn")
    end
    

    if curStep == 256 then
         tween("dadCharacter1",{x = get("dadCharacter1.x")+250,alpha = 1},crochet*0.004)
        tween("blackBG",{alpha = 0.67},crochet*0.004)
          hud(1, crochet,4, 'quadOut')
    end
    if curStep == 284 then
        setShaderProperty("jitter","gAmnt",0.07)
        mirror(false,true,"","zoom",0,2,1,crochet,"backIn")
    elseif curStep == 288 then
        setShaderProperty("jitter","gAmnt",0)
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == 300 then
        tweenShader("fish", "power",0.2, crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,-15,1,crochet,"quadOut")
    elseif curStep == 304 then
        x = 0.1
        tweenShader("bump", "barrel",-2, crochet * 0.004, "quadIn")
        setShaderProperty("jitter","gAmnt",0.07)
        tween("blackBG",{alpha = 0},crochet*0.004,"quadIn")
        mirror(false,true,"","angle",0,-45,0.5,crochet,"quadOut")
    elseif curStep == 306 then
        x = -0.1
        mirror(false,true,"","angle",0,-25,0.5,crochet,"quadOut")
    elseif curStep == 308 then
        mirror(false,true,"","angle",0,-45,0.5,crochet,"quadOut")
        x = 0.1
    elseif curStep == 310 then
        mirror(false,true,"","angle",0,-25,0.5,crochet,"quadOut")
        x = -0.1
    elseif curStep == 312 then
        x = 0.1
        tweenShader("bloom", "brightness",1, crochet * 0.002, "quadIn")
        setShaderProperty("jitter","gAmnt",0)
         mirror(false,true,"","zoom",0,0.3,2,crochet,"quadIn")
         mirror(false,true,"","angle",0,15,2,crochet,"quadIn")
    elseif curStep == 316 then
        tweenShader("fish", "power",0.5, crochet * 0.001, "quadIn")
        tweenShader("mirror2", "y",-0.5,crochet * 0.001, "quadIn")
        tweenShader("bars", "effect",0.55,crochet * 0.001, "quadIn")
    elseif curStep == 320 then
         set("defaultCamZoom", 0.5) 
        tweenShader("bump", "barrel",0, crochet * 0.002, "quadOut")
        tweenShader("bloom", "brightness",0, crochet * 0.001, "quadOut")
        st(true, true, 'fish', 'power', 'power', 0.1, 0, 4, crochet, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
         mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        st(true, true, 'mirror2', 'y', 'y', 0.5, 0, 2, crochet, "quadOut")
        tweenShader("bars", "effect",0.1,crochet * 0.003, "quadOut")
    end

    if curStep == 332 or curStep == 364 then
         mirror(false,true,"","zoom",0,0.6,1,crochet,"backIn")
    elseif curStep == 336 then
        st(true, true, 'mirror2', 'x', 'x', 0, 0.4, 1, crochet, "quadOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,10,1,crochet,"quadOut")
    elseif curStep == 340 or curStep == 348 then
        tweenShader("mirror2", "x",0,crochet * 0.001, "quadIn")
        mirror(false,true,"","angle",0,0,1,crochet,"quadIn")
    elseif curStep == 344 then
        tweenShader("mirror2", "x",-0.4,crochet * 0.001, "quadOut")
        mirror(false,true,"","angle",0,-10,1,crochet,"quadOut")
    end
    if curStep == 348 then
        setShaderProperty("jitter","gAmnt",0.07)
    elseif curStep == 352 then
        bloom(2,1,crochet,2,"")
        setShaderProperty("jitter","gAmnt",0)
    elseif curStep == 368 then
         mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
          mirror(false,true,"","angle",0,180,2,crochet,"quadOut")
          tweenShader("bars", "effect",0.35, crochet * 0.002, "quadOut")
         tweenShader("fish", "power",0.2, crochet * 0.002, "quadOut")
    elseif curStep == 376 then
        tweenShader("mirror2", "barrel",-2, crochet * 0.002, "quadIn")
         mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
          mirror(false,true,"","angle",0,360,2,crochet,"quadIn")
          tweenShader("bars", "effect",0, crochet * 0.002, "quadIn")
         tweenShader("fish", "power",0, crochet * 0.002, "quadIn")
    elseif curStep == 384 then
        tweenShader("fish", "power",0.15, crochet * 0.002, "quadOut")
        flashCamera("hud","",crochet*0.002)
        tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
    end
    if curStep == 408 or curStep == 440 then
         tweenShader("fish", "power",0.25, crochet * 0.002, "quadIn")
        tweenShader("mirror2", "zoom",0.7, crochet * 0.002, "quadIn")
    elseif curStep == 416 or curStep == 448 then
        tweenShader("fish", "power",0.15, crochet * 0.002, "quadOut")
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "quadOut")
       --  st(true, true, 'bars', 'effect', 'effect', 0, 90, 3, crochet, "quadOut")
    end
    if curStep == 448 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"quadOut")
    elseif curStep == 452 then
        st(true, true, 'mirror3', 'y', 'y', 0,1, 1, crochet, "quadIn")
    elseif curStep == 456 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
    elseif curStep == 460 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
         mirror(false,true,"","angle",0,15,1,crochet,"quadIn")
          mirror(false,true,"","x",0,-0.25,1,crochet,"quadIn")
    elseif curStep == 464 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
        mirror(false,true,"","x",0,0,1,crochet,"quadOut")
        tweenShader("mirror2", "zoom",1.5, crochet * 0.008, "quadIn")
        tweenShader("mirror2", "barrel",1, crochet * 0.008, "quadIn")
     elseif curStep == 468 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
         mirror(false,true,"","angle",0,-15,1,crochet,"quadIn")
          mirror(false,true,"","x",0,0.25,1,crochet,"quadIn")
    elseif curStep == 472 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
         mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
          mirror(false,true,"","x",0,0,1,crochet,"quadOut")
    elseif curStep == 476 then
        st(true, true, 'mirror3', 'y', 'y', 1,2, 1, crochet, "quadIn")
    elseif curStep == 480 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"quadIn")
        mirror(false,true,"","x",0,0.5,2,crochet,"quadIn")
    elseif curStep == 484 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 488 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        mirror(false,true,"","x",0,1,2,crochet,"quadOut")
    elseif curStep == 496 then
        tweenShader("mirror2", "zoom",1, crochet * 0.004, "quadIn")
        st(true, true, 'mirror2', 'angle', 'angle', 0,-25, 2, crochet, "quadOut")
        tweenShader("mirror2", "barrel",0, crochet * 0.004, "quadIn")
    elseif curStep == 504 then
        tweenShader("mirror2", "angle",25, crochet * 0.002, "quadIn")
    elseif curStep == 512 then
        mirror(true,true,"x","x",-1,0,4,crochet,"quadOut")
        tweenShader("mirror2", "angle",0, crochet * 0.002, "quadOut")
        flashCamera("hud","",crochet*0.002)
    end
    if curStep == 656 then
        mirror(false,true,"","zoom",0,3,1,crochet,"backIn")
    elseif curStep == 660 then
        tweenShader("bars", "effect",0.25, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,6,1,crochet,"backIn")
    elseif curStep == 664 then
         tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
        flashCamera("game","",crochet*0.002)
        setShaderProperty("jitter","gAmnt",0.1)
        mirror(true,true,"zoom","zoom",0,1.5,1,crochet,"quadOut")
        tweenShader("fish", "power",0.35, crochet * 0.001, "quadOut")
        
    elseif curStep == 668 then
         mirror(false,true,"","zoom",0,0,1,crochet,"quadIn")
         tweenShader("bars", "effect",0.55,crochet * 0.001, "quadIn")
        tweenShader("fish", "power",0,crochet * 0.001, "quadIn")
    elseif curStep == 672 then
        flashCamera("game","",crochet*0.002)
        setShaderProperty("jitter","gAmnt",0)
        st(true, true, 'mirror3', 'y', 'y', 1,2, 0.1, crochet, "quadInOut")
    end
    if curStep == 768 then
          tween("blackBG",{alpha = 0},crochet*0.002)
    elseif curStep == 784 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        mirror(true,true,"x","x",0,-0.35,1,crochet,"quadOut")
        tweenShader("fish", "power",0.15, crochet * 0.001, "quadOut")
    elseif curStep == 788 then
        tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        mirror(false,true,"","x",0,0.35,1,crochet,"quadIn")
    elseif curStep == 792 then
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        mirror(false,true,"","x",0,0,2,crochet,"quadOut")
    elseif curStep == 796 then
        tweenShader("bars", "effect",0.55,crochet * 0.001, "quadIn")
    elseif curStep == 800 then
        tweenShader("bars", "effect",0.1,crochet * 0.002, "quadOut")
        mirror(true,true,"zoom","zoom",2,1,2,crochet,"quadOut")
        mirror(false,true,"","x",0,-1,3,crochet,"quadOut")
        set("defaultCamZoom", 0.5) 
    elseif curStep == 808 then
         mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
          mirror(false,true,"","angle",0,35,2,crochet,"quadOut")
    elseif curStep == 816 then
         tween("blackBG",{alpha = 0.67},crochet*0.004)
        tweenShader("mirror2", "barrel",-2,crochet * 0.004, "quadIn")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"quadIn")
        mirror(false,true,"","angle",0,-25,2,crochet,"quadIn")
    elseif curStep == 824 then
         mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
          mirror(false,true,"","angle",0,15,2,crochet,"quadIn")
    elseif curStep == 828 then
         mirror(true,true,"x","x",-1,-2,3,crochet,"quadInOut")
    elseif curStep == 832 then
         tween("blackBG",{alpha = 0},crochet*0.002)
        tweenShader("mirror2", "barrel",0,crochet * 0.004, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
          mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
           bloom(2,1,crochet,2,"")
    elseif curStep == 844 then
         tweenShader("bars", "effect",0.25,crochet * 0.001, "quadInOut")
        mirror(false,true,"","zoom",0,0.6,1,crochet,"quadInOut")
    elseif curStep == 848 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
    elseif curStep == 856 then
         mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        elseif curStep == 860 or curStep == 852 then
         mirror(false,true,"","zoom",0,0.6,1,crochet,"quadIn")
        
     elseif curStep == 864 then
        tweenShader("bars", "effect",0.1,crochet * 0.002, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
     elseif curStep == 872 then
         tweenShader("mirror3", "dist",-0.25,crochet * 0.002, "quadIn")
     elseif curStep == 880 then
          tween("blackBG",{alpha = 1},crochet*0.004,"quadIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"backOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"backOut")
        tweenShader("mirror3", "dist",0.1,crochet * 0.002, "quadOut")
    elseif curStep == 884 then
        mirror(false,true,"","zoom",0,3,1,crochet,"backOut")
        mirror(false,true,"","angle",0,-25,1,crochet,"backOut")
     elseif curStep == 888 then
        tweenShader("bars", "effect",0.55,crochet * 0.002, "quadIn")
        mirror(false,true,"","zoom",0,10,2,crochet,"quadIn")
        mirror(false,true,"","angle",0,-90,2,crochet,"quadIn")
        tweenShader("mirror3", "dist",-0.1,crochet * 0.002, "quadIn")
        tweenShader("mirror2", "y",1,crochet * 0.002, "quadIn")
         tweenShader("bloom", "brightness",1,crochet * 0.002, "quadIn")
     elseif curStep == 896 then
         tweenShader("bloom", "brightness",0,crochet * 0.002, "quadOut")
          tween("blackBG",{alpha = 0},crochet*0.002)
        tweenShader("bars", "angle1",180,crochet * 0.003, "quadOut")
        tweenShader("mirror3", "dist",0,crochet * 0.002, "quadOut")
        mirror(true,true,"angle","angle",0,-25,1,crochet,"quadOut")
        tweenShader("bars", "effect",0.1,crochet * 0.002, "quadOut")
        flashCamera("hud","",crochet*0.001)
        tweenShader("fish", "power",0.25, crochet * 0.002, "quadOut")
        st(true, true, 'mirror2', 'y', 'y', 0,0, 0.1, crochet, "quadInOut")
        tweenShader("mirror3", "y",1,crochet * 0.002, "quadOut")
        matt = true
     elseif curStep == 900 or curStep == 908 then
         mirror(false,true,"","angle",0,0,1,crochet,"quadIn")
     elseif curStep == 904 then
        mirror(false,true,"","angle",0,15,1,crochet,"quadOut")
         tweenShader("mirror3", "x",1,crochet * 0.002, "quadOut")
     elseif curStep == 912 then
        mirror(false,true,"","angle",0,-180,2,crochet,"quadOut")
     elseif curStep == 916 then
        tweenShader("mirror2", "zoom",0.8,crochet * 0.001, "quadIn")
    elseif curStep == 920 then
        tweenShader("mirror2", "zoom",1.5,crochet * 0.001, "quadOut")
        mirror(false,true,"","angle",0,-360,2,crochet,"quadIn")
         tweenShader("bloom", "contrast",3,crochet * 0.002, "quadIn")
          tweenShader("bars", "effect2",0.25,crochet * 0.001, "quadOut")
           tweenShader("bars", "effect",0,crochet * 0.001, "quadOut")
     elseif curStep == 924 then
         tweenShader("mirror2", "zoom",1,crochet * 0.001, "quadIn")
        tweenShader("fish", "power",0, crochet * 0.002, "quadIn")
        tweenShader("bars", "effect2",0,crochet * 0.001, "quadIn")
     elseif curStep == 928 then
             tweenShader("bars", "effect",0.15,crochet * 0.002, "quadOut")
        tweenShader("mirror3", "y",0.75,crochet * 0.001, "quadOut")
         mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
          setShaderProperty("jitter","gAmnt",0.1)
          tweenShader("bloom", "contrast",1,crochet * 0.002, "quadOut")
           mirror(true,true,"angle","angle",0,-45,1,crochet,"quadOut")
           triggerEvent('screen shake', (stepCrochet * 0.004) .. ',0.012')
           tweenShader("fish", "power",0.2, crochet * 0.001, "quadOut")
     elseif curStep == 932 or curStep == 940 then
        tweenShader("mirror3", "y",1,crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,0,1,crochet,"quadIn")
        tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
     elseif curStep == 936 then
        tweenShader("fish", "power",0.2, crochet * 0.001, "quadOut")
        tweenShader("mirror3", "y",1.25,crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,45,1,crochet,"quadOut")
        triggerEvent('screen shake', (stepCrochet * 0.004) .. ',0.012')
     elseif curStep == 944 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"quadIn")
        mirror(true,true,"x","x",0,-0.5,2,crochet,"quadIn")
    elseif curStep == 948 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 952 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        mirror(false,true,"","x",0,-1,2,crochet,"quadOut")
    elseif curStep == 956 then
       tweenShader("mirror3", "y",2,crochet * 0.0025, "quadInOut")
    elseif curStep == 960 then
        bloom(2,1,crochet,2,"")
          setShaderProperty("jitter","gAmnt",0)
        bfpico,matt = true,false
         mirror(false,true,"","zoom",0,0.8,2,crochet,"quadOut")
    elseif curStep == 968 then
         mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,15,2,crochet,"quadIn")
        tweenShader("mirror3", "x",2,crochet * 0.003, "quadInOut")
        tweenShader("bars", "angle1",90, crochet * 0.003, "quadOut")
    elseif curStep == 972 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == 976 then
         tweenShader("bars", "effect",0.2, crochet * 0.001, "quadOut")
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == 984 then
        tweenShader("bars", "effect",0, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-25,1,crochet,"quadOut")
    elseif curStep == 988 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        mirror(false,true,"","x",0,0,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,10,1,crochet,"quadIn")
    elseif curStep == 992 then
        tweenShader("bars", "angle1",0, crochet * 0.001, "quadOut")
        tweenShader("bars", "effect",0.2, crochet * 0.002, "quadOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
        setShaderProperty("jitter","gAmnt",0.1)
        mirror(false,true,"","angle",0,-45,1,crochet,"quadOut")
        triggerEvent('screen shake', (stepCrochet * 0.004) .. ',0.012')
        tweenShader("fish", "power",0.2, crochet * 0.001, "quadOut")
     elseif curStep == 996 or curStep == 1004 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,0,1,crochet,"quadIn")
        tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
     elseif curStep == 1000 then
        tweenShader("bars", "effect",0, crochet * 0.002, "quadIn")
        tweenShader("fish", "power",0.2, crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,45,1,crochet,"quadOut")
        triggerEvent('screen shake', (stepCrochet * 0.004) .. ',0.012')
     elseif curStep == 1008 then
         setShaderProperty("jitter","gAmnt",0)
         mirror(false,true,"","zoom",0,2.5,2,crochet,"quadOut")
        mirror(false,true,"","angle",0,-100,4,crochet,"quadIn")
         tweenShader("bloom", "brightness",1, crochet * 0.004, "quadIn")
     elseif curStep == 1016 then
         tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
        tweenShader("fish", "power",1, crochet * 0.002, "quadIn")
         mirror(false,true,"","zoom",0,4.5,2,crochet,"quadOut")
    end
    if curStep >= 496 and curStep < 504 then
        if curStep % 2 == 0 then
            x = (curStep % 4 == 0) and -0.4 or 0.4
        end
        setShaderProperty("bloom","contrast", curStep % 2)
    end


    if curStep >= 208 and curStep < 216 
    or curStep >= 376 and curStep < 384 
    or curStep >= 720 and curStep < 728
    or curStep >= 1296 and curStep < 1304
    or curStep >= 1328 and curStep < 1336 then
        
        if curStep % 2 == 0 then
            if (math.floor(curStep / 2) % 2 == 0) then
                x = 0.15
            else
                x = -0.15
            end

            if curStep >= 1296 then
                local lol = 1
                lol = -lol
                -- alterna el signo del ángulo cada 4 pasos
                if (math.floor(curStep / 4) % 2 == 0) then
                    angle = 5*lol
                else
                    angle = -5*lol
                end
            end
        end
    end

    if curStep >= 896 and curStep < 1009 then
        if curStep % 8 == 0 then
                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 8, 0, 1, crochet, "quadOut")
                st(true, true, 'bump', 'zoom', 'zoom', 0.6, 1, 1, crochet, "quadOut")
                st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
                if curStep < 920 then
                    tweenShader("bars", "effect",0.2, crochet * 0.001, "quadOut")
                    mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
                end

                
                 local offset = (((curStep / 8) % 2) == 0) and 0.1 or -0.1
                st(true, true, 'mirror2', 'y', 'y', offset, 0, 1, crochet, "quadOut")
            elseif curStep % 8 == 4 then
                if curStep < 920 then
                mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
                tweenShader("bars", "effect",0.1, crochet * 0.001, "quadIn")
                end
            end
    end
    if curStep >= 128 and curStep < 240 or curStep >= 384 and curStep < 512-16 or curStep >= 640 and curStep < 656
    or curStep >= 672 and curStep < 752 then --192 pico
        if curStep < 192 or curStep >= 384 and curStep < 448 or curStep >= 640 and curStep < 704 then
            if curStep % 32 == 4 then
                st(true, true, 'mirror3', 'y', 'y', 0,1, 2.5, crochet, "quadInOut")
            elseif curStep % 32 == 20 then
                st(true, true, 'mirror3', 'y', 'y', 1,2, 2.5, crochet, "quadInOut")
            end
            if curStep % 8 == 0 then
                mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
                tweenShader("bars", "effect",0.2, crochet * 0.001, "quadOut")
                local offset = ((math.floor((curStep - 128) / 16) % 2 == 0) and 1 or -1) * 0.07
                if (math.floor(curStep / 8) % 2 == 0) then
                        y, angle, x = 0.2, -15, offset
                    else
                        y, angle, x = -0.2, 15, offset
                    end
            elseif curStep % 8 == 4 then
                tweenShader("bars", "effect",0.1, crochet * 0.001, "quadIn")
                mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
            end
        else
            if curStep % 8 == 0 then
                tweenShader("bars", "effect",0.2, crochet * 0.001, "quadOut")
                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 8, 0, 1, crochet, "quadOut")
                st(true, true, 'bump', 'zoom', 'zoom', 0.6, 1, 1, crochet, "quadOut")
                st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
            elseif curStep % 8 == 4 then
                tweenShader("bars", "effect",0.1, crochet * 0.001, "quadIn")
            end
        end
    end

    --second part
    if curStep >= 1280 and curStep < 1408 then
        if curStep % 8 == 0 then

                st(true, true, 'zoomblur', 'focusPower', 'focusPower', 8, 0, 1, crochet, "quadOut")
                st(true, true, 'bump', 'zoom', 'zoom', 0.6, 1, 1, crochet, "quadOut")
                st(true, true, 'bump', 'y', 'y', -0.045, 0, 1, crochet, "backOut")
                st(true, true, 'bump', 'x', 'x', -0.004, 0, 1, crochet, "backOut")
        end
    end
    if curStep == 1280 then
        perlinSpeed,perroxd = 0.5,true
    elseif curStep == 1288 then
        setProperty('', 'cameraSpeed', 1)
        st(true, true, 'mirror3', 'x', 'x', 0, 1, 4, crochet, "quadInOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         tweenShader("fish", "power",0.25, crochet * 0.001, "quadOut")
        angle = 25
    elseif curStep == 1292 or curStep == 1300 then
        mirror(false,true,"","zoom",0,0.6,1,crochet,"quadIn")
         tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
    elseif curStep == 1296 then
       angle = -25
       tweenShader("fish", "power",0.25, crochet * 0.001, "quadOut")
        tweenShader("bars", "effect",0.25, crochet * 0.002, "quadOut")
        tweenShader("bars", "angle1",0, crochet * 0.003, "quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,45,2,crochet,"quadIn")
    elseif curStep == 1304 then
         bloom(2,1,crochet,2,"")
        tweenShader("mirror2", "y",1, crochet * 0.002, "quadIn")
        tweenShader("bars", "effect",0, crochet * 0.002, "quadIn")
         tweenShader("bars", "angle",-90, crochet * 0.002, "quadIn")
         tweenShader("fish", "power",0.25, crochet * 0.002, "quadOut")
         mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
        mirror(false,true,"","angle",0,-180,2,crochet,"quadOut")
    elseif curStep == 1312 then
        tweenShader("mirror2", "y",2, crochet * 0.002, "quadOut")
        flashCamera("game","",crochet*0.002)
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
         tweenShader("fish", "power",0, crochet * 0.001, "quadOut")
         mirror(true,true,"zoom","zoom",1,0.6,3,crochet,"quadOut")
        mirror(true,true,"angle","angle",90,0,2,crochet,"quadOut")
    elseif curStep == 1324 then
        tweenShader("mirror3", "x",0, crochet * 0.003,"quadInOut")
    elseif curStep == 1336 then
         tweenShader("fish", "power",0.25, crochet * 0.001, "quadOut")
         mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,25,2,crochet,"quadIn")
    elseif curStep == 1340 then
        tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
    elseif curStep == 1344 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
    end

    parte1(0)
    parte1(512)
    parte2(128)
    parte2(512+128)
    drop(1024)
end
function parte1(s)
    if curStep == s + 12 or curStep == s + 76 or curStep == s + 108 then
        mirror(false,true,"","zoom",0,0.6,1,crochet,"backIn")
    elseif curStep == s + 16 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == s + 24 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,360,2,crochet,"quadOut")
        tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
        tweenShader("bars", "effect2",0.1, crochet * 0.001, "quadOut")
    elseif curStep == s + 28 then
        tweenShader("bars", "effect2",0, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == s + 32 then
        bloom(2,1,crochet,2,"")
        setShaderProperty("jitter","gAmnt",0)
        tweenShader("bars", "effect",0.1,crochet * 0.0015, "backOut")
        mirror(false,true,"","zoom",0,1,1.5,crochet,"backOut")
    elseif curStep == s + 38 then
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"backOut")
        tweenShader("bars", "effect",0.2, crochet * 0.0015, "backOut")
    elseif curStep == s + 44 then
        setShaderProperty("jitter","gAmnt",0.07)
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        tweenShader("bars", "effect",0.1, crochet * 0.001, "quadIn")
    elseif curStep == s + 48 then
        bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        tweenShader("bars", "effect",0.25, crochet * 0.001, "quadOut")
        st(true, true, 'mirror2', 'x', 'x', -4,0, 4, crochet, "quadInOut")
        tweenShader("fish", "power",0.25, crochet * 0.001, "quadOut")
        tweenShader("mirror2", "angle",360, crochet * 0.003, "quadInOut")
    elseif curStep == s + 56 then
        setShaderProperty("jitter","gAmnt",0)
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        tweenShader("bars", "effect",0.25, crochet * 0.001, "quadOut")
        tweenShader("bloom", "brightness",1, crochet * 0.002, "quadIn")
    elseif curStep == s + 60 then
        tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        tweenShader("bars", "effect",0, crochet * 0.001, "quadIn")
    elseif curStep == s + 64 then
        tweenShader("bloom", "brightness",0, crochet * 0.002, "quadOut")
        bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
    elseif curStep == s + 80 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"quadOut") 
    elseif curStep == s + 88 then
        tweenShader("bars", "angle1",180, crochet * 0.004, "quadOut")
        tweenShader("bars", "effect",0.25, crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(true,true,"angle","angle",0,-180,2,crochet,"quadIn")
    elseif curStep == s + 92 then
        tweenShader("bars", "effect",0, crochet * 0.001, "quadIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == s + 96 then
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut") 
        mirror(true,true,"angle","angle",180,0,2,crochet,"quadOut")
    elseif curStep == s + 112 then
        mirror(false,true,"","zoom",0,3,4,crochet,"quadIn")
        mirror(false,true,"","angle",0,180,4,crochet,"quadIn")
        tweenShader("bump", "barrel",-2, crochet * 0.004, "quadIn")
        tweenShader("bloom", "brightness",1, crochet * 0.004, "quadIn")
         tweenShader("bars", "angle1",0, crochet * 0.004, "quadIn")
        tweenShader("bars", "effect",0.55, crochet * 0.004, "quadIn")
        tweenShader("fish", "power",0.5, crochet * 0.004, "quadIn")
    elseif curStep == s + 120 then
    elseif curStep == s + 128 then
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
        tweenShader("fish", "power",0.15, crochet * 0.002, "quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
       -- mirror(true,true,"angle","angle",25,0,2,crochet,"quadOut")
        tweenShader("bump", "barrel",0, crochet * 0.002, "quadOut")
        tweenShader("bloom", "brightness",0, crochet * 0.002, "quadOut")
    end
end
function parte2(s)
    if curStep == s then
        perlinSpeed,matt = 1.5,true
        tweenShader("mirror3", "dist",0.25,crochet * 0.002, "quadOut")

    elseif curStep == s+24 then
        tweenShader("bars", "angle1",180,crochet * 0.003, "quadOut")

    elseif curStep == s+56 then
        tweenShader("bars", "angle1",0,crochet * 0.003, "quadOut")
        tweenShader("bloom", "brightness",1, crochet * 0.002, "quadIn")

    elseif curStep == s+64 then
        tweenShader("mirror2", "barrel",0.5, crochet * 0.016, "quadIn")
        tweenShader("bloom", "brightness",0, crochet * 0.002, "quadOut")
        matt,bfpico = false,true
        bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","x",0,-0.1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,15,1,crochet,"quadOut")

    elseif curStep == s+68 or curStep == s+76 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
        mirror(false,true,"","x",0,0,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,0,1,crochet,"quadIn")

    elseif curStep == s+72 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","x",0,0.1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"quadOut")

    elseif curStep == s+76 then
        st(true, true, 'mirror3', 'x', 'x', 0, 1, 2, crochet, "quadInOut")

    elseif curStep == s+80 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"quadOut")

    elseif curStep == s+84 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,15,1,crochet,"quadIn")

    elseif curStep == s+88 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-180,2,crochet,"quadOut")
        tweenShader("bars", "angle1",-180,crochet * 0.003, "quadOut")

    elseif curStep == s+92 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
        st(true, true, 'mirror3', 'y', 'y', 0, 1, 2, crochet, "quadInOut")

    elseif curStep == s+96 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        x,angle = 0.1,15

    elseif curStep == s+100 or curStep == s+108 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")

    elseif curStep == s+104 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        x,angle = -0.1,-15

    elseif curStep == s+112 then
        bfpico = false
        tweenShader("fish", "power",2, crochet * 0.004, "quadIn")
        set("defaultCamZoom", 0.7) 
        mirror(false,true,"","zoom",0,5,4,crochet,"quadIn")
        mirror(false,true,"","angle",0,90,4,crochet,"quadIn")
        tweenShader("bars", "angle1",-90,crochet * 0.004, "quadIn")
        tweenShader("bars", "effect",0.55,crochet * 0.004, "quadIn")
        tweenShader("mirror3", "dist",0,crochet * 0.004, "quadIn")
         tween("blackBG",{alpha = 1},crochet*0.004,"quadIn")
    elseif curStep == s+128 then
        tweenShader("mirror2", "barrel",0, crochet * 0.004, "quadOut")
        st(true, true, 'mirror3', 'y', 'y', -0.5,0, 4, crochet, "quadInOut")
        st(true, true, 'mirror3', 'x', 'x', -0.5,0, 4, crochet, "quadInOut")
        mirror(true,true,"zoom","zoom",0,1,4,crochet,"quadOut")
        mirror(true,true,"angle","angle",-90,0,4,crochet,"quadOut")
        st(true, true, 'fish', 'power', 'power', 0.1, 0, 4, crochet, "quadOut")
        st(true, true, 'bars', 'angle1', 'angle1', 45, 0, 4, crochet, "quadOut")
        flashCamera("hud","",crochet*0.002)
        tweenShader("bars", "effect",0.1,crochet * 0.004, "quadOut")
    end

    
end
function drop(s)
    if curStep == s then
         cammatt = true hud(0, crochet,2, 'quadOut') setProperty('', 'cameraSpeed', 3)
         triggerEvent('screen shake', (crochet * 0.064) .. ',0.01')
         set("dadCharacter1.alpha", 1)
        set("dadCharacter1.x", getActorX("dadCharacter1")+150)
        set("dadCharacter0.y", getActorY("dadCharacter0")+350)
        set("dadCharacter0.alpha", 0)
        set("bfCharacter0.alpha", 0)
        set("bfCharacter1.alpha", 0)
        set("girlfriend.alpha", 0)
        flashCamera("hud","",crochet*0.002)
         tweenShader("bloom", "brightness",-0.1, crochet * 0.001, "")
         tweenShader("bars", "effect",0.1, crochet * 0.0015, "quadOut")
        st(true, true, 'fish', 'power', 'power', 0.2, 0, 2, crochet, "quadOut")
         mirror(true,true,"zoom","zoom",0.5,1,2,crochet,"quadOut")
          mirror(true,true,"angle","angle",90,0,1,crochet,"quadOut")
    elseif curStep == s+8 then
        st(true, true, 'mirror2', 'y', 'y', 0, 1, 2, crochet, "quadIn")
        tweenShader("bars", "effect",0.25, crochet * 0.002, "quadIn")
        tween("dadCharacter1",{y = getActorY("dadCharacter1")+550},crochet*0.002,"quadIn")
        tween("blackBG",{alpha = 1},crochet*0.002,"quadIn")
    elseif curStep == s+16 then
    
        setShaderProperty("jitter","gAmnt",0.025)
        setShaderProperty("bars","angle2",90)
        tween("blackBG",{alpha = 0},crochet*0.002,"")
         st(true, true, 'mirror2', 'y', 'y', 0, 0, 0.01, crochet, "quadOut")
        tweenShader("bars", "effect",0.15, crochet * 0.002, "quadOut")
         tweenShader("bars", "angle1",-90, crochet * 0.003, "quadOut")
        tween("dadCharacter1",{y = getActorY("dadCharacter1")-550},crochet*0.001,"quadOut")
         tween("blue",{x = 700},crochet*0.002,"quadOut")
         tweenShader("mirror4", "zoom",2, crochet * 0.002, "quadOut")
         set("blue.angleY", 90)
          mirror(false,true,"","zoom",0,0.8,2,crochet,"quadOut")
    --elseif curStep == s+4 then
        tweenShader("fish", "power",0.25, crochet * 0.002, "quadOut")
        tween('blue', {angleY = 0}, stepCrochet*0.001*8, 'quadOut')
    elseif curStep == s+24 then
        setShaderProperty("jitter","gAmnt",0.1)
         tweenShader("mirror2", "barrel",-1, crochet * 0.002, "quadIn")
        tween("blackBG",{alpha = 0.5},crochet*0.002,"")
        tweenShader("mirror4", "zoom",1, crochet * 0.002, "quadIn")
        mirror(false,true,"","zoom",0,0.4,2,crochet,"quadIn")
        tween("blue",{x = 1900 , angle = 25},crochet*0.0017,"quadIn")
        tween("blue",{angleX = -90},crochet*0.002,"quadIn")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")-950},crochet*0.002,"quadIn")
        tweenShader("fish", "power",0, crochet * 0.002, "quadIn")
        tweenShader("bars", "effect",0, crochet * 0.002, "quadIn")
    elseif curStep == s+32 then
        bloom(2,1,crochet,2,"")
        setShaderProperty("jitter","gAmnt",0.025)
        tweenShader("bars", "effect2",0.1, crochet * 0.002, "quadOut")
        tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
         tweenShader("mirror4", "zoom",2, crochet * 0.001, "quadOut")
         set("blue.y", 500)
        set("blue.x", 350)
        set("blue.angle", 0)
        tween("blue",{y = -30 , angleX = 0},crochet*0.0015,"quadOut")
        tween("blackBG",{alpha = 0},crochet*0.002,"")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        mirror(true,true,"y","y",0.5,0,1,crochet,"quadOut")
        tweenShader("fish", "power",0.25, crochet * 0.001, "quadOut")
        tweenShader("mirror2", "barrel",-1, crochet * 0.004, "quadIn")
    elseif curStep == s+34 or curStep == s+38 then
       -- mirror(false,true,"","x",0,0,0.5,crochet,"quadIn")
    elseif curStep == s+36 then
         tweenShader("fish", "power",0, crochet * 0.001, "quadIn")
        tweenShader("bars", "effect2",0.2, crochet * 0.001, "quadOut")
       -- mirror(false,true,"","y",0,1,1,crochet,"quadOut")
         tween("blue",{angleY = 25,angle = -10,x = 100},crochet*0.001,"quadOut")
        tweenShader("mirror4", "zoom",1, crochet * 0.001, "quadIn")
    elseif curStep == s+40 then
        tween("blackBG",{alpha = 1},crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,0.5,2,crochet,"quadIn")
        tweenShader("mirror4", "zoom",3, crochet * 0.001, "quadOut")
        tweenShader("bars", "effect2",0.3, crochet * 0.001, "quadOut")
        tweenShader("bars", "angle2",180, crochet * 0.002, "quadOut")
        --mirror(false,true,"","y",0,0,1,crochet,"quadOut")
       -- mirror(false,true,"","x",0,0.25,1,crochet,"quadOut")
         tween("blue",{angleY = -25,angle = 10,x = 600},crochet*0.001,"quadOut")
    elseif curStep == s+44 then
        setShaderProperty("jitter","gAmnt",0.1)
         tweenShader("mirror4", "zoom",1, crochet * 0.001, "quadIn")
        tweenShader("bars", "effect2",0, crochet * 0.001, "quadIn")
        tween("blue",{angleY = 0,angle = 0,x = 350},crochet*0.001,"quadOut")
        tween("blue",{y = 1050},crochet*0.0015,"quadIn")
        --mirror(false,true,"","x",0,2,2,crochet,"quadInOut")
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+950},crochet*0.002,"quadInOut")
    elseif curStep == s+48 then
        set("blue2.angleY", -180)
        tween("blue2",{angleY = 0 , alpha = 1},crochet*0.002,"quadOut")
        setShaderProperty("jitter","gAmnt",0.025)
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tween("blackBG",{alpha = 0},crochet*0.002,"")
        tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
         setShaderProperty("bars","angle1",0)
          tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
    elseif curStep == s+52 then
        setShaderProperty("jitter","gAmnt",0.1)
    elseif curStep == s+56 then
        tween("blue2",{z = -600,alpha = 0},crochet*0.002,"quadIn")
        setShaderProperty("jitter","gAmnt",0.025)
        tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
          tweenShader("mirror3", "zoom",10, crochet * 0.001, "quadOut")
            tweenShader("mirror3", "angle",180, crochet * 0.002, "quadOut")
        mirror(false,true,"","y",0,-1,7,stepCrochet,"quadIn")
         tweenShaderProperty('fish', 'power', 0.5, stepCrochet*0.001*4, 'quadOut')
        tweenShaderProperty('bloom', 'brightness', 0.5, stepCrochet*0.001*8, 'quadIn')
         tweenShader("mirror2", "barrel",-0.5, crochet * 0.001, "quadOut")
          tween("bfCharacter0",{alpha = 1},crochet*0.002,"quadIn")
           tween("bfCharacter1",{alpha = 1},crochet*0.002,"quadIn")
            tween("girlfriend",{alpha = 1},crochet*0.002,"quadIn")
    elseif curStep == s+60 then
         tweenShaderProperty('mirror3', 'zoom', 0.75, stepCrochet*0.001*4, 'quadIn')
        tweenShaderProperty('mirror2', 'barrel', 0, stepCrochet*0.001*4, 'quadIn')
        tweenShaderProperty('fish', 'power', 0, stepCrochet*0.001*4, 'quadIn')
    elseif curStep == s+64 then
        cammatt,bfpico = false,true
         tweenShader("mirror3", "angle",360, crochet * 0.002, "quadOut")
        tweenShader("bloom", "brightness",-0.15, crochet * 0.001, "")
       tweenShaderProperty('mirror3', 'zoom', 1, stepCrochet*0.008, 'quadOut')
        mirror(true,true,"y","y",0.5,0,1,crochet,"quadOut")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
    end
    if curStep == s+72 then--bf
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,25,2,crochet,"quadIn")
    elseif curStep == s+76 then
        st(true, true, 'mirror3', 'x', 'x', 0, 1, 2.5, crochet, "quadInOut")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == s+80 then
        tweenShader("bars", "effect",0.25, crochet * 0.002, "quadOut")
        tweenShader("bars", "angle1",90, crochet * 0.003, "quadOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        mirror(false,true,"","y",0,2,1.5,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        tweenShader("mirror3", "zoom",2, crochet * 0.002, "quadOut")
         tweenShaderProperty('fish', 'power', 0.25, stepCrochet*0.008, 'quadOut')
    elseif curStep == s+84 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    elseif curStep == s+88 then
        tweenShaderProperty('fish', 'power', 0, stepCrochet*0.008, 'quadIn')
        tweenShader("bars", "effect",0, crochet * 0.002, "quadIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        mirror(false,true,"","y",0,4,1.5,crochet,"quadOut")
        tweenShader("mirror3", "dist",-0.25, crochet * 0.002, "quadIn")
        tweenShader("mirror3", "zoom",1, crochet * 0.002, "quadIn")
        tweenShader("mirror3", "x",2, crochet * 0.002, "quadIn")
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "quadIn")
    elseif curStep == s+92 then
         mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")

    end
    if curStep == s+96 then
        angle,x = 25,0.1
         --tweenShader("mirror2", "zoom",0.5, crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShader("mirror3", "dist",0, crochet * 0.002, "quadOut")
        setShaderProperty("bars","angle1",0)
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
       -- tweenShader("mirror3", "angle",25, crochet * 0.002, "quadIn")
    elseif curStep == s+100 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
    elseif curStep == s+104 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
    elseif curStep == s+102 then
        angle,x = -25,-0.1
        mirror(false,true,"","x",0,1,3,crochet,"quadOut")
    elseif curStep == s+108 then
         angle = 25
         tweenShader("bars", "effect",0.25, crochet * 0.001, "quadIn")
          mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")
     elseif curStep == s+112 then
         angle = -25
          tweenShader("bars", "angle1",-90, crochet * 0.003, "quadOut")
         tweenShader("bars", "effect",0, crochet * 0.002, "quadOut")
          mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
     elseif curStep == s+116 then
         mirror(false,true,"","x",0,2,3,crochet,"quadOut")
        tweenShader("bloom", "brightness",1, crochet * 0.004, "quadIn")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
     elseif curStep == s+120 then
         tweenShader("mirror2", "barrel",-1, crochet * 0.004, "quadIn")
          mirror(false,true,"","zoom",0,10,2,crochet,"quadOut")
            mirror(false,true,"","angle",0,90,2,crochet,"quadIn")
            tween("blackBG",{alpha = 0.8},crochet*0.002,"quadIn")
          tweenShaderProperty('fish', 'power', 1, stepCrochet*0.008, 'quadIn')
     elseif curStep == s+128 then
        flashCamera("game","",crochet*0.002)
        tween("blackBG",{alpha = 0},crochet*0.001,"quadOut")
        set("dadCharacter1.alpha",0)
            setShaderProperty("bars","angle2",90)
        tweenShader("bars", "effect2",0.1, crochet * 0.003, "quadOut")
        cammatt,bfpico = true,false
             tween("orange",{x = 400},crochet*0.002,"quadOut")
        st(true, true, 'fish', 'power', 'power', 0.2, 0.1, 2, crochet, "quadOut")
             tweenShader("mirror2", "barrel",0, crochet * 0.004, "quadIn")
          mirror(true,true,"zoom","zoom",0,2,1,crochet,"quadOut")
            mirror(true,true,"angle","angle",0,0,0.1,crochet,"quadOut")
         tweenShader("bloom", "brightness",0, crochet * 0.002, "quadOut")
         tweenShader("mirror3", "x",3, crochet * 0.002, "quadOut")
        st(true, true, 'mirror3', 'angle', 'angle', 0, 15, 1, crochet, "quadOut")
     elseif curStep == s+132 then
         tweenShader("mirror3", "angle",0, crochet * 0.001, "quadIn")
       mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
         tweenShader("mirror3", "y",1, crochet * 0.002, "quadInOut")
          tween("blackBG",{alpha = 0.7},crochet*0.001,"quadIn")
     elseif curStep == s+136 then
         tween("orange",{y = 1000},crochet*0.002,"quadIn")
         tween("blackBG",{alpha = 0},crochet*0.001,"quadOut")
         tweenShader("mirror3", "angle",-15, crochet * 0.001, "quadOut")
        tweenShader("mirror3", "zoom",2, crochet * 0.001, "quadOut")
     elseif curStep == s+140 then
         tween("blackBG",{alpha = 1},crochet*0.001,"quadIn")
           tweenShader("mirror3", "angle",0, crochet * 0.001, "quadIn")
        tweenShader("mirror3", "zoom",2.5, crochet * 0.001, "quadIn")
         mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
         tweenShader("mirror3", "angle",90, crochet * 0.001, "quadIn")
    elseif curStep == s+144 then
        tween("orange",{y = -50},crochet*0.002,"quadOut")
         tween("blackBG",{alpha = 0},crochet*0.001,"quadOut")
         tweenShader("mirror3", "zoom",1, crochet * 0.001, "quadOut")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
         tweenShader("mirror3", "angle",180, crochet * 0.002, "quadOut")
    elseif curStep == s+148 then
         mirror(true,true,"y","y",0,-2,2,crochet,"quadInOut")
    elseif curStep == s+152 then
           tweenShaderProperty('fish', 'power', 0.25, crochet*0.001, 'quadOut')
        tweenShader("mirror3", "zoom",2, crochet * 0.001, "quadOut")
        tweenShader("mirror2", "barrel",1, crochet * 0.002, "quadIn")
        tweenShader("bars", "angle2",0, crochet * 0.003, "quadOut")
        tweenShader("bars", "effect2",0, crochet * 0.002, "quadOut")
        tween("blackBG",{alpha = 1},crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,0.7,2,crochet,"quadIn")

         tween("orange",{angleY = 90,angle = -15 , alpha = 0},crochet*0.002,"quadOut")
        --tweenShader("mirror3", "angle",15, crochet * 0.001, "quadOut")
    elseif curStep == s+156 then
       tween("dadCharacter0",{alpha = 1,y = getActorY("dadCharacter0")-250},crochet*0.003,"quadInOut")
      tweenShaderProperty('fish', 'power', 0.1, crochet*0.001, 'quadIn')
        tweenShader("mirror3", "zoom",1, crochet * 0.001, "quadIn")
    elseif curStep == s+160 then
        tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tween("blackBG",{alpha = 0},crochet*0.002,"quadOut")
           setShaderProperty("bars","angle1",0)
         tweenShader("bars", "effect",0.25, crochet * 0.002, "quadOut")
    elseif curStep == s+164 then
        tweenShader("mirror3", "x",2, crochet * 0.0025, "quadInOut")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
    elseif curStep == s+168 then
         mirror(false,true,"","angle",0,-15,1,crochet,"quadOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
    elseif curStep == s+172 then
       -- tweenShader("mirror2", "x",-0.15, crochet * 0.001, "quadIn")
         tweenShader("bars", "effect",0, crochet * 0.001, "quadIn")
          mirror(false,true,"","angle",0,15,1,crochet,"quadIn")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
    elseif curStep == s+176 then
    
        -- tweenShader("mirror2", "x",0, crochet * 0.001, "quadOut")
         tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
          mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
    elseif curStep == s+180 then
          mirror(false,true,"","angle",0,15,1,crochet,"quadOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
         tweenShaderProperty('fish', 'power', 0.25, crochet*0.001, 'quadOut')
     elseif curStep == s+184 then
         tweenShaderProperty('fish', 'power', 0.35, crochet*0.001, 'quadOut')
          mirror(false,true,"","angle",0,45,1,crochet,"quadOut")
        mirror(false,true,"","zoom",0,6,1,crochet,"quadOut")
         tweenShader("bars", "effect",0.55, crochet * 0.002, "quadIn")
         tweenShader("bars", "angle1",90, crochet * 0.002, "quadIn")
     elseif curStep == s+188 then
         tweenShaderProperty('fish', 'power', 0, crochet*0.001, 'quadIn')
         tweenShader("mirror3", "x",1, crochet * 0.002, "quadInOut")
          mirror(false,true,"","angle",0,45,1,crochet,"quadIn")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
     elseif curStep == s+192 then
          cammatt,bfpico = false,true
        flashCamera("hud","",crochet*0.002)
         tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
        mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
         mirror(true,true,"x","x",0,2,3,crochet,"quadOut")
     elseif curStep == s+196 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadIn")
        tweenShaderProperty('fish', 'power', 0.25, crochet*0.001, 'quadIn')
     elseif curStep == s+200 then
         mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
            mirror(false,true,"","angle",0,180,2,crochet,"quadOut")
             tweenShader("mirror3", "y",0, crochet * 0.002, "quadIn")
              tweenShader("bars", "effect",0.25, crochet * 0.002, "quadIn")
     elseif curStep == s+204 then
         tweenShaderProperty('fish', 'power', 0, crochet*0.001, 'quadIn')
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
     elseif curStep == s+208 then--1232
         tweenShaderProperty('fish', 'power', 0.2, crochet*0.002, 'quadOut')
        tweenShader("mirror3", "zoom",2, crochet * 0.002, "quadOut")
          tweenShader("bars", "angle1",0, crochet * 0.003, "quadOut")
         mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
     elseif curStep == s+212 then
         tween("blackBG",{alpha = 1},crochet*0.001,"quadIn")
          mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,205,1,crochet,"quadIn")
     elseif curStep == s+216 then
        tween("blackBG",{alpha = 0},crochet*0.001,"quadOut")
          mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,180,1,crochet,"quadOut")
     elseif curStep == s+220 then
        tween("blackBG",{alpha = 1},crochet*0.002,"quadIn")
         tweenShader("mirror3", "x",0, crochet * 0.002, "quadInOut")
     elseif curStep == s+224 then -- 1248
         mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
         angle = 15
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
         tweenShaderProperty('fish', 'power', 0, crochet*0.002, 'quadOut')
        tweenShader("mirror3", "zoom",1, crochet * 0.002, "quadOut")
     elseif curStep == s+228 then
        tween("blackBG",{alpha = 0},crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
         mirror(false,true,"","angle",0,165,1,crochet,"quadIn")
     elseif curStep == s+232 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,180,1,crochet,"quadOut")
     elseif curStep == s+236 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
     elseif curStep == s+240 then
         mirror(false,true,"","zoom",0,10,4,crochet,"quadIn")
        mirror(false,true,"","angle",0,0,4,crochet,"quadOut")
        tweenShader("bars", "angle1",90, crochet * 0.004, "quadIn")
        tweenShader("bars", "effect",0.55, crochet * 0.004, "quadIn")
         tweenShaderProperty('fish', 'power', 1, crochet*0.004, 'quadIn')
         tweenShader("mirror2", "barrel",1, crochet * 0.004, "quadInOut")
     elseif curStep == s+244 then
         tweenShader("mirror2", "x",1, crochet * 0.003, "quadInOut")
     elseif curStep == s+256 then
        bfpico = false
        set("defaultCamZoom", 0.5) 
       --  tweenShader("mirror2", "x",0, crochet * 0.00001)
        set("dadCharacter1.alpha", 1)
        set("dadCharacter0.alpha", 1)
        set("bfCharacter0.alpha", 1)
        set("bfCharacter1.alpha", 1)
        set("girlfriend.alpha", 1)
        flashCamera("hud","",crochet*0.002)
        mirror(true,true,"y","y",0.5,1,4,crochet,"quadOut")
         tweenShader("mirror2", "barrel",0, crochet * 0.002, "quadOut")
         tweenShader("bars", "effect",0, crochet * 0.0015, "quadOut")
        st(true, true, 'fish', 'power', 'power', 0.2, 0, 4, crochet, "quadOut")
         mirror(true,true,"zoom","zoom",1,3,1,crochet,"quadOut")
          mirror(true,true,"angle","angle",90,0,1,crochet,"quadOut")
     elseif curStep == s+260 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"quadIn")
    end

    if curStep >= s+24 and curStep < s+32 then
        st(true, true, 'bump', 'zoom', 'zoom', 2.5, 1, 1, stepCrochet, "quadOut")
        
    end
    if curStep >= s+56 and curStep < s+64 then
         if curStep % 1 == 0 then
            x = (curStep % 2 == 0) and -0.4 or 0.4
        end
        setShaderProperty("bloom","contrast", curStep % 2)
    end
    if (curStep >= s+128 and curStep < s+128+48)
    or (curStep >= s+192 and curStep < s+256-16) then
        if curStep % 8 == 0 then
            local offsetY = (((curStep / 8) % 2) == 0) and 0.1 or -0.1
            local offsetZoom = (((curStep / 8) % 2) == 0) and 1.1 or 0.8

            st(true, true, 'mirror2', 'y', 'y', offsetY, 0, 2, crochet, "quadOut")
            st(true, true, 'mirror2', 'zoom', 'zoom', offsetZoom, 1, 2, crochet, "quadOut")
        end
    end

end