local noteXPos = {}
local targetnoteXPos = {}
local noteYPos = {}
local targetnoteYPos = {}
local noteZPos = {}
local noteZScale = {}
local targetnoteZPos = {}
local noteAngle = {}
local targetnoteAngle = {}
local startSpeed = 1
local modcharts = true
local time = 0
local downscroll = 1
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
local stepY = 30 -- Espaciado vertical entre flechas
local startY = -100
function createPost() 
    if downscrollBool then
        downscroll = -1
    end
    lascosasdelhud(0)
    startSpeed = getProperty('', 'speed')

    for i = 0, (keyCount*2)-1 do 
        table.insert(noteXPos, 0) -- Posiciones por defecto
        table.insert(noteYPos, 0)
        table.insert(noteZPos, 0)
        table.insert(noteZScale, 1)
        table.insert(noteAngle, 0)
        table.insert(targetnoteXPos, 0)
        table.insert(targetnoteYPos, 0)
        table.insert(targetnoteZPos, 0)
        table.insert(targetnoteAngle, 0)
  
        noteXPos[i+1] = getActorX(i)
        targetnoteXPos[i+1] = getActorX(i)
        if (i >= 0 and i <= 8) then
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -740
        elseif (i >= 9 and i <= 17) then
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
        end
        local yOffset = i * stepY  
        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
        noteAngle[i+1] = -360
        
        noteYPos[i+1] = startY - yOffset 
    end
    makeCamera("speedlines")
    initShader("speedlines","speedlines")
    makeCamera("vignette")
    makeCamera("nose")
    initShader('static', 'static')
   
    
    setCameraShader('game', 'static')
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green', 1.5)
    setShaderProperty('color', 'blue', 1.5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.2)
    setShaderProperty('mirror', 'angle', -60)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.1)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)

	initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 2)
    setShaderProperty('zoomblurGame', 'focusPower', 3)

    initShader('DistortionEffect', 'DistortionEffect')--
    setCameraShader('game', 'DistortionEffect')
	setShaderProperty('DistortionEffect', 'size', 0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0.5)

    makeSprite('UpperBar', 'UpperBar', 0,-50,1)
    setActorLayer('UpperBar', layershit)
    setObjectCamera('UpperBar', 'nose')
    setActorAlpha(1, "UpperBar")

    makeSprite('LowerBar', 'LowerBar', 0,50,1)
    setActorLayer('LowerBar', layershit)
    setObjectCamera('LowerBar', 'nose')
    setActorAlpha(1, "LowerBar")

    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)
   
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function songStart()

tweenShaderProperty("bloom","contrast",1,crochet*0.001*32,"cubeOut")
tweenShaderProperty("mirror","zoom",1,crochet*0.001*30,"cubeOut")
tweenShaderProperty("mirror","angle",0,crochet*0.001*30,"cubeOut")
tweenShaderProperty("zoomblurGame","focusPower",0,crochet*0.001*30,"cubeOut")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end

local noteScale = 1

function lerp(a, b, ratio)
	return a + ratio * (b - a); --the funny lerp
end
local defaultNoteScale = -1
local lerpX = true
local lerpY = false
local lerpAngle = true
local lerpScale = true

local defaultWidth = -1
local defaultSusWidth = -1
local defaultSusHeight = -1
local defaultSusEndHeight = -1

local notesSeen = {}

local noteRotX = 0
local targetNoteRotX = 0

local lerpSpeedScale = 5
local lerpSpeedX = 1
local lerpSpeedY = 1
local lerpSpeedZ = 4
local lerpSpeedAngle = 1
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0
local dad = false
local bf = false
local time = 0
a,angle,speed,perroxd = 0,1,5,false
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('static', 'iTime', time)
    setCustomShaderFloat('speedlines', 'iTime', time)
    setCustomShaderFloat('DistortionEffect', 'iTime', time)
    zoom = lerp(zoom, 1, elapsed * 8)
    setShaderProperty('barrel', 'zoom', zoom)
    if dad == true then
        set("camFollow.x",1005)
        set("camFollow.y",950)
        set("defaultCamZoom", 0.8)
    elseif dad == false then
        set("defaultCamZoom", 0.6)
    end
    if bf == true then
		set("camFollow.x", get("boyfriend.x")+125)
        set("camFollow.y", get("boyfriend.y")+150)
        set("defaultCamZoom", 0.8)
    elseif bf == false then
        set("defaultCamZoom", 0.6)
    end
     if perroxd then
    a = a + (elapsed / (1 / 120))
    setShaderProperty('barrel', 'angle', math.sin(a / 100 * speed) * angle)
     else 
        setShaderProperty('barrel', 'angle', 0)
    end
