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
local textos = {
    {'they','They not like us',50, -300, 150,"game","white"},
}
local qlol = '#000000'
local lastColor = qlol
function createPost()
    hud(0, crochet, 1, 'cubeOut')
    local shaders = { 
        {"mirror", "BarrelBlurEffect", {zoom = 1.25, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"bars", "bars", {effect = 0,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},
        {"smoke", "PerlinSmokeEffect", {smokeStrength = 1}},
        {"vignette", "VignetteEffect", {strength = 15, size = 0.25}},
        {"blur", "zoomblur", {focusPower = 3, posY = -2}},
        {"BetterBlurEffect", "BetterBlurEffect", {strength = 0, loops = 7, quality = 10}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = 0,effect = 0, strength = 0.5}},
        {"ca", "ChromAbEffect", {strength = 0.002}}
     }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        if name ~= "bump" and name ~= "mirror2" and name ~= "mirror"
        and name ~= "bars" and name ~= "smoke" then
            setCameraShader('hud', name)
        end 
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end

    for _, text in ipairs(textos) do
        makeText(text[1], text[2], text[3], text[4], text[5])
        setCamera(text[1], text[6])
        setActorScroll(0.5, 0.5,text[1])
        setActorFont(text[1], "Contb___.ttf")
        setActorTextColor(text[1], text[7])
        setActorAlpha(0, text[1])
        setActorLayer(text[1],getActorLayer("gfCharacter0"))
    end
     makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('gfCharacter0'))
    setProperty('', 'centerCamera', true)
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
function songStart()
    mirror(false,true,"","zoom",0,1,60,crochet,"")
    tweenShader('blur','focusPower',0,crochet*0.064,"cubeIn") 
    tweenShader('greyscale','strength',0,crochet*0.064,"cubeIn")
    tweenShader('smoke','smokeStrength',0,crochet*0.064,"cubeIn")  
    bloom(0,1,crochet,32,"")
