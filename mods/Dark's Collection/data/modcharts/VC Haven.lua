function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
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

local stepY = -500 -- Espaciado vertical entre flechas
local startYBottom = 1000 -- Posición inicial para las flechas de abajo
local centerY = 60
local time = 0
local lollololol = true
local downscroll = 1
function createPost()
    set("ratingsGroup.alpha")
    lascosasdelhud(0,crochet,0.1,"cubeOut")
    startSpeed = getProperty('', 'speed')
    if downscrollBool then
        downscroll = -1
    end
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
        local startY = 0
        targetnoteYPos[i + 1] = _G['defaultStrum' .. i .. 'Y']
        local targetY = targetnoteYPos[i + 1]
        if i >= 0 and i <= 8 then
            startY = startYBottom + (i % 9) * stepY
        end
        noteYPos[i+1] = startY
        targetnoteYPos[i+1] = targetY
        if difficulty == "VOIID" then
            if not middlescroll then
                if (i >= 0 and i <= 8) then
                targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +320
                elseif (i >= 9 and i <= 17) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +720
                end
            end
        else
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +320
                elseif (i >= 4 and i <= 7) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +720
                end
            end
        end
    
  
    end
    makeSprite('global', '', -1110, 0)
    makeSprite('player', '', -1110, 0)
    makeSprite('opponent', '', -1110, 0)

    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.5)
    setShaderProperty('godrays', 'density',0.5)
    setShaderProperty('godrays', 'weigth', 0.68)



 
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)




    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 4)

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.1, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)
    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)

    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    initShader('raroglitch', 'GlitchWave')
    setCameraShader('game', 'raroglitch')
    setShaderProperty('raroglitch', 'greyscale', 1)
    setShaderProperty('raroglitch', 'glitch', 0.0)
    setShaderProperty('raroglitch', 'wave', 0.0)
    setShaderProperty('raroglitch', 'glitchLine', 0.0)
    setShaderProperty('raroglitch', 'red', 0.0)

    
    initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.1)

    initShader('RayMarchEffect', 'RayMarchEffect')--
    setCameraShader('game', 'RayMarchEffect')
    setShaderProperty('RayMarchEffect', 'Xdirection', 0)
    setShaderProperty('RayMarchEffect', 'Ydirection', 0)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0)
    setShaderProperty('mirror', 'angle', -10)
	setShaderProperty('mirror', 'x', -1)
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

    initShader('barrel', 'PincushNewEffect')
    setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'barrel', 5)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)
    setShaderProperty('bump', 'angle', 0)
    setShaderProperty('bump', 'barrel', 0)

    initShader('RayMarchEffect2', 'RayMarchEffect')--
    setCameraShader('game', 'RayMarchEffect2')
    setShaderProperty('RayMarchEffect2', 'Xdirection', 0)
    setShaderProperty('RayMarchEffect2', 'Ydirection', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', -0.5)



    initShader('mirror3', 'PincushNewEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)

    initShader('bars2', 'bars')--
    setCameraShader('game', 'bars2')
    setShaderProperty('bars2', 'effect', 0)


    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue',1.5)


    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 10)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('heat', 'HeatEffect')
    setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty('heat', 'strength', 1)
    

    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 5)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.15)


    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    makeSprite('bring', 'Haven/bring', 150, -1170, 0.5)
    setObjectCamera('bring', 'hud')
    makeSprite('in', 'Haven/in', 550, -1170, 0.5)
	setObjectCamera('in', 'hud')
    makeSprite('the', 'Haven/the', 750, -1170, 0.5)
	setObjectCamera('the', 'hud')
    makeSprite('ruckus', 'Haven/ruckus', -2000, 280, 0.5)
	setObjectCamera('ruckus', 'hud')
    makeSprite('like', 'Haven/like',1650, 280, 0.5)
	setObjectCamera('like', 'hud')
    set("bfCharacter1.alpha",0)
end
function ca(strength,s,ease)
	setShaderProperty("caBlue","strength",strength)
	tweenShaderProperty("caBlue","strength",0.001,stepCrochet*0.001*s,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function bumps(mirror,xd,valor,valor2,speed,curStep,ease)
	setShaderProperty(mirror,xd,valor)
	tweenShaderProperty(mirror,xd,valor2,speed*0.001*curStep,ease)
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function raroglitchlol(glitch, wave, glitchLine, Red)
    setShaderProperty('raroglitch', 'glitch', glitch)
    setShaderProperty('raroglitch', 'wave', wave)
    setShaderProperty('raroglitch', 'glitchLine', glitchLine)
    setShaderProperty('raroglitch', 'red', Red)
end
function songStart()
    for i = 0, (keyCount*2)-1 do
        tween("note"..i,{alpha = 1},crochet*0.001*12,"cubeIn")
    end
    mirror(false,true,"","zoom",0,1,12,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,12,crochet,"cubeOut")
    mirror(false,true,"","x",0,0,12,crochet,"cubeOut")
    tweenShaderProperty("barrel","barrel",0,crochet*0.001*16,"cubeOut")
    tweenShaderProperty("pixel","strength",0,crochet*0.001*12,"cubeIn")
    tweenShaderProperty("bars","effect",0,crochet*0.001*12,"cubeOut")
    tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*12,"linear")
    tweenShaderProperty("greyscale","strength",0,crochet*0.001*14,"cubeIn")
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
local lerpSpeedX = 5
local lerpSpeedY = 0.65
local lerpSpeedZ = 5
local lerpSpeedAngle = 4
local lerpSpeednoteRotX = 5

local drunkLerp = 0.5
local drunk = 0
local drunkSpeed = 5

local nose = true
local sxm = true
local bfs = false
local rotCam = true
local rotCamSpd = 0
local rotCamRange = 0
local rotCamInd = 0
local caWave = 0
local caWaveSpeed = 2
local caWaveRange = 0
local swap = -1
local xdxd = 1
local lolxd = true
local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 2 
local perlinXRange = 4.5
local perlinYRange = 4.5

local perlinxddxddx = false

local serpientelocuraY = true

local serpientelol = 0.15 --altura
local serpientexd = 0.5 --velocidad


