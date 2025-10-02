function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
local characters = {"dadCharacter0", "dadCharacter1","boyfriend"}
local yPositions = {30, 400, 440}  
local xPositions = {-12, -12, 30} --1,9,18
local originalPositions = {}

function posiciones(context, spacing)
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "players" then        
            set(character .. ".x", xPositions[i] * spacing)
            set(character .. ".y", yPositions[i] or 0)
        elseif context == "game" then
            local originalPos = originalPositions[character]
            if originalPos then
                set(character .. ".x", originalPos.x)
                set(character .. ".y", originalPos.y)
            end
        end
        setCamera(character, context)
    end
end
function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if moverDadCharacters then
            if i <= 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
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
    makeCamera("players")
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
        tween("note"..i,{alpha = 1},crochet*0.001*32,"cubeOut")
    end
    makeSprite('global', '', -1110, 0)
    makeSprite('player', '', -1110, 0)
    makeSprite('opponent', '', -1110, 0)

    
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920/getCamZoom(), 1080/getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))

    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end


    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    

    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 4)

    initShader('sobel2', 'SobelEffect')
    setCameraShader('players', 'sobel2')
    setShaderProperty('sobel2', 'strength', 0)
    setShaderProperty('sobel2', 'intensity', 4)

    initShader('glowBorder', 'glowBorder')--
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'transparency', 1)
    setShaderProperty('glowBorder', 'transparency2', 1)
    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    lascosasdelhud(0,crochet,1,"cubeOut")

    initShader('rarete', 'greyscalemoving') 
    setCameraShader("game","rarete")
    setShaderProperty("rarete","strength",0)

    initShader('mirror0', 'PincushNewEffect')--
    setCameraShader('players', 'mirror0')
    setShaderProperty('mirror0', 'zoom', 0)
    setShaderProperty('mirror0', 'angle',0)
	setShaderProperty('mirror0', 'x', 0)
    setShaderProperty('mirror0', 'y', 0)
	setShaderProperty('mirror0', 'barrel', 0)
    setShaderProperty('mirror0', 'doChroma', true)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0)
    setShaderProperty('mirror', 'angle',-20)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', -1)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel',2)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'zoom', 1)
	setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setCameraShader('players', 'godrays')
    setShaderProperty('godrays', 'decay', 0.8)
    setShaderProperty('godrays', 'density',0.15)
    setShaderProperty('godrays', 'weigth', 0.5)
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)
    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0)
    initShader('fish', 'EyeFishEffect')--
    setCameraShader('game', 'fish')
    setShaderProperty('fish', 'power', 0)

    initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setCameraShader('players', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.1)
    
    initShader('scanline', 'ScanlineEffect')
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setCameraShader('players', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)



    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.2)
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)
    setProperty('', 'cameraSpeed', 5)


    
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

local serpientelocuraY = false
local serpientelol = 0.5 --altura
local serpientexd = 0.4 --velocidad
local time = 0 
local sxm = true
local bfs = false
local cam = false
local caWave = 0
local caWaveSpeed = 4
local caWaveRange = 0
function update(elapsed)
    local currentBeat = (songPos / 1000) * (bpm / 60) 
    if serpientelocuraY then
        for i = 0, (keyCount * 2) - 1 do
            noteYPos[i + 1] = noteYPos[i + 1] + (serpientelol * math.sin(currentBeat * serpientexd + i)) --buenserpientexdxdxd
        end
    end
    time = time + elapsed
    setCustomShaderFloat("godrays","iTime",time*2)
    setCustomShaderFloat("titleeffect","uTime",time*2)
    setCustomShaderFloat("glitchy","iTime",time)
    setCustomShaderFloat("glowBorder","iTime",time*2)
    setCustomShaderFloat("speedlines","iTime",time)
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    if sxm then
        set("camFollow.x",655)
        set("camFollow.y",550)
        set("defaultCamZoom", 0.75)
    end
    if bfs then
        set("camFollow.x",1605)
        set("camFollow.y",650)
        set("defaultCamZoom", 0.85)
    end
    if cam then
        set("defaultCamZoom", 0.55)
        set("camFollow.x",1125)
        set("camFollow.y",500)
    end
    barrel = lerp(barrel, 0, elapsed*8)
    setShaderProperty('barrel', 'barrel', barrel)

    angle = lerp(angle, 0, elapsed*8)
    setShaderProperty('barrel', 'angle', angle)

    x = lerp(x, 0, elapsed*8)
    setShaderProperty('barrel', 'x', x)

    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('barrel', 'zoom', zoom)
end
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
    bloom(0,1,crochet,4,"linear")
    tweenShaderProperty('bars','effect',0,crochet*0.001*4,'cubeOut')
    tweenShaderProperty('mirror2','barrel',0,crochet*0.001*16,'cubeOut')
    mirror(false,true,"","zoom",0,1,12,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,16,crochet,"cubeOut")
    mirror(false,true,"","y",0,0,8,crochet,"cubeOut")
end
local swap = 1
local flechasY = false
local lolxd = false
local flechaslolxd = false
local temblor = false
local temblores = {1568,1596,1600,1624,1632,1656,1660,1708,1728,
2624,2680,2688,2720,2748,2752,2808,2816,2848,2872,2876,2880,2936,
2944,2976,3004,3008,3064,3072,3104,3132,3744,3772,3776,3800,3808,
3832,3836,3840,3896,3904,3932,3936,3944,3952,3960,3964,3980,3982,3984}