end
local perlinX,perlinY,perlinZ ,time = 0, 0, 0,0
local perlinSpeed,perlinXRange,perlinYRange,perlinZRange = 2, 0.075, 0.075,5
akiro,bf = false,false
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
function update(elapsed)
     if qlol ~= lastColor then
        makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), qlol)
        lastColor = qlol
        actorScreenCenter('blackBG')
    end
    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.002)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end
    time = time + elapsed
    setShaderProperty("smoke","iTime",time)
    zoom = lerp(zoom, 1, elapsed * 8)
    setShaderProperty('bump', 'zoom', zoom)
    blur = lerp(blur, 1, elapsed * 8)
    setShaderProperty('BetterBlurEffect', 'strength', blur)
    if akiro then
        set("camFollow.x", get("dad.x")+400)
        set("camFollow.y", get("dad.y")+300)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+200)
        set("camFollow.y", get("boyfriend.y")+450)
    end
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
lol = 1
function stepHit()
    if curStep >= 256 and curStep < 512 then
        if curStep % 32 == 0 or curStep % 32 == 12 or curStep % 32 == 20 or curStep % 32 == 26 then
            zoom,blur = 0.7,10
        end
    end
    if curStep == 224 or curstep == 1504 then
        tweenShader('bump','barrel',-2,crochet*0.008,"cubeIn") 
    elseif curStep == 240 then
        mirror(false,true,"","zoom",0,0,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,4,crochet,"cubeIn")
        bloom(1,0,crochet,3.5,"cubeIn")
    elseif curStep == 256 then
        tweenShader('bump','barrel',0,crochet*0.002,"cubeOut") 
        bloom(2,1,crochet,2,"")setProperty('', 'centerCamera', false)
        mirror(false,true,"","zoom",0,1,3,crochet,"cubeOut")
        mirror(false,true,"","angle",0,360,3,crochet,"cubeOut")
    elseif curStep == 320 or curStep == 448 or curStep == 640 or curStep == 832
    or curStep == 896 or curStep == 1856 or curStep == 1920 or curStep == 2112
    or curStep == 2240  then
        bloom(2,1,crochet,2,"")
    elseif curStep == 384 or curStep == 416 or curStep == 480 or curStep == 896 or curStep == 1920 or curStep == 2176 or curStep == 2208  then
        set("defaultCamZoom", 0.8)
    elseif curStep == 392 or curStep == 424 or curStep == 512 or curStep == 960 or curStep == 1984 or curStep == 2184 or curStep == 2216 then
        set("defaultCamZoom", 0.5)
    elseif curStep == 496 or curStep == 2288 then
        tweenShader('greyscale','strength',1,crochet*0.001,"cubeOut") 
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,180,4,crochet,"cubeIn")
    elseif curStep == 504 or curStep == 2296 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    end
    if curStep == 512 then
        hud(1, crochet, 4, 'cubeOut')
        bloom(2,1,crochet,2,"")
         setCameraShader('hud', "bloom")
        tweenShader('greyscale','strength',0,crochet*0.002,"cubeOut") 
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,4,crochet,"cubeOut")
    elseif curStep == 2304 then
        tween("camHUD",{alpha = 0},crochet*0.064)
        tweenShader('bars','effect',0.55,crochet*0.064,"cubeIn") 
        tweenShader('blur','focusPower',5,crochet*0.064,"cubeIn") 
         bloom(2,1,crochet,2,"")
            
        tweenShader('greyscale','strength',0,crochet*0.002,"cubeOut") 
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
         tweenShader('bump','barrel',-2,crochet*0.064,"cubeIn") 
        mirror(true,true,"angle","angle",-180,0,4,crochet,"cubeOut")
    end
    if curStep == 768 or curStep == 1792 then
        qlol = "#000000"
         hud(0.35, crochet, 4, 'cubeOut')
         tweenShader('smoke','smokeStrength',2,crochet*0.004,"cubeOut") 
        setProperty('', 'centerCamera', true)
        tween("blackBG", {alpha = 0.5}, crochet * 0.004,"cubeOut")
    elseif curStep == 880 or curStep == 1904 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 888 or curStep == 1912 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
    elseif curStep == 896 or curStep == 1920 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1016 or curStep == 2040 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
         hud(0, crochet, 2, 'cubeIn')
         tween("blackBG", {alpha = 0}, crochet * 0.002,"cubeIn")
     elseif curStep == 1020 or curStep == 2044 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        tweenShader('bump','barrel',-2,crochet*0.001,"cubeIn") 
     elseif curStep == 1022 or curStep == 2046 then
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
     elseif curStep == 1024 then
        tweenShader('smoke','smokeStrength',0,crochet*0.004,"cubeOut") 
        bloom(2,1,crochet,4,"")
        setProperty('', 'centerCamera', false)
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
        tweenShader('bump','barrel',0,crochet*0.004,"cubeOut") 
        tweenShader('bars','effect',0.15,crochet*0.008,"cubeOut") 
        bf =true
     elseif curStep == 1152 then
        bf,akiro = false,true
        bloom(2,1,crochet,4,"")
     elseif curStep == 2048 then
        tweenShader('smoke','smokeStrength',0,crochet*0.004,"cubeOut") 
        bloom(2,1,crochet,4,"")
        setProperty('', 'centerCamera', false)
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
        tweenShader('bump','barrel',0,crochet*0.004,"cubeOut") 
    end
    if curStep == 1086 or curStep == 1214 then
          mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeInOut")
    elseif curStep == 1118 or curStep == 1246 then
          mirror(false,true,"","zoom",0,1,4,crochet,"cubeInOut")
     elseif curStep == 1148 then
        tweenShader('bump','barrel',-2,crochet*0.001,"cubeIn") 
        mirror(false,true,"","zoom",0,0.2,1,crochet,"cubeIn")
    elseif curStep == 1152 then
         tweenShader('bump','barrel',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,4,"") blur = 10
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
    elseif curStep == 1280 then
        bf,akiro,qlol = false,false,"#FFFFFF"
        perlinCaRange = 0.015
         tweenActorColor("dad",255,255,255,0,0,0,crochet * 0.002,"cubeOut")
        tweenActorColor("gfCharacter0",255,255,255,0,0,0,crochet * 0.002,"cubeOut")
        tweenActorColor("gfCharacter1",255,255,255,0,0,0,crochet * 0.002,"cubeOut")
        tweenActorColor("boyfriend",255,255,255,0,0,0,crochet * 0.002,"cubeOut")
        tween("blackBG", {alpha = 1}, crochet * 0.004,"cubeOut")
        bloom(2,1,crochet,4,"")
        set("defaultCamZoom", 0.8)
    elseif curStep == 1332 or curStep == 1336 or curStep == 1340 
    or curStep == 1396 or curStep == 1400 or curStep == 1404 then
        zoom = 1.5
    elseif curstep == 1408 or curstep == 1472 then
       set("defaultCamZoom", 0.5)
    elseif curstep == 1440 or curstep == 1504 then
       set("defaultCamZoom", 0.8)
    end
    if curStep == 1332 or curStep == 1396 then
        lol = -lol
         mirror(true,true,"angle","angle",0,45*lol,1,crochet,"cubeOut")
    elseif curStep == 1336 or curStep == 1400 then
         mirror(false,true,"","angle",0,90*lol,1,crochet,"cubeOut")
    elseif curStep == 1340 or curStep == 1404 then
         mirror(false,true,"","angle",0,180*lol,1,crochet,"cubeIn")
     elseif curStep == 1344 or curStep == 1408 then
         mirror(false,true,"","angle",0,360*lol,3,crochet,"cubeOut")
    end
    if curStep == 1460 or curStep == 1524 then
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 1464 or curStep == 1528 then
         mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 1468 or curStep == 1532 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
     elseif curStep == 1472 or curStep == 1536 then
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
     elseif curStep == 1520 then
         bloom(1,0,crochet,3.5,"cubeIn")
     end
     if curStep == 1536 then
        perlinCaRange = 0
        tweenActorColor("dad",0,0,0,255,255,255,crochet * 0.002,"cubeOut")
        tweenActorColor("gfCharacter0",0,0,0,255,255,255,crochet * 0.002,"cubeOut")
        tweenActorColor("gfCharacter1",0,0,0,255,255,255,crochet * 0.002,"cubeOut")
        tweenActorColor("boyfriend",0,0,0,255,255,255,crochet * 0.002,"cubeOut")
        tween("blackBG", {alpha = 0}, crochet * 0.004,"cubeOut")
        hud(1, crochet, 4, 'cubeOut')
        bloom(2,1,crochet,2,"")
        tweenShader('bars','effect',0,crochet*0.004,"cubeOut") 
    end
    if curStep >= 496 and curStep < 512 then
        if curStep % 2 == 0 then
           -- removeCameraShader("hud","bloom")
            setShaderProperty("bloom","contrast",0)
        elseif curStep % 2 == 1 then
            setShaderProperty("bloom","contrast",1)
        end
    end
    if curStep >= 512 and curStep < 768 or curStep >= 1536 and curStep < 1792 then
        if curStep % 64 == 0 or curStep % 64 == 6 or curStep % 64 == 12 or curStep % 64 == 13 
        or curStep % 64 == 14 or curStep % 64 == 24 or curStep % 64 == 28 or curStep % 64 == 32 
        or curStep % 64 == 38 or curStep % 64 == 44 or curStep % 64 == 46 or curStep % 64 == 52--564
        or curStep % 64 == 56 or curStep % 64 == 60  then
            zoom = 0.65
        end
    end
    if curStep >= 768 and curStep < 1024 then
        if curStep % 32 == 0 or curStep % 32 == 12 or curStep % 32 == 20 or curStep % 32 == 26 then
            zoom = 0.65
        end
    end
    if curStep >= 1024 and curStep < 1280 or curStep >= 2048 and curStep < 2304 then
        if curStep % 32 == 0 or curStep % 32 == 6 or curStep % 32 == 12 or curStep % 32 == 18
        or curStep % 32 == 22 or curStep % 32 == 28 then
            zoom = 0.65
        end
    end
    if curStep >= 512 and curStep < 1024 or curStep >= 1536 and curStep < 2048 then
        if curStep % 32 == 16 then
            triggerEvent("add camera zoom","","-0.07")
        end
        if curStep % 16 == 0 then
            set("defaultCamZoom", math.random() * 0.15 + 0.5)
        end
    end
    if curStep >= 2304 then
        if curStep % 32 == 0  then
             mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        elseif curStep % 32 == 28 then
             mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        end
    end

    theynotlikeus(512)
    theynotlikeus(1536)
