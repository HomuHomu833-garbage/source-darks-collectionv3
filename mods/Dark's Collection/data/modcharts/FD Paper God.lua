local sprites = {
    {'bitrl ps','bitrl ps', 70, -550, 0.9,"hud"},
    {'uno paper','uno paper', 320, -550, 0.9,"hud"},
    {'dos paper','dos paper', 320, 650, 0.9,"hud"},
    {'tres paper','tres paper', 320, 650, 0.9,"hud"},
    {'cuatro paper','cuatro paper', 320, -550, 0.9,"hud"},
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
downscroll = 1
function createPost()
    for _, sprite in ipairs(sprites) do
        makeSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorLayer(sprite[1], layershit)
    end
    hud(0, crochet, 1, 'cubeOut')
    local shaders = { 
    {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"bars", "bars", {effect = 0.1,effect2 = 0, angle1 = 0 , angle2 = 0}},
    {"mirror2", "PincushNewEffect", {zoom = 0.5, angle = -45, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"greyscale", "GreyscaleEffect", {strength = 1}},
    {"ca", "ChromAbEffect", {strength = 0.002}},
    {"zoomblur", "zoomblur", {focusPower = 5, posY = 0}},
    {"vignette", "VignetteEffect", {strength = 0, size = 0.025,red = 0 , green = 0 , blue = 0}},
    {"bloom", "BloomEffect", {contrast = 0 , brightness = 0,effect = 0, strength = 0.5}}
    }
    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        if name ~= "bars" and name ~= "greyscale" and name ~= "mirror3" then
            setCameraShader('hud', name)
        end 
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorAlpha(0, 'Fire')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
end
function songStart()
    tweenShader("mirror2", "zoom",1, crochet * 0.008, "cubeOut")
    tweenShader("mirror2", "angle",0, crochet * 0.008, "cubeOut")
    tweenShader("bloom", "contrast",1, crochet * 0.008, "linear")
    tweenShader("zoomblur", "focusPower", 0, crochet * 0.016, "linear")
    tweenShader("vignette", "strength", 15, crochet * 0.008, "cubeOut")
    tweenShader("greyscale", "strength", 0, crochet * 0.064, "linear")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
    setShaderProperty("zoomblur","focusPower",3)
	tweenShader("zoomblur","focusPower",0,speed*0.001*curStep,ease)
end
local cam = true
function update(elapsed)
    zoom = lerp(zoom, 1, elapsed * 4)
    setShaderProperty('bump', 'zoom', zoom)
    angle = lerp(angle, 0, elapsed * 8)
    setShaderProperty('bump', 'angle', angle)
    if cam then
        set("camFollow.x",-150)
        set("camFollow.y",250)
        set("defaultCamZoom", 0.53)
    end
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror2',value,valor)
    end
    if tween then
        tweenShader('mirror2',value2,valor2, speed*0.001*s,ease)
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
function stepHit()
    if curStep == 128 then
        tween("blackBG",{alpha = 0.7},crochet*0.001,"cubeOut")
    elseif curStep == 144 then
        tween("bitrl ps",{y = 50},crochet*0.002,"cubeOut")
        tweenShader("mirror2", "zoom",0.85, crochet * 0.004, "cubeIn")
    end
    if curStep == 2232 then
        tween("bitrl ps",{y = 250},crochet*0.0005,"cubeOut")
    elseif curStep == 2224 then
        tween("bitrl ps",{y = 50},crochet*0.002,"cubeOut")
        tweenShader("mirror3", "zoom",0.85, crochet * 0.004, "cubeIn")
    elseif curStep == 2232 then
        tweenShader("mirror3", "angle",100, crochet * 0.002, "cubeIn")
    elseif curStep == 2234 then
        tween("bitrl ps",{y = -150},crochet*0.0005,"cubeOut")
    elseif curStep == 2236 then
        tween("bitrl ps",{y = 50},crochet*0.001,"cubeOut")
    end
    if curStep == 152 then
        tweenShader("mirror", "zoom",0.25, crochet * 0.002, "cubeIn")
        tweenShader("mirror2", "angle",100, crochet * 0.002, "cubeIn")
    elseif curStep == 160 or curStep == 1184 then
        tween("bitrl ps",{y = 650},crochet*0.002,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        tweenShader("mirror", "zoom",1, crochet * 0.002, "cubeOut")
        mirror(true,true,"angle","angle",-60,0,2,crochet,"cubeOut")
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
        tween("blackBG",{alpha = 0},crochet*0.002,"cubeOut")
        hud(1, crochet,4, 'cubeOut')
        cam = false
        tweenShader("greyscale", "strength",0, crochet * 0.001, "cubeOut")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "cubeOut")
    elseif curStep == 288 or curStep == 416 or curStep == 544 or curStep == 800 
    or curStep == 992 or curStep == 1312 or curStep == 1440 or curStep == 1696 
    or curStep == 1824 or curStep == 1984 then
        bloom(4,1,crochet,2,"linear")
        tweenShader("greyscale", "strength",0, crochet * 0.001, "cubeOut")
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
    elseif curStep == 408 or curStep == 536 or curStep == 920 or curStep == 1176 or curStep == 1432 
    or curStep == 1816 or curStep == 2488 then
        tweenShader("mirror2", "zoom",0.5, crochet * 0.002, "cubeIn")
    elseif curStep == 540 or curStep == 1180 or curStep == 1980 or curStep == 2492 then
        mirror(true,true,"angle","angle",0,100,1,crochet,"cubeIn")
    elseif curStep == 600 then
        tweenShader("bloom", "contrast",4, crochet * 0.002, "cubeIn")
        tweenShader("zoomblur","focusPower",3,crochet*0.002,"cubeIn")
    elseif curStep == 608 then
        tweenShader("bloom", "contrast",1, crochet * 0.002, "linear")
        tweenShader("zoomblur","focusPower",0,crochet*0.002,"linear")
    elseif curStep == 656 or curStep == 1168 or curStep == 1552 then
        st(true,true,'ca','strength','strength',0.03,0.002,2,crochet,"cubeOut")
        tweenShader("greyscale", "strength",1, crochet * 0.001, "cubeOut")
    end
    if curStep == 928 or curStep == 1824 then
        tweenShader("mirror3", "x",0, crochet * 0.002, "cubeInOut")
        if curStep == 928 then
        tweenShader("greyscale", "strength",1, crochet * 0.001, "cubeOut")
        end
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
        tweenShader("vignette", "blue",0, crochet * 0.004, "cubeOut")
        hud(0, crochet,4, 'cubeOut')
        lol = false
        cam = true
    end
    if curStep == 664 or curStep == 1560 or curStep == 1976 then
        if curStep == 1560 then
            bloom(4,1,crochet,2,"linear")
        end
        tweenShader("mirror2", "zoom",0.85, crochet * 0.002, "cubeIn")
    end
    if curStep == 668 or curStep == 1564 or curStep == 1980 then
        tweenShader("mirror", "zoom",0.25, crochet * 0.001, "cubeIn")
        tweenShader("mirror2", "angle",100, crochet * 0.001, "cubeIn")
    elseif curStep == 672 or curStep == 1568 then
        tweenShader("mirror", "zoom",1, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "x",-0.5, crochet * 0.002, "cubeInOut")
        mirror(true,true,"angle","angle",-60,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
        tweenShader("greyscale", "strength",0, crochet * 0.001, "cubeOut")
        tweenShader("bars", "effect",0.03, crochet * 0.002, "cubeOut")
        tweenShader("vignette", "blue",255, crochet * 0.004, "cubeOut")
        hud(0.35, crochet,4, 'cubeOut')
        lol = true
    end
    if curStep == 656 or curStep == 1968 then
        tween("uno paper",{y = 200},crochet*0.001,"cubeOut")
    elseif curStep == 660 or curStep == 1972 then
        tween("uno paper",{y = 650},crochet*0.001,"cubeInOut")
        tween("dos paper",{y = 200},crochet*0.001,"cubeOut")
    elseif curStep == 664 or curStep == 1976 then
        tween("dos paper",{y = -550},crochet*0.001,"cubeInOut")
        tween("tres paper",{y = 200},crochet*0.001,"cubeOut")
    elseif curStep == 668 or curStep == 1980 then
        tween("tres paper",{y = -550},crochet*0.001,"cubeInOut")
        tween("cuatro paper",{y = 200},crochet*0.001,"cubeOut")
    elseif curStep == 672 or curStep == 1984 then
        tween("cuatro paper",{y = 650},crochet*0.001,"cubeInOut")
    end
    if curStep == 544 then
        mirror(true,true,"angle","angle",-60,0,2,crochet,"cubeOut")
    elseif curStep == 800 or curStep == 1696 then
        tweenShader("mirror3", "x",0.5, crochet * 0.002, "cubeInOut")
    elseif curStep == 1440 or curStep == 1456 or curStep == 1464 or curStep == 1472
    or curStep == 1488 or curStep == 1496 or curStep == 1504 or curStep == 1520
    or curStep == 1528 or curStep == 1536 or curStep == 1976 or curStep == 1984 then
        st(true,true,'ca','strength','strength',0.03,0.002,2,crochet,"cubeOut")
    elseif curStep == 1952 then
        tweenShader("greyscale", "strength",1, crochet * 0.008, "cubeIn")
        bloom(4,1.5,crochet,2,"linear")
    end
    if curStep == 2240 then
        tween("bitrl ps",{y = 650},crochet*0.002,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        tweenShader("mirror", "zoom",1, crochet * 0.002, "cubeOut")
        st(true,true,'mirror3','angle','angle',-60,0,2,crochet,"cubeOut")
    end
    if curStep == 1984 then
        tweenShader("mirror", "zoom",1, crochet * 0.002, "cubeOut")
        mirror(true,true,"angle","angle",-60,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        --tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
        tweenShader("greyscale", "strength",0, crochet * 0.001, "cubeOut")
        tweenShader("vignette", "blue",255, crochet * 0.004, "cubeOut")
        hud(0, crochet,4, 'cubeOut')
        lol = true
        cam = false
        setActorAlpha(1, 'Fire')
    elseif curStep == 2000 then
        tweenShader("mirror3", "angle",180, crochet * 0.002, "cubeOut")
    elseif curStep == 2012 then
        tweenShader("mirror3", "x",-0.5, crochet * 0.002, "cubeInOut")
    elseif curStep == 2048 then
        tweenShader("mirror3", "angle",0, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "zoom",2, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect",0.25, crochet * 0.002, "cubeOut")
    elseif curStep == 2072 then
        tweenShader("mirror3", "x",-2.5, crochet * 0.002, "cubeInOut")
    elseif curStep == 2096 then
        tweenShader("mirror3", "y",1, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "zoom",1.5, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect",0.23, crochet * 0.002, "cubeOut")
    elseif curStep == 2104 then
        tweenShader("mirror3", "angle",180, crochet * 0.002, "cubeIn")
        tweenShader("mirror3", "zoom",0.5, crochet * 0.002, "cubeIn")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "cubeIn")
    elseif curStep == 2112 or curStep == 2368 then
        tween("blackBG",{alpha = 0.85},crochet*0.002,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        tweenShader("mirror3", "x",-3, crochet * 0.002, "cubeInOut")
        tweenShader("mirror3", "zoom",1, crochet * 0.002, "cubeOut")
        cam = true
    elseif curStep == 2176 or curStep == 2432 then
        tweenShader("mirror3", "zoom",1.25, crochet * 0.002, "cubeOut")
    elseif curStep == 2224 or curStep == 2480 then
        tweenShader("mirror3", "zoom",1, crochet * 0.004, "cubeIn")
    elseif curStep == 2240 or curStep == 2496 then
        tween("blackBG",{alpha = 0},crochet*0.002,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        cam = false
    elseif curStep == 2256 then
        tweenShader("mirror3", "angle",0, crochet * 0.002, "cubeOut")
    elseif curStep == 2268 then
        tweenShader("mirror3", "x",-3.5, crochet * 0.002, "cubeInOut")
    elseif curStep == 2304 then
        tweenShader("mirror3", "angle",-180, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "zoom",2, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect",0.25, crochet * 0.002, "cubeOut")
    elseif curStep == 2328 then
        tweenShader("mirror3", "x",-5.5, crochet * 0.002, "cubeInOut")
    elseif curStep == 2352 then
        tweenShader("mirror3", "y",2, crochet * 0.002, "cubeOut")
        tweenShader("mirror3", "zoom",1.5, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect",0.23, crochet * 0.002, "cubeOut")
    elseif curStep == 2360 then
        tweenShader("mirror3", "angle",0, crochet * 0.002, "cubeIn")
        tweenShader("mirror3", "zoom",0.5, crochet * 0.002, "cubeIn")
        tweenShader("bars", "effect",0.1, crochet * 0.002, "cubeIn")
    end
    if curStep == 2496 then
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeOut")
        mirror(true,true,"angle","angle",-60,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        tweenShader("vignette", "blue",0, crochet * 0.004, "cubeOut")
        lol = false
        tweenShader("mirror3", "x",-2, crochet * 0.002, "cubeInOut")
        st(true,true,'ca','strength','strength',0.03,0.002,2,crochet,"cubeOut")
    elseif curStep == 2624 then
        tweenShader("bloom", "contrast",3, crochet * 0.008, "cubeIn")
        tweenShader("greyscale", "strength",1, crochet * 0.008, "cubeIn")
        tweenShader("zoomblur","focusPower",3,crochet*0.008,"cubeIn")
        tweenShader("vignette", "size",1, crochet * 0.008, "cubeIn")
        tweenShader("vignette", "strength",0, crochet * 0.008, "cubeIn")
    end
    if ((curStep >= 1984 and curStep < 2220) or (curStep >= 2240 and curStep < 2480)) and curStep % 2 == 0 then
        if curStep % 4 == 0 then
            local isZero = math.floor((curStep % 8) / 4) == 0
            angle = isZero and -5 or 5
        end
        local isZoomZero = math.floor((curStep % 4) / 2) == 0
        tweenShader("mirror2", "zoom", isZoomZero and 1 or 0.9, crochet * 0.00035, isZoomZero and "cubeOut" or "cubeIn")
    end
    
    if curStep == 672 or curStep == 1568 or curStep == 1984 then
        for i = 0, 17 do
            if i <= 8 then
                if not middlescroll then
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + 320, crochet * 0.001 * 2, 'cubeOut')
                end
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
            else
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + 320, crochet * 0.001 * 2, 'cubeOut')
                tween("defaultStrum"..i, {alpha = 0}, crochet * 0.001 * 2, 'linear')
            end
        end
    elseif curStep == 792  or curStep == 1688 or curStep == 2104 then
        if not middlescroll then
            set("ratingsGroup.x",-280)
        end
        for i = 0, 17 do
            if i >= 9 then
                if not middlescroll then
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] - 320, crochet * 0.001 * 2, 'cubeOut')
                end
                tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
            else
                tween("defaultStrum"..i, {alpha = 0}, crochet * 0.001 * 2, 'linear')
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + 100*downscroll,crochet*0.001*2, 'cubeOut')
            end
        end
    elseif curStep == 928 or curStep == 1824 or curStep == 1984 or  curStep == 2496 then
        set("ratingsGroup.x",0)
        for i = 0, 17 do
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 4, 'cubeOut')
            tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
            tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
        end
    end
    
    
    if (curStep >= 160 and curStep < 672)
    or (curStep >= 672 and curStep < 928)
    or (curStep >= 992 and curStep < 1168)
    or (curStep >= 1184 and curStep < 1296)
    or (curStep >= 1312 and curStep < 1552)
    or (curStep >= 1568 and curStep < 1816)
    or (curStep >= 1824 and curStep < 1952)
    or (curStep >= 1984 and curStep < 2488)
    or (curStep >= 2496 and curStep < 2624) then

        local mod = 4 
        if (curStep >= 640 and curStep < 672) or (curStep >= 1536 and curStep < 1552) then
            mod = 1
        elseif (curStep >= 992 and curStep < 1120) or (curStep >= 1824 and curStep < 1888)
        or (curStep >= 2496 and curStep < 2560) then
            mod = 8
        elseif (curStep >= 1888 and curStep < 1952) or (curStep >= 2560 and curStep < 2624) then
            mod = 16
        elseif (curStep >= 1152 and curStep < 1168) or (curStep >= 1504 and curStep < 1536) then
            mod = 2
        end
        if curStep % mod == 0 then
            zoom = 0.93
        end
        if curStep % 8 == 0 then
            set("defaultCamZoom", math.random() * 0.2 + 0.67)
        end
    end

    
    
end
lol = false
function playerTwoSing(data, time, type)
    if lol then
		trailfd("dadCharacter1",data)
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
    tweenScaleX('trail'..trailCount, 1, duration, 'cubeInOut', 'trailFinish')
    tweenScaleY('trail'..trailCount, 1, duration, 'cubeInOut')
    local angle = data * (math.pi / 2)
    tweenActorProperty('trail'..trailCount, 'x', 150 * math.sin(angle), duration, 'cubeIn')
    tweenActorProperty('trail'..trailCount, 'y', 150 * math.cos(angle), duration, 'cubeIn')
    setActorLayer('trail'..trailCount, getActorLayer(baseSprite) - 1)

    trailCount = trailCount + 1
    if trailCount >= trailLimit then 
        trailCount = 0
    end
end

