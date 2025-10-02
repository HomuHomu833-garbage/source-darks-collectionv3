function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("infoTxt.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
    set("timeBarBG.alpha",s)
    set("ratingText.alpha",s)
end
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 1.5
local perlinXRange = 0.1
local perlinYRange = 0.1
local perlinZRange = 0
local bf=false
local matt=false
local time = 0
local setcam = {"Matt Win","Matt Lose","BF Win","BF Lose"}
local scales = {}
function posiciones(nombre, x, y)
    set(nombre .. ".x", x)
    set(nombre .. ".y", y)
end
function createPost()
    scales["Matt Win"] = {1, 1}
    scales["Matt Lose"] = {1, 1}
    scales["BF Win"] = {1, 1}
    scales["BF Lose"] = {1, 1}
    for _, name in ipairs(setcam) do
        makeSprite(name, 'Alarmiing/'..name, 0, 0, 2) 
        setCamera(name, "hud") 
    end
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920/getCamZoom(), 1080/getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0.15, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
    
    posiciones("Matt Lose",300,1250)
    posiciones("BF Lose",750,1250)
    posiciones("Matt Win",345,1250)
    posiciones("BF Win",700,1250)

    setActorAlpha(1, "Matt Win")
    setActorAlpha(0, "Matt Lose")
    setActorAlpha(1, "BF Win")
    setActorAlpha(0, "BF Lose")


    lascosasdelhud(0)
    initShader('particles', 'particlesnew')
    setCameraShader('game', 'particles')  
    setShaderProperty('particles', 'transparency', 0.84)
    setShaderProperty('particles', 'red', 2)
    setShaderProperty('particles', 'blue', 1)
    setShaderProperty('particles', 'green', 1)
    

    set("boyfriend.x",2500)
    set("dad.x",-2200)
    set("dad.y", getActorY("dad")-50)

    
    initShader('perlin', 'PincushNewEffect')--
    setCameraShader('game', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
	setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)
    setShaderProperty('perlin', 'angle', 0)
	setShaderProperty('perlin', 'barrel', 0)
    setShaderProperty('perlin', 'doChroma', true)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.2)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    
    initShader('bars', 'bars')
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red',2)
    setShaderProperty('color', 'green', 1)
    setShaderProperty('color', 'blue', 1)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red',1.1)
    setShaderProperty('color', 'green', 1.1)
    setShaderProperty('color', 'blue', 1.1)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    initShader('blur', 'blur')
    setCameraShader('game', 'blur')
    setShaderProperty('blur', 'strengthX', 0)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0)

    initShader("godrays","godrays")
    setCameraShader('hud', 'godrays')
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.7)
    setShaderProperty('godrays', 'density',0.15)
    setShaderProperty('godrays', 'weigth', 0.6)

    

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setCameraShader("hud","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)
        
    initShader('saturation', 'saturation')
    setCameraShader('game', 'saturation')
    setShaderProperty('saturation', 'AAA', 2)
    setShaderProperty('saturation', 'BBB', 1)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.002)

    makeSprite('white', '', 0, 0, 1)
	setObjectCamera('white', 'hud')
	makeGraphic('white', 4000, 2000, '#000000')
	actorScreenCenter('white')
	setActorAlpha(0, 'white')


    for i = 0,7 do
        setActorProperty(i,"alpha",s)
    end
   
end

local x = 0
local X = true
local zoom = 1
local blur = 0
local perlinlol = true
local cam = true
local matt = false
local bf = false
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('godrays', 'iTime', time)
    setCustomShaderFloat('particles', 'iTime', time)
    if perlinlol then
    perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('perlin', 'angle', ((-0.5 + perlin(0, perlinZ, 0))*perlinZRange))
    end
    if cam then
    set("defaultCamZoom", 0.38)
	set("camFollow.x",725)
    set("camFollow.y",-450)
    end
    if matt then
        set("camFollow.x", get("dad.x")+150)
        set("camFollow.y", get("dad.y")+150)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+350)
    end
    if X then
        x = lerp(x, 0, elapsed*8)
        setShaderProperty('mirror', 'x', x)
    end
    zoom, blur = lerp(zoom, 1, elapsed * 8), lerp(blur, 0, elapsed * 8)
        setShaderProperty('perlin', 'zoom', zoom)
        setShaderProperty('blur', 'strengthX', blur)

        local mattX = getActorX("Matt Win")
        setActorX(mattX, "Matt Lose")
        setActorY(getActorY("Matt Win"), "Matt Lose")
        local bfX = getActorX("BF Win")
        setActorX(bfX, "BF Lose")
        setActorY(getActorY("BF Win"), "BF Lose")

