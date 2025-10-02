function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
function createBar(name, x, y, width, height, color, layer, alpha)
    makeSprite(name, name, x, y, 1)
    makeGraphic(name, width, height, color)
    actorScreenCenter(name)
    setActorLayer(name, layer)
    setActorY(y, name)
    setObjectCamera(name, 'hud')
    setActorAlpha(alpha, name)
end
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


function createPost()
    startSpeed = getProperty('', 'speed')
    for i = 0, (keyCount * 2) - 1 do 
        table.insert(noteXPos, 0) 
        table.insert(noteYPos, 0)
        table.insert(noteZPos, 0)
        table.insert(noteZScale, 1)
        table.insert(noteAngle, 0)
        table.insert(targetnoteXPos, 0)
        table.insert(targetnoteYPos, 0)
        table.insert(targetnoteZPos, 0)
        table.insert(targetnoteAngle, 0)
        makeSprite('note'..i, '', -11110, 0)
        set('note'..i..'.alpha', 0)
       
        noteXPos[i+1] = getActorX(i)
		targetnoteXPos[i+1] = getActorX(i)
        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
		noteYPos[i+1] = _G['defaultStrum'..i..'Y']
       
    
  
    end
    makeSprite('global', '', -1110, 0)
    makeSprite('player', '', -1110, 0)
    makeSprite('opponent', '', -1110, 0)

    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    createBar('topBar', -1200, -670, 4000, 720, '0xFF000000', layershit, 1)
    createBar('bottomBar', -1200, 670, 4000, 720, '0xFF000000', layershit, 1)

    lascosasdelhud(0,stepCrochet,1,"cubeOut")
    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 0)
    setShaderProperty('vcrchroma', 'speed', 1.2)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)

    initShader('particles', 'particlesnew')--
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.8)
    setShaderProperty('particles', 'red', 1)
    setShaderProperty('particles', 'green', 0)
    setShaderProperty('particles', 'blue', 2)

    initShader('glowBorder', 'glowBorder')--
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'transparency', 0.35)
    setShaderProperty('glowBorder', 'transparency2', 1)


    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(1, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)
    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)

    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 0.45 es rojo 0.7 amarillo 0.95
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.5)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2)
    setShaderProperty('mirror', 'angle',0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0.0)
    
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.1)

   
  
 

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
    setShaderProperty('bloom', 'brightness',0)
    initShader('blur', 'blur')
    setCameraShader('game', 'blur')
    setShaderProperty('blur', 'strengthX', 0)

    initShader("rayos","godrays")
    setCameraShader('game', 'rayos')
    setCameraShader('hud', 'rayos')
    setShaderProperty('rayos', 'decay', 0.8)
    setShaderProperty('rayos', 'density',0.15)
    setShaderProperty('rayos', 'weigth', 0.5)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)
    setProperty('', 'cameraSpeed', 6)
end

function getNoteAlpha(i)
    local pos = getActorAlpha('global') * getActorAlpha('note'..i)
    local playerxd = 'player'
    if i < keyCount then
        playerxd = 'opponent'
    end
    pos = pos * getActorAlpha(playerxd)
    return pos
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

local lerpSpeedScale = 8
local lerpSpeedX = 8
local lerpSpeedY = 5
local lerpSpeedZ = 8
local lerpSpeedAngle = 4
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 5


local time = 0
local zoom = 1
local shaggy = true
local previousZoom = 1
local caWave = 0
local caWaveSpeed = 2
local caWaveRange = 0

local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 1.1 
local perlinXRange = 0.07
local perlinYRange = 0.07
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat("rayos","iTime",time*1.2)
    setCustomShaderFloat("chess","iTime",time/2)
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("vcrchroma","iTime",time)
    setCustomShaderFloat("glowBorder","iTime",time)
    setCustomShaderFloat("speedlines","iTime",time)
    setCustomShaderFloat("glitchy","iTime",time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
   
    setShaderProperty('bump', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('bump', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))

    if shaggy then
        set("camFollow.x", get("dad.x")+250)
        set("camFollow.y", get("dad.y")+400)
        set("defaultCamZoom", 0.8)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+100)
        set("defaultCamZoom", 0.8)
    end
    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
    if math.abs(zoom - previousZoom) > 0.01 then
        triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.012')
    end
    previousZoom = zoom
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    
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
    setShaderProperty("blur","strengthX",10)
	tweenShaderProperty("blur","strengthX",value1,speed*0.001*curStep,ease)