end
function partepeak(s)--928
    if curStep == s then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.015', (crochet*0.001*64)..',0')
        tweenFadeIn("blackBG",0.5,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,4,crochet,"backIn")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,4,2,crochet,"quartOut")
    elseif curStep == s+24 then
        mirror(false,true,"","zoom",0,5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
    elseif curStep == s+28 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == s+32 then
        bloom(6,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut")
    end
end
function shaggyybfpeak(n)
    if curStep == n then
        
        mirror(true,true,"zoom","zoom",2,1,1,crochet,"cubeOut")
    elseif curStep == n+16 then
        tweenShaderProperty("mirror2","x",1,crochet*0.001*3,"elasticInOut")
    elseif curStep == n+48+16 then
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*3,"elasticInOut")
    elseif curStep == n+32 or curStep == n+44+32 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*3,"elasticInOut")
    elseif curStep == n+40 then
        mirror(false,true,"","zoom",0,0,2,crochet,"backIn")
    elseif curStep == n+48 then
        mirror(true,true,"zoom","zoom",3,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == n+44+48 then
        tweenShaderProperty("barrel","barrel",4,crochet*0.001*4,"cubeIn")
    end
end
function partepeakbf(s)--992
    if curStep == s then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.015', (crochet*0.001*64)..',0')
        tweenFadeIn("blackBG",0.5,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,4,crochet,"backIn")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,4,2,crochet,"quartOut")
    elseif curStep == s+24 then
        mirror(false,true,"","zoom",0,5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == s+28 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == s+32 then
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end
end
zoombump={120,248,312,440,504,696,888,2424,2616}
local beatSwap = -1
function stepHit()
    shaggyybfpeak(1040)
    shaggyybfpeak(2768)
  
    partepeak(928)
    partepeakbf(992)
        partepeak(2656)
    partepeakbf(2720)
    for i = 1, #zoombump do
        if curStep == zoombump [i] then
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*2,"cubeOut")
        elseif curStep == zoombump [i]+4 then
            mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        elseif curStep == zoombump [i]+8 then
            tweenShaderProperty("EyeFishEffectGame","power",0.1,crochet*0.001*1,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        end
    end
    if curStep >= 128  then
        if curStep % 16 == 0 then
            noteScale = noteScale + 0.5 
        end
        if curStep % 32 == 0 then
            setShaderProperty('barrel', 'barrel', -1)
			tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        end 
	end
    if curStep >= 896 and curStep < 952 or curStep >= 960 and curStep < 1016 or curStep >= 1024 and curStep < 1152
    or curStep >= 2624 and curStep < 2680 or curStep >= 2688 and curStep < 2744 or curStep >= 2752  and curStep < 2880 then
        if curStep % 32 == 0 then
           mirror(true,true,"x","x",0.1,0,2,crochet,"cubeOut")
           mirror(true,true,"angle","angle",15,0,2,crochet,"cubeOut")
        elseif curStep % 32 == 8 then
            mirror(true,true,"x","x",-0.10,0,2,crochet,"cubeOut")
            mirror(true,true,"angle","angle",-15,0,2,crochet,"cubeOut")
        elseif curStep % 32 == 16 then
            mirror(true,true,"x","x",0.10,0,1.5,crochet,"cubeOut")
            mirror(true,true,"angle","angle",15,0,1.5,crochet,"cubeOut")
        elseif curStep % 32 == 22 then
            mirror(true,true,"x","x",-0.10,0,1,crochet,"cubeOut")
            mirror(true,true,"angle","angle",-15,0,1,crochet,"cubeOut")
        elseif curStep % 32 == 28 then
            mirror(true,true,"x","x",0.10,0,1,crochet,"cubeOut")
            mirror(true,true,"angle","angle",15,0,1,crochet,"cubeOut")
        end 
	end
    if curStep >= 896 and curStep < 1152 or curStep >= 2624 and curStep < 2880 then
        if curStep % 8 == 0 then
            setShaderProperty('DistortionEffect', 'size', 0.4)
			tweenShaderProperty("DistortionEffect","size",0,stepCrochet*0.001*5.5,"cubeOut")
        end
        if curStep % 16 == 0 then
            for i = 0,17 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 30
                noteAngle[i+1] = -40
            end
		elseif curStep % 16 == 8 then
            for i = 0,17 do
                noteXPos[i+1] = targetnoteXPos[i+1] + 30
                noteAngle[i+1] = 40
            end
          
		end
	end
    if curStep == 128 then
        lascosasdelhud(1)
        setShaderProperty('greyscale', 'strength', 0)
        lerpSpeedX = 3
        lerpSpeedAngle = 5
        for i = 0,17 do
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
            noteAngle[i+1] = 360
        end
    elseif curStep == 144 or curStep == 208 or curStep == 736 then
        mirror(false,true,"","x",0,1,1,crochet,"cubeOut")
    elseif curStep == 160 or curStep == 224 or curStep == 752 then
        mirror(false,true,"","x",0,0,1,crochet,"cubeOut")
    elseif curStep == 168 or curStep == 368 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeOut")
    elseif curStep == 176 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
    elseif curStep == 180 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,4,1,crochet,"cubeOut")
    elseif curStep == 184 then
        mirror(false,true,"","angle",0,360,2,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",4,crochet*0.001*4,"cubeInOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 188 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 192 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end
    if curStep == 272 then
        mirror(false,true,"","y",0,1,1,crochet,"cubeOut")
    elseif curStep == 280 then
        mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
    elseif curStep == 336 then
        mirror(false,true,"","x",0,3,1,crochet,"cubeOut")
    elseif curStep == 352 then
        mirror(false,true,"","angle",0,360,2,crochet,"cubeIn")
    elseif curStep == 360 then
        mirror(false,true,"","y",0,2,2,crochet,"cubeOut")
    elseif curStep == 376 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
        tweenShaderProperty("mirror2","x",0,crochet*0.001*4,"cubeInOut")
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 384 then
        flashCamera("hud","white",0.6)
        mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
    end
    if curStep == 400 or curStep == 464 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
    elseif curStep == 416 or curStep == 488 or curStep == 560 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(true,true,"x","x",0.15,0,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",15,0,2,crochet,"cubeOut")
    elseif curStep == 424 or curStep == 480 or curStep == 568 or curStep == 760 then
        mirror(true,true,"x","x",-0.15,0,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-15,0,1,crochet,"cubeOut")
    elseif curStep == 432 or curStep == 440 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        mirror(true,true,"x","x",-2,0,1,crochet,"cubeOut")
    elseif curStep == 436 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        mirror(true,true,"x","x",-2,0,1,crochet,"cubeOut")
    elseif curStep == 448 or curStep == 508 or curStep == 700 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        setShaderProperty("mirror2","y",-2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*3,"cubeInOut")
    elseif curStep == 496 or curStep == 688 then
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeOut")
        mirror(true,true,"x","x",2,0,2,crochet,"cubeOut")
    elseif curStep == 504 or curStep == 696 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        mirror(true,true,"x","x",2,0,1,crochet,"cubeOut")
    end
    if curStep == 608 then
        mirror(false,true,"","zoom",0,0.2,8,crochet,"backIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*8,"cubeIn")
        tweenShaderProperty("barrel","barrel",8,crochet*0.001*8,"cubeIn")
        tweenFadeIn("blackBG",0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 640 or curStep == 2368 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0.3,crochet*0.001*2,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenFadeIn("blackBG",0.25,crochet*0.001*1,"cubeOut")
    elseif curStep == 768 or curStep == 2496 then
        mirror(false,true,"","zoom",0,2.5,16,crochet,"cubeOut")
    elseif curStep == 832 or curStep == 2560 then
        mirror(false,true,"","angle",0,-90,4,crochet,"cubeIn")
    elseif curStep == 840 or curStep == 2568 then
        setShaderProperty("mirror2","x",-2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*4,"cubeInOut")
    elseif curStep == 848 or curStep == 2576 then
        mirror(false,true,"","angle",0,90,4,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,12,crochet,"cubeIn")
    elseif curStep == 856 or curStep == 2584 then
        setShaderProperty("mirror2","x",2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*4,"cubeInOut")
    elseif curStep == 864 or curStep == 2592 then
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
    elseif curStep == 896 or curStep == 2624 then
        flashCamera("hud","white",0.6)
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('toggle checker bg','0.1',crochet*0.001*1)
    end

    if curStep == 896 or curStep == 2624 then
        tweenShaderProperty("mirror2","x",-0.3,crochet*0.001*2,"cubeInOut")
    elseif curStep == 960 or curStep == 2688 then
        bf = true
        tweenShaderProperty("mirror2","x",0,crochet*0.001*2,"cubeInOut")
    elseif curStep == 1024 or curStep == 2752 then
        bf = false
    end

   if curStep == 1152 or curStep == 2880 then -- drop
        flashCamera("hud","white",0.8)
        perroxd = true
    elseif curStep == 1208 or curStep == 1464 or curStep == 2936 or curStep == 3192 then
        mirror(true,true,"x","x",0,2,3,crochet,"cubeInOut")
    elseif curStep == 1216 or curStep == 1224 or curStep == 1472 or curStep == 1480 or curStep == 2944 or curStep == 2952 or curStep == 3200 or curStep == 3208 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 1220 or curStep == 1228 or curStep == 1476 or curStep == 1484 or curStep == 2948 or curStep == 2956 or curStep == 3204 or curStep == 3212 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    end

    if curStep == 1216 or curStep == 1472 or curStep == 2944 or curStep == 3200 then
        mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
    elseif curStep == 1224 or curStep == 1480 or curStep == 2952 or curStep == 3208 then
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
    elseif curStep == 1232 or curStep == 1488 or curStep == 2960 or curStep == 3216 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,360,4,crochet,"cubeOut")
    elseif curStep == 1240 or curStep == 1496 or curStep == 2968 or curStep == 3224 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == 1392 or curStep == 1648 or curStep == 3120 or curStep == 3376 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,15,2,crochet,"cubeOut")
    elseif curStep == 1400 or curStep == 1656 or curStep == 3128 or curStep == 3384 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeIn")
    elseif curStep == 1408 or curStep == 1664 or curStep == 3136 or curStep == 3392 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end

    if curStep == 1664 or curStep == 3904  then
        flashCamera("hud","white",0.8)
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeOut")
        perroxd = false
    elseif curStep == 1712  then
        tweenShaderProperty("greyscale","strength",0,crochet*0.004,"cubeIn")
        tweenShaderProperty("barrel","barrel",2,crochet*0.001*2,"cubeOut")
    elseif curStep == 1720  then
        tweenShaderProperty("barrel","barrel",-2,crochet*0.001*2,"cubeIn")
    elseif curStep == 1728  then
        flashCamera("hud","white",0.8)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 4160 then
                flashCamera("hud","white",0.8)
        tweenShaderProperty("bloom","contrast",0,crochet*0.001*16,"")
    end
    

    if curStep >= 1152 and curStep < 1664  or curStep >= 2880  and curStep < 3904 then
        if curStep % 8 == 0 then
            zoom = 0.8
        end
    end
end
function updatePost(elapsed)
	if not modcharts then 
		return
	end
	if lerpScale then 
		noteScale = lerp(noteScale, 1, elapsed*lerpSpeedScale)
	end
	noteRotX = lerp(noteRotX, targetNoteRotX, elapsed*lerpSpeednoteRotX)

	drunk = lerp(drunk, drunkLerp, elapsed*5)

	local currentBeat = (songPos / 1000)*(bpm/60)

	for i = 0,(keyCount*2)-1 do 
		noteXPos[i+1] = lerp(noteXPos[i+1], targetnoteXPos[i+1], elapsed*lerpSpeedX)
		noteYPos[i+1] = lerp(noteYPos[i+1], targetnoteYPos[i+1], elapsed*lerpSpeedY)
		noteZPos[i+1] = lerp(noteZPos[i+1], targetnoteZPos[i+1], elapsed*lerpSpeedZ)

		local thisnotePosX = noteXPos[i+1] + getXOffset(i, 0)
		local thisnotePosY = noteYPos[i+1]
		local noteRotPos = getNoteRot(thisnotePosX, thisnotePosY,noteRotX)

		thisnotePosX = noteRotPos[1]
		thisnotePosY = noteRotPos[2]
		local thisnotePosZ = noteRotPos[3]+(noteZPos[i+1]/1000)
		--local thisnotePosX = noteXPos[i+1]
		--local thisnotePosY = noteYPos[i+1]
		--local thisnotePosZ = (noteZPos[i+1]/1000)-1

		noteAngle[i+1] = lerp(noteAngle[i+1], targetnoteAngle[i+1], elapsed*lerpSpeedAngle)
		setActorModAngle(noteAngle[i+1], i)

		local totalNotePos = calculatePerspective(thisnotePosX, thisnotePosY, thisnotePosZ)
		
		--setActorX(noteXPos[i+1], i)
		--setActorY(noteYPos[i+1], i)
		setActorX(totalNotePos[1], i)
		setActorY(totalNotePos[2], i)
		
		noteZScale[i+1] = totalNotePos[3]
		setActorScaleXY(noteScale * (1/-noteZScale[i+1]), noteScale * (1/-noteZScale[i+1]), i)
		if getPlayingActorAnimation(i) == 'confirm' then 
			setActorScaleXY(noteScale*1.45 * (1/-noteZScale[i+1]), noteScale*1.45 * (1/-noteZScale[i+1]), i) --confirm is weird ig
		end
		
	end
    local songSpeed = getProperty('', 'speed')
	local noteCount = getRenderedNotes()
	if noteCount>0 then 
		for i = 0, noteCount-1 do 
			local data = getRenderedNoteType(i)
			if getRenderedNoteHit(i) then 
				data = data + keyCount --player notes
			end
			if defaultWidth == -1 then 
				defaultWidth = getRenderedNoteWidth(i)
			end
			if defaultNoteScale == -1 then 
				defaultNoteScale = getRenderedNoteScaleX(i)
			end
			local offsetX = getRenderedNoteOffsetX(i)
			local strumTime = getRenderedNoteStrumtime(i)
			if downscrollBool then 
				if isRenderedNoteSustainEnd(i) then 
					strumTime = getRenderedNotePrevNoteStrumtime(i)
				end
			end
			
			local curPos = ((songPos-strumTime)*songSpeed)
			offsetX = offsetX + getXOffset(data, curPos)
			local thisnoteYPos = noteYPos[data+1]
			if downscrollBool then 
				thisnoteYPos = thisnoteYPos + (0.45*curPos) - (getRenderedNoteOffsetY(i))
				if isRenderedNoteSustainEnd(i) then 
					thisnoteYPos = thisnoteYPos - (getRenderedNoteHeight(i))+2
				end
			else 
				thisnoteYPos = thisnoteYPos - (0.45*curPos) - (getRenderedNoteOffsetY(i))
			end
			local thisnoteXPos = noteXPos[data+1]+offsetX
			
			local noteRotPos = getNoteRot(thisnoteXPos, thisnoteYPos, noteRotX)
	
			thisnoteXPos = noteRotPos[1]
			thisnoteYPos = noteRotPos[2]
			local thisnotePosZ = noteRotPos[3]+(noteZPos[data+1]/1000)
			local totalNotePos = calculatePerspective(thisnoteXPos, thisnoteYPos, thisnotePosZ)

			if not isSustain(i) then 
				--setRenderedNoteScale(getRenderedNoteWidth(i)*,getRenderedNoteHeight(i)*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleX(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleY(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteAlpha(1,i)
				setRenderedNoteAngle(noteAngle[data+1],i)
			else
				--offsetX = 37 * (1/-totalNotePos[3]) * (defaultWidth/112)
				setRenderedNoteAlpha(0.6,i)
				if defaultSusWidth == -1 then 
					defaultSusWidth = getRenderedNoteWidth(i)
				end

				if isRenderedNoteSustainEnd(i) then --sustain ends
					if defaultSusEndHeight == -1 then 
						defaultSusEndHeight = getRenderedNoteScaleY(i)
					end
					
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusEndHeight* (1/-totalNotePos[3]), i)
				else 
                    if defaultSusHeight == -1 then 
                        defaultSusHeight = getRenderedNoteScaleY(i)
                    end
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusHeight* (1/-totalNotePos[3])* (songSpeed/startSpeed), i)
				end

				setRenderedNoteAngle(0,i)

				
				--susOffset = 37*noteScale
			end
			
			setRenderedNotePos(totalNotePos[1],totalNotePos[2], i)
		end
	end

end

function getXOffset(data, curPos)

	local xOffset = 0
	if drunk ~= 0 then 
		xOffset = xOffset + drunk * (math.cos( ((songPos*0.001) + ((data%keyCount)*0.2) ) * (drunkSpeed*0.2)) * 112*0.5);
	end

	return xOffset
end

function getSustainAngle(i)

	local data = getRenderedNoteType(i)
	local mustPress = getRenderedNoteHit(i)
	if mustPress then 
		data = data + keyCount --player notes
	end

	local noteYPos = ((songPos-getRenderedNoteStrumtime(i))*songSpeed)
	local nextYPos = noteYPos + stepCrochet

	local noteOffsetX = getXOffset(data, noteYPos)
	local nextOffsetX = getXOffset(data, nextYPos)

	local thisNoteX = getRenderedNoteCalcX(i)+noteOffsetX
	local nextNoteX = getRenderedNoteCalcX(i)+nextOffsetX

	local thisNoteY = getRenderedNoteY(i)
	

	local ang = 0
	if downscrollBool then 
		local nextNoteY = getRenderedNoteY(i) + (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) - (math.pi/2))
		--debugPrint(ang)
	else 
		local nextNoteY = getRenderedNoteY(i) - (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) + (math.pi/2))
	end
	return ang
end

--the funny perspective math

local zNear = 0
local zFar = 1000
local zRange = zNear - zFar 
local tanHalfFOV = math.tan(math.pi/4) -- math.pi/2 = 90 deg, then half again

function calculatePerspective(x,y,z)

	if (z >= 1) then
		z = 1 --stop weird shit
	end

	x = x - (1280/2) + (defaultWidth/2)
	y = y - (720/2) + (defaultWidth/2)

	local zPerspectiveOffset = (z+(2 * zFar * zNear / zRange));

	local xPerspective = x*(1/tanHalfFOV);
	local yPerspective = y/(1/tanHalfFOV);
	xPerspective = xPerspective/-zPerspectiveOffset;
	yPerspective = yPerspective/-zPerspectiveOffset;

	xPerspective = xPerspective + (1280/2) - (defaultWidth/2)
	yPerspective = yPerspective + (720/2) - (defaultWidth/2)

	return {xPerspective,yPerspective,zPerspectiveOffset}
end
local rad = math.pi/180;
function getNoteRot(XPos, YPos, rotX)
	local x = 0
	local y = 0
	local z = -1

	--fucking math
	local strumRotX = getCartesianCoords3D(rotX,90, XPos-(1280/2))
	x = strumRotX[1]+(1280/2)
	local strumRotY = getCartesianCoords3D(90,0, YPos-(720/2))
	y = strumRotY[2]+(720/2)
	--notePosY = _G['default'..strum..'Y'..i%keyCount]+strumRot[2]
	z = z + strumRotX[3] + strumRotY[3]
	return {x,y,z}
end
--the funny spherical to cartesian for 3d angles
function getCartesianCoords3D(theta, phi, radius)

	local x = 0
	local y = 0
	local z = 0

	x = math.cos(theta*rad)*math.sin(phi*rad);
	y = math.cos(phi*rad);
	z = math.sin(theta*rad)*math.sin(phi*rad);
	x = x*radius;
	y = y*radius;
	z = z*radius;

	return {x,y,z/1000}
end

--https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end