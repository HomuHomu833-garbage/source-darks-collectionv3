function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    --tween("infoTxt",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
  --  tween("timeBarBG",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
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
local stepY = 500 -- Espaciado vertical entre flechas
local startYBottom = 2000 -- Posición inicial para las flechas de abajo
local startYTop = -1000 -- Posición inicial para las flechas de arriba
local centerY = 250
local downscroll = 1
function createPost()
    lascosasdelhud(0,crochet,2,"cubeOut")
    startSpeed = getProperty('', 'speed')
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)
    if downscrollBool then
        downscroll = -1
    end
    for i = 0, (keyCount * 2) - 1 do 
        table.insert(noteXPos, 0) -- Posiciones por defecto
        table.insert(noteYPos, 0)
        table.insert(noteZPos, 0)
        table.insert(noteZScale, 1)
        table.insert(noteAngle, 0)
        table.insert(targetnoteXPos, 0)
        table.insert(targetnoteYPos, 0)
        table.insert(targetnoteZPos, 0)
        table.insert(targetnoteAngle, 0)
        makeSprite('note'..i, '', -11110, 0)
        
        noteXPos[i+1] = getActorX(i)
		targetnoteXPos[i+1] = getActorX(i)

        local startY = 0
        local targetY = centerY

        if i >= 0 and i <= 3 then
            startY = startYBottom + (i % 4) * stepY
        elseif i >= 4 and i <= 7 then
            startY = startYTop - ((i - 4) % 4) * stepY
        end

        noteYPos[i+1] = startY
        targetnoteYPos[i+1] = targetY
  
        if not middlescroll then
            if (i >= 0 and i <= 3) then
               targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +320
            elseif (i >= 4 and i <= 7) then
                targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
            end
        end
    end
    makeSprite('global', '', -1110, 0)
    makeSprite('player', '', -1110, 0)
    makeSprite('opponent', '', -1110, 0)
    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    initShader("vcrchroma","vcrchroma")
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 1)
    setShaderProperty('vcrchroma', 'speed', 1.2)
    initShader('WiggleEffect', 'WiggleEffect')
    setCameraShader('game', 'WiggleEffect')
    setShaderProperty('WiggleEffect', 'uWaveAmplitude', 0.0057)
    setShaderProperty('WiggleEffect', 'uSpeed', 10)
    setShaderProperty('WiggleEffect', 'uFrequency', 7)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)

    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 0)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 0.5)


    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2)
    setShaderProperty('mirror', 'angle', -40)
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

    initShader('mirror3', 'PincushNewEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)


    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)
    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
   
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.1)
    


    makeSprite('uno', 'uno', -3000, 150, 1)
	setObjectCamera('uno', 'hud')
	makeSprite('dos', 'dos', 3000, 150, 1)
	setObjectCamera('dos', 'hud')
	makeSprite('tres', 'tres', -3000, 150, 1)
	setObjectCamera('tres', 'hud')
	makeSprite('cuatro', 'cuatro', 300, 1150, 1)
	setObjectCamera('cuatro', 'hud')

    setActorLayer('filter', layershit)
    makeAnimatedSprite('filter', 'filter', 0,0)
    addActorAnimation('filter', 'filter', 'pantalla', 24, true)
    playActorAnimation('filter', 'filter', true)
    setActorScale(1, 'filter')
    actorScreenCenter('filter')
    setObjectCamera("filter", 'hud')
    setActorLayer('filter', layershit)

    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue',1.5)


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

local lerpSpeedScale = 5
local lerpSpeedX = 0.75
local lerpSpeedY = 0.65
local lerpSpeedZ = 0.75
local lerpSpeedAngle = 1
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 5

function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
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
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*16,"cubeIn")
    tweenShaderProperty("mirror","zoom",1,crochet*0.001*36,"cubeOut")
    tweenShaderProperty("mirror","angle",0,crochet*0.001*36,"cubeOut")
    tweenShaderProperty("bars","effect",0,crochet*0.001*32,"cubeOut")
end

