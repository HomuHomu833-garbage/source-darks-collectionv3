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
    hud(0, crochet,1, 'cubeOut')
    local shaders = { 
        {"titleeffect", "coloreffect", {money = 0}},
        {"wiggle", "wiggle", {uSpeed = 5, uFrequency = 1.5, uWaveAmplitude = 0.015}},
        {"vcrchroma", "vcrchroma", {strength = 1 , speed = 1.2}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1.35, angle = -10, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"bars", "bars", {effect = 0,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},
        {"ca", "ChromAbEffect", {strength = 0.002}},
        {"scanline", "ScanlineEffect", {strength = 0.1, pixelsBetweenEachLine = 5}},
        {"zoomblur", "zoomblur", {focusPower = 5, posY = 0}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = -0.015}}
        }
        for _, shader in ipairs(shaders) do
            local name, effect, properties = shader[1], shader[2], shader[3]
            initShader(name, effect)
            setCameraShader('game', name)
            if name ~= "bars" and name ~= "mirror3" and name ~= "mirror2" and name ~= "scanline"
            and name ~= "vcrchroma" and name ~= "wiggle" then
                setCameraShader('hud', name)
            end 
            for prop, value in pairs(properties) do
                setShaderProperty(name, prop, value)
            end
        end
    end
function bloom(contrast,value1,speed,curStep,ease)
        setShaderProperty("bloom","contrast",contrast)
        tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function songStart()
    bloom(0,1,crochet,32,"")
    tweenShader("mirror2", "zoom",1, crochet * 0.064)
    tweenShader("mirror2", "angle",0, crochet * 0.016, "cubeOut")
    tweenShader("greyscale", "strength",0, crochet * 0.064, "cubeIn")
    tweenShader("zoomblur", "focusPower",0, crochet * 0.064)
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end

local perlinX,perlinY,perlinZ ,time = 0, 0, 0,0
local perlinSpeed,perlinXRange,perlinYRange,perlinZRange = 2, 0.075, 0.075,5
function update(elapsed)
    time = time + elapsed
    setShaderProperty("wiggle","iTime",time)
    setShaderProperty("vcrchroma","iTime",time)
    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
    x = lerp(x, 0, elapsed * 8)
    y = lerp(y, 0, elapsed * 8)
    angle = lerp(angle,0,elapsed*8)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    perlinZ = perlinZ + elapsed * math.random() * perlinSpeed
    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    local perlinOffsetZ = (-0.5 + perlin(0, 0, perlinZ)) * perlinZRange
    setShaderProperty('bump', 'x', x + perlinOffsetX)
    setShaderProperty('bump', 'y', y + perlinOffsetY)
    setShaderProperty('bump', 'angle', angle + perlinOffsetZ)