end
function songStart()
    tweenShaderProperty("bars","effect",0,crochet*0.001*4,"cubeOut")
    tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*4,"cubeOut")
    tweenShaderProperty("mirror2","x",2,crochet*0.001*3,"cubeInOut")
    lerpSpeedX = 3
    for i = 0,5 do
        tween("note"..i,{alpha = 1},crochet*0.001*6,"cubeOut")
        noteAngle[i+1] = -360
        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +320
    end
end
function zflechas(s, invert)
    for i = 0,11 do
        if invert then
            noteZPos[i + 1] = targetnoteZPos[i + 1] - s
        else
            noteZPos[i + 1] = targetnoteZPos[i + 1] + s
        end
    end
end

saltosxd = {376,1272}
camara = {440,536,568,1336,1464}
camarabf = {408,536,1304,1432}
function stepHit()
    if curStep >= 0 and curStep < 2112 then
        if curStep % 32 == 6 or curStep % 32 == 12 or curStep % 32 == 20 or curStep % 32 == 24 then
            zflechas(50, false)
            if curStep >= 128 then
                noteScale = noteScale + 0.25
            end
        end
    end
    
    if curStep >= 1152 and curStep < 1408 or curStep >= 1664 and curStep < 1760 or curStep >= 1792 and curStep < 2112 then
        if curStep % 64 == 4 or curStep % 64 == 24 or curStep % 64 == 50 then
            noteScale = noteScale + 0.25
            lerpSpeedX = 8
            for i = 0, 11 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
                
            end
        elseif curStep % 64 == 20 or curStep % 64 == 28 or curStep % 64 == 40 then
            for i = 0, 11 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
            end
            noteScale = noteScale + 0.25
        end
    end
    
    for i = 1, #camara do
        if curStep == camara [i] then
            shaggy = true
            bf = false
            setProperty('', 'cameraSpeed', 7)
        elseif curStep == camara [i]+4 then
            shaggy = false
            bf = true
        elseif curStep == camara [i]+8 then
           shaggy = false
           bf = false
           set("defaultCamZoom", 0.6)

        elseif curStep == camara [i]+12 then
          setProperty('', 'cameraSpeed', 1)
        end
    end

    for i = 1, #camarabf do
        if curStep == camarabf [i] then
            shaggy = false
            bf = true
            setProperty('', 'cameraSpeed', 7)
        elseif curStep == camarabf [i]+4 then
            shaggy = true
            bf = false
        elseif curStep == camarabf [i]+8 then
           shaggy = false
           bf = false
           set("defaultCamZoom", 0.6)
        elseif curStep == camarabf [i]+12 then
            setProperty('', 'cameraSpeed', 1)
        end
    end
    if curStep == 8 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 56 then
        mirror(false,true,"","angle",0,40,2,crochet,"cubeIn")
        mirror(true,true,"x","x",2,0,3,crochet,"cubeInOut")
        for i = 6,11 do
            tween("note"..i,{alpha = 1},crochet*0.001*6,"cubeOut")
            noteAngle[i+1] = 360
            if not middlescroll then
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
            end
        end
        for i = 0,5 do
            tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
            targetnoteZPos[i+1] = -500
        end
    elseif curStep == 64 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bf = true
        shaggy = false
       
    elseif curStep == 116 or curStep == 1204 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeIn")
    elseif curStep == 120 then
        mirror(false,true,"","zoom",0,0,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeInOut")
    elseif curStep == 128 then
        for i = 6,11 do
            noteAngle[i+1] = -360
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
        end
        for i = 0,5 do
            tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
            targetnoteZPos[i+1] = 0
            noteAngle[i+1] = 360
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
            
        end
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(true,true,"zoom","zoom",10,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        shaggy = true
        bf = false
    elseif curStep == 136 then
        mirror(true,true,"x","x",-2,0,2,crochet,"cubeInOut")
    elseif curStep == 144 then
        mirror(true,true,"y","y",2,0,2,crochet,"cubeInOut")
    elseif curStep == 168 then
        mirror(true,true,"x","x",0,-1,2,crochet,"expoIn")
    elseif curStep == 176 then
        mirror(true,true,"y","y",0,-1,1,crochet,"expoIn")
    elseif curStep == 180 then
        mirror(true,true,"x","x",-1,0,1,crochet,"expoIn")
        mirror(true,true,"y","y",1,0,1,crochet,"expoIn")
    elseif curStep == 184 then
        mirror(true,true,"y","y",-2,0,2,crochet,"cubeInOut")
    elseif curStep == 192 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,4,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        bf = false
        shaggy = false
        set("defaultCamZoom", 0.6)
        
    elseif curStep == 224 then
        mirror(false,true,"","zoom",0,2.5,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,4,crochet,"cubeOut")
        zoom = 0.87
    elseif curStep == 240 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*4,"cubeIn")
      --  mirror(false,true,"","zoom",0,1,4,crochet,"cubeIn")
      --  mirror(false,true,"","angle",0,-20,4,crochet,"cubeIn")
    elseif curStep == 246 then
        mirror(false,true,"","x",0,0,0.5,crochet,"expoIn")
    elseif curStep == 248 then
        zoom = 0.87
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
    elseif curStep == 256 then
        lascosasdelhud(1,stepCrochet,16,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.0,crochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 1)
        setProperty('', 'cameraSpeed', 1)
    end
    if curStep == 320 or curStep == 576  or curStep == 1344 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 480 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*6, 'cubeOut')
        mirror(false,true,"","zoom",0,2,6,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,6,crochet,"cubeOut")
    elseif curStep == 496 or curStep == 624 then
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 504 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeOut")
    elseif curStep == 508 or curStep == 636 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 512 or curStep == 640 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")

    elseif curStep == 608 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*6, 'cubeOut')
        mirror(false,true,"","zoom",0,2,6,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,6,crochet,"cubeOut")
    elseif curStep == 632 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")

    elseif curStep == 752 or curStep == 1648 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 760 or curStep == 1656 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 764 or curStep == 1660 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 768 or curStep == 1664 then
        setProperty('', 'cameraSpeed', 6)
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('chess', 'transparency', 0.1)
        shaggy = true
    elseif curStep == 832 or curStep == 1728 then
        shaggy = false
        bf = true
    elseif curStep == 864 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 880 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 888 then
        tweenShaderProperty('mirror2', 'barrel',10, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"x","x",-4,0,4,crochet,"cubeInOut")
        lascosasdelhud(0,stepCrochet,8,"cubeOut")
    elseif curStep == 892 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 896 then
        tweenShaderProperty('mirror2', 'barrel',0, crochet*0.001*1, 'cubeOut')
        bf = false
        set("defaultCamZoom", 0.6)
        setShaderProperty('speedlines', 'transparency', 0)
        caWaveRange = 0.07
    end
    if curStep == 1168 or curStep == 1232 then
   
	   tweenShaderProperty("bloom","contrast",0,crochet*0.001*3,"cubeIn")
    elseif curStep == 1184 or curStep == 1248 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1208 then
        mirror(false,true,"","zoom",0,0,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,360,4,crochet,"cubeInOut")
    elseif curStep == 1216 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(true,true,"zoom","zoom",10,1,2,crochet,"cubeOut")
    end

    if curStep == 1248 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*8,"cubeIn")
      --  tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*6, 'cubeOut')
    elseif curStep == 1280 then
        lascosasdelhud(1,stepCrochet,16,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 1)
    elseif curStep == 1376 or curStep == 1504 then
        mirror(false,true,"","zoom",0,2,6,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,6,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*6, 'cubeOut')
    elseif curStep == 1392 or curStep == 1520 then
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1400 or curStep == 1528 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
    elseif curStep == 1404 or curStep == 1532 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1408 or curStep == 1536 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
        caWaveRange = 0.07
    elseif curStep == 1472 then
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.05)
    end
    if curStep == 1536 then
        caWaveRange = 0
        setShaderProperty('glitchy', 'AMT', 0.0)
    elseif curStep == 1664 then
        caWaveRange = 0.07
        setShaderProperty('glitchy', 'AMT', 0.05)
    elseif curStep == 1760 then
        caWaveRange = 0
        setShaderProperty('glitchy', 'AMT', 0.0)
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 1776 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 1784 then
        tweenShaderProperty('mirror2', 'barrel',10, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"y","y",4,0,4,crochet,"cubeInOut")
        lascosasdelhud(0,stepCrochet,8,"cubeOut")
    elseif curStep == 1788 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1792 then
        tweenShaderProperty('mirror2', 'barrel',0, crochet*0.001*1, 'cubeOut')
        bf = false
        set("defaultCamZoom", 0.6)
        setShaderProperty('speedlines', 'transparency', 0)
        caWaveRange = 0.07
    end
    if curStep == 1920 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 2080 then
        mirror(false,true,"","angle",0,-90,12,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*8, 'cubeIn')
        for i = 0,11 do
            tween("note"..i,{alpha = 0},crochet*0.001*6,"cubeIn")
        end
    elseif curStep == 2096 then
        tweenShaderProperty('bars', 'effect',0.6, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2104 then
    
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeIn")
    end
    
    for i = 1, #saltosxd do
        if curStep == saltosxd [i] then
            tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
            tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*2, 'cubeIn')
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            mirror(true,true,"angle","angle",0,-20,2,crochet,"cubeIn")
        elseif curStep == saltosxd [i]+4 then
           mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        elseif curStep == saltosxd [i]+8 then
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
            tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        end
    end
    if curStep >= 238 and curStep < 246 then
        if curStep % 4 == 0 then
            mirror(false,true,"","x",0,0.15,0.5,crochet,"expoIn")
        elseif curStep % 4 == 2 then
            mirror(false,true,"","x",0,-0.15,0.5,crochet,"expoIn")
            
        end
    end
    if curStep >= 256 and curStep < 769 or curStep >= 1280 and curStep < 1664 then
        if curStep % 64 == 0 or curStep % 64 == 32 or curStep % 64 == 60 then
            zoom = 0.8
            noteScale = noteScale + 0.2
            zflechas(100, true)
        end
    end
    if curStep >= 768 and curStep < 864 or curStep >= 896 and curStep < 1152 
    or curStep >= 1664 and curStep < 1760 or curStep >= 1792 and curStep < 1920
    or  curStep >= 1936 and curStep < 2048 then
        if curStep % 8 == 0  then
            zoom = 0.8
            noteScale = noteScale + 0.2
            zflechas(100, true)
        end
    end
    if curStep >= 896 and curStep < 1152 or curStep >= 1792 and curStep < 1920 or  curStep >= 1936 and curStep < 2048  then
        if curStep % 32 == 0  then
            setShaderProperty('titleeffect', 'money', 0)
            bloom(4,1,crochet,1,"cubeOut")
        elseif curStep % 32 == 8 then
            bloom(4,1,crochet,1,"cubeOut")
            setShaderProperty('titleeffect', 'money', 0.45)
        elseif curStep % 32 == 16 then
            bloom(4,1,crochet,1,"cubeOut")
            setShaderProperty('titleeffect', 'money', 0.7)
        elseif curStep % 32 == 24 then
            bloom(4,1,crochet,1,"cubeOut")
            setShaderProperty('titleeffect', 'money', 0.95)
        end
    end
    if curStep >= 672 and curStep < 865 or curStep >= 1536 and curStep < 1770 then
        if curStep % 32 == 0  then
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    drop2(1824)
    drop(928)