local time = 0
local matt = true
local bf = false
local cam = false
local xd = true
local nose = true
local qlolxd = true
local caWave = 0
local caWaveSpeed = 3
local caWaveRange = 0
local serpientelocuraY = false
local serpientelol = 1.5 --altura
local serpientexd = 2.5 --velocidad
local angle = 0
function update(elapsed)
    angle = lerp(angle, 0, math.min(1, elapsed*10 ))
    setShaderProperty('mirror3', 'angle', angle)
    time = time + elapsed

    setCustomShaderFloat('WiggleEffect', 'uTime', time)
    setCustomShaderFloat('vcrchroma', 'iTime', time)
    setCustomShaderFloat('speedlines', 'iTime', time)
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    if matt then
        set("camFollow.x", get("dad.x")+300)
        set("camFollow.y", get("dad.y")+250)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+70)
    end
    if cam then
        set("camFollow.x",1700)
        set("camFollow.y",950)
    end
    local currentBeat = (songPos / 1000) * (bpm / 60) 
    if serpientelocuraY then
        for i = 0, (keyCount * 2) - 1 do
            noteYPos[i + 1] = noteYPos[i + 1] + (serpientelol * math.sin(currentBeat * serpientexd + i)) --buenserpientexdxdxd
        end
    end
end
function bumpzoom(s,w)
    setShaderProperty('bump', 'zoom', w)
    tweenShaderProperty('bump', 'zoom', 1,stepCrochet*0.001*s,"cubeOut")
    triggerEvent('screen shake', (stepCrochet*0.001*s)..',0.01')