function stepHit()
    for i = 1, #temblores do
        if curStep == temblores[i] then
           bump()
           noteScale = noteScale + 0.3
           if flechaslolxd then
            flechas(0,true)
           end
           if lolxd then
            swap = swap * -1
            for i = 0, (keyCount * 2) - 1 do
                if i % 2 == 0 then
                    noteAngle[i+1] = 25*swap
                else
                    noteAngle[i+1] = -25*swap
                end
            end
            noteScale = noteScale + 0.3
            setShaderProperty('glitchy', 'AMT', 0.25)
            tweenShaderProperty('glitchy', 'AMT', 0.03,crochet*0.001*1, 'cubeOut')
            bloom(2.5,1,crochet,1,"cubeOut")
           end
        end
    end
    if curStep % 16 == 0 and ((curStep >= 0 and curStep <= 256) or (curStep >= 1536 and curStep <= 1792)) then
        barrel = -1
        noteScale = noteScale + 0.25
    end
    if (curStep >= 768 and curStep <= 992 or curStep >= 2304 and curStep <= 2528 ) then
        if curStep % 16 == 0 then
            for i = 0,(keyCount * 2) - 1 do
                noteAngle[i+1] = 25
            end
        end
        if curStep % 16 == 8 then
            for i = 0,(keyCount * 2) - 1 do
                noteAngle[i+1] = -25
            end
        end
    end
    
    if (curStep >= 256 and curStep <= 512 or curStep >= 768 and curStep <= 992 or curStep >= 1792 and curStep <= 2048 
    or curStep >= 2304 and curStep <= 2528 ) and curStep % 8 == 0  then
        barrel = -1.5
        noteScale = noteScale + 0.25
        zoom = 0.8
        if temblor then
            triggerEvent('screen shake',(stepCrochet*0.001*4)..',0.01')
        end
        if flechasY then
            flechas(0,true)
        end
    end

    if curStep % 32 == 0 and curStep <= 240 then
        setShaderProperty('caBlue', 'strength', 0.007)
        tweenShaderProperty('caBlue', 'strength', 0.001,crochet*0.001*3, 'cubeOut')
        flechas(0,true)
    end
    if (curStep >= 520 and curStep <= 608 or curStep >= 2056 and curStep <= 2144) and curStep % 16 == 0 then
        mirror(true, true, "x", "x", 2, 0, 3, crochet, "cubeInOut")
    end
    if curStep >= 640 and curStep <= 752 or curStep >= 2176 and curStep <= 2288 then
        if curStep % 16 == 4 then
        mirror(true, true, "y", "y", - 2, 0, 2.5, crochet, "cubeInOut")
        elseif curStep % 16 == 12 then
            mirror(true, true, "x", "x", - 2, 0, 2.5, crochet, "cubeInOut")
        end
    end
    
    if curStep == 64 then
        bfs = true
        sxm = false
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 112 then
        flechas(0,true)
        setShaderProperty('caBlue', 'strength', 0.005)
        tweenShaderProperty('caBlue', 'strength', 0.001,crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('bars','effect',0.35,crochet*0.001*4,'expoIn')
        tweenShaderProperty('fish','power',0.2,crochet*0.001*4,'expoIn')
        mirror(false,true,"","zoom",0,3,4,crochet,"expoIn")
        mirror(false,true,"","angle",0,-180,4,crochet,"expoIn")
    elseif curStep == 120 or curStep == 1528 then
        flechas(1)
        lerpSpeedZ = 2
    elseif curStep == 128 then
        bfs = false
        sxm = false
        for i = 0,(keyCount * 2) - 1 do
            noteAngle[i+1] = 360
        end
        cam = true
        bloom(4,1,crochet,4,"cubeOut")
        mirror(false,true,"","zoom",0,1,32,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-360,32,crochet,"cubeIn")
        tweenShaderProperty('fish','power',0,crochet*0.001*32,'expoIn')
        tweenShaderProperty('bars','effect',0,crochet*0.001*28,'expoIn')
    elseif curStep == 224 then
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*8,'cubeOut')
    elseif curStep == 240 then
        flechas(0,true)
        setShaderProperty('caBlue', 'strength', 0.005)
        tweenShaderProperty('caBlue', 'strength', 0.001,crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*2,'expoIn')
        tweenShaderProperty('bars','effect2',0.6,crochet*0.001*2,'expoIn')
    elseif curStep == 248 then
        lerpSpeedZ = 5
        for i = 0,(keyCount * 2) - 1 do
            targetnoteZPos[i + 1] = 0
        end
    elseif curStep == 256 then
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('bars','effect2',0,crochet*0.001*2,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        cam = false
        sxm = true
        lascosasdelhud(1,crochet,4,"cubeOut")
    elseif curStep == 512 or curStep == 2048 then
        flechas(2,true)
    elseif curStep == 568 or curStep == 2104 then
        flechas(2,false)
    end
    if curStep == 624 or curStep == 2160 then
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeOut')
    elseif curStep == 632 or curStep == 2168 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('zoomblurgame','focusPower',5,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirror2','barrel',1,crochet*0.001*1,'cubeOut')
        mirror(true,true,"x","x",-4,0,4,crochet,"cubeInOut")
    elseif curStep == 636 or curStep == 2172 then
        tweenShaderProperty('mirror2','barrel',-2,crochet*0.001*1,'expoIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == 640 or curStep == 2176 then
        sxm = true
        for i = 0,(keyCount * 2) - 1 do
        tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] 
        targetnoteZPos[i + 1] = 0
        end
        cam = false
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty('mirror2','barrel',0,crochet*0.001*2,'cubeOut')
    elseif curStep == 704 or curStep == 2240 then
        sxm = false
        bfs = true
    elseif curStep == 760 or curStep == 2296 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-25,2,crochet,"cubeIn")
        tweenShaderProperty('fish','power',0.2,crochet*0.001*1,'cubeOut')
    elseif curStep == 764 or curStep == 2300 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 768 or curStep == 2304 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('fish','power',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        temblor = true
        bfs = false
        set("defaultCamZoom", 0.65)
    end

    if curStep == 864 or curStep == 2400 then
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,2,crochet,"cubeOut")
        tweenShaderProperty('zoomblurgame','focusPower',5,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('fish','power',0.2,crochet*0.001*2,'cubeOut')
    elseif curStep == 876 or curStep == 2412 then
        mirror(false,true,"","zoom",0,1.1,1,crochet,"quartOut")
        mirror(false,true,"","angle",0,0,1,crochet,"quartOut")
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*1,'cubeOut')
    elseif curStep == 880 or curStep == 2416 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,2,crochet,"cubeOut")
    elseif curStep == 888 or curStep == 2424 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,100,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.35,crochet*0.001*2,'cubeIn')
    elseif curStep == 892 or curStep == 2428 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,140,1,crochet,"cubeIn")
    elseif curStep == 896 or curStep == 2432 then
        bloom(4,1,crochet,4,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,16,crochet,"cubeOut")
        tweenShaderProperty('fish','power',0,crochet*0.001*1,'cubeOut')
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*4,'cubeOut')
        temblor = false
        flechasY = true
        sxm = true
        cam = false
    elseif curStep == 956 or curStep == 2492 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
        tweenShaderProperty('fish','power',0.1,crochet*0.001*1,'cubeIn')
        tweenShaderProperty('bars','effect',0.17,crochet*0.001*1,'cubeIn')
    elseif curStep == 960 or curStep == 2496 then
        sxm = false
        cam = true
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*4,'cubeOut')
    elseif curStep == 1008 or curStep == 2544 then
        tweenShaderProperty('zoomblurgame','focusPower',5,crochet*0.001*3,'cubeOut')
        tweenShaderProperty('mirror2','barrel',-2,crochet*0.001*4,'cubeIn')
    elseif curStep == 1016 or curStep == 2552 then
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeIn')
        lascosasdelhud(0,crochet,2,"cubeOut")
        
    elseif curStep == 1020 or curStep == 2556 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*2,'cubeIn')
    elseif curStep == 1024 then
        tweenShaderProperty('fish','power',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*1,'cubeOut')
        setShaderProperty('mirror2','barrel',-10)
        tweenShaderProperty('mirror2','barrel',0.5,crochet*0.001*8,'cubeOut')

    end
    if curStep == 2556 then
        bloom(1,0,crochet,1,"cubeIn")
    end
    if curStep == 1520 then
        tweenShaderProperty('mirror2','barrel',-2,crochet*0.001*4,'cubeIn')
    elseif curStep == 1528 then
        tweenShaderProperty('vignette','size',0.5,crochet*0.001*2,'expoIn')
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'expoIn')
        tweenShaderProperty('fish','power',0.2,crochet*0.001*2,'expoIn')
        tweenShaderProperty('bars','effect',0.35,crochet*0.001*2,'expoIn')
        mirror(false,true,"","zoom",0,3,2,crochet,"expoIn")
    elseif curStep == 1536 then
        setShaderProperty('mirror2','barrel',-10)
        tweenShaderProperty('mirror2','barrel',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('sobel','strength',0,crochet*0.001*4,'cubeOut')
        setShaderProperty('glowBorder', 'transparency', 1)
        setShaderProperty('speedlines', 'transparency', 1)
        setShaderProperty('titleeffect', 'money',0)
        bloom(4,1,crochet,4,"cubeOut")
        posiciones("game")
        bump()
        --flashCamera("game","white",0.5)
        tween('girlfriend',{alpha = 1},crochet*0.001*4,'cubeOut')
        caWaveRange = 0
    elseif curStep == 1632 then
        mirror(true,true,"angle","angle",0,180,8,crochet,"expoIn")
    elseif curStep == 1664 then
        bloom(4,1,crochet,2,"cubeOut")
        bump()
        mirror(false,true,"","angle",0,360,28,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,28,crochet,"cubeIn")
        tweenShaderProperty('bars','effect',0,crochet*0.001*28,'linear')
        tweenShaderProperty('fish','power',0,crochet*0.001*28,'cubeIn')
    elseif curStep == 1776 then
        mirror(true,true,"angle","angle",0,10,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*3,'cubeIn')
    elseif curStep == 1780 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeIn")
    elseif curStep == 1784 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        for i = 0,(keyCount * 2) - 1 do
            targetnoteZPos[i + 1] = 0
        end
        flechasY = false
    elseif curStep == 1788 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 1792 then
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*1,'cubeOut')
        tweenShaderProperty('vignette','size',0.2,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
        
        temblor = false
        cam = false
        sxm = true
        lascosasdelhud(1,crochet,4,"cubeOut")
    end
    if curStep >= 512 and curStep <= 768 or curStep >= 2048 and curStep <= 2304 then
        local mod128 = curStep % 128
        local barrelZoomSteps = {0, 96, 112, 116, 120} 
        local barrelSteps = {8, 16, 24, 40, 48, 56, 72, 80, 90, 104}
        local zoomSteps = {20, 32, 52, 60, 64, 78, 84, 94, 108, 124}
        for _, step in ipairs(barrelZoomSteps) do
            if mod128 == step then
                barrel = -1.5
                zoom = 0.8
                noteScale = noteScale + 0.3
                break
            end
        end
        for _, step in ipairs(barrelSteps) do
            if mod128 == step then
                barrel = -1.5
                noteScale = noteScale + 0.25
                break
            end
        end
        for _, step in ipairs(zoomSteps) do
            if mod128 == step then
                zoom = 0.8
                noteScale = noteScale + 0.2
                break
            end
        end
    end
    parte1(256)
    parte1(1792)
    drop(1024)
    if (curStep >= 1024 and curStep <= 1280 or curStep >= 1344 and curStep <= 1516 or curStep >= 3200 and curStep <= 3456 or curStep >= 3520 and curStep <= 3696) then
        if curStep % 8 == 0 then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        end
        if curStep % 16 == 4 then
            mirror(true,true,"y","y",0,1,1,crochet,"cubeIn")
        elseif curStep % 16 == 12 then
            mirror(true,true,"y","y",1,2,1,crochet,"cubeIn")
        end
        if curStep % 16 == 0 then
            bloom(3,1,crochet,2,"cubeOut")
           -- tweenShaderProperty('mirror2','angle',25,crochet*0.001*1,'cubeOut')
            setShaderProperty('mirror2','barrel',5)
            tweenShaderProperty('mirror2','barrel',0.5,crochet*0.001*2,'cubeOut')
        elseif curStep % 16 == 4 or curStep % 16 == 12 then
        --    tweenShaderProperty('mirror2','angle',0,crochet*0.001*1,'cubeIn')
        elseif curStep % 16 == 8 then
       --     tweenShaderProperty('mirror2','angle',-25,crochet*0.001*1,'cubeOut')
            bloom(3,1,crochet,2,"cubeOut")
            setShaderProperty('mirror2','barrel',-5)
            tweenShaderProperty('mirror2','barrel',0.5,crochet*0.001*2,'cubeOut')
        end
        
    end

    if curStep >= 3200 and curStep <= 3240 or curStep >= 3264 and curStep <= 3296  then
        if curStep % 16 == 0  then
           angle = 20
           x = -0.15
           bump()
           flechas(0,false)

        elseif curStep % 16 == 8 then
            angle = -20
           x = 0.15
           bump()
           flechas(0,false)
        end
    end
    if curStep >= 3296 and curStep <= 3456 or curStep >= 3520 and curStep <= 3712 then
        if curStep % 32 == 0 or curStep % 32 == 8 or curStep % 32 == 16 or curStep % 32 == 22
        or curStep % 32 == 28 then
            swap = swap * -1
            bump()
            flechas(0,false)
           angle = 20*swap
           x = -0.15*swap
        end
    end

    if curStep == 3312 then
        tweenShaderProperty('mirror0','x',1,crochet*0.001*4,'expoIn')
        if difficulty == "VOIID" then
            for i = 0, 8 do
                local offset
                    if i >= 0 and i <= 3 then
                        offset = 20
                    elseif i >= 5 and i <= 8 then
                        offset = -40
                    end
                if i ~= 4 then  
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                end
            end
        else
            for i = 0, 3 do
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] 
            end
        end
    elseif curStep == 3328 then
        if difficulty == "VOIID" then
            for i = 0, 8 do
                noteAngle[i+1] = 360
            end
        else
            for i = 0, 3 do
                noteAngle[i+1] = 360
            end
        end

    elseif curStep == 3360 then
        setShaderProperty('mirror0','y',0)
        tweenShaderProperty('mirror0','y',-1,crochet*0.001*1,'cubeOut')
    elseif curStep == 3368 then
        tweenShaderProperty('mirror0','y',-2,crochet*0.001*1,'cubeOut')
    elseif curStep == 3432 then
        tweenShaderProperty('mirror0','x',0,crochet*0.001*4,'expoIn')
    end
    if curStep == 3568 then
        tweenShaderProperty('mirror0','x',-1,crochet*0.001*4,'expoIn')
        if difficulty == "VOIID" then
            for i = 9, 17 do
                local offset
                    if i >= 9 and i <= 12 then
                        offset = 20
                    elseif i >= 14 and i <= 17 then
                        offset = -40
                    end
                if i ~= 13 then  
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                end
            end
        else
            for i = 4, 7 do
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] 
            end
        end
    elseif curStep == 3568+16 then
        if difficulty == "VOIID" then
            for i = 9, 17 do
                noteAngle[i+1] = 360
            end
        else
            for i = 4, 7 do
                noteAngle[i+1] = 360
            end
        end
    elseif curStep == 3616 then
        setShaderProperty('mirror0','y',0)
        tweenShaderProperty('mirror0','y',1,crochet*0.001*1,'cubeOut')
    elseif curStep == 3624 then
        tweenShaderProperty('mirror0','y',2,crochet*0.001*1,'cubeOut')
    elseif curStep == 3696 then
        tweenShaderProperty('mirror0','x',0,crochet*0.001*4,'expoIn')
    end   
    if curStep == 3200 then
        caWaveRange = 0.015

    elseif curStep == 3244 then
        mirror(false,true,"","angle",0,-40,1,crochet,"expoIn")
        tween("blackBG",{alpha = 0.8},crochet*0.001*1,'expoIn')
    elseif curStep == 3248 then
        for i = 0,(keyCount * 2) - 1 do
            noteAngle[i+1] = 40
        end
        mirror(false,true,"","angle",0,-110,2,crochet,"expoIn")
    elseif curStep == 3256 then
        for i = 0,(keyCount * 2) - 1 do
            noteAngle[i+1] = -40
        end
        mirror(false,true,"","angle",0,-180,2,crochet,"expoIn")
    elseif curStep == 3264 then

        mirror(false,true,"","angle",0,-360,2,crochet,"cubeOut")
        tween("blackBG",{alpha = 0},crochet*0.001*2,'cubeOut')
    end
    if curStep == 3308 or curStep == 3564 then
        mirror(false,true,"","x",0,1,1,crochet,"expoIn")
        tween("blackBG",{alpha = 0.8},crochet*0.001*1,'expoIn')
    elseif curStep == 3312 or curStep == 3568 then
        mirror(false,true,"","x",0,-1,1.5,crochet,"expoIn")
    elseif curStep == 3318 or curStep == 3574 then
        mirror(false,true,"","x",0,1,1.5,crochet,"expoIn")
    elseif curStep == 3324 or curStep == 3580 then
        mirror(false,true,"","x",0,0,1,crochet,"expoIn")
    elseif curStep == 3328 or curStep == 3584 then
        tween("blackBG",{alpha = 0},crochet*0.001*2,'cubeOut')
    end
    if curStep == 3372 or curStep == 3628 then
        mirror(true,true,"angle","angle",0,40,1,crochet,"expoIn")
        tween("blackBG",{alpha = 0.8},crochet*0.001*1,'expoIn')
    elseif curStep == 3376 or curStep == 3632 then
        mirror(false,true,"","angle",0,80,1.5,crochet,"expoIn")
    elseif curStep == 3382 or curStep == 3638 then
        mirror(false,true,"","angle",0,120,1.5,crochet,"expoIn")
    elseif curStep == 3388 or curStep == 3644 then
        mirror(false,true,"","angle",0,180,1,crochet,"expoIn")
    elseif curStep == 3392 or curStep == 3648 then
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
        tween("blackBG",{alpha = 0},crochet*0.001*2,'cubeOut')
    end
    if curStep == 3436 then
        mirror(false,true,"","x",0,-1,1,crochet,"expoIn")
        tween("blackBG",{alpha = 0.8},crochet*0.001*1,'expoIn')
    elseif curStep == 3440 then
        mirror(false,true,"","x",0,1,1.5,crochet,"expoIn")
    elseif curStep == 3446 then
        mirror(false,true,"","x",0,-1,1.5,crochet,"expoIn")
    elseif curStep == 3448 then
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*2,'backIn')
        if difficulty == "VOIID" then
            for i = 0, 17 do
                if i == 4 or i == 13 then
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X']
                    tween("note"..i, {alpha = 0}, crochet * 0.001 * 2, "cubeOut")
                elseif i >= 0 and i <= 8 then
                    tween("note"..i, {alpha = 0}, crochet * 0.001 * 2, "cubeOut")
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X']
                else
                    tween("note"..i, {alpha = 1}, crochet * 0.001 * 2, "cubeOut")
                    local offset = 0
                    if i >= 9 and i <= 12 then
                        offset = middlescroll and -20 or -280
                    elseif i >= 14 and i <= 17 then
                        offset = middlescroll and 20 or -340
                    end
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                end
            end
        else
            for i = 0, 7 do
                if i >= 0 and i <= 3 then
                    tween("note"..i, {alpha = 0}, crochet * 0.001 * 2, "cubeOut")
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X']
                else
                    tween("note"..i, {alpha = 1}, crochet * 0.001 * 2, "cubeOut")
                    local offset = 0
                    if i >= 4 and i <= 7 then
                        offset = middlescroll and 0 or -320
                    end
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                end
            end
        end
        
        
        
        
    elseif curStep == 3452 then
        mirror(false,true,"","x",0,0,1,crochet,"expoIn")
        tweenShaderProperty('fish','power',0.2,crochet*0.001*1,'expoIn')
        mirror(false,true,"","zoom",0,2.5,1,crochet,"expoIn")
    elseif curStep == 3456 then--1280
        for i = 0,17 do
            noteAngle[i+1] = 360
            
        end
        setActorAlpha(0.7, 'blackBG')
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*1,'cubeOut')
        bfs = true
        setShaderProperty('titleeffect', 'money',0)
        cam = false
        setShaderProperty('sobel', 'strength', 0)
        posiciones("game")
        tweenShaderProperty('mirror0','x',0,crochet*0.001*1,'cubeOut')
        caWaveRange = 0
        setShaderProperty('speedlines', 'transparency', 1)
        tweenShaderProperty('bars','effect',0,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeOut')
        bloom(4,1,crochet,2,"linear")
    elseif curStep == 3464 then
        mirror(true,true,"angle","angle",0,40,6,crochet,"cubeIn")
    elseif curStep == 3484 then
        bump()
    elseif curStep == 3488 then
        bump()
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,8,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeOut")
    elseif curStep == 3496 then
        bump()
        mirror(false,true,"","angle",0,-60,2,crochet,"cubeOut")
    elseif curStep == 3504 then
        bump()
        mirror(false,true,"","angle",0,-90,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*4,'cubeIn')
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*4,'cubeIn')
    elseif curStep == 3508 then
        bump()
        mirror(false,true,"","angle",0,-110,1,crochet,"cubeOut")
    elseif curStep == 3512 then
        bump()
        mirror(false,true,"","angle",0,-130,1,crochet,"cubeOut")
    elseif curStep == 3516 then
       -- bump()
        mirror(false,true,"","angle",0,-180,1,crochet,"expoIn")
    elseif curStep == 3520 then
        if difficulty == "VOIID" then
            for i = 0, 17 do
                local offset = 0
                if i >= 9 and i <= 12 then
                    offset = middlescroll and -280 or -600
                elseif i >= 14 and i <= 17 then
                    offset = middlescroll and -340 or -660
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0, 7 do
                local offset = 0
                if i >= 3 and i <= 7 then
                    offset = middlescroll and -320 or -640
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        end
        
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*4,'cubeOut')
        setActorAlpha(0, 'blackBG')
        setShaderProperty('sobel', 'strength', 0.5)
        caWaveRange = 0.015
        bfs = false
        cam = true
        posiciones("players", 50)
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        bloom(4,1,crochet,2,"linear")
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShaderProperty('fish','power',0.1,crochet*0.001*1,'cubeOut')
        setShaderProperty('titleeffect', 'money',1.1)
    elseif curStep == 3696 then
        tweenShaderProperty('bars','effect2',0.6,crochet*0.001*4,'expoIn')
        tweenShaderProperty('mirror2','barrel',-10,crochet*0.001*4,'expoIn')
        mirror(false,true,"","zoom",0,5,4,crochet,"expoIn")
    
    elseif curStep == 3712 then
        lolxd = false
        tweenShaderProperty('fish','power',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('bars','effect2',0,crochet*0.001*8,'cubeOut')
        mirror(true,true,"zoom","zoom",0,1,16,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,16,crochet,"cubeOut")
        tweenShaderProperty('mirror2','barrel',0,crochet*0.001*8,'cubeOut')
        tweenShaderProperty('sobel','strength',0,crochet*0.001*4,'cubeOut')
        setShaderProperty('glowBorder', 'transparency', 1)
        setShaderProperty('glitchy', 'AMT', 0)
        setShaderProperty('speedlines', 'transparency', 1)
        setShaderProperty('titleeffect', 'money',0)
        bloom(4,1,crochet,4,"cubeOut")
        posiciones("game")
        sxm = true
        cam = false
        drunkLerp = 0
        drunkSpeed = 0
        flechaslolxd = true
        bump()
        for i = 0,17 do
            noteAngle[i+1] = -360
        end
        tween('girlfriend',{alpha = 1},crochet*0.001*4,'cubeOut')
        caWaveRange = 0
    elseif curStep == 3776 then
        sxm = false
        bfs = true
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 3832 then
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeIn')
    elseif curStep == 3840 then
        bfs = false
        bloom(4,1,crochet,2,"cubeOut")
        set("defaultCamZoom", 0.6)
        setProperty('', 'cameraSpeed', 1)
    elseif curStep == 3936 then
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*6,'cubeIn')
    elseif curStep == 3960 then
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeOut')
    elseif curStep == 3984 then
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 4000 then
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*12,'cubeIn')
        tweenShaderProperty('zoomblurgame','focusPower',5,crochet*0.001*12,'cubeIn')
    elseif curStep == 4032 then
        mirror(false,true,"","zoom",0,0,12,crochet,"cubeIn")
        bloom(1,0,crochet,8,"cubeIn")
    end


    if curStep == 3200 then
        movimiento({1,8,0}, 3, "cubeOut", true)
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
    elseif curStep == 3448 then
        movimiento({-12,-12,0}, 2, "cubeIn", true)
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*2,'cubeIn')
    elseif curStep == 3520 then
        movimiento({0,0,18}, 3, "cubeOut", false)
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
    elseif curStep == 3704 then
        movimiento({0,0,30}, 2, "cubeIn", false)
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*2,'cubeIn')
    end

    if curStep == 1024 or curStep == 3200 then
        lerpSpeedX = 3
        if difficulty == "VOIID" then
            for i = 0, 17 do 
                if i == 4 or i == 13 then
                    targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] -70
                    tween("note"..i, {alpha = 0}, crochet * 0.001 * 2, "cubeOut")
                else
                    local offset
                    if i >= 0 and i <= 3 then
                        offset = 660
                    elseif i >= 5 and i <= 8 then
                        offset = 600
                    elseif i >= 9 and i <= 12 then
                        offset = middlescroll and -280 or -600
                    elseif i >= 14 and i <= 17 then
                        offset = middlescroll and -340 or -660
                    end
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                    if i >= 9 and i <= 17 then
                        tween("note"..i,{alpha = 0}, crochet * 0.001 * 12, "linear")
                    end
                end
            end
        else
            for i = 0, 7 do 
                    local offset
                    if i >= 0 and i <= 3 then
                        offset = 640
                    elseif i >= 4 and i <= 7 then
                        offset = middlescroll and -320 or -640
                    end
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                    if i >= 4 and i <= 7 then
                        tween("note"..i,{alpha = 0}, crochet * 0.001 * 12, "linear")
                    end
            end
        end
    elseif curStep == 1080 or curStep == 1208 or curStep == 1336 or curStep == 1464 then
        if difficulty == "VOIID" then
            for i = 0, 17 do
                if i >= 9 and i <= 17 then
                    if i ~= 4 and i ~= 13 then  
                        tween("note"..i, {alpha = 1}, crochet * 0.001 * 2, "cubeOut")
                    end
                end
            end
        else
            for i = 0, 7 do
                if i >= 4 and i <= 7 then
                    tween("note"..i, {alpha = 1}, crochet * 0.001 * 2, "cubeOut")
                end
            end
        end
    elseif curStep == 1088 or curStep == 1472 then
        if difficulty == "VOIID" then
            for i = 0, 8 do
                local offset
                    if i >= 0 and i <= 3 then
                        offset = 20
                    elseif i >= 5 and i <= 8 then
                        offset = -40
                    end
                if i ~= 4 then  
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                tween("note"..i,{alpha = 0},crochet*0.001*6,"cubeOut")
                noteAngle[i+1] = 360
                end
            end
        else
            for i = 0, 3 do
           
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X']
                tween("note"..i,{alpha = 0},crochet*0.001*6,"cubeOut")
                noteAngle[i+1] = 360
                
            end
        end
    elseif curStep == 1152 then
        if difficulty == "VOIID" then
            for i = 0, 8 do
                if i ~= 4 then
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                end
            end
            for i = 9,17 do
                local offset
                if i >= 9 and i <= 12 then
                    offset = 20
                elseif i >= 14 and i <= 17 then
                    offset = -40
                end
                if i ~= 13 then  
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                    tween("note"..i,{alpha = 0},crochet*0.001*8,"cubeOut")
                    noteAngle[i+1] = -360
                end
            end
        else
            for i = 0, 3 do
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
            for i = 4,7 do
                
                
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] 
                    tween("note"..i,{alpha = 0},crochet*0.001*8,"cubeOut")
                    noteAngle[i+1] = -360
                
            end
        end
    elseif curStep == 1216  or curStep == 1344 then
        if difficulty == "VOIID" then
            for i = 0,8 do
                local offset
                if i >= 0 and i <= 3 then
                    offset = 660
                elseif i >= 5 and i <= 8 then
                    offset = 600
                end
                if i ~= 4 then  
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                    tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    noteAngle[i+1] = 360
                end
            end
        else
             for i = 0,3 do
 
               
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 640
                    tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    noteAngle[i+1] = 360
                
            end
        end
    elseif curStep == 1280 then
        if difficulty == "VOIID" then
            for i = 0,17 do
                noteAngle[i+1] = -360
                if i >= 0 and i <= 3 then
                    offset = 340
                elseif i >= 5 and i <= 8 then
                    offset = 280
                elseif i >= 9 and i <= 12 then
                    offset = middlescroll and -280 or -600
                elseif i >= 14 and i <= 17 then
                    offset = middlescroll and -340 or -660
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                if i ~= 4 and i ~= 13 then
                    if i >= 0 and i <= 8 then
                        tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                    elseif i >= 9 and i <= 17 then
                        tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    end
                end
            end
        else
            for i = 0,7 do
                noteAngle[i+1] = -360
                if i >= 0 and i <= 3 then
                    offset = 320
              
                elseif i >= 4 and i <= 7 then
                    offset = middlescroll and -320 or -640
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
                
                    if i >= 0 and i <= 3 then
                        tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                    elseif i >= 4 and i <= 7 then
                        tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    end
                
            end
        end
    elseif curStep == 1408 then
        if difficulty == "VOIID" then
            for i = 0,17 do
                noteAngle[i+1] = -360
                if i ~= 4 and i ~= 13 then
                    if i >= 0 and i <= 8 then
                        tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                    elseif i >= 9 and i <= 17 then
                        tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    end
                end
            end
        else
            for i = 0,7 do
                noteAngle[i+1] = -360
                
                    if i >= 0 and i <= 3 then
                        tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                    elseif i >= 4 and i <= 7 then
                        tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeOut")
                    end
                
            end
        end
    elseif curStep == 1528 or curStep == 3704 then -- normalidad
        for i = 0,(keyCount * 2) - 1 do
            tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] 
            targetnoteYPos[i + 1] = _G['defaultStrum'..i..'Y'] 
        end

    end
    if curStep == 1308 or curStep == 1312 or curStep == 1320
    or curStep == 1328 or curStep == 1332 or curStep == 1336 or curStep == 1338
    or curStep == 1340 or curStep == 1342 or curStep == 3484  or curStep == 3488 
    or curStep == 3496 or curStep == 3504 or curStep == 3508 or curStep == 3512   then
        flechas(0,true)
        swap = swap * -1
        for i = 0,(keyCount * 2) - 1 do
            noteAngle[i+1] = -25*swap
        end
    end

    if curStep >= 1120 and curStep <= 1280 or curStep >= 1344 and curStep <= 1536
    or curStep >= 3296 and curStep <= 3456 or curStep >= 3520 and curStep <= 3712 then
        if curStep % 32 == 16 or curStep % 32 == 28 then
            for i = 0,(keyCount * 2) - 1 do
                noteAngle[i+1] = 25
            end
        elseif curStep % 32 == 22 then
            for i = 0,(keyCount * 2) - 1 do
                noteAngle[i+1] = -25
            end
        end
    end
    
    
    