end
function theynotlikeus(s)
    if curStep >= s and curStep < s + 256 then
        local localStep = curStep - s
        if localStep % 64 == 16 or localStep % 64 == 32 or localStep % 64 == 48 then
            local i = math.random(1, #textos)
            local nombre = textos[i][1]
            setActorAlpha(1, nombre)
            tween(nombre, {alpha = 0}, crochet * 0.0035)
            local posiblesX = {300,900,500,0} 
            local xAleatorio = posiblesX[math.random(#posiblesX)]
            setActorX(xAleatorio, nombre)
            tween(nombre, {x = getActorX(nombre) - 300}, crochet * 0.0035)
            local posiblesY = {-250,-150,-50,-300} 
            local yAleatorio = posiblesY[math.random(#posiblesY)]
            setActorY(yAleatorio,nombre) 
        end
    end
    if curStep == s+116 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    elseif curStep == s+120 then
        angle = -15
    elseif curStep == s+124 then
        mirror(true,true,"angle","angle",0,65,0.5,crochet,"cubeOut")
    elseif curStep == s+126 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,0.5,crochet,"cubeIn")
    elseif curStep == s+128 then
        mirror(true,true,"angle","angle",-180,0,3,crochet,"cubeOut")
    elseif curStep == s+252 then
        tweenShader('bump','barrel',-2,crochet*0.001,"cubeIn") 
        mirror(false,true,"","zoom",0,0.2,1,crochet,"cubeIn")
    elseif curStep == s+256 then
         tweenShader('bump','barrel',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,4,"") blur = 10
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeOut")
    end

end