function update(elapsed)
    time = time + elapsed*xdxd
    if perlinxddxddx then
        perlinX = perlinX + elapsed*math.random()*perlinSpeed
        perlinY = perlinY + elapsed*math.random()*perlinSpeed
       
        setShaderProperty('RayMarchEffect2', 'Xdirection', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
        setShaderProperty('RayMarchEffect2', 'Ydirection', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    else
               setShaderProperty('RayMarchEffect2', 'Xdirection', 0)
        setShaderProperty('RayMarchEffect2', 'Ydirection', 0)
    end

    local currentBeat = (songPos / 1000) * (bpm / 60) 
    if serpientelocuraY then
        for i = 0, (keyCount * 2) - 1 do
            --targetnoteZPos[i + 1] = targetnoteZPos[i + 1] + (serpientelolz * math.sin(currentBeat * serpientexdz + i))
            noteYPos[i + 1] = noteYPos[i + 1] + (serpientelol * math.sin(currentBeat * serpientexd + i)) --buenserpientexdxdxd
        end
    end
    if sxm then
        set("camFollow.x",1155)
        set("camFollow.y",550)
        set("defaultCamZoom", 0.65)
    end
    if bfs then
        set("camFollow.x",2365)
        set("camFollow.y",750)
        set("defaultCamZoom", 0.7)
    end
    setCustomShaderFloat("godrays","iTime",time)
    setCustomShaderFloat("chess","iTime",time)
    
    setCustomShaderFloat("heat","iTime",time)


    setCustomShaderFloat('glitchy', 'iTime', time)
    setCustomShaderFloat('raroglitch', 'iTime', time)
    setCustomShaderFloat('speedlines', 'iTime', time)
    setCustomShaderFloat('titleeffect', 'uTime', time)
    

    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('bump', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('bump', 'angle', 0)
    end
end
function stepHit()
    if curStep == 48 or curStep == 104 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("bars","effect",0.2,crochet*0.001*1,"cubeOut")
    elseif curStep == 56 then
        xdxd = 3
        tweenShaderProperty("godrays","decay",0.75,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,2,3,crochet,"cubeInOut")
        tweenShaderProperty("mirror2","angle",360,crochet*0.001*4,"cubeInOut")
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.02')
        tweenShaderProperty("barrel","barrel",5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"cubeOut")
        setShaderProperty('chess', 'transparency', 0.1)
        tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeIn")
        noteScale = noteScale + 0.4
        if difficulty == "VOIID" then
            if not middlescroll then
                for i = 0,17 do
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']-240
                        targetnoteZPos[i+1] = -500
                        tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        else
             if not middlescroll then
                for i = 0,17 do
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']-240
                        targetnoteZPos[i+1] = -500
                        tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        end
    elseif curStep == 60 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("godrays","decay",0.5,crochet*0.001*1,"cubeIn")
    elseif curStep == 64 then
        xdxd = 1
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*2,"cubeOut")
        bloom(6,1,crochet,4,"cubeOut")
        sxm = false
        bfs = true
    end
    if curStep == 72 or curStep == 104 then
        noteScale = noteScale + 0.4
    elseif curStep == 88 then
        noteScale = noteScale + 0.4
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadOut")
    elseif curStep == 92 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"quadOut")
    elseif curStep == 96 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 112 then
        bfs = false
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.25,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrel","barrel",-10,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("mirror3","angle",-10,crochet*0.001*2,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*16,"cubeIn")
        tweenShaderProperty("godrays","decay",0.75,crochet*0.001*4,"cubeIn")
        set("defaultCamZoom", 0.5)
    elseif curStep == 120 then
        noteScale = noteScale + 0.4
        mirror(false,true,"","zoom",0,0.5,2,crochet,"expoIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"expoIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"expoIn")
        tweenShaderProperty("mirror3","angle",10,crochet*0.001*2,"expoIn")
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("titleeffect","money",0.4,crochet*0.001*2,"cubeIn")
    elseif curStep == 128 then
    

        bloom(6,1,crochet,4,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("mirror3","angle",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("godrays","decay",0.5,crochet*0.001*2,"cubeOut")
        lascosasdelhud(1,crochet,4,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("titleeffect","money",0,crochet*0.001*2,"cubeOut")

        sxm = true
    end
    parte1(128)
    parte1(512)
    parte1(896)
    parte1(1280)
    parte2(256)
    parte2(1024)
    parte3peak(384)
    parte3peak(1152)
    droppeak(640)
    droppeak(768)
    droppeak(1408)
    droppeak(1536)
    if curStep == 622 then
        rotCamSpd = 0
        rotCamRange = 0
        lollololol = false
    elseif curStep == 624 then
        if difficulty == "VOIID" then
            for i = 9,17 do 
                targetnoteZPos[i+1] = -100    
            end
        else
            for i = 3,7 do 
                targetnoteZPos[i+1] = -100    
            end
        end
        lascosasdelhud(0,crochet,4,"cubeOut")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        bloom(0,1,crochet,1,"cubeOut")
    elseif curStep == 628 then
        if difficulty == "VOIID" then
            for i = 9,17 do 
                targetnoteZPos[i+1] = -200    
            end
        else
            for i = 9,17 do 
                targetnoteZPos[i+1] = -200    
            end
        end
        bloom(0,1,crochet,1,"cubeOut")
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
    elseif curStep == 632 then
        if difficulty == "VOIID" then
            for i = 9,17 do 
                targetnoteZPos[i+1] = -300    
            end
        else
            for i = 9,17 do 
                targetnoteZPos[i+1] = -300    
            end
        end
        bloom(0,1,crochet,1,"cubeOut")
        tweenFadeIn("blackBG",1,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("bars","effect2",0.6,crochet*0.001*2,"backIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("pixel","strength",60,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*2,"cubeIn")
    elseif curStep == 636 then
        if difficulty == "VOIID" then
            for i = 0,17 do 
                if (i >= 0 and i <= 8) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                elseif (i >= 9 and i <= 17) then
                    if not middlescroll then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = -500
                end  
            end
        else
            for i = 0,7 do 
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                elseif (i >= 4 and i <= 7) then
                    if not middlescroll then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = -500
                end  
            end
        end
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,0,1,crochet,"cubeIn")
    end
    if curStep == 768 or curStep == 1536 then
        setShaderProperty("mirror3","x",-1)
        bfs = true
        sxm = false
    elseif curStep == 828 or curStep == 1596 then
        tween("bfCharacter1",{x = getActorX("bfCharacter1")+325 , alpha = 1},crochet*0.001*4,"cubeOut")
    elseif curStep == 856 or curStep == 1624 then
        tween("bfCharacter1",{x = getActorX("bfCharacter1")-325 , alpha = 0},crochet*0.001*4,"cubeOut")
    elseif curStep == 896 then
        lollololol = true
        caWaveRange = 0
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        setShaderProperty('titleeffect', 'money', 1)
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars2","effect",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("speedlines","transparency",1)
        setShaderProperty("chess","transparency",0)
        setShaderProperty("mirror3","x",0)
        setShaderProperty("glitchy","AMT",0)
        setShaderProperty("godrays","decay",0.5)
        lascosasdelhud(1,crochet,4,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        bfs = false
        sxm = true
    end
    if curStep == 1016 then
        lolxd = false
    elseif curStep == 1024 then
        setActorY(-9990,"ratingsGroup")
        for i = 0,(keyCount * 2) - 1 do
            noteYPos[i+1] = targetnoteYPos[i+1] - 70
        end
        noteRotX = 40
        mirror(true, true, "y", "y", -2, 1, 2, crochet, "cubeOut")
        rotCamSpd = 3
        rotCamRange = 0
        bfs = false
        sxm = true
        tweenFadeIn("blackBG",0.8,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrel","barrel",5,crochet*0.001*0.5,"cubeOut")
        bloom(4,1,crochet,1,"cubeOut")
        mirror(false,true,"","zoom",0,3,0.5,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*0.5,"cubeOut")
        bumps("bump","angle",20,0,stepCrochet,4,"cubeOut")
        xdxd = 0.5
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*2,"cubeOut")
        setShaderProperty('titleeffect', 'colorraro', 1.1)
        caWave = 0.075
        setShaderProperty('glitchy', 'AMT', 0.05)
        lascosasdelhud(0,crochet,4,"cubeOut")
        raroglitchlol(0.05,0.1,0.3,0.3)
        setShaderProperty("godrays","decay",0.7)
       
    elseif curStep == 1026 then
        setShaderProperty('barrel', 'barrel', -10)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeIn")
    elseif curStep == 1028 then
        bloom(4,1,crochet,1,"cubeOut")
        bumps("bump","angle",-20,0,stepCrochet,8,"cubeOut")
        for i = 0,(keyCount * 2) - 1 do
            noteYPos[i+1] = targetnoteYPos[i+1] + 70
        end
        noteRotX = -40
    elseif curStep == 1032 then
        lolxd = true
        bloom(4,1,crochet,1,"cubeOut")
    end

    if curStep == 1390 then
        lollololol = false
    elseif curStep == 1392 then
        lascosasdelhud(0,crochet,4,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 1396 then
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1398 then
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1400 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1404 then
        bloom(1,0,crochet,1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",2,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,0,1,crochet,"cubeOut")
        for i = 0,(keyCount * 2) - 1 do 
            if difficulty == "VOIID" then
                if (i >= 0 and i <= 8) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                elseif (i >= 9 and i <= 17) then
                    if not middlescroll then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = -500
                end  
            else
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                elseif (i >= 4 and i <= 7) then
                    if not middlescroll then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = -500
                end  
            end
        end
    end
    
    if  curStep >= 1392 and curStep < 1396 or curStep >= 1400 and curStep < 1404
    then
        if curStep % 4 == 0 then
            caWaveRange = 0.08
            mirror(true,true,"x","x",-0.15,0,1,stepCrochet,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
            end
        end
        if curStep % 4 == 1 then
            mirror(true,true,"x","x",0.15,0,1,stepCrochet,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
            end
        end
        if curStep % 4 == 2 then
            mirror(true,true,"y","y",0.15,0,1,stepCrochet,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
            end
        end

        if curStep % 4 == 3 then
            mirror(true,true,"y","y",-0.15,0,1,stepCrochet,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1]+ 50
            end
            caWaveRange = 0
        end
    end

    if curStep == 1664 then
        drunkLerp = 0.5
        drunkSpeed = 1
        serpientelocuraY = false
        if difficulty == "VOIID" then
            for i = 0,8 do 
                    targetnoteZPos[i+1] = -700
                    tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    noteAngle[i + 1] = 360 
            end
        else
                        for i = 0,3 do 
                    targetnoteZPos[i+1] = -700
                    tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    noteAngle[i + 1] = 360 
            end
        end
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*4,"cubeOut")
        mirror(true,true,"zoom","zoom",0,1,8,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*4,"cubeOut")
        raroglitchlol(0.05,0.1,0.3,0.3)
        setShaderProperty('titleeffect', 'money', 1)
        setShaderProperty("speedlines","transparency",1)
        setShaderProperty("chess","transparency",0)
        setShaderProperty("mirror3","x",0)
        setShaderProperty("glitchy","AMT",0)
        setShaderProperty("godrays","decay",0.5)
        setShaderProperty("vignette","size",0.5)
        setShaderProperty("greyscale","strength",0.7)
        rotCamSpd = 1
        rotCamRange = 4
    elseif curStep == 1688 or curStep == 1776 then
        mirror(false,true,"","zoom",0,3,4,crochet,"cubeIn")
        tweenShaderProperty("barrel","barrel",-2,crochet*0.001*4,"cubeIn")
        setShaderProperty("barrel","doChroma",false)
        tweenShaderProperty("bars2","effect",0.6,crochet*0.001*4,"cubeIn")
    elseif curStep == 1712 or curStep == 1780 then
        lerpSpeedZ = 2
        if difficulty == "VOIID" then
            for i = 9,17 do 
                targetnoteZPos[i+1] = -600
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeIn")
                noteAngle[i + 1] = 360
            end
        else
            for i = 3,7 do 
                targetnoteZPos[i+1] = -600
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeIn")
                noteAngle[i + 1] = 360
            end
        end
    elseif curStep == 1728 then
        drunkLerp = 1
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*8,"cubeOut")
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeOut")
        setActorColor("dadCharacter0",0,0,0)
        setActorColor("dadCharacter1",0,0,0)
        setActorColor("bfCharacter0",0,0,0)
        setActorColor("bfCharacter1",0,0,0)
        setActorColor("girlfriend",0,0,0)
        setShaderProperty('sobel', 'strength', 0.9)
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        bloom(8,1,crochet,4,"cubeOut")
    elseif curStep == 1744 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
    elseif curStep == 1750 then
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == 1756 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 1760 then
        mirror(true,true,"y","y",-2,0,2,crochet,"cubeOut")
    elseif curStep == 1722 then
        if difficulty == "VOIID" then
            for i = 9,17 do 
                targetnoteZPos[i+1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                noteAngle[i + 1] = -360
            end
        else
            for i = 3,7 do 
                targetnoteZPos[i+1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                noteAngle[i + 1] = -360
            end
        end 
    end

    if curStep == 114 then
        tween("bring", {y = 170}, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 116 then
        tween("in", {y = 170}, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 118 then
        tween("the", {y = 170}, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 120 then
        tween("ruckus", {x = 200}, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 124 then
        tween("like", {x = 650}, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 128 then
      --  serpientelocuraY = false
        tweenActorProperty("bring", 'y',-1250, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty("in", 'y',-1250, stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty("the", 'y',-1280 , stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty("ruckus", 'x',-1280 , stepCrochet*0.001*8, 'cubeOut')
        tweenActorProperty("like", 'x',1680, stepCrochet*0.001*8, 'cubeOut')
    end
   
        local section = math.floor(curStep/16)
    if section >= 8 and section < 16 or section >= 32 and section < 39 
    or section >= 56 and section < 64 or section >= 80 and section < 87 then
        if curStep % 16 == 4 or curStep % 16 == 12 then
            noteScale = noteScale + 0.4
            bumps("bump","zoom",0.8,1,stepCrochet,4,"cubeOut")
            bumps("bump","barrel",-1,0,stepCrochet,4,"cubeOut")
            bumps("bump","x",0.04,0,stepCrochet,4,"cubeOut")
            bumps("bump","y",-0.015,0,stepCrochet,4,"cubeOut")
            triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.003')
        end
    end
    if section >= 0 and section < 8 then
        if curStep % 32 == 0 or curStep % 32 == 4 or
         curStep % 32 == 8 or curStep % 32 == 16 then
            bumps("bump","zoom",0.8,1,stepCrochet,4,"cubeOut")
        elseif (curStep % 32 == 12 or curStep % 32 == 14) 
            or (curStep % 32 == 20 or curStep % 32 == 22)
            or (curStep % 32 == 26 or curStep % 32 == 28 or curStep % 32 == 30) then
            bumps("bump","zoom",0.9,1,stepCrochet,2,"cubeOut")
        end
    end
      
end

function parte1(s)
    if curStep == s then
        setActorY(0,"ratingsGroup")
        drunkLerp = 0
        serpientelocuraY = false
        for i = 0,(keyCount * 2) - 1 do
                targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                targetnoteZPos[i+1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                if difficulty == "VOIID" then
                    if i <= 8 then
                        noteAngle[i + 1] = -25 
                    else
                        noteAngle[i + 1] = 25 
                    end
                else
                    if i <= 4 then
                        noteAngle[i + 1] = -25 
                    else
                        noteAngle[i + 1] = 25 
                    end
                end
        end
        rotCamSpd = 3
        rotCamRange = 7
    end
    if curStep == s+8 or curStep == s+40 or curStep == s+72 or curStep == s+104 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*4,"cubeOut")
        caWaveRange = 0
    elseif curStep == s+16 or curStep == s+48 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*1,"cubeOut")
    elseif curStep == s+24 then
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*0.5,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("barrel","x",1,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty("barrel","barrel",10,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("RayMarchEffect", "Xdirection",-1,crochet*0.001*1, "cubeOut")
    elseif curStep == s+28 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("barrel","x",2,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
        tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*1, "cubeIn")
    elseif curStep == s+56 then
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*0.5,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("barrel","x",1,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("barrel","barrel",10,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("RayMarchEffect2", "Xdirection",1,crochet*0.001*1, "cubeOut")
    elseif curStep == s+60 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("barrel","x",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
        tweenShaderProperty("RayMarchEffect2", "Xdirection",0,crochet*0.001*1, "cubeIn")
    end
    if curStep == s+24 or curStep == s+28 or curStep == s+56 or curStep == s+60 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
    elseif curStep == s+26 or curStep == s+30 or curStep == s+58 or curStep == s+62 then
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeIn")
    elseif curStep == s+32 then
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        bfs = true
        sxm = false
    end
    if curStep == s+64 then
        caWaveRange = 0.05
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
        mirror(true,true,"zoom","zoom",2,1,2,crochet,"cubeOut")
        mirror(true,true,"y","y",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bfs = false
        sxm = true
    elseif curStep == s+68 or curStep == s+100 then
        mirror(true,true,"y","y",1,2,1,crochet,"cubeOut")
    elseif curStep == s+76 or curStep == s+108 then
        mirror(true,true,"x","x",0.15,0,0.5,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        for i = 0,(keyCount * 2) - 1 do
            noteXPos[i + 1] = targetnoteXPos[i + 1] + 70
        end
    elseif curStep == s+78 or curStep == s+110 then
        for i = 0,(keyCount * 2) - 1 do
            noteXPos[i + 1] = targetnoteXPos[i + 1] - 70
        end
        mirror(true,true,"x","x",-0.15,0,0.5,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    end
    if lollololol then
        if curStep == s+80 or curStep == s+112 then
            swap = swap * -1
            mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-20*swap,1,crochet,"cubeIn")
            tweenShaderProperty("RayMarchEffect2", "Ydirection",-1*swap,crochet*0.001*1, "cubeIn")
            tweenShaderProperty("RayMarchEffect2", "Xdirection",-1*swap,crochet*0.001*1, "cubeIn")
        elseif curStep == s+82 or curStep == s+114 then
            mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeIn")
        elseif curStep == s+84 or curStep == s+116  then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            bloom(3,1,crochet,1,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            mirror(true,true,"y","y",0,2,1,crochet,"cubeOut")
            tweenShaderProperty("RayMarchEffect2", "Ydirection",0,crochet*0.001*1, "cubeOut")
            tweenShaderProperty("RayMarchEffect2", "Xdirection",0,crochet*0.001*1, "cubeOut")
        elseif curStep == s+92 then
            mirror(false,true,"","zoom",0,3,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
        elseif curStep == s+94 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        elseif curStep == s+96 then
            mirror(true,true,"zoom","zoom",2,1,2,crochet,"cubeOut")
            mirror(true,true,"y","y",0,1,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
            sxm = false
            bfs = true
        end
        if curStep == s+120 then
            tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
            tweenShaderProperty("vignette","size",0.5,crochet*0.001*2,"cubeIn")
            bloom(1,2,crochet,2,"cubeIn")
            tweenShaderProperty("barrel","barrel",10,crochet*0.001*2,"cubeIn")
            tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
            tweenFadeIn("blackBG",0.5,stepCrochet*0.001*8,"cubeIn")
            setShaderProperty("mirror2","angle",360)
            tweenShaderProperty("mirror2","angle",0,crochet*0.001*4,"cubeInOut")
            mirror(false,true,"","zoom",0,6,2,crochet,"cubeIn")
        elseif curStep == s+124 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        end
        if  curStep >= s+80 and curStep < s+84 or curStep >= s+88 and curStep < s+92
        or  curStep >= s+112 and curStep < s+116 or curStep >= s+120 and curStep < s+124
        then
            if curStep % 4 == 0 then
                caWaveRange = 0.08
                for i = 0,(keyCount * 2) - 1 do
                    noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
                end
                mirror(true,true,"x","x",-0.15,0,1,stepCrochet,"cubeOut")
            end
            if curStep % 4 == 1 then
                for i = 0,(keyCount * 2) - 1 do
                    noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
                end
                mirror(true,true,"x","x",0.15,0,1,stepCrochet,"cubeOut")
            end
            if curStep % 4 == 2 then
                for i = 0,(keyCount * 2) - 1 do
                    noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
                end
                mirror(true,true,"y","y",0.15,0,1,stepCrochet,"cubeOut")
            end
            if curStep % 4 == 3 then
                for i = 0,(keyCount * 2) - 1 do
                    noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
                end
                mirror(true,true,"y","y",-0.15,0,1,stepCrochet,"cubeOut")
                caWaveRange = 0
            end
        end
    end
end
function parte2(s)
    if curStep == s or curStep == s+64 or curStep == s+96 then
        for i = 0,(keyCount * 2) - 1 do
           -- noteAngle[i+1] = 360
            if difficulty == "VOIID" then
                if (i >= 9 and i <= 17) then
                    tween("note"..i,{alpha = 0.3},stepCrochet*0.001*8,"cubeOut")
                elseif (i >= 0 and i <= 8) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*8,"cubeOut")
                end
                if not middlescroll then
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                        targetnoteZPos[i+1] = 0
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                        targetnoteZPos[i+1] = -500
                    end
                end
            else
                if (i >= 0 and i <= 3) then
                    tween("note"..i,{alpha = 0.3},stepCrochet*0.001*8,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*8,"cubeOut")
                end
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                        targetnoteZPos[i+1] = 0
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                        targetnoteZPos[i+1] = -500
                    end
                end
            end
        end
    elseif curStep == s+24 or curStep == s+72 or curStep == s+104 then
        for i = 0,(keyCount * 2) - 1 do
            --noteAngle[i+1] = 360
            if difficulty == "VOIID" then
                if (i >= 0 and i <= 8) then
                tween("note"..i,{alpha = 0.3},stepCrochet*0.001*8,"cubeOut")
                elseif (i >= 9 and i <= 17) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*8,"cubeOut")
                end
                if not middlescroll then
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                        targetnoteZPos[i+1] = -500
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                        targetnoteZPos[i+1] = 0
                    end
                end
            else
                if (i >= 0 and i <= 3) then
                tween("note"..i,{alpha = 0.3},stepCrochet*0.001*8,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                    tween("note"..i,{alpha = 1},stepCrochet*0.001*8,"cubeOut")
                end
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                        targetnoteZPos[i+1] = -500
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                        targetnoteZPos[i+1] = 0
                    end
                end
            end
        end
    end
    if lolxd then
        if curStep == s then
            setActorY(-9990,"ratingsGroup")
            drunkLerp = 0.5
            xdxd = 0.5
            tweenShaderProperty("chess","transparency",0.1,crochet*0.001*2,"cubeOut")
            setShaderProperty('titleeffect', 'colorraro', 1.1)
            caWave = 0.075
            setShaderProperty('glitchy', 'AMT', 0.05)
            lascosasdelhud(0,crochet,4,"cubeOut")
            rotCamSpd = 0
            rotCamRange = 0
            raroglitchlol(0.05,0.1,0.3,0.3)
            setShaderProperty("godrays","decay",0.7)
            setShaderProperty("barrel","barrel",-10)
            tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
            serpientelocuraY = true
            tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
            bloom(3,1,crochet,2,"cubeOut")
            mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
            sxm = true
            bfs = false
        elseif curStep == s+32 or curStep == s+80 then
            sxm = false
            bfs = true
            bloom(3,1,crochet,2,"cubeOut")
        elseif curStep == s+64 or curStep == s+96 then
            sxm = true
            bfs = false
            bloom(3,1,crochet,2,"cubeOut")
        elseif curStep == s+112 then
            sxm = false
            bfs = false
            set("defaultCamZoom", 0.5)
            bloom(3,1,crochet,2,"cubeOut")
        elseif curStep == s+120 then
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            tweenShaderProperty("mirror2","angle",180,crochet*0.001*3,"cubeOut")
            bumps("bump","zoom",0.7,1,stepCrochet,4,"cubeOut")
            bumps("bump","barrel",-1,0,stepCrochet,4,"cubeOut")
            bumps("bump","x",0.04,0,stepCrochet,4,"backOut")
            bumps("bump","y",-0.015,0,stepCrochet,4,"backOut")
            triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.01')
    
            bloom(3,1,crochet,2,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*8,"cubeOut")
            tweenShaderProperty("greyscale","strength",0,stepCrochet*0.001*8,"cubeOut")
            tweenShaderProperty("godrays","decay",0.5,stepCrochet*0.001*8,"cubeOut")
            tweenShaderProperty("vignette","size",0.15,stepCrochet*0.001*8,"cubeOut")
            tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeOut")
            tweenShaderProperty("barrel", "barrel", 10, crochet * 0.001 * 2, "cubeIn")
            tweenShaderProperty("bars", "effect", 0.5, crochet * 0.001 * 2, "cubeIn")
            tweenShaderProperty("RayMarchEffect", "Ydirection",0,crochet*0.001*2, "cubeOut")
            tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*2, "cubeOut")
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
            noteScale = noteScale + 0.5
            noteRotX = 10
            for i = 0,(keyCount * 2) - 1 do
                if i <= 8 then
                    noteAngle[i + 1] = -35 
                else
                    noteAngle[i + 1] = 35 
                end
            end
        elseif curStep == s+124 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
            mirror(true,true,"x","x",0,-3,2,crochet,"cubeInOut")
           -- tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        elseif curStep == s+128 then
            sxm = true
           tweenShaderProperty("bars", "effect", 0, crochet * 0.001 * 2, "cubeOut")
            tweenShaderProperty("barrel", "barrel", 0, crochet * 0.001 * 2, "cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
            setShaderProperty('glitchy', 'AMT', 0)
            lascosasdelhud(1,crochet,4,"cubeOut")
            raroglitchlol(0,0,0,0)
            ca(0.01,8,"cubeOut")
            setShaderProperty('titleeffect', 'colorraro', 0)
            setShaderProperty('titleeffect', 'money', 1)
            tweenShaderProperty("chess","transparency",0.1,crochet*0.001*2,"cubeOut")
            drunkLerp = 0.2
           
            
        end
        
        if (curStep >= s and curStep < s + 32) or (curStep >= s + 48 and curStep < s + 128) then
            if curStep % 32 == 0 then
      
                if curStep < s + 48 then
                    mirror(true, true, "y", "y", -2, -1, 2, crochet, "backIn")
                else
                    mirror(true, true, "y", "y", -1, 0, 2, crochet, "backIn")
                    --tweenShaderProperty("RayMarchEffect", "Xdirection",1*swap,crochet*0.001*2, "cubeIn")
                end
            elseif curStep % 32 == 16 then
                if curStep < s + 48 then
                    mirror(true, true, "y", "y", -1, 0, 2, crochet, "backIn")
                else
                    mirror(true, true, "y", "y", -2, -1, 2, crochet, "backIn")
                   -- tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*2, "cubeOut")
                end
            end
        end
        if curStep >= s and curStep < s+32 or curStep >= s+48 and curStep < s+120 then
            if curStep % 16 == 0 then
                swap = swap * -1
                mirror(false,true,"","angle",0,15*swap,2,crochet,"backIn")
                tweenShaderProperty("mirror2", "zoom", 0.7, stepCrochet * 0.001 * 8, "backIn")
                tweenShaderProperty("RayMarchEffect", "Ydirection",-2*swap,crochet*0.001*2, "backIn")
                tweenShaderProperty("RayMarchEffect", "Xdirection",2*swap,crochet*0.001*2, "backIn")
              
            elseif curStep % 16 == 8 then
                for i = 0,(keyCount * 2) - 1 do
                    noteAngle[i + 1] = -35 *swap
                end
                noteScale = noteScale + 0.5
                noteRotX = 20*swap
                ca(0.01,8,"cubeOut")
                bumps("bump","zoom",0.7,1,stepCrochet,4,"cubeOut")
                bumps("bump","barrel",-1,0,stepCrochet,4,"cubeOut")
                bumps("bump","x",0.04*swap,0,stepCrochet,4,"backOut")
                bumps("bump","y",-0.015,0,stepCrochet,4,"backOut")
                triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.02')
                bloom(3,1,crochet,2,"cubeOut")
                bumps('greyscale','strength',0.0, 1.0, stepCrochet, 15,'linear')
                mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
                tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*8,"cubeOut")
                tweenShaderProperty("RayMarchEffect", "Ydirection",0,crochet*0.001*2, "cubeOut")
                tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*2, "cubeOut")
        
            end
        end
    end
end
function parte3peak(s)
    if curStep == s then

        serpientelocuraY = false
        for i = 0,(keyCount * 2) - 1 do
            if difficulty == "VOIID" then
                if (i >= 0 and i <= 8) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']-240
                    targetnoteZPos[i+1] = -500
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                elseif (i >= 9 and i <= 17) then
                    if not middlescroll then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    end
                end
            else
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']-240
                    targetnoteZPos[i+1] = -500
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                    if not middlescroll then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    end
                end
            end
        end
    end
    if curStep >= s and curStep < s + 128 then
        if curStep > 0 and curStep % 32 == 0 then
            for i = 0, (keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
                noteAngle[i + 1] = 15
            end
        elseif curStep % 32 == 28 then
            for i = 0, (keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
                noteAngle[i + 1] = -15
            end
        elseif curStep % 32 == 30 then
            for i = 0, (keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
                noteAngle[i + 1] = 15
            end
        end
        if curStep % 32 == 0 or curStep % 32 == 4 or curStep % 32 == 8 or curStep % 32 == 12 
        or curStep % 32 == 16 or curStep % 32 == 20 or curStep % 32 == 24 then
            if curStep % 8 == 0 then
                noteRotX = 5
                for i = 0, (keyCount * 2) - 1 do
                    noteAngle[i + 1] = -15
                end
                noteScale = noteScale + 0.3
                bumps("bump", "zoom", 0.8, 1, stepCrochet, 4, "cubeOut")
                bumps("bump", "barrel", -1, 0, stepCrochet, 4, "cubeOut")
                bumps("bump", "x", -0.04, 0, stepCrochet, 4, "backOut")
                bumps("bump", "y", -0.015, 0, stepCrochet, 4, "backOut")
            elseif curStep % 8 == 4 then
                noteRotX = -5
                for i = 0, (keyCount * 2) - 1 do
                    noteAngle[i + 1] = 15
                end
                noteScale = noteScale + 0.3
                bumps("bump", "zoom", 0.8, 1, stepCrochet, 4, "cubeOut")
                bumps("bump", "barrel", -1, 0, stepCrochet, 4, "cubeOut")
                bumps("bump", "x", 0.04, 0, stepCrochet, 4, "backOut")
                bumps("bump", "y", -0.015, 0, stepCrochet, 4, "backOut")
            end
        end
    end
    
    if curStep == s+4 then
        mirror(false,true,"","y",0,-2,1,crochet,"cubeOut")
    elseif curStep == s+8 then
        tweenShaderProperty("greyscale","strength",0.5,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","angle",0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == s+12 then
        caWaveRange = 0.1
        caWaveSpeed = 3
        bloom(3,1,stepCrochet,4,"cubeOut")
        setShaderProperty("greyscale","strength",0.0)
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*4,"cubeIn")
        setShaderProperty("barrel","barrel",-10)
        tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*8,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,3,0.5,crochet,"cubeOut")
        tweenShaderProperty("mirror2","angle",-15,stepCrochet*0.001*2,"cubeOut")
        mirror(true,true,"x","x",-10,0,2,crochet,"cubeOut")
        tweenShaderProperty("RayMarchEffect", "Ydirection",-1,crochet*0.001*0.5, "cubeOut")
        tweenShaderProperty("RayMarchEffect", "Xdirection",-1,crochet*0.001*0.5, "cubeOut")
        xdxd = 3
        tweenShaderProperty("titleeffect","money",0.9,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 0)
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.015')
    elseif curStep == s+14 then
        tweenShaderProperty("EyeFishEffectGame","power",0,stepCrochet*0.001*2,"cubeIn")
        tweenShaderProperty("mirror2","angle",15,stepCrochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        tweenShaderProperty("RayMarchEffect", "Ydirection",1,crochet*0.001*0.5, "cubeIn")
        tweenShaderProperty("RayMarchEffect", "Xdirection",1,crochet*0.001*0.5, "cubeIn")
    elseif curStep == s+16 then
        caWaveRange = 0
        setShaderProperty('godrays', 'decay', 0.5)
        bloom(3,1,crochet,2,"cubeOut")
        tweenShaderProperty("mirror2","angle",0,stepCrochet*0.001*8,"cubeOut")
        tweenShaderProperty("RayMarchEffect", "Ydirection",0,crochet*0.001*2, "cubeOut")
        tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*2, "cubeOut")
        xdxd = 1
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("titleeffect","money",1,stepCrochet*0.001*8,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 1)
        sxm = false
        bfs = true
    end
    -- bf
    if curStep == s+24 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,0.5,crochet,"cubeOut")
        tweenShaderProperty("RayMarchEffect", "Ydirection",-0.7,crochet*0.001*1, "cubeOut")
        tweenShaderProperty("RayMarchEffect", "Xdirection",-0.7,crochet*0.001*1, "cubeOut")
    elseif curStep == s+26 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"expoIn")
    elseif curStep == s+28 then
        mirror(false,true,"","zoom",0,3,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeOut")
        tweenShaderProperty("RayMarchEffect", "Ydirection",0.7,crochet*0.001*1, "cubeOut")
        tweenShaderProperty("RayMarchEffect", "Xdirection",0.7,crochet*0.001*1, "cubeOut")
    elseif curStep == s+30 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,1.5,stepCrochet,"expoIn")
    end
    if curStep == s+32 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",360,crochet*0.001*2, "cubeOut")
        mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.7,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("barrel", "barrel",-5,crochet*0.001*4, "backOut")
    elseif curStep == s+36 then
        tweenShaderProperty("mirror2", "x",1,crochet*0.001*2, "cubeOut")
    elseif curStep == s+40 then
        tweenShaderProperty("mirror2", "angle",0,crochet*0.001*2, "cubeOut")
        mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
    elseif curStep == s+44 then
        tweenShaderProperty("mirror2", "x",2,crochet*0.001*2, "cubeOut")
    elseif curStep == s+48 then
        tweenShaderProperty("barrel", "barrel",0,crochet*0.001*2, "cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("RayMarchEffect", "Ydirection",0,crochet*0.001*1, "cubeOut")
        tweenShaderProperty("RayMarchEffect", "Xdirection",0,crochet*0.001*1, "cubeOut")
        sxm = true
        bfs = false
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",15,crochet*0.001*1, "backOut")
    elseif curStep == s+52 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",-15,crochet*0.001*1, "backOut")
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",0,crochet*0.001*1, "cubeOut")
        mirror(false,true,"","y",0,-1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,stepCrochet*0.001*8,"cubeOut")
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",-15,crochet*0.001*0.5, "cubeOut")
        mirror(false,true,"","y",0,-2,0.5,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == s+62 then
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",15,crochet*0.001*0.5, "cubeOut")
        mirror(false,true,"","y",0,-3,0.5,crochet,"cubeOut")
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == s+64 then
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","y",0,-6,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",40,0,2,crochet,"cubeOut")
        tweenShaderProperty("mirror2", "angle",0,crochet*0.001*2, "cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,stepCrochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*1,"cubeOut")
        bumps("RayMarchEffect","Xdirection",-2,0,stepCrochet,8,"backOut")
        bumps("RayMarchEffect","Ydirection",2,0,stepCrochet,8,"backOut")
    end

    if curStep == s+72 then
        mirror(true,true,"y","y",2,0,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-40,0,2,crochet,"cubeOut")
        bloom(2,1,crochet,2,"cubeOut")
        bumps("RayMarchEffect","Xdirection",2,0,stepCrochet,8,"backOut")
        bumps("RayMarchEffect","Ydirection",-2,0,stepCrochet,8,"backOut")
    elseif curStep == s+80 then
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
    elseif curStep == s+84 then
        setShaderProperty("mirror2","x",0)
        tweenShaderProperty("mirror2", "x",1,crochet*0.001*1, "cubeIn")
    elseif curStep == s+88 then
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,stepCrochet*0.001*8,"backIn")
    elseif curStep == s+92 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == s+94 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,stepCrochet*0.001*2,"cubeIn")
    elseif curStep == s+96 then--480
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,stepCrochet*0.001*8,"cubeOut")
        tweenShaderProperty("mirror2", "x",2,crochet*0.001*1, "cubeOut")
    end
    if curStep == s+100 then
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,0.7,2,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,0.5,crochet,"cubeOut")
    elseif curStep == s+102 then
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,0.5,2,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,0.5,crochet,"cubeOut")
    elseif curStep == s+104 then
        setShaderProperty('glitchy', 'AMT', 0.15)
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"y","y",0,4,2,crochet,"cubeOut")
        tweenShaderProperty("mirror2","angle",-360,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrel","barrel",-10,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.35,crochet*0.001*1,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeIn")
    elseif curStep == s+108 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",4,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.25,crochet*0.001*2,"cubeOut")
    elseif curStep == s+112 then
        bloom(4,1,crochet,2,"cubeOut")
        lascosasdelhud(0,crochet,2,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
        tweenFadeIn("blackBG",0.7,stepCrochet*0.001*16,"cubeOut")
        setShaderProperty('glitchy', 'AMT', 0)
        sxm = false
        bfs = false
        set("defaultCamZoom", 0.5)
    elseif curStep == s+120 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"backIn")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*2,"cubeOut")
    elseif curStep == s+128 then
        sxm = true
        bfs = false
    --    mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale", "strength",0,crochet*0.001*2, "cubeOut")
        lascosasdelhud(1,crochet,4,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
    end
    if  curStep >= s+80 and curStep < s+84 or curStep >= s+88 and curStep < s+92
    then
        if curStep % 4 == 0 then
            caWaveRange = 0.1
            mirror(true,true,"x","x",-0.15,0,1,stepCrochet,"cubeOut")
        end
        if curStep % 4 == 1 then
            mirror(true,true,"x","x",0.15,0,1,stepCrochet,"cubeOut")
        end
        if curStep % 4 == 2 then
            mirror(true,true,"y","y",0.15,0,1,stepCrochet,"cubeOut")
        end
        if curStep % 4 == 3 then
            mirror(true,true,"y","y",-0.15,0,1,stepCrochet,"cubeOut")
            caWaveRange = 0
        end
    end
    if curStep >= s+32 and curStep < s+48 then
        if curStep % 8 == 0 then
            tweenShaderProperty("greyscale", "strength",0.5,crochet*0.001*1, "cubeIn")
            tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeIn")
        elseif curStep % 8 == 4 then
            tweenShaderProperty("greyscale", "strength",0,crochet*0.001*1, "cubeOut")
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            bloom(2,1,crochet,1,"cubeOut")
        end
        if curStep % 4 == 0 then
            --bloom(1.5,1,crochet,1,"cubeOut")
            mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
        elseif curStep % 4 == 2 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
        end
    end
   
end
function droppeak(s)
    if curStep == s then
        setActorY(-9990,"ratingsGroup")
        drunkLerp = 0.5
        drunkSpeed = 4
        serpientelol = 0.25 --altura
        serpientexd = 1.5
        serpientelocuraY = true
        setShaderProperty('glitchy', 'AMT', 0.1)
        setShaderProperty('glitchy', 'SPEED', 0.5)
        sxm = true
        bfs = false
        caWaveSpeed = 2
        caWaveRange = 0.1
        xdxd = 1.5
        perlinxddxddx = true
        triggerEvent('screen shake', (stepCrochet*0.001*128)..',0.01')
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bars","effect2",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('chess', 'transparency', 0.1)
        tweenShaderProperty("pixel","strength",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 0)
        setShaderProperty('godrays', 'decay', 0.6)
        setShaderProperty('titleeffect', 'money', 1.1)
        tweenShaderProperty("bars2","effect",0.1,crochet*0.001*2,"cubeOut")
    elseif curStep == s+24 or curStep == s+120 then
        nose = false
        lerpSpeedY = 5
        noteRotX = 15
        for i = 0, (keyCount * 2) - 1 do
            noteYPos[i + 1] = (i % 2 == 0) and targetnoteYPos[i + 1] + 40 or targetnoteYPos[i + 1] - 40
        end
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
        bumps("mirror2","x",0.15,0,stepCrochet,4,"backOut")
        mirror(true,true,"angle","angle",-25,0,1,crochet,"cubeOut")
        tweenShaderProperty("mirror3","barrel",10,stepCrochet*0.001*8,"cubeIn")
        bumps("RayMarchEffect2","Xdirection",3,0,stepCrochet,4,"backOut")
        bumps("RayMarchEffect2","Ydirection",-3,0,stepCrochet,4,"backOut")
        mirror(true,true,"y","y",1,2,1,crochet,"quadOut")
    elseif curStep == s+28 or curStep == s+124 then
        noteRotX = -15
        for i = 0, (keyCount * 2) - 1 do
            noteYPos[i + 1] = (i % 2 == 0) and targetnoteYPos[i + 1] - 40 or targetnoteYPos[i + 1] + 40
        end
        mirror(false,true,"","zoom",0,0.6,1,crochet,"cubeOut")
        bumps("mirror2","x",-0.15,0,stepCrochet,4,"backOut")
        mirror(true,true,"angle","angle",25,0,1,crochet,"cubeOut")
        bumps("RayMarchEffect2","Xdirection",3,0,stepCrochet,4,"backOut")
        bumps("RayMarchEffect2","Ydirection",-3,0,stepCrochet,4,"backOut")
        mirror(true,true,"x","x",1,2,1,crochet,"quadOut")
    elseif curStep == s+32 or curStep == s+128 then
        nose = true
        setShaderProperty("mirror3","barrel",-10)
        tweenShaderProperty("mirror3","barrel",0,stepCrochet*0.001*32,"cubeOut")
    elseif curStep == s+56 then
        nose = false
        mirror(true,true,"y","y",1,4,2,crochet,"backInOut")
        tweenShaderProperty("barrel","barrel",10,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("bars","effect2",0.5,crochet*0.001*2,"backIn")
        tweenShaderProperty("pixel","strength",60,crochet*0.001*2,"backIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenFadeIn("blackBG",0.45,stepCrochet*0.001*8,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,stepCrochet*0.001*8,"cubeIn")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+60 then
        --mirror(true,true,"x","x",1,2,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == s+64 then
        tweenShaderProperty("bars","effect2",0.07,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("pixel","strength",0,crochet*0.001*2,"cubeOut")
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        setShaderProperty('vignette', 'size', 0.5)
        setShaderProperty('barrel', 'barrel', -6)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*8,"cubeIn")
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeOut")
        setActorColor("dadCharacter0",0,0,0)
        setActorColor("dadCharacter1",0,0,0)
        setActorColor("bfCharacter0",0,0,0)
        setActorColor("bfCharacter1",0,0,0)
        setActorColor("girlfriend",0,0,0)
        setShaderProperty('sobel', 'strength', 0.9)
        tweenShaderProperty("EyeFishEffectGame","power",0,stepCrochet*0.001*8,"cubeOut")
        nose = true
        xdxd = 0.5
        caWaveRange = 0
    elseif curStep == s+72 then
        noteScale = noteScale + 0.5
        bumps("bump","zoom",0.8,1,stepCrochet,4,"cubeOut")
        bumps("bump","barrel",-1,0,stepCrochet,4,"cubeOut")
        bumps("bump","x",0.04,0,stepCrochet,4,"backOut")
        bumps("bump","y",-0.015,0,stepCrochet,4,"backOut")
    elseif curStep == s+80 then
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeOut")
    elseif curStep == s+88 then
        noteScale = noteScale + 0.5
        tweenShaderProperty("bars","effect2",0,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
    elseif curStep == s+96 then
        caWaveRange = 0.1
        setActorProperty("blackBG","alpha",0.0)
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('vignette', 'size', 0.15)
        setActorColor("dadCharacter0",255,255,255)
        setActorColor("dadCharacter1",255,255,255)
        setActorColor("bfCharacter0",255,255,255)
        setActorColor("bfCharacter1",255,255,255)
        setActorColor("girlfriend",255,255,255)
        setShaderProperty('sobel', 'strength', 0)
        --mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        xdxd = 1.5
    end
    if curStep == s+120 then
        tweenShaderProperty("bars2","effect",0.5,crochet*0.001*2,"backIn")
        for i = 0,(keyCount * 2) - 1 do 
            if difficulty == "VOIID" then
                if (i >= 0 and i <= 8) then
                    targetnoteZPos[i+1] = -500
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                elseif (i >= 9 and i <= 17) then
                    if not middlescroll then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = 0
                end 
            else
                 if (i >= 0 and i <= 3) then
                    targetnoteZPos[i+1] = -500
                    tween("note"..i,{alpha = 0.3},crochet*0.001*2,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                    if not middlescroll then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    targetnoteZPos[i+1] = 0
                end 
            end
        end
    elseif curStep == s+128 then
        perlinxddxddx = false
    end
    if curStep >= s+56 and curStep < s+64 then
        if curStep % 4 == 0 then
            lerpSpeedY = 5
            noteScale = noteScale + 0.3
            bumps("mirror2","x",0.1,0,stepCrochet,2,"cubeOut")
            bumps("mirror","angle",-25,0,stepCrochet,2,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteYPos[i+1] = targetnoteYPos[i+1] + 70
            end
        elseif curStep % 4 == 2 then
            bumps("mirror2","x",-0.1,0,stepCrochet,2,"cubeOut")
            bumps("mirror","angle",25,0,stepCrochet,2,"cubeOut")
            for i = 0,(keyCount * 2) - 1 do
                noteYPos[i+1] = targetnoteYPos[i+1] - 70
            end
        end
    end
    if curStep >= s and curStep < s+64 or curStep >= s+96 and curStep < s+128 then
        if nose then
            if curStep % 4 == 0 then
                tweenShaderProperty("EyeFishEffectGame","power",0.25,stepCrochet*0.001*2,"cubeOut")
                mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
       
            elseif curStep % 4 == 2 then
                tweenShaderProperty("EyeFishEffectGame","power",0.0,stepCrochet*0.001*2,"cubeIn")
                mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
            end
            if curStep % 16 == 0 then
                mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
                mirror(true,true,"y","y",0,1,1,crochet,"cubeOut")
               --tweenShaderProperty("RayMarchEffect2","Ydirection",-0.8,stepCrochet*0.001*4,"cubeOut")
                --tweenShaderProperty("RayMarchEffect2","Xdirection",0.8,stepCrochet*0.001*4,"cubeOut")
            elseif curStep % 16 == 4 then
                mirror(true,true,"x","x",0,1,1,crochet,"cubeOut")
               -- tweenShaderProperty("RayMarchEffect2","Ydirection",0,stepCrochet*0.001*4,"cubeIn")
                --tweenShaderProperty("RayMarchEffect2","Xdirection",0,stepCrochet*0.001*4,"cubeIn")
                mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
            elseif curStep % 16 == 8 then
                mirror(true,true,"y","y",1,2,1,crochet,"cubeOut")
               -- tweenShaderProperty("RayMarchEffect2","Ydirection",0.8,stepCrochet*0.001*4,"cubeOut")
                --tweenShaderProperty("RayMarchEffect2","Xdirection",-0.8,stepCrochet*0.001*4,"cubeOut")
                mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
            elseif curStep % 16 == 12 then
                mirror(true,true,"x","x",1,2,1,crochet,"cubeOut")
                --tweenShaderProperty("RayMarchEffect2","Ydirection",0,stepCrochet*0.001*4,"cubeIn")
                --tweenShaderProperty("RayMarchEffect2","Xdirection",0,stepCrochet*0.001*4,"cubeIn")
                mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
            end
        end
        if curStep % 8 == 0 then
            bloom(2,1,crochet,1,"cubeOut")
            bumps("bump","x",0.04,0,stepCrochet,4,"backOut")
            bumps("bump","y",-0.015,0,stepCrochet,4,"backOut")
            noteScale = noteScale + 0.3
            for i = 0, (keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] + 30
                noteAngle[i + 1] = -25
            end
        elseif curStep % 8 == 4 then
            noteScale = noteScale + 0.3
            bumps("bump","x",-0.04,0,stepCrochet,4,"backOut")
            bumps("bump","y",-0.015,0,stepCrochet,4,"backOut")
            for i = 0, (keyCount * 2) - 1 do
                noteXPos[i + 1] = targetnoteXPos[i + 1] - 30
                noteAngle[i + 1] = 25
            end
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