-- parte locura


    if curStep == 2592 then
        bloom(0,1,crochet,4,"linear")
        for i = 0,17 do
            setActorAlpha(0, 'note'..i)
        end
        lolxd = true
        bfs = false
        cam = true
        sxm = false
        --setShaderProperty('sobel', 'strength', 0.5)
        setShaderProperty('sobel2', 'strength', 1)
        setShaderProperty('vignette', 'size', 0.5)
       -- setShaderProperty('glowBorder', 'transparency', 0.35)
        tweenShaderProperty('mirror2','barrel',1,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('rarete','strength',1,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*8,'cubeIn')
        posiciones("players", 50)
        set("girlfriend.alpha",0)
        set("dadCharacter1.alpha",0)
        set("boyfriend.alpha",0)
        tween("blackBG",{alpha = 0.45},crochet*0.001*8,'cubeIn')
        movimiento({5,16,0}, 1, "cubeOut", true)
        movimiento({5,16,10}, 1, "cubeOut", false)
        set("dadCharacter0.alpha",0)
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*1,'cubeOut')
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*1,'cubeOut')
        setShaderProperty('colorfill', 'fade', 0)
        temblor = true
        if difficulty == "VOIID" then
            for i = 0,8 do
                targetnoteZPos[i + 1] = 1000
                if i >= 0 and i <= 3 then
                    offset = 200
                elseif i >= 5 and i <= 8 then
                    offset = 500
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
            for i = 9,17 do
                targetnoteZPos[i + 1] = -500
                if i >= 9 and i <= 12 then
                    offset = -280
                elseif i >= 14 and i <= 17 then
                    offset = -340
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = 1000
                if i >= 0 and i <= 1 then
                    offset = 250
                elseif i >= 2 and i <= 3 then
                    offset = 450
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
            for i = 4,7 do
                targetnoteZPos[i + 1] = -500
                
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] -320
            end
        end
    elseif curStep == 2608 then
        mirror(false,true,"","zoom",0,3,4,crochet,"expoIn")
        mirror(false,true,"","angle",0,-180,4,crochet,"expoIn")
        tweenShaderProperty('fish','power',0.2,crochet*0.001*4,'expoIn')
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*4,'backIn')
        tweenShaderProperty('bars','effect2',0.6,crochet*0.001*4,'backIn')
    elseif curStep == 2624 then
        lerpSpeedZ = 2
        drunkLerp = 1
        drunkSpeed = 2
        serpientelocuraY = true
        if difficulty == "VOIID" then
            for i = 0,8 do
                targetnoteZPos[i + 1] = 0
                if i ~= 4 then
                    tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                end
            end
            
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
            end
             for i = 4,7 do
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] -320
            end
        end
        
        mirror(false,true,"","zoom",0,1,60,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-360,60,crochet,"cubeIn")
        tweenShaderProperty('bars','effect2',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*4,'cubeOut')
        bump()
        tween("dadCharacter0",{alpha = 1},crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*8,'cubeOut')
    elseif curStep == 2640 then
        movimiento({5,13,0}, 2, "cubeOut", true)
        tween("dadCharacter1",{alpha = 1},crochet*0.001*4,'cubeOut')
    elseif curStep == 2656 then
        lerpSpeedX = 0.5
        lerpSpeedZ = 0.5
        if difficulty == "VOIID" then
        for i = 0,8 do
                targetnoteZPos[i + 1] = -500
                tween("note"..i,{alpha = 0},crochet*0.001*6,"cubeIn")
                if i >= 0 and i <= 3 then
                    offset = -500
                elseif i >= 5 and i <= 8 then
                    offset = 1000
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0,3 do
               targetnoteZPos[i + 1] = -500
                tween("note"..i,{alpha = 0},crochet*0.001*6,"cubeIn")
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 320
            end
        end
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*6,'cubeIn')
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*6,'cubeIn')
        movimiento({1,18,0}, 6, "cubeIn", true)
        tween("dadCharacter0",{alpha = 0},crochet*0.001*6,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*6,'cubeIn')
    elseif curStep == 2680 then
        lerpSpeedX = 3
        lerpSpeedZ = 2
        if difficulty == "VOIID" then
            for i = 0,8 do
                if i >= 0 and i <= 3 then
                    targetnoteZPos[i + 1] = 0
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    offset = 200
                elseif i >= 5 and i <= 8 then
                    offset = 500
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0,3 do
                if i >= 0 and i <= 1 then
                    targetnoteZPos[i + 1] = 0
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    offset = 250
                elseif i >= 2 and i <= 3 then
                    offset = 450
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        end
        movimiento({5,13,0}, 2, "cubeOut", true)
        tween("dadCharacter0",{alpha = 1},crochet*0.001*3,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
    elseif curStep == 2688 then
        if difficulty == "VOIID" then
            for i = 5,8 do
                targetnoteZPos[i + 1] = 0
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")

            end
        else
            for i = 2,3 do
                targetnoteZPos[i + 1] = 0
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
        end
        tween("dadCharacter1",{alpha = 1},crochet*0.001*3,'cubeOut')
    elseif curStep == 2696 then
        lerpSpeedZ = 0.5
        if difficulty == "VOIID" then
            for i = 0,8 do
                targetnoteZPos[i + 1] = -500
                tween("note"..i,{alpha = 0},crochet*0.001*5,"cubeIn")
            end
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = -500
                tween("note"..i,{alpha = 0},crochet*0.001*5,"cubeIn")
            end
        end
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*6,'cubeIn')
        tween("dadCharacter0",{alpha = 0},crochet*0.001*5,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*5,'cubeIn')
        movimiento({1,18,0}, 6, "cubeIn", true)
    elseif curStep == 2719 or curStep == 2966 then
        lerpSpeedZ = 10
        if difficulty == "VOIID" then
            for i = 0,8 do
                targetnoteZPos[i + 1] = 1000
            end
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = 1000
            end
        end
        tweenShaderProperty('mirror0','x',1,crochet*0.001*0.1,'cubeOut')
    elseif curStep == 2720 or curStep == 2848 then
        lerpSpeedZ = 3
        if difficulty == "VOIID" then
            for i = 0,8 do
                if i ~= 4 then
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
                end
            end
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*4,"cubeOut")
            end
        end
        tween("dadCharacter0",{alpha = 1},crochet*0.001*4,'cubeOut')
        tween("dadCharacter1",{alpha = 1},crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
        movimiento({5,13,0}, 4, "cubeOut", true)
        lerpSpeedX = 3
        if difficulty == "VOIID" then
            for i = 0,8 do
                if i >= 0 and i <= 3 then
                    offset = 340
                elseif i >= 5 and i <= 8 then
                    offset = 280
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0,3 do
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 320
            end
        end
        
    elseif curStep == 2736 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*4,'cubeIn')
        tween("dadCharacter0",{alpha = 0},crochet*0.001*4,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*4,'cubeIn')
    elseif curStep == 2752 or curStep == 2792 then
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*8,'cubeOut')
        tween("dadCharacter0",{alpha = 1},crochet*0.001*4,'cubeOut')
        tween("dadCharacter1",{alpha = 1},crochet*0.001*4,'cubeOut')
    elseif curStep == 2784 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*2,'cubeIn')
        tween("dadCharacter0",{alpha = 0},crochet*0.001*1.5,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*1.5,'cubeIn')
    elseif curStep == 2791 or curStep == 3047 then
        tweenShaderProperty('mirror0','x',0,crochet*0.001*0.1,'linear')
    elseif curStep == 2816 then
        movimiento({1,18,0}, 8, "cubeIn", true)
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*8,'cubeIn')
        tween("dadCharacter0",{alpha = 0},crochet*0.001*8,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*8,'cubeIn')
    elseif curStep == 2832 then
        lerpSpeedX = 0.5
        if difficulty == "VOIID" then
            for i = 0,8 do
                if i >= 0 and i <= 3 then
                    offset = 100
                elseif i >= 5 and i <= 8 then
                    offset = 500
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        else
            for i = 0,3 do
                if i >= 0 and i <= 1 then
                    offset = 150
                elseif i >= 2 and i <= 3 then
                    offset = 500
                end
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            end
        end
    elseif curStep == 2864 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,1,crochet,"cubeOut")
        movimiento({1,18,0}, 4, "cubeIn", true)
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*4,'cubeIn')
        tween("dadCharacter0",{alpha = 0},crochet*0.001*4,'cubeIn')
        tween("dadCharacter1",{alpha = 0},crochet*0.001*4,'cubeIn')
    elseif curStep == 2868 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
    elseif curStep == 2872 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*2,'cubeIn')
        if difficulty == "VOIID" then
            for i = 0,8 do
                targetnoteZPos[i + 1] = 1000
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeOut")
            end
        else
            for i = 0,3 do
                targetnoteZPos[i + 1] = 1000
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeOut")
            end
        end
          if difficulty == "VOIID" then
            for i = 9,17 do
                if i ~= 13 then
                    targetnoteZPos[i + 1] = 0
                    tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                end
            end
        else
            for i = 4,7 do
                
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 320
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
        end
    elseif curStep == 2876 then
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")
    elseif curStep == 2880 then
        mirror(false,true,"","zoom",0,1,60,crochet,"cubeIn")
        mirror(false,true,"","angle",0,360,60,crochet,"cubeIn")
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*4,'cubeOut')
        tween("boyfriend",{alpha = 1},crochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*8,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*8,'cubeOut')
    elseif curStep == 2912 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*6,'cubeIn')
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*6,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*5,'cubeIn')
        movimiento({0,0,15}, 6, "cubeIn", false)
    elseif curStep == 2936 or curStep == 3008 or curStep == 3104 then
        movimiento({0,0,10}, 2, "cubeOut", false)
        tween("boyfriend",{alpha = 1},crochet*0.001*3,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
    elseif curStep == 2952 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*4,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*3.5,'cubeIn')
        movimiento({0,0,5}, 4, "cubeIn", false)
    elseif curStep == 2968 or curStep == 3048 then-------
        tween("boyfriend",{alpha = 1},crochet*0.001*6,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*6,'cubeOut')
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*6,'cubeOut')
        movimiento({0,0,10}, 6, "cubeOut", false )
    elseif curStep == 2992 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*4,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*4,'cubeIn')
    elseif curStep == 3024 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*6,'cubeIn')
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*6,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*5,'cubeIn')
        movimiento({0,0,15}, 6, "cubeIn", false )
    elseif curStep == 3072 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*8,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*8,'cubeIn')
    elseif curStep == 3120 then
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*4,'cubeIn')
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*4,'cubeIn')
        tween("boyfriend",{alpha = 0},crochet*0.001*3.5,'cubeIn')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 3124 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == 3128 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty('mirror2','barrel',-2,crochet*0.001*1,'cubeOut')
        if difficulty == "VOIID" then
            for i = 9,17 do
                targetnoteZPos[i + 1] = 1000
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeOut")
            end
        else
            for i = 4,7 do
                targetnoteZPos[i + 1] = 1000
                tween("note"..i,{alpha = 0},crochet*0.001*2,"cubeOut")
            end
        end
    elseif curStep == 3132 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('bars','effect',0.6,crochet*0.001*1,'cubeIn')
        tweenShaderProperty('mirror2','barrel',0,crochet*0.001*1,'cubeIn')
    elseif curStep == 3136 then
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*8,'cubeOut')
        setShaderProperty('sobel2', 'strength', 0)
        setShaderProperty('vignette', 'size', 0.5)
        tweenShaderProperty('rarete','strength',0,crochet*0.001*16,'cubeIn')
        posiciones("players", 50)
        set("dadCharacter1.alpha",1)
        set("boyfriend.alpha",1)
        movimiento({-12,-12,30}, 1, "cubeOut", true)
        movimiento({-12,-12,30}, 1, "cubeOut", false)
        set("dadCharacter0.alpha",1)
       tweenShaderProperty('mirror0','zoom',1,crochet*0.001*1,'cubeOut')
       tweenShaderProperty('mirror0','angle',0,crochet*0.001*1,'cubeOut')
        setShaderProperty('colorfill', 'fade', 1)
    elseif curStep == 3168 then
        serpientelocuraY = false
        if difficulty == "VOIID" then
            for i = 0,17 do
                targetnoteZPos[i + 1] = 0
                if i >= 0 and i <= 8 then
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] +640
                elseif i >= 9 and i <= 17 then
                    if not middlescroll then
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        else
            for i = 0,7 do
                targetnoteZPos[i + 1] = 0
                if i >= 0 and i <= 3 then
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] +640
                elseif i >= 4 and i <= 7 then
                    if not middlescroll then
                    targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        end
        tween("blackBG",{alpha = 0},crochet*0.001*8,'cubeIn')
        tweenShaderProperty('vignette','size',0.2,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('sobel','strength',0.5,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('mirror2','barrel',-2,crochet*0.001*8,'cubeIn')
        tweenShaderProperty('fish','power',0.1,crochet*0.001*8,'cubeIn')
    
    elseif curStep == 3192 then
        if difficulty == "VOIID" then
            for i = 9,17 do
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
        else
            for i = 4,7 do
                targetnoteZPos[i + 1] = 0
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
        end
    elseif curStep == 3200 then
        if difficulty == "VOIID" then
            for i = 0,8 do 
                if i ~= 4 then
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                end
            end
        else
             for i = 0,3 do 
            
                tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
            end
        end
        
        bloom(4,1,crochet,4,"cubeOut")
        flashCamera("game","white",0.5)
        setShaderProperty('glowBorder', 'transparency', 0.35)
        setShaderProperty('speedlines', 'transparency', 0)
        setShaderProperty('titleeffect', 'money',1.1)
        setShaderProperty('mirror2','barrel',-10)
        tweenShaderProperty('mirror2','barrel',0.5,crochet*0.001*8,'cubeOut')
    end
end
function parte1(s)

    if curStep == s+56 then
        mirror(true,true,"x","x",-2,0,4,crochet,"backInOut")
        tweenShaderProperty('zoomblurgame','focusPower',5,crochet*0.001*2,'cubeIn')
    elseif curStep == s+64 then
        sxm = false
        bfs = true
        bloom(4,1,crochet,2,"linear")
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*3,'cubeOut')
    end
    if curStep == s+112 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty('fish','power',0.2,crochet*0.001*1,'cubeOut')
    elseif curStep == s+116 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,0,1,crochet,"expoIn")
    elseif curStep == s+120 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == s+124 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"expoIn")
    elseif curStep == s+128 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('fish','power',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,2,"linear")
        bfs = false
        sxm = true
       -- cam = true
    elseif curStep == s+144 or curStep == s+208 then--400
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,1,crochet,"cubeOut")
        mirror(true,true,"x","x",-0.2,0,1,crochet,"cubeOut")
        tweenShaderProperty('mirror2','barrel',10,crochet*0.001*3,'cubeIn')
        for i = 0,17 do
            noteAngle[i+1] = 25
        end
    elseif curStep == s+148 or curStep == s+212 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,1,crochet,"cubeOut")
        mirror(true,true,"x","x",0.2,0,1,crochet,"cubeOut")
        for i = 0,17 do
            noteAngle[i+1] = -25
        end
    elseif curStep == s+152 or curStep == s+216 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,-0.2,1,crochet,"cubeOut")
    elseif curStep == s+156 or curStep == s+220 then
        tweenShaderProperty('mirror2','barrel',-10,crochet*0.001*1,'expoIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeInOut")
        for i = 0,17 do
            noteAngle[i+1] = -360
        end
    elseif curStep == s+160 or curStep == s+224 then--416
        bloom(4,1,crochet,2,"linear")
        setShaderProperty("mirror2","barrel",10)
        tweenShaderProperty('mirror2','barrel',0,crochet*0.001*2,'cubeOut')
       -- mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","x",0,0,2,crochet,"cubeOut")
    elseif curStep == s+176 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.15,crochet*0.001*1,'cubeOut')
    elseif curStep == s+192 then
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,3,crochet,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        bfs = true
        sxm = false
    end
    if curStep == s+240 then--496
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeOut')
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.15,crochet*0.001*1,'cubeOut')
    elseif curStep == s+248 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        mirror(true,true,"x","x",2,0,3,crochet,"cubeInOut")
    elseif curStep == s+256 then
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*1,'cubeOut')
        bloom(4,1,crochet,2,"linear")
        tweenShaderProperty('fish','power',0.1,crochet*0.001*1,'cubeOut')
        bfs = false
        cam = true
        sxm = false
    end