--scales - bumps
        scales["Matt Win"] = lerp(scales["Matt Win"], 1, 12 * elapsed)
        scales["BF Win"] = lerp(scales["BF Win"], 1, 12 * elapsed)
        scales["Matt Lose"] = lerp(scales["Matt Lose"], 1, 12 * elapsed)
        scales["BF Lose"] = lerp(scales["BF Lose"], 1, 12 * elapsed)
        
        setActorScale(scales["Matt Win"], "Matt Win")
        setActorScale(scales["BF Win"], "BF Win")
        setActorScale(scales["Matt Lose"], "Matt Lose")
        setActorScale(scales["BF Lose"], "BF Lose")
end
function lerp(a, b, ratio)
    return a + ratio * (b - a)
end

function songStart()
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*32,"cubeIn")
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

function stepHit()
    
    
    if curStep == 120 then
       -- tweenFadeIn("white",0.8,crochet*0.001*2,"cubeIn") 
        for i = 0,7 do
            tweenActorProperty(i,"alpha",1,crochet*0.001*2, "linear")
        end
    end
    if curStep == 128 or curStep == 640 then
        tween("dad", {x = 50},crochet*0.001*2, "cubeOut")
        tween("boyfriend", {x = 1100},crochet*0.001*2, "cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        lascosasdelhud(1)
        tweenFadeIn("white",0,crochet*0.001*1,"cubeOut") 
        perlinlol = true
        
    end
    if curStep == 256 or curStep == 384 or curStep == 448 or curStep == 768 
    or curStep == 896 or curStep == 928 or curStep == 1280 then
        set("defaultCamZoom", 0.7)
        matt = true
        cam = false
        bf = false
    elseif curStep == 288 or curStep == 416 or curStep == 480 or curStep == 800 
    or curStep == 912 or curStep == 944 or curStep == 1312 then
        matt = false
        bf = true
    elseif curStep == 320 or curStep == 496 or curStep == 832 or curStep == 960
    or curStep == 1344 then
        set("defaultCamZoom", 0.38)
        matt = false
        bf = false
        cam = true
    end
    if curStep > 128 and curStep <= 246 or curStep > 256 and curStep <= 336 or curStep > 352 and curStep <= 512
     or curStep > 512 and curStep <= 624 or curStep > 646 and curStep <= 758 or curStep > 768 and curStep <= 848 
     or curStep > 864 and curStep <= 1008 or curStep > 1024 and curStep <= 1142 or curStep > 1152 and curStep <= 1267
     or curStep > 1280 and curStep <= 1360 or curStep > 1376 and curStep <= 1408 then
        local steps = {[0] = true,[7] = true,[20] = true,[26] = true,[31] = true,[32] = true, 
        [38] = true,[50] = true,[53] = true,[58] = true, [62] = true, [63] = true }
        if steps[curStep % 64] then
            zoom,blur = 0.85,5
            triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.01')
        end
    end
    if curStep == 340 or curStep == 348 then
        mirror(false,true,"","x",0,-0.2,1,crochet,"cubeInOut")
    elseif curStep == 344 then
        mirror(false,true,"","x",0,0.2,1,crochet,"cubeInOut")
    elseif curStep == 352 then
        mirror(false,true,"","x",0,0,1,crochet,"cubeInOut")
        --mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
      --  triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.01')
    elseif curStep == 384 or curStep == 896 or curStep == 1024 then
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 500  or curStep == 508 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
        perlinlol = false
    elseif curStep == 502 or curStep == 506 then
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeOut")
    elseif curStep == 504 then
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-40,0.5,crochet,"cubeOut")
    elseif curStep == 510 then
        mirror(false,true,"","angle",0,10,0.5,crochet,"cubeOut")
    end
    if curStep == 508 or curStep == 1404 then
        tween("dad", {x = -2200},crochet*0.001*3, "cubeInOut")
        tween("boyfriend", {x = 2500},crochet*0.001*3, "cubeInOut")
    end
    if curStep == 508 then
        tweenShaderProperty('perlin', 'x', -18, crochet*0.001*10, 'sineInOut')
    elseif curStep == 512 or curStep == 1408 then
        mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        tween("Matt Win", {y = 250}, crochet * 0.001 * 1, "cubeOut")
        tween("BF Win", {y = 250}, crochet * 0.001 * 1, "cubeOut")
        lascosasdelhud(0)
        perlinlol = false
    elseif curStep == 544 then
        mirror(true,true,"angle","angle",1080,0,12,crochet,"cubeInOut")
    elseif curStep == 576 then
        mirror(false,true,"","zoom",0,2.5,4,crochet,"quadOut")
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 608 or curStep == 1504 then
        mirror(false,true,"","zoom",0,1,8,crochet,"cubeIn")
        tween("Matt Win", {y = 1250}, crochet * 0.001 * 8, "cubeIn")
        tween("BF Win", {y = 1250}, crochet * 0.001 * 8, "cubeIn")
    elseif curStep == 628 or curStep == 632 or curStep == 636 then

        zoom,blur = 0.85,5
        triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.01')
    end
    if curStep == 752 then
        nose = false
    elseif curStep == 1008 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame',"power",0.5, crochet*0.001*2,"cubeOut")
    elseif curStep == 1016 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*2,"cubeIn")
    elseif curStep == 1136 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*3, 'cubeIn')
    elseif curStep == 1148 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'expoIn')
    end
    if curStep == 1152 then
        setShaderProperty('titleeffect', 'money',0.7)
    elseif curStep == 1536 or curStep == 1024 or curStep == 640 then
        zoom,blur = 0.6,5
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('smoker', 'transparency', 1)
    end
    if curStep == 1408 then
        setShaderProperty('smoker', 'transparency', 0.25)
        setActorAlpha(0, 'blackBG')
    elseif curStep == 1536 then
        tween("camHUD",{alpha=0}, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.6, crochet*0.001*6, 'cubeIn')
    end
    -- -18 x
    if curStep > 336 and curStep <= 352 or curStep > 848 and curStep <= 864 or curStep > 1360 and curStep <= 1376 then
        if curStep % 4 == 0 then
            X = false
            mirror(false, true, "", "zoom",0,0.7,0.5,crochet,"expoIn")
        elseif curStep % 4 == 2 then
            mirror(false, true, "", "zoom",0,1,0.5,crochet,"cubeOut")
            triggerEvent('screen shake', (stepCrochet * 0.001 * 2)..',0.01')
        end
        if curStep % 8 == 0 then
            tweenFadeIn("blackBG",0.5,crochet*0.001*1,"cubeOut") 
        end
        if curStep % 8 == 4 then
            tweenFadeIn("blackBG",0.15,crochet*0.001*1,"cubeOut") 
        end
    end
    if curStep == 384 or curStep == 896 or curStep == 1408 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.15,crochet*0.001*1,"cubeOut")
    end

    zoomyx(240)
    zoomyx(752)
    zoomyx(1136)
    zoomyx(1264)
    local gfSpeed = getProperty("", "gfSpeed")

    if curStep > 512 and curStep <= 640 or curStep > 1408 and curStep <= 1536  then
        if curStep % 8 == 0 then
            if math.floor(curStep / gfSpeed) % 4 == 0 then
                scales["Matt Win"] = 1.7
                scales["BF Win"] = 1.7
                scales["Matt Lose"] = 1.7
                scales["BF Lose"] = 1.7
            else
                scales["Matt Win"] = 1.0
                scales["BF Win"] = 1.0
                scales["Matt Lose"] = 1.0
                scales["BF Lose"] = 1.0
            end
            setActorAlpha(1, "Matt Win")
            setActorAlpha(0, "Matt Lose")
            setActorAlpha(0, "BF Win")
            setActorAlpha(1, "BF Lose")
            tween("BF Win", {x = 900}, crochet * 0.001 * 1, "expoOut")
            tween("Matt Win", {x = 700}, crochet * 0.001 * 1, "expoOut")
        elseif curStep % 8 == 4 then
            tween("BF Win", {x = 400}, crochet * 0.001 * 1, "expoOut")
            tween("Matt Win", {x = 150}, crochet * 0.001 * 1, "expoOut")
            if math.floor(curStep / gfSpeed) % 4 == 0 then
                scales["Matt Win"] = 1.7
                scales["BF Win"] = 1.7
                scales["Matt Lose"] = 1.7
                scales["BF Lose"] = 1.7
            else
                scales["Matt Win"] = 1.0
                scales["BF Win"] = 1.0
                scales["Matt Lose"] = 1.0
                scales["BF Lose"] = 1.0
            end
            setActorAlpha(0, "Matt Win")
            setActorAlpha(1, "Matt Lose")
            setActorAlpha(1, "BF Win")
            setActorAlpha(0, "BF Lose")
        end
    end
end
local nose = true
function zoomyx(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,2,3,crochet,"cubeIn")
    elseif curStep == s+4 or curStep == s+12 then
        zoom,blur = 0.85,5
        if nose then
            x = -0.15
        end
    elseif curStep == s+8 then
        zoom,blur = 0.85,5
        if nose then
            x = 0.15
       end
    end
    if curStep == s+12 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == s+16 then
        bloom(6,1,crochet,2,"cubeOut")
        zoom,blur = 0.6,5
    end
end