end
function stepHit()
    if curStep == 240 or curStep == 1008 or curStep == 2288 then
        tweenShader("mirror2", "zoom",2.5, crochet * 0.002, "cubeOut")
        setShaderProperty("mirror2","angle",0)
        tweenShader("mirror2", "angle",-180, crochet * 0.004, "cubeIn")
    elseif curStep == 248 or curStep == 1016 or curStep == 2296 then
        tweenShader("mirror2", "zoom",1, crochet * 0.002, "cubeIn")
    elseif curStep == 256 or curStep == 1024 or curStep == 2304 then
        hud(1, crochet,8, 'cubeOut')
        tweenShader("bars", "effect",0.1, crochet * 0.002, "quadOut")
        bloom(4,1,crochet,4,"cubeOut")
        setShaderProperty("vcrchroma","strength",0)
        setShaderProperty("scanline","strength",0)
        tweenShader("mirror2", "angle",-360, crochet * 0.004, "cubeOut")
        tweenShader("zoomblur", "focusPower",0, crochet * 0.001,"cubeOut")
    elseif curStep == 752 or curStep == 2032 then
        tweenShader("mirror2", "zoom",2, crochet * 0.002, "cubeOut")
    elseif curStep == 764 or curStep == 2044 then
        tweenShader("mirror2", "zoom",1, crochet * 0.001, "cubeIn")
    elseif curStep == 768 then
        hud(0, crochet,8, 'cubeOut')
        setProperty('', 'cameraSpeed', 3)
        bloom(4,1,crochet,4,"cubeOut")
        setShaderProperty("vcrchroma","strength",1)
    elseif curStep == 960 then
        tweenShader("greyscale", "strength",1, crochet * 0.001, "cubeOut")
    elseif curStep == 992 then
        tweenShader("zoomblur", "focusPower",5, crochet * 0.008,"cubeIn")
        tweenShader("greyscale", "strength",0, crochet * 0.008, "cubeIn")
    elseif curStep == 1520 or curStep == 2800 then
        setShaderProperty("mirror2","angle",0)
        tweenShader("mirror2", "angle",-180, crochet * 0.004, "cubeIn")
    elseif curStep == 1536 then
        hud(1, crochet,8, 'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        setShaderProperty("vcrchroma","strength",1)
        setShaderProperty("greyscale","strength",1)
        tweenShader("greyscale", "strength",0, crochet * 0.064, "cubeIn")
        tweenShader("mirror2", "angle",-360, crochet * 0.004, "cubeOut")
    elseif curStep == 2048 then
                setProperty('', 'cameraSpeed', 3)
        bloom(4,1,crochet,4,"cubeOut")
        setShaderProperty("greyscale","strength",1)
        tweenShader("greyscale", "strength",0, crochet * 0.064, "cubeIn")
        setShaderProperty("zoomblur","focusPower",5)
        tweenShader("zoomblur", "focusPower",0, crochet * 0.064,"cubeIn")
        setShaderProperty("scanline","strength",0.1)
    end
    if curStep == 2304 then
        tweenShader("bump", "barrel",-0.5, crochet * 0.004, "cubeOut")
        setShaderProperty("titleeffect","money",0.95)
    elseif curStep == 2432 or curStep == 2560 then
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 2816 then
        hud(0, crochet,8, 'cubeOut')
        bloom(1,0,crochet,128,"cubeIn")
        setShaderProperty("vcrchroma","strength",1)
        tweenShader("mirror2", "angle",-360, crochet * 0.004, "cubeOut")
        tweenShader("zoomblur", "focusPower",5, crochet * 0.128,"cubeIn")
        tweenShader("greyscale", "strength",1, crochet * 0.128,"cubeIn")
         perlinSpeed = 1
         setProperty('', 'cameraSpeed', 1)
    end
    if curStep == 1024 then
        perlinSpeed = 3
         set("defaultCamZoom", 0.6)        setProperty('', 'cameraSpeed', 1)
    elseif curStep == 1536 or curStep == 2816 then
        perlinSpeed = 2
    elseif curStep == 2304 then
        perlinSpeed,perlinXRange,perlinYRange,perlinZRange = 4 , 0.09,0.09,10

    end
    if curStep >= 256 and curStep < 768 or curStep >= 1536 and curStep < 2048 or curStep >= 2816 then
        if curStep % 256 == 16 or curStep % 256 == 80 then
            set("defaultCamZoom", 0.7)
        elseif curStep % 256 == 24 or curStep % 256 == 88 or curStep % 256 == 160 or curStep % 256 == 224 then
            set("defaultCamZoom", 0.8)
         elseif  curStep % 256 == 0 or curStep % 256 == 32 or curStep % 256 == 64 or curStep % 256 == 96 or curStep % 256 == 128 or curStep % 256 == 192 then
            set("defaultCamZoom", 0.6)
         elseif curStep % 256 == 48 or curStep % 256 == 112 or curStep % 256 == 176 or curStep % 256 == 240 then
            set("defaultCamZoom", 0.9)
        
        end
    end
    if quelargo(curStep, 2176, 2240) and curStep % 16 == 0 then
        zoom = 0.87
    elseif (quelargo(curStep, 768, 992) or quelargo(curStep, 2240, 2272) or quelargo(curStep, 2304, 2528)) and curStep % 8 == 0 then
        zoom = 0.87
    elseif (quelargo(curStep, 992, 1008) or quelargo(curStep, 2272, 2288) or quelargo(curStep, 2528, 2544) ) and curStep % 4 == 0 then
        zoom = 0.87
    elseif (quelargo(curStep, 1008, 1020) or quelargo(curStep, 2288, 2298) or quelargo(curStep, 2544, 2552) )and curStep % 2 == 0 then
        zoom = 0.87
    elseif quelargo(curStep, 256, 768) or quelargo(curStep, 1024, 1536) or quelargo(curStep, 2560, 2816) then
        local lol64 = curStep % 64
        local qso = curStep % 128
        if lol64 == 0 or lol64 == 12 or lol64 == 25 or lol64 == 41 or lol64 == 57 or lol64 == 61 then
            zoom = 0.87
        elseif lol64 == 16 or lol64 == 48 then
            zoom = 1.15
        elseif qso == 94 or qso == 110 or qso == 126 then
            zoom = 0.87
        end
    end

end
function quelargo(step, min, max)
        return step >= min and step < max
end