end
local saltos = {136,504,952,1656}
local saltosotro = {248}
local saltossinbars = {312,1080}
local saltossinbarsotro = {632,888,1784}
function stepHit()
    for i = 1, #saltos do
        if curStep == saltos [i] then
            tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
            tweenShaderProperty("mirror2","angle",20,crochet*0.001*1,"quadOut")
            tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"expoIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        elseif curStep == saltos [i]+4 then
            tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
            tweenShaderProperty("mirror2","angle",-20,crochet*0.001*1,"cubeIn")
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        elseif curStep == saltos [i]+8 then
            tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
            tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #saltosotro do
        if curStep == saltosotro [i] then
            tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
            tweenShaderProperty("mirror2","angle",-20,crochet*0.001*1,"quadOut")
            tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"expoIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        elseif curStep == saltosotro [i]+4 then
            tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
            tweenShaderProperty("mirror2","angle",20,crochet*0.001*1,"cubeIn")
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        elseif curStep == saltosotro [i]+8 then
            tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
            tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #saltossinbars do
        if curStep == saltossinbars [i] then
            tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
            tweenShaderProperty("mirror2","angle",-20,crochet*0.001*2,"cubeIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        elseif curStep == saltossinbars [i]+4 then
            tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
        elseif curStep == saltossinbars [i]+8 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #saltossinbarsotro do
        if curStep == saltossinbarsotro [i] then
            tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
            tweenShaderProperty("mirror2","angle",20,crochet*0.001*2,"cubeIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        elseif curStep == saltossinbarsotro [i]+4 then
            tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
        elseif curStep == saltossinbarsotro [i]+8 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    if curStep >= 112 and curStep <= 124 and curStep % 4 == 0 then
        lerpSpeedY = 8
        lerpSpeedAngle = 5
        local stepIndex = math.floor((curStep - 112) / 4) % 4 
        local pairs = {
            [0] = {0, 4}, 
            [1] = {1, 5}, 
            [2] = {2, 6}, 
            [3] = {3, 7},
        }
        local pair = pairs[stepIndex]
        for _, i in ipairs(pair) do
            targetnoteYPos[i + 1] = _G['defaultStrum' .. i .. 'Y']
            noteAngle[i + 1] = (i % 2 == 0) and 360 or -360
        end
    end
    if curStep == 1916 then
        tween("tres",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("cuatro",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 1920 then
        tween("cuatro",{x=2000},crochet*0.001*1,"cubeInOut")
         serpientelocuraY = true
         drunkLerp = 2
    end
    if curStep == 112 or curStep == 1904 then
        tween("uno",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 116 or curStep == 1908 then
        tween("uno",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("dos",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 120 or curStep == 1912 then
        tween("dos",{x=2000},crochet*0.001*1,"cubeInOut")
        tween("tres",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 124 then
        tween("tres",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("cuatro",{y=150},crochet*0.001*1,"quartOut")
    elseif curStep == 128 then
        setShaderProperty("greyscale","strength",0)
        tween("cuatro",{y=2000},crochet*0.001*1,"cubeInOut")
        bloom(4,1,crochet,2,"cubeOut")
        setActorAlpha(0, "filter")
        for i = 0,7 do
            noteAngle[i + 1] = (i % 4 == 0) and 360 or -360
        end
    elseif curStep == 136 then
        tween("cuatro", {x = 2000, y = 150},crochet*0.001*1,"cubeInOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 144 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        lascosasdelhud(1,crochet,2,"cubeOut")
        set("defaultCamZoom", 0.6)
        lerpSpeedX = 4
        lerpSpeedAngle = 3
        noteScale = noteScale + 0.4
        for i = 0, 7 do
            targetnoteXPos[i + 1] = _G['defaultStrum' .. i .. 'X']
            if i <= 3 then
                noteAngle[i + 1] = -25 
            else
                noteAngle[i + 1] = 25 
            end
        end
    elseif curStep == 156 then
        mirror(false,true,"","x",0,-1,1,crochet,"expoIn")
    elseif curStep == 172 then
        mirror(false,true,"","y",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 174 then
        mirror(false,true,"","y",0,-1,0.5,crochet,"expoIn")
    elseif curStep == 184 then
        mirror(false,true,"","angle",0,180,2,crochet,"expoIn")
    elseif curStep == 192 or curStep == 448 then
        bloom(4,1,crochet,2,"cubeOut")
        triggerEvent('Change Camera Speed', '4')
        bf = true
        matt = false
    elseif curStep == 204 then
        mirror(false,true,"","x",0,-2,1,crochet,"expoIn")
    elseif curStep == 224 then
        mirror(false,true,"","x",0,-3,2,crochet,"expoIn")
        mirror(false,true,"","y",0,0,2,crochet,"expoIn")
    elseif curStep == 236 then
        mirror(false,true,"","x",0,-4,1,crochet,"expoIn")
    elseif curStep == 240 then
        mirror(false,true,"","angle",0,360,1.5,crochet,"cubeInOut")
    elseif curStep == 256 then
        bf = false
    elseif curStep == 276 then
        mirror(false,true,"","x",0,-3,1,crochet,"expoOut")
    elseif curStep == 280 then
        mirror(false,true,"","y",0,1,1,crochet,"expoOut")
    elseif curStep == 340 then
        mirror(false,true,"","y",0,2,1,crochet,"expoOut")
    elseif curStep == 344 then
        tweenShaderProperty("mirror3","x",-1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
        tweenShaderProperty("mirror2","angle",20,crochet*0.001*1,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 348 then
        tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("mirror2","angle",-20,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 352 then
        tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 376 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"expoIn")
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(true,true,"angle","angle",-360,0,3.5,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 384 then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        qlolxd = false
        matt = true
    elseif curStep == 440 then
        mirror(false,true,"","x",0,-4,2,crochet,"expoIn")
    elseif curStep == 472 then
        mirror(false,true,"","y",0,3,2,crochet,"expoIn")
    elseif curStep == 496 then
        mirror(false,true,"","x",0,-5,2,crochet,"cubeIn")
        mirror(false,true,"","y",0,4,2,crochet,"cubeIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    end
    if curStep == 512 then
        qlolxd = true
        lerpSpeedAngle = 5
        lerpSpeedX = 4
        lerpSpeedZ = 4
        for i = 0,7 do
            noteAngle[i+1] = 360
            if (i >= 0 and i <= 3) then
               tween("note"..i,{alpha = 0.3},stepCrochet*0.001*16,"cubeOut")
            end
            if not middlescroll then
                set("ratingsGroup.x",-240)
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 240
                    targetnoteZPos[i+1] = -500
                elseif (i >= 4 and i <= 7) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    targetnoteZPos[i+1] = 0
                end
            end
        end
        setShaderProperty('speedlines', 'transparency', 0)
        bf = false
    elseif curStep == 568 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(true,true,"angle","angle",360,0,3.5,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 572 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
   elseif curStep == 576 then
        xd = false
        triggerEvent('flip echo direction','doubleshield','')
    elseif curStep == 632 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"expoIn")
        triggerEvent('toggle checker bg','0.1',crochet*0.001*2)
    elseif curStep == 640 then
        set("ratingsGroup.x",0)
        for i = 0,7 do
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
            tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
            targetnoteZPos[i+1] = 0
        end
        caWaveRange = 0.08
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        matt = false
        bf = false
        triggerEvent('Change Camera Speed', '1')
    elseif curStep == 688-16 then
        mirror(false,true,"","y",0,3,1,crochet,"cubeIn")
    elseif curStep == 700 then
        mirror(false,true,"","x",0,-3,3,crochet,"cubeInOut")
        triggerEvent('flip echo direction','doubleshield','')
    elseif curStep == 724 then
        mirror(false,true,"","x",0,-4,1,crochet,"cubeIn")
    elseif curStep == 748 then
        mirror(false,true,"","y",0,2,1,crochet,"cubeIn")
    elseif curStep == 752 then
        tweenShaderProperty("mirror3","x",-2,crochet*0.001*2,"cubeInOut")
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 764 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 768 then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        caWaveRange = 0
        setShaderProperty('speedlines', 'transparency', 1)
    elseif curStep == 800 then
        mirror(true,true,"y","y",-2,0,2,crochet,"cubeOut")
    elseif curStep == 804 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 856 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeIn")
    elseif curStep == 868 then
        mirror(true,true,"y","y",2,0,2.5,crochet,"cubeInOut")
    elseif curStep == 880 then
        mirror(false,true,"","x",0,2,2,crochet,"cubeInOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 888 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 896 then
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        caWaveRange = 0.08
        for i = 0,7 do
            noteAngle[i+1] = 360
            if (i >= 0 and i <= 3) then
               tween("note"..i,{alpha = 0.3},stepCrochet*0.001*16,"cubeOut")
            end
            if not middlescroll then
                set("ratingsGroup.x",-240)
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                    targetnoteZPos[i+1] = -500
                elseif (i >= 4 and i <= 7) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    targetnoteZPos[i+1] = 0
                end
            end
        end
    end
    if curStep == 920 then
        mirror(false,true,"","x",0,3,2,crochet,"cubeIn")
        mirror(false,true,"","y",0,-1,2,crochet,"cubeIn")
    elseif curStep == 940 or curStep == 1004 then
        mirror(false,true,"","y",0,0,1,crochet,"expoIn")
    elseif curStep == 944 then
        mirror(false,true,"","x",0,0,2,crochet,"cubeInOut")
    elseif curStep == 976 then
        mirror(false,true,"","x",0,-1,1,crochet,"expoIn")
    elseif curStep == 984 then
        mirror(false,true,"","y",0,-1,1,crochet,"expoIn")
    elseif curStep == 1000 then
        mirror(false,true,"","x",0,-2,1,crochet,"expoIn")
    elseif curStep == 1008 then
        tweenShaderProperty("mirror2","x",10,crochet*0.001*5,"cubeInOut")
       -- mirror(true,true,"x","x",-10,0,5,crochet,"cubeInOut")
    elseif curStep == 1016 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 1020  then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1024 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",1800,0,5,crochet,"cubeInOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenFadeIn("blackBG",0.5,crochet*0.001*2,"cubeIn")
    end
    if curStep == 1030 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 1034 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1038 or curStep == 1152 or curStep == 1408 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 1080 or curStep == 1784 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 1088 or curStep == 1792 then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 1116 then
        mirror(false,true,"","x",0,-3,1,crochet,"expoIn")
        mirror(false,true,"","y",0,1,1,crochet,"expoIn")
    elseif curStep == 1128 then
        mirror(false,true,"","x",0,-4,1,crochet,"expoIn")
        mirror(false,true,"","y",0,0,1,crochet,"expoIn")
    elseif curStep == 1132 then
        mirror(true,true,"angle","angle",-1800,0,5,crochet,"cubeInOut")
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
    elseif curStep == 1136 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*3,"cubeIn")
        setShaderProperty('speedlines', 'transparency', 1)
        caWaveRange = 0
    elseif curStep == 1144 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"quadOut")
    elseif curStep == 1148 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    end
    if curStep == 1166 or curStep == 1200 or curStep == 1230 or curStep == 1236 or curStep == 1294 
    or curStep == 1312 or curStep == 1390 then 
        mirror(true,true,"x","x",-0.15,0,1,crochet,"cubeOut")
        for i = 0,7 do
            noteXPos[i+1] = targetnoteXPos[i+1] + 50
        end
    elseif curStep == 1196 or curStep == 1204 or curStep == 1262 or curStep == 1298 or curStep == 1320
    or curStep == 1358 then
        for i = 0,7 do
            noteXPos[i+1] = targetnoteXPos[i+1] - 50
        end
        mirror(true,true,"x","x",0.15,0,1,crochet,"cubeOut")
    elseif curStep == 1170 or curStep == 1234 or curStep == 1268 or curStep == 1316 or curStep == 1326 
    or curStep == 1362 or curStep == 1396 then
        for i = 0,7 do
            noteXPos[i+1] = targetnoteXPos[i+1] - 50
        end
        mirror(true,true,"x","x",0.15,0,0.5,crochet,"cubeOut")
    elseif curStep == 1172 or curStep == 1230 or curStep == 1266 or curStep == 1300 or curStep == 1318 
    or curStep == 1324 or curStep == 1364 or curStep == 1394 then
        mirror(true,true,"x","x",-0.15,0,0.5,crochet,"cubeOut")
        for i = 0,7 do
            noteXPos[i+1] = targetnoteXPos[i+1] + 50
        end
    end
    if curStep >= 1328 and curStep <= 1336 then
        noteScale = noteScale + 0.2
        if curStep % 2 == 0 then
            for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] + 50
            end
            mirror(true,true,"x","x",-0.15,0,1,stepCrochet,"cubeOut")
        end
        if curStep % 2 == 1 then
            for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 50
            end
            mirror(true,true,"x","x",0.15,0,1,stepCrochet,"cubeOut")
        end
    end
    if curStep >= 1336 and curStep <= 1344 then
        if curStep % 4 == 0 then
            noteScale = noteScale + 0.2
            for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] + 50
            end
            mirror(true,true,"x","x",-0.15,0,2,stepCrochet,"cubeOut")
            bumpzoom(2,0.87)
        end
        if curStep % 4 == 2 then
            noteScale = noteScale + 0.2
            for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 50
            end
            mirror(true,true,"x","x",0.15,0,2,stepCrochet,"cubeOut")
            bumpzoom(2,0.87)
        end
    end
    if curStep == 1152 then
        set("ratingsGroup.x",0)
        for i = 0, 7 do
            tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
            targetnoteXPos[i + 1] = _G['defaultStrum' .. i .. 'X']
            targetnoteZPos[i + 1] = 0
            if i <= 3 then
                noteAngle[i + 1] = -25 
            else
                noteAngle[i + 1] = 25 
            end
        end
        set("defaultCamZoom", 0.4)
        cam = true
    elseif curStep == 1216 or curStep == 1344 or curStep == 1472 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1272 then
        tweenShaderProperty("mirror2","zoom",3,crochet*0.001*1,"quadOut")
        tweenShaderProperty("mirror2","angle",-20,crochet*0.001*1,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 1276 then
        tweenShaderProperty("mirror2","zoom",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("mirror2","angle",20,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1280 then
        tweenShaderProperty("mirror2","angle",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1308 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 1312 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*1,"cubeIn")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.015')
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeInOut")
    elseif curStep == 1316 or curStep == 1380 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 1376 then
        mirror(false,true,"","zoom",0,5,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*1,"cubeIn")
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.015')
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeInOut")
    elseif curStep == 1392 then
        mirror(true,true,"angle","angle",1800,0,5,crochet,"cubeInOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeIn")
    elseif curStep == 1400 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("zoomblurgame","focusPower",2,crochet*0.001*2,"cubeIn")
    elseif curStep == 1404 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        
    elseif curStep == 1408 then
        set("ratingsGroup.x",-240)
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        setActorAlpha(1, "filter")
        setShaderProperty("vignette","size",0.7)
        lascosasdelhud(0,crochet,2,"cubeOut")
        for i = 0,7 do
            noteAngle[i+1] = 360
            if (i >= 4 and i <= 7) then
               tween("note"..i,{alpha = 0.3},stepCrochet*0.001*16,"cubeOut")
            end
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                elseif (i >= 4 and i <= 7) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    targetnoteZPos[i+1] = -500
                end
            end
        end
    elseif curStep == 1464 then
        for i = 0,7 do
            noteAngle[i+1] = 360
            if (i >= 0 and i <= 3) then
               tween("note"..i,{alpha = 0.3},stepCrochet*0.001*16,"cubeOut")
            elseif i >= 4 and i <= 7 then
               tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
            end
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    targetnoteZPos[i+1] = -500
                elseif (i >= 4 and i <= 7) then
                    targetnoteZPos[i+1] = 0
                end
            end
        end
    elseif curStep == 1504 then
        mirror(false,true,"","zoom",0,1,8,crochet,"expoIn")
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*8,"cubeIn")

    elseif curStep == 1536 or curStep == 1580 or curStep == 1600 or curStep == 1632 
    or curStep == 1708 or curStep == 1728 or curStep == 1760 or curStep == 1820 or
    curStep == 1952 or curStep == 1984 then
        bloom(4, 1, crochet, 2, "cubeOut")
    end
    if curStep == 1557 or curStep == 1559 then
        bloom(2, 1, crochet, 0.5, "cubeOut")
    elseif curStep == 1720 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
    elseif curStep == 1724 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1816 then
        mirror(true,true,"angle","angle",-1800,0,4,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,30,3,crochet,"cubeIn")
    elseif curStep == 1820 then
        nose = false
        for i = 0,7 do
            noteAngle[i+1] = -360
        end
    elseif curStep == 1828 then
        set("ratingsGroup.y",-111240)
        lascosasdelhud(0,crochet,2,"cubeOut")
        nose = true
        mirror(true,true,"zoom","zoom",0.5,1,2,crochet,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*512)..',0.015')
    elseif curStep == 1848 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 1852 or curStep == 1916 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1856 then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 1912 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",2,crochet*0.001*1,"cubeIn")
    elseif curStep == 1920 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*8,"cubeIn")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*8,"cubeIn")
    elseif curStep == 1980 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 1992 or curStep == 2040 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 1996 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 2000 or curStep == 2048 then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 2044 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 2076 then
        mirror(false,true,"","zoom",0,5,0.5,crochet,"quadOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 2078 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
    elseif curStep == 2080 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
    elseif curStep == 2104 then
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"quadOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 2108 then
        mirror(true,true,"angle","angle",-1800,0,5,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("vignette","size",0.7,crochet*0.001*1,"cubeIn")
    elseif curStep == 2112 then
        drunkLerp = 0
        for i = 0,7 do
            noteAngle[i + 1] = (i % 4 == 0) and 360 or -360
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
            tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
            targetnoteZPos[i+1] = 0
        end
        serpientelocuraY = false
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        bloom(4, 1, crochet, 2, "cubeOut")
        setShaderProperty("speedlines","transparency",1)
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
        caWaveRange = 0
    elseif curStep == 2176 then
        for i = 0,7 do
            
            tween("note"..i,{alpha = 0},stepCrochet*0.001*16,"linear")
        end
        tweenShaderProperty("zoomblurgame","focusPower",10,crochet*0.001*20,"cubeIn")
        mirror(false,true,"","zoom",0,2,20,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*20,"cubeIn")
        tweenShaderProperty("bars","effect",0.6,crochet*0.001*20,"cubeIn")
    end
    if curStep == 1600 or curStep == 1680 or curStep == 1712 or curStep == 1828 or curStep == 1980 then
        cam = false
        bf = true
        matt = false
    elseif curStep == 1536 or curStep == 1696 or curStep == 1792 or curStep == 1920 then
        set("defaultCamZoom", 0.6)
        cam = false
        bf = false
        matt = true
    elseif curStep == 1664 then
        triggerEvent('Change Camera Speed', '4')
        triggerEvent('screen shake', (crochet*0.001*38)..',0.01')
        set("ratingsGroup.x",-240)
        for i = 0,7 do
            noteAngle[i+1] = 360
            if (i >= 0 and i <= 3) then
               tween("note"..i,{alpha = 0.3},stepCrochet*0.001*16,"cubeOut")
            end
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                    targetnoteZPos[i+1] = -500
                elseif (i >= 4 and i <= 7) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    targetnoteZPos[i+1] = 0
                end
            end
        end
        bf = false
        matt = true
    elseif curStep == 2048 then
        bf = false
        matt = false
        cam = false
    end
    if curStep >= 1408 and curStep <= 1520 then
        if curStep % 16 == 0 then
            setShaderProperty("mirror2","y",-2)
            tweenShaderProperty("mirror2","y",0,crochet*0.001*3,"cubeInOut")
        end
    end
    if curStep >= 1152 and curStep <= 1664 then
        if curStep % 32 == 8 or curStep % 32 == 24 then
            local angle = (curStep % 32 == 8) and -25 or 25  
            local rotX = (curStep % 32 == 8) and 15 or -15  
            noteRotX = rotX
            for i = 0, 7 do
                noteAngle[i + 1] = (i <= 3) and angle or -angle
            end
        end
    end
    if curStep >= 1152 and curStep <= 1408 then
        if curStep % 64 == 0 or curStep % 64 == 28 or curStep % 64 == 32 or curStep % 64 == 38 then
            bumpzoom(4,0.87)
        elseif curStep % 64 == 60 or curStep % 64 == 62 then
            bumpzoom(4,0.87)
        end
    end
    if curStep >= 1536 and curStep <= 1600 and curStep % 8 == 0 then
        bumpzoom(4, 0.8)
        noteScale = noteScale + 0.4
    elseif curStep >= 1600 and curStep <= 1632 and curStep % 4 == 0 then
        bumpzoom(4, 0.8)
        noteScale = noteScale + 0.3
    elseif curStep >= 1632 and curStep <= 1656 and curStep % 2 == 0 then
        bumpzoom(2, 0.85)
        noteScale = noteScale + 0.2
    end
    if curStep == 1536 then
        set("ratingsGroup.x",0)
        for i = 0, 7 do
            tween("note"..i,{alpha = 1},stepCrochet*0.001*16,"cubeOut")
            targetnoteXPos[i + 1] = _G['defaultStrum' .. i .. 'X']
            targetnoteZPos[i + 1] = 0
            if i <= 3 then
                noteAngle[i + 1] = -25 
            else
                noteAngle[i + 1] = 25 
            end
        end
    end
    if curStep >= 1408 and curStep <= 1536 and curStep % 16 == 0 then
        noteScale = noteScale + 0.5
    end
    if curStep == 1664 then
        
        setActorAlpha(0, "filter")
        setShaderProperty("vignette","size",0.3)
        setShaderProperty("greyscale","strength",0)
        setShaderProperty("speedlines","transparency",0)
        lascosasdelhud(1,crochet,2,"cubeOut")
        triggerEvent('toggle checker bg','0.1',crochet*0.001*2)
        caWaveRange = 0.08
    end
    if curStep >= 1824 and curStep <= 2112 and curStep % 8 == 0 then
        triggerEvent('flip echo direction','doubleshield','')
    end
    if curStep >= 512 and curStep <= 624 then
        if curStep % 16 == 0 then
            bloom(4, 1, crochet, 2, "cubeOut")

            if xd then
                matt = true
                bf = false
            end
        elseif curStep % 16 == 8 then
            matt = false
            bf = true
        end
    end
    
    if (curStep >= 144 and curStep <= 1028) or (curStep >= 1040 and curStep <= 1136) then
        if curStep % 16 == 4 or curStep % 16 == 12 then
            lerpSpeedZ = 12
            noteScale = noteScale + 0.4

            for i = 0, 7 do
                noteZPos[i + 1] = targetnoteZPos[i + 1] + 50
            end
    
            if curStep % 16 == 4 then
                noteRotX = 7
            elseif curStep % 16 == 12 then
                noteRotX = -7
            end
        end
    end
    
    if curStep >= 144 and curStep <= 1028 or curStep >= 1040 and curStep <= 1136 then
        if qlolxd then
            if curStep % 32 == 0 or curStep % 32 == 6 or curStep % 32 == 10 or
            curStep % 32 == 14 or curStep % 32 == 16 or curStep % 32 == 26 then
               bumpzoom(4,0.8)
            elseif curStep % 32 == 24 or curStep % 32 == 30 then
                bumpzoom(2,0.85)
            end
        end
    end
    if curStep >= 1664 and curStep <= 2112 then
        if nose then
            if curStep % 16 == 4 or curStep % 16 == 12 then
                noteScale = noteScale + 0.4
                local angle = (curStep % 16 == 4) and -25 or 25  
                local rotX = (curStep % 16 == 4) and 15 or -15  
                noteRotX = rotX 
                for i = 0, 7 do
                    if curStep % 16 == 4 then
                        noteXPos[i + 1] = targetnoteXPos[i + 1] - 50 
                    elseif curStep % 16 == 12 then
                        noteXPos[i + 1] = targetnoteXPos[i + 1] + 50 
                    end
                    noteAngle[i + 1] = (i <= 3) and angle or -angle
                end
            end
            if curStep % 64 == 0 or curStep % 64 == 10 or curStep % 64 == 16 or
            curStep % 64 == 22 or curStep % 64 == 26 or curStep % 64 == 26 or 
            curStep % 64 == 32 or curStep % 64 == 48 or curStep % 64 == 54 or
             curStep % 64 == 58 then
                setShaderProperty('bump', 'zoom', 0.8)
                tweenShaderProperty('bump', 'zoom', 1,stepCrochet*0.001*4,"cubeOut")
            elseif curStep % 64 == 14 or curStep % 64 == 30 or curStep % 64 == 40
            or curStep % 64 == 42 or curStep % 64 == 46 or curStep % 64 == 62 then
                setShaderProperty('bump', 'zoom', 0.85)
                tweenShaderProperty('bump', 'zoom', 1,stepCrochet*0.001*2,"cubeOut")
            end
        end
    end
  
end
local beatSwap = 1

function playerOneSing(a, b, c, d)
    if c == "VoiidBullet" then
        flashCamera("hud", "white", stepCrochet * 0.001, "cubeOut") 
    end
    if c == "Wiik4Sword" then
        flashCamera("game", "purple", stepCrochet * 0.001, "cubeOut") 
    end

    if c == "BoxingMatchPunch" or c == "Wiik3Punch" then
            beatSwap = beatSwap * -1
            angle = 20*beatSwap
--setShaderProperty("mirror3", "angle", 20 * beatSwap,stepCrochet*0.001, "cubeIn") 
           -- tweenShaderProperty("mirror3", "angle", 0, stepCrochet* 0.001, "cubeOut")  
        
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
		--local thisnotePosX = noteXPos[i+1]
		--local thisnotePosY = noteYPos[i+1]
		--local thisnotePosZ = (noteZPos[i+1]/1000)-1

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

--https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end