end
function drop(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,3,8,crochet,"expoIn")
        mirror(false,true,"","angle",0,180,8,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*8, 'expoIn')
    elseif curStep == s+32 then
        mirror(false,true,"","angle",0,360,3,crochet,"cubeOut")
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == s+44 then
        setShaderProperty('mirror2', 'x', 0)
        tweenShaderProperty('mirror2', 'x',3, crochet*0.001*3, 'cubeInOut')
    elseif curStep == s+48 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+52 then
        setShaderProperty('mirror2', 'y', 0)
        tweenShaderProperty('mirror2', 'y',-3, crochet*0.001*3, 'quadInOut')
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('mirror2', 'x',2, crochet*0.001*1, 'quadInOut')
    elseif curStep == s+64 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror2', 'y',-2, crochet*0.001*2, 'quadOut')
    elseif curStep == s+88 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"expoOut")
        mirror(true,true,"angle","angle",0,-20,1,crochet,"expoOut")
    elseif curStep == s+92 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,1,crochet,"expoIn")
    elseif curStep == s+96 then --1024
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.05)
    elseif curStep == s+108 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,3,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,1,crochet,"expoIn")
        tweenFadeIn("blackBG",1,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == s+112 then
        for i = 0,7 do
            noteAngle[i+1] = -25
        end
        mirror(false,true,"","angle",0,80,1.5,crochet,"expoIn")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == s+118 then
        
        mirror(false,true,"","angle",0,140,1.5,crochet,"expoIn")
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+120 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*2, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == s+124 then
        for i = 0,7 do
            noteAngle[i+1] = 25
        end
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
        mirror(false,true,"","angle",0,180,1,crochet,"expoIn")
        bloom(4,1,crochet,1,"cubeOut")
       
    elseif curStep == s+128 then
        for i = 0,7 do
            noteAngle[i+1] = -25
        end
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
    elseif curStep == s+152 then -- 1080
        mirror(false,true,"","zoom",0,2,1,crochet,"expoOut")
        mirror(true,true,"angle","angle",0,20,2,crochet,"expoIn")
    elseif curStep == s+156 then--1084
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        setShaderProperty('titleeffect', 'money', 0)
        bloom(4,1,crochet,1,"cubeOut")
        --mirror(true,true,"angle","angle",0,20,1,crochet,"expoIn")
    elseif curStep == s+160 then --1088
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == s+168 then --1096
        mirror(true,true,"x","x",0,1,2,crochet,"expoIn")
    elseif curStep == s+176 then -- 1104
        mirror(false,true,"","y",0,1,2,crochet,"expoIn")
    elseif curStep == s+184 then --1112
        mirror(true,true,"x","x",1,2,1,crochet,"expoIn")
    elseif curStep == s+188 then--1116
        mirror(false,true,"","y",0,-1,1,crochet,"expoIn")
    elseif curStep == s+204 then--1132
        mirror(true,true,"x","x",2,0,3,crochet,"cubeInOut")
    elseif curStep == s+208 then
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == s+212 then
        setShaderProperty('titleeffect', 'money', 0.4)
        bloom(4,1,crochet,1,"cubeOut")
        mirror(false,true,"","y",0,0,1,crochet,"expoIn")
    elseif curStep == s+216 then--1144
    
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
    elseif curStep == s+220 then--1148
        setShaderProperty('titleeffect', 'money', 0)
        bloom(4,1,crochet,1,"cubeOut")
        
      
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+224 then
        setShaderProperty('speedlines', 'transparency', 1)
        setShaderProperty('chess', 'transparency', 0)
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 0)
       setShaderProperty('glitchy', 'AMT', 0)
        bloom(4,1,crochet,1,"cubeOut")
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        caWaveRange = 0
    end
