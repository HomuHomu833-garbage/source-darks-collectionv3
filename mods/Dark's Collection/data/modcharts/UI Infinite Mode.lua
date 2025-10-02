local window, a = 240, 0
local start_Rock_Num, end_Rock_Num = 2, 12
local rock_Stuff = {}

function createImage(name, imagePath, x, y, scale, alpha)
 
    makeSprite(name, imagePath, x, y, scale)
    
  
    setCamera(name, "hud")

    actorScreenCenter(name)

    setActorAlpha(alpha, name)
end
function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("infoTxt",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("timeBarBG",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end

function start(song)
    for i = 0,17 do
        setActorAlpha(0,i)
    end
    lascosasdelhud(0,stepCrochet,1,"cubeOut")
    createImage("set", "set", 0, 0, 0.7, 0)
    createImage("ready", "ready", 0, 0, 0.7, 0)
    createImage("go", "go", 0, 0, 0.7, 0)
    createImage("hehe", "hehe", 0, 0, 0.7, 0)
    createImage("hehehe", "hehehe", 0, 0, 0.7, 0) -- Imagen "hehe" con alpha 0
    createImage("going", "going", 0, 0, 0.5, 0) -- Imagen "going" con alpha 0
    createImage("trying", "trying", 0, 0, 0.5, 0)
    createImage("end", "end", 0, 0, 0.7, 0)
    createImage("serious", "serious", 0, 0, 0.6, 0)
    createImage("started", "started", 0, 0, 0.6, 0)
    createImage("sure", "sure", 0, 0, 0.6, 0)
    createImage("because", "because", 0, 0, 0.5, 0)
    createImage("asked", "asked", 0, 0, 0.6, 0)
    createImage("over", "over", 0, 0, 0.6, 0)
    initShader('ca', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.001)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle',0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0.5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'red', 0)
    setShaderProperty('vignette', 'blue', 0)
    setShaderProperty('vignette', 'green', 0)
    setShaderProperty('vignette', 'size', 0.2)


    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)

    
    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
    setShaderProperty('bloom', 'brightness', -0.05)

    tweenShaderProperty("bars","effect",0,crochet*0.001*32,"linear")
    for i = start_Rock_Num, end_Rock_Num do
        rock_Stuff[i] = getActorY("undefinedSprite" .. i)
    end
end
local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 0.85 
local perlinXRange = 0
local perlinYRange = 0
local perlinZRange = 0
function update(elapsed)
     
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
    perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('mirror', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('mirror', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('mirror', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

    a = a + elapsed * 1.5
    local sin_a = math.sin(a * 2) * 50
    local sin_2a = math.sin(2 * a) * window
    local sin_2a_plus_i = function(i) return math.sin(2 * (a + i)) * 80 end

    setActorPos(-1000 + math.cos(a) * 2 * window, -1850 + sin_2a, "dad")

    for i = start_Rock_Num, end_Rock_Num do
        setActorPos(getActorX("undefinedSprite" .. i), rock_Stuff[i] + sin_2a_plus_i(i), "undefinedSprite" .. i)
    end

    setActorPos(350, -1650 + sin_a, "boyfriend")
    setActorPos(350 - 200, -1650 + sin_a + 300, "bf_rock")
    
    setActorPos(350 - 700, -2150 + sin_a + 175 + sin_a * 2, "girlfriend")
    setActorPos(350 - 700 - 200, -2150 + sin_a + 175 + sin_a * 2 + 300, "gf_rock")
end
function images(actor,alpha,s)
    tween(actor,{alpha = alpha},stepCrochet*0.001*s)
end
function stepHit()

    if curStep == 496 or curStep == 1024 or curStep == 2688 or curStep == 3200 or curStep == 3608
    or curStep == 4736 or curStep == 5248 then
        set("defaultCamZoom", 0.8)
    elseif curStep == 512 or curStep == 1280 or curStep == 2048 or curStep == 3072 or curStep == 3728
    or curSep == 4864 or curStep == 5504 then
        set("defaultCamZoom", 0.5)
    end
    if curStep == 3200 or curStep == 3488  or curStep == 3632 or curStep == 3776 or curStep == 4064 or curStep == 4208 then
        setShaderProperty('vignette', 'red', 255)
        tweenShaderProperty("vignette","red",0,crochet*0.001*2,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*1)..',0.012')
    end
    if curStep == 224 then
        images("hehe",1,4)
        for i = 0,17 do
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 4, 'cubeOut')
        end
        tweenShaderProperty("greyscale","strength",0.2,crochet*0.001*8,"linear")
    elseif curStep == 236 then
        images("hehe",0,4)
        images("going",1,4)
    elseif curStep == 252 then
        images("going",0,4)
    elseif curStep == 496 then
        images("trying",1,4)
    elseif curStep == 508 then
        images("trying",0,4)
    elseif curStep == 1264 then
        images("end",1,4)
    elseif curStep == 1276 then
        images("end",0,4)
    elseif curStep == 1984 then
        images("serious",1,4)
    elseif curStep == 2012 then
        images("serious",0,4)
    elseif curStep == 2028 then
        images("started",1,4)
    elseif curStep == 2044 then
        images("started",0,4)
    elseif curStep == 3096 then
        images("sure",1,4)
    elseif curStep == 3108 then
        images("sure",0,4)
    elseif curStep == 3112 then
        images("because",1,4)
    elseif curStep == 3140 then
        images("because",0,4)
    elseif curStep == 3164 then
        images("asked",1,4)
    elseif curStep == 3184 then
        images("asked",0,4)
    elseif curStep == 4412 then
        images("hehehe",1,4)
    elseif curStep == 4428 then
        images("hehehe",0,4)
    elseif curStep == 4460 then
        images("over",1,4)
    elseif curStep == 4476 then
        images("over",0,4)
    elseif curStep == 256 or curStep == 2048 then
        lascosasdelhud(1,stepCrochet,8,"linear")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*4,"cubeOut")
    elseif curStep == 1792 or curStep == 4352 then
        for i = 0,17 do
            tween("defaultStrum"..i, {alpha = 0}, crochet * 0.001 * 8, 'linear')
        end
        set("defaultCamZoom", 0.8)
        lascosasdelhud(0,stepCrochet,8,"linear")
        tweenShaderProperty("bars","effect",0.6,crochet*0.001*8,"linear")
    elseif curStep == 1856 or curStep == 4432 then
        tweenShaderProperty("greyscale","strength",0.5,crochet*0.001*8,"linear")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*8,"linear")
    elseif curStep == 2016 or curStep == 4464 then
        for i = 0,17 do
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 4, 'cubeOut')
        end
    elseif curStep == 2304 then
        tweenShaderProperty("greyscale","strength",0.2,crochet*0.001*4,"linear")
    elseif curStep == 3072 then
        lascosasdelhud(0,stepCrochet,8,"linear")
    elseif curStep == 3188 then
        set("set.alpha",1)
        tween("set", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
    elseif curStep == 3192 then
        set("ready.alpha",1)
        tween("ready", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
    elseif curStep == 3196 then
        set("go.alpha",1)
        tween("go", {alpha = 0}, crochet * 0.001 * 1, 'cubeOut')
    elseif curStep == 4480 then
        set("defaultCamZoom", 0.5)
        perlinSpeed = 0.85 
        perlinXRange = 0.2
        perlinYRange = 0.2
        perlinZRange = 20
        tweenShaderProperty("greyscale","strength",0.2,crochet*0.001*4,"linear")
        lascosasdelhud(1,stepCrochet,8,"linear")
        flashCamera("hud","white",crochet*0.001*3,"linear")
        setShaderProperty('vignette', 'red', 255)
        setShaderProperty('vignette', 'blue', 0)
        setShaderProperty('vignette', 'green', 0)
    end
end