end
function drop(s)
    if curStep == s then
        caWaveRange = 0.015
        setShaderProperty('sobel', 'strength', 0.5)
        flashCamera("game","white",0.5)
        setShaderProperty('glowBorder', 'transparency', 0.35)
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShaderProperty('fish','power',0.1,crochet*0.001*1,'cubeOut')
        posiciones("players", 50)
        set("girlfriend.alpha",0)
        temblor = true
        setShaderProperty('titleeffect', 'money',1.1)
    elseif curStep == s+44 then
        mirror(false,true,"","angle",0,-60,1,crochet,"expoIn")
    elseif curStep == s+48 then
        mirror(false,true,"","angle",0,-120,2,crochet,"expoIn")
        for i = 0,17 do
            noteAngle[i+1] = 45
        end
    elseif curStep == s+56 then
        for i = 0,17 do
            noteAngle[i+1] = -45
        end
        tweenShaderProperty('mirror2','x',1,crochet*0.001*3,'cubeInOut')
        mirror(false,true,"","angle",0,-180,2,crochet,"expoIn")
    elseif curStep == s+60 then
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeOut")
    elseif curStep == s+64 then
        for i = 0,17 do
            noteAngle[i+1] = 360
        end
    elseif curStep == s+108 then
        mirror(true,true,"angle","angle",0,60,1,crochet,"expoIn")
    elseif curStep == s+112 then
        mirror(false,true,"","angle",0,120,1.5,crochet,"expoIn")
    elseif curStep == s+118 then
        mirror(false,true,"","angle",0,140,1.5,crochet,"expoIn")
    elseif curStep == s+120 then
        tweenShaderProperty('mirror0','x',-1,crochet*0.001*2,'expoIn')
        tweenShaderProperty('mirror2','x',0,crochet*0.001*3,'cubeInOut')
    elseif curStep == s+124 then
        mirror(false,true,"","angle",0,180,1,crochet,"expoIn")
    elseif curStep == s+128 then--1152
        mirror(false,true,"","angle",0,360,3,crochet,"cubeOut")
    elseif curStep == s+172 or curStep == s+236 then
        tweenShaderProperty('mirror2','x',2,crochet*0.001*1,'expoIn')
    elseif curStep == s+176 or curStep == s+240 then--1200
        tweenShaderProperty('mirror2','x',0,crochet*0.001*1.5,'expoIn')
    elseif curStep == s+182 then
        tweenShaderProperty('mirror2','x',2,crochet*0.001*1.5,'expoIn')
    elseif curStep == s+186 then
        tweenShaderProperty('mirror2','x',0,crochet*0.001*1,'expoIn')
    elseif curStep == s+246 then
        tweenShaderProperty('mirror2','x',2,stepCrochet*0.001*12,'cubeInOut')
    end
    
    if curStep == s-4 then
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*1,'cubeIn')
        tweenShaderProperty('mirror0','zoom',0.5,crochet*0.001*1,'cubeIn')
    end
    if curStep == s or curStep == s+128 or curStep == s+384 then
        movimiento({1,9,0}, 3, "cubeOut", true)
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
    elseif curStep == s+56 or curStep == s+184 or curStep == s+440 then
        movimiento({-12,-12,0}, 2, "cubeIn", true)
        tweenShaderProperty('mirror0','angle',20,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*2,'cubeIn')
    elseif curStep == s+64 or curStep == s+192 or curStep == s+320 or curStep == s+448 then
        movimiento({0,0,18}, 3, "cubeOut", false)
        tweenShaderProperty('mirror0','angle',0,crochet*0.001*4,'cubeOut')
        tweenShaderProperty('mirror0','zoom',1,crochet*0.001*4,'cubeOut')
    elseif curStep == s+120 or curStep == s+248 or curStep == s+376 or curStep == s+504 then
        movimiento({0,0,30}, 2, "cubeIn", false)
        tweenShaderProperty('mirror0','angle',-20,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('mirror0','zoom',0,crochet*0.001*2,'cubeIn')
    end

    if curStep == s+248 then
        tweenShaderProperty('bars','effect',0.5,crochet*0.001*2,'backIn')
        tweenShaderProperty('bars','effect2',0.5,crochet*0.001*2,'backIn')
    elseif curStep == s+252 then
        tweenShaderProperty('fish','power',0.2,crochet*0.001*1,'expoIn')
        mirror(false,true,"","zoom",0,2.5,1,crochet,"expoIn")
        tweenShaderProperty('zoomblurgame','focusPower',2,crochet*0.001*1,'expoIn')
    elseif curStep == s+256 then--1280
        setActorAlpha(0.7, 'blackBG')
        sxm = true
        setShaderProperty('titleeffect', 'money',0)
        cam = false
        setShaderProperty('sobel', 'strength', 0)
        posiciones("game")
        tweenShaderProperty('mirror0','x',0,crochet*0.001*1,'cubeOut')
        caWaveRange = 0
        setShaderProperty('speedlines', 'transparency', 1)
        tweenShaderProperty('bars','effect',0,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('bars','effect2',0,crochet*0.001*2,'cubeOut')
        tweenShaderProperty('greyscale','strength',1,crochet*0.001*2,'cubeOut')
        bloom(4,1,crochet,2,"linear")
    elseif curStep == s+264 then
        mirror(true,true,"angle","angle",0,-50,6,crochet,"cubeIn")
    elseif curStep == s+288 then--1312
        mirror(false,true,"","zoom",0,1,8,crochet,"expoIn")
        bloom(4,1,crochet,2,"linear")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
        bump()
    elseif curStep == s+296 then
        bump()
        mirror(false,true,"","angle",0,60,2,crochet,"cubeOut")
    elseif curStep == s+304 then--1328
        bump()
        mirror(false,true,"","angle",0,90,1,crochet,"cubeOut")
    elseif curStep == s+308 then--1332
        bump()
        mirror(false,true,"","angle",0,110,1,crochet,"cubeOut")
    elseif curStep == s+312 or curStep == s+316 then--1336,1340
        mirror(false,true,"","angle",0,60,0.5,crochet,"cubeOut")
        bump()
    elseif curStep == s+314 then
        bump()
        mirror(false,true,"","angle",0,110,0.5,crochet,"cubeOut")
    elseif curStep == s+318 then
        bump()
        mirror(false,true,"","angle",0,180,0.5,crochet,"cubeOut")

    elseif curStep == s+348 then--1372
        tweenShaderProperty('mirror2','x',1,crochet*0.001*1,'expoIn')
    elseif curStep == s+356 then--1380
        tweenShaderProperty('mirror2','x',-1,crochet*0.001*1,'expoIn')
      
    elseif curStep == s+364 or curStep == s+428 then--1388
        tweenShaderProperty('mirror2','x',0,crochet*0.001*1,'expoIn')
    elseif curStep == s+368 or curStep == s+432 then--1392
        tweenShaderProperty('mirror2','x',1,crochet*0.001*1.5,'expoIn')
    elseif curStep == s+374 or curStep == s+438 then--1398
        tweenShaderProperty('mirror2','x',-1,crochet*0.001*1.5,'expoIn')
    elseif curStep == s+380 or curStep == s+444 then--1404
       tweenShaderProperty('mirror2','x',0,crochet*0.001*1,'expoIn')

    end
    if curStep == s+312 then
        tweenShaderProperty('bars','effect',0.55,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('greyscale','strength',0,crochet*0.001*2,'cubeIn')
        tweenShaderProperty('zoomblurgame','focusPower',0,crochet*0.001*2,'cubeIn')
    elseif curStep == s+320 then
        setActorAlpha(0, 'blackBG')
        setShaderProperty('sobel', 'strength', 0.5)
        
        caWaveRange = 0.015
        sxm = false
        cam = true
        posiciones("players", 50)
        tweenShaderProperty('bars','effect',0.1,crochet*0.001*2,'cubeOut')
        mirror(false,true,"","angle",0,360,4,crochet,"cubeOut")
        bloom(4,1,crochet,2,"linear")
        setShaderProperty('speedlines', 'transparency', 0)
        tweenShaderProperty('fish','power',0.1,crochet*0.001*1,'cubeOut')
        setShaderProperty('titleeffect', 'money',1.1)
        
    end



    if curStep == s+284 then --1308
        bump()
    end

    if (curStep >= s and curStep <= s+96) and curStep % 8 == 0  then
       bump()
       flechas(0,false)
    end
    --local swap = 1
    if curStep >= s+96 and curStep <= s+256 or curStep >= s+320 and curStep <= s+512 then
        if curStep % 32 == 0 or curStep % 32 == 8 or curStep % 32 == 16 or curStep % 32 == 22
        or curStep % 32 == 28 then
            swap = swap * -1
            bump()
            flechas(0,false)
           angle = 20*swap
           x = -0.15*swap
        end
    end
end
function bump()
    barrel = -1.5
    zoom = 0.8
    triggerEvent('screen shake',(stepCrochet*0.001*4)..',0.01')
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
local flipShit = 1
function flechas(state, modifyY)
    flipShit = flipShit * -1
    if state == 0 then -- flechas en escalera Y y z
        if difficulty == "VOIID" then
            for i = 0, 17 do
                if (i >= 0 and i <= 3) or (i >= 9 and i <= 12) then
                    if modifyY then
                        noteYPos[i + 1] = noteYPos[i + 1] + (15 * (4 - (i % 9))) * flipShit
                    end
                    if not modifyY then
                        noteZPos[i + 1] = noteZPos[i + 1] - (35 * (4 - (i % 9))) * flipShit
                    end
                elseif (i >= 5 and i <= 8) or (i >= 14 and i <= 17) then
                    if modifyY then
                        noteYPos[i + 1] = noteYPos[i + 1] - (15 * ((i % 9) - 4)) * flipShit
                    end
                    if not modifyY then
                        noteZPos[i + 1] = noteZPos[i + 1] + (35 * ((i % 9) - 4)) * flipShit
                    end
                end
            end
        else
            for i = 0, 7 do
                if (i >= 0 and i <= 1) or (i >= 2 and i <= 3) then
                    if modifyY then
                        noteYPos[i + 1] = noteYPos[i + 1] + (15 * (4 - (i % 9))) * flipShit
                    end
                    if not modifyY then
                        noteZPos[i + 1] = noteZPos[i + 1] - (35 * (4 - (i % 9))) * flipShit
                    end
                elseif (i >= 4 and i <= 5) or (i >= 6 and i <= 7) then
                    if modifyY then
                        noteYPos[i + 1] = noteYPos[i + 1] - (15 * ((i % 9) - 4)) * flipShit
                    end
                    if not modifyY then
                        noteZPos[i + 1] = noteZPos[i + 1] + (35 * ((i % 9) - 4)) * flipShit
                    end
                end
            end
        end
        noteScale = noteScale + 0.3
    end
    if state == 1 then -- esto ira en curva de z
        if difficulty == "VOIID" then
            for i = 0, 17 do
                if i >= 0 and i <= 8 then
                    targetnoteZPos[i + 1] = -50 - (i * 25) 
                elseif i >= 9 and i <= 17 then
                    targetnoteZPos[i + 1] = -50 - ((17 - i) * 25) 
                end
            end
        else
            for i = 0, 7 do
                if i >= 0 and i <= 3 then
                    targetnoteZPos[i + 1] = -50 - (i * 25) 
                elseif i >= 4 and i <= 7 then
                    targetnoteZPos[i + 1] = -50 - ((17 - i) * 25) 
                end
            end
        end
    end
    if state == 2 then --midlescroll x y z oponente
        for i = 0, 17 do
            if difficulty == "VOIID" then
                if modifyY then
                    if i >= 0 and i <= 8 then
                        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 320
                        tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    elseif i >= 9 and i <= 17 then
                        if not middlescroll then
                            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 240
                        end
                        targetnoteZPos[i + 1] = -500
                        tween("note"..i,{alpha = 0.25},crochet*0.001*2,"cubeOut")
                    end
                else
                    if i >= 0 and i <= 8 then
                        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 240
                        targetnoteZPos[i + 1] = -500
                        tween("note"..i,{alpha = 0.25},crochet*0.001*2,"cubeOut")
                    elseif i >= 9 and i <= 17 then
                        if not middlescroll then
                        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 320
                        end
                        targetnoteZPos[i + 1] = 0
                        tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    end
                end
            else
                if modifyY then
                    if i >= 0 and i <= 3 then
                        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 320
                        tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    elseif i >= 4 and i <= 7 then
                        if not middlescroll then
                            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 240
                        end
                        targetnoteZPos[i + 1] = -500
                        tween("note"..i,{alpha = 0.25},crochet*0.001*2,"cubeOut")
                    end
                else
                    if i >= 0 and i <= 3 then
                        targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 240
                        targetnoteZPos[i + 1] = -500
                        tween("note"..i,{alpha = 0.25},crochet*0.001*2,"cubeOut")
                    elseif i >= 4 and i <= 7 then
                        if not middlescroll then
                            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 320
                        end
                        targetnoteZPos[i + 1] = 0
                        tween("note"..i,{alpha = 1},crochet*0.001*2,"cubeOut")
                    end
                end
            end
        end
    end
end