end
function drop2(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,3,8,crochet,"expoIn")
        mirror(false,true,"","angle",0,-180,8,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*8, 'expoIn')
    elseif curStep == s+32 then
        mirror(false,true,"","angle",0,-360,3,crochet,"cubeOut")
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == s+44 then
        setShaderProperty('mirror2', 'x', 0)
        tweenShaderProperty('mirror2', 'x',-3, crochet*0.001*3, 'cubeInOut')
    elseif curStep == s+48 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+52 then
        setShaderProperty('mirror2', 'y', 0)
        tweenShaderProperty('mirror2', 'y',3, crochet*0.001*3, 'quadInOut')
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('mirror2', 'x',-2, crochet*0.001*1, 'quadInOut')
    elseif curStep == s+64 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror2', 'y',2, crochet*0.001*2, 'quadOut')
    elseif curStep == s+88 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"expoOut")
        mirror(true,true,"angle","angle",0,20,1,crochet,"expoOut")
    elseif curStep == s+92 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"expoIn")
    elseif curStep == s+96 then --1024
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0.05)
    elseif curStep == s+108 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,3,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,-40,1,crochet,"expoIn")
        tweenFadeIn("blackBG",1,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == s+112 then
        for i = 0,7 do
            noteAngle[i+1] = -25
        end
        mirror(false,true,"","angle",0,-80,1.5,crochet,"expoIn")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == s+118 then
        
        mirror(false,true,"","angle",0,-140,1.5,crochet,"expoIn")
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+120 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*2, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == s+124 then
        for i = 0,7 do
            noteAngle[i+1] = -25
        end
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
        mirror(false,true,"","angle",0,-180,1,crochet,"expoIn")
        bloom(4,1,crochet,1,"cubeOut")
       
    elseif curStep == s+128 then
        for i = 0,7 do
            noteAngle[i+1] = 25
        end
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        mirror(false,true,"","angle",0,-360,2,crochet,"cubeOut")
    elseif curStep == s+152 then -- 1080
        mirror(false,true,"","zoom",0,2,1,crochet,"expoOut")
        mirror(true,true,"angle","angle",0,-20,2,crochet,"expoIn")
    elseif curStep == s+156 then--1084
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        setShaderProperty('titleeffect', 'money', 0)
        bloom(4,1,crochet,1,"cubeOut")
        --mirror(true,true,"angle","angle",0,20,1,crochet,"expoIn")
    elseif curStep == s+160 then --1088
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == s+168 then --1096
        mirror(true,true,"x","x",0,-1,2,crochet,"expoIn")
    elseif curStep == s+176 then -- 1104
        mirror(false,true,"","y",0,-1,2,crochet,"expoIn")
    elseif curStep == s+184 then --1112
        mirror(true,true,"x","x",-1,-2,1,crochet,"expoIn")
    elseif curStep == s+188 then--1116
        mirror(false,true,"","y",0,1,1,crochet,"expoIn")
    elseif curStep == s+204 then--1132
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
    elseif curStep == s+208 then
        tweenShaderProperty('bars', 'effect',0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == s+212 then
        setShaderProperty('titleeffect', 'money', 0.4)
        bloom(4,1,crochet,1,"cubeOut")
        mirror(false,true,"","y",0,0,1,crochet,"expoIn")
    elseif curStep == s+216 then--1144
    
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
    elseif curStep == s+220 then--1148
        setShaderProperty('titleeffect', 'money', 0)
        bloom(4,1,crochet,1,"cubeOut")
        
      
        mirror(true,true,"x","x",2,0,3,crochet,"cubeInOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+224 then
        setShaderProperty('speedlines', 'transparency', 1)
        setShaderProperty('chess', 'transparency', 0)
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 0)
       setShaderProperty('glitchy', 'AMT', 0)
        bloom(4,1,crochet,1,"cubeOut")
        tweenShaderProperty('bars', 'effect',0, crochet*0.001*4, 'cubeOut')
        caWaveRange = 0
        setProperty('', 'cameraSpeed', 1)
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
		local noteRotPos = getNoteRot(thisnotePosX, thisnotePosY, noteRotX)

		thisnotePosX = noteRotPos[1]
		thisnotePosY = noteRotPos[2]
		local thisnotePosZ = noteRotPos[3]+(noteZPos[i+1]/1000)
	
		noteAngle[i+1] = lerp(noteAngle[i+1], targetnoteAngle[i+1], elapsed*lerpSpeedAngle)
		setActorModAngle(noteAngle[i+1], i)

		local totalNotePos = calculatePerspective(thisnotePosX, thisnotePosY, thisnotePosZ)
		
        setActorAlpha(getNoteAlpha(i), i)
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

			local alpha = getNoteAlpha(data)

			if not isSustain(i) then 
				--setRenderedNoteScale(getRenderedNoteWidth(i)*,getRenderedNoteHeight(i)*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleX(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleY(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteAlpha(alpha,i)
				setRenderedNoteAngle(noteAngle[data+1],i)
			else
				setRenderedNoteAlpha(alpha*0.6,i)
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
		xOffset = xOffset + drunk * (math.sin( ((songPos*0.001) + ((data%keyCount)*0.2) ) * (drunkSpeed*0.2)) * 112*0.5);
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

function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end