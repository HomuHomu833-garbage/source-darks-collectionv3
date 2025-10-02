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
function makespritesxd(nombre,elnombreotro,x,y,size,hudogameonose)
	makeSprite(elnombreotro, nombre, x, y, size)
	setObjectCamera(elnombreotro, hudogameonose)
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
local downscroll = 1
local stepY = 100 -- Espaciado vertical entre flechas
local startY = -200

function createPost()
    makeCamera("bars")
    makeCamera("nose")
    makespritesxd("corrupt/1","uno",2000,0,1,"nose")
    makespritesxd("corrupt/2","dos",2000,0,1,"nose")
    makespritesxd("corrupt/3","tres",2000,0,1,"nose")
    makespritesxd("corrupt/Lets Go","Lets Go",0,2000,1,"nose")
    if downscrollBool then
        downscroll = -1
    end
    lascosasdelhud(0)
    startSpeed = getProperty('', 'speed')

    for i = 0,(keyCount*2)-1 do 
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
        local yOffset = i * stepY  
        
        noteYPos[i+1] = startY - yOffset 

        targetnoteZPos[i+1] = 1000 
    end

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setCameraShader('hud', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH', 0.1)

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-350,'topBar')
    setObjectCamera('topBar', 'bars')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(350,'bottomBar')
    setObjectCamera('bottomBar', 'bars')
    setActorAlpha(1, "bottomBar")

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setCameraShader('bars', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.2)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red',1)
    setShaderProperty('color', 'green', 1)
    setShaderProperty('color', 'blue', 1)

    initShader('pincush', 'PincushNewEffect')
    setCameraShader('game', 'pincush')
    setCameraShader('bars', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
    setShaderProperty('pincush', 'angle', 0)
	setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'doChroma', true)

    initShader('pincush2', 'PincushNewEffect')
    setCameraShader('game', 'pincush2')
    setCameraShader('hud', 'pincush2')
    setCameraShader('bars', 'pincush2')
    setShaderProperty('pincush2', 'zoom', 1)
    setShaderProperty('pincush2', 'angle', 0)
	setShaderProperty('pincush2', 'x', 0)
    setShaderProperty('pincush2', 'y', 0)
	setShaderProperty('pincush2', 'barrel', 0)
    setShaderProperty('pincush2', 'doChroma', true)


    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setCameraShader('hud', 'EyeFishEffectGame')
    setCameraShader('bars', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', -0.5)
    
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0.5)

    initShader('blur', 'blur')
    setCameraShader('game', 'blur')
    setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strengthX', 0)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)

	initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.5)

    initShader('perlin', 'PincushNewEffect')--
    setCameraShader('game', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
	setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)
    setShaderProperty('perlin', 'angle', 0)
	setShaderProperty('perlin', 'barrel', 0)
    setShaderProperty('perlin', 'doChroma', true)

    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)
    
end
function barras(value,speed,curStep,ease)
    tween("topBar",{y=-value},speed*0.001*curStep,ease)
    tween("bottomBar",{y=value},speed*0.001*curStep,ease)
end
function bumps(valor,speed,curStep)
	setShaderProperty("pincush","zoom",valor)
	tweenShaderProperty("pincush","zoom",1,speed*0.001*curStep,"cubeOut")
end
function angulos(w,step)
    setShaderProperty('mirror', 'angle', w, stepCrochet*0.001,'cubeIn')
    tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*step, 'cubeOut')
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function songStart()
    barras(650,crochet,28,"linear")

    tweenShaderProperty("bloom","contrast",1,crochet*0.001*28,"linear")
    mirror(false,true,"","zoom",0,1,32,crochet,"linear")
end
function noselolxd(s,w)
    if curStep == w then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
    elseif curStep == w+4 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == w+8 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end
    if curStep == s+96 then
        mirror(false,true,"","zoom",0,0.9,1,crochet,"cubeOut")
        matt=false
        bf=true
        set("defaultCamZoom", 0.8)
    end
    if curStep == s then
        mirror(true,true,"x","x",-2,0,2,crochet,"cubeOut")
    elseif curStep == s+16 or curStep == s+80 then
        mirror(true,true,"x","x",2,0,2,crochet,"cubeOut")
    elseif curStep == s+32 then
        mirror(false,true,"","zoom",0,0.9,1,crochet,"cubeOut")
        matt=true
        bf=false
        set("defaultCamZoom", 0.8)
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,0.6,0.5,crochet,"cubeOut")
    elseif curStep == s+58 then
        mirror(false,true,"","zoom",0,0.5,0.5,crochet,"cubeOut")
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,0.4,0.5,crochet,"cubeOut")
    elseif curStep == s+62 then
        mirror(false,true,"","zoom",0,0.3,0.5,crochet,"cubeOut")
    elseif curStep == s+64 or curStep == w+8 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        matt=false
        bf=false
        set("defaultCamZoom", 0.5)
    end
end
function droploco(s)
    if curStep == s then 
        tweenShaderProperty('mirror', 'zoom', 1.5, stepCrochet*0.001*4, 'backIn')
    elseif curStep == s+4 then 
        tweenShaderProperty('mirror', 'zoom', 2.0, stepCrochet*0.001*4, 'backIn')
    end
    if curStep == s+8 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
        mirror(true,true,"y","y",-4,0,2,crochet,"cubeOut")
        tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
    elseif curStep == s+12 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('pincush', 'barrel', -15)
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*8,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*112)..',0.013', (crochet*0.001*64)..',0')
    end
    if curStep == s+16 or curStep == s+48 or curStep == s+96 then
        mirror(true,true,"x","x",-2,0,4,crochet,"backInOut")
    elseif curStep == s+32 or curStep == s+80 or curStep == S+112 then
        mirror(true,true,"y","y",-2,0,4,crochet,"backInOut")
    end
end
function drop(s,d)
    if curStep == d-8 then 
        tweenShaderProperty('mirror', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == d-4 then
        tweenShaderProperty('mirror', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == d then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
        mirror(true,true,"y","y",-4,0,2,crochet,"cubeOut")
        tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
    elseif curStep == d+4 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == d+8 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('pincush', 'barrel', -15)
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*8,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*32)..',0.013', (crochet*0.001*64)..',0')

    end
    if curStep == s then

        matt = true
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        triggerEvent('screen shake', (crochet*0.001*32)..',0.013', (crochet*0.001*64)..',0')
        lascosasdelhud(0)
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
        flashCamera("hud","white",1)
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirror', 'zoom', 1.2, stepCrochet*0.001*4, 'expoIn')
        set("defaultCamZoom", 0.8)
    elseif curStep == s+32 or curStep == s+96 then
        bf = true
        matt = false
    elseif curStep == s+64 then
        matt = true
        bf = false
    elseif curStep == s+112 then
        bf = false
        matt = false
        set("defaultCamZoom", 0.5)
        tweenShaderProperty("mirror2", "angle",0, crochet*0.001*2, "cubeOut")
    end


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
local lerpSpeedY = 1.5
local lerpSpeedZ = 1.5
local lerpSpeedAngle = 2.5
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0
local time = 0

local colors = {
    {1, 3.5, 1},      -- Verde
    {2, 2, 0},      -- Amarillo
    {2.8, 2.2, 1},    -- Naranja
    {2, 1, 2},  -- Morado
    {1, 2, 3},      -- Azul
    {1, 3.5, 1},      -- Verde
    {1, 2.5, 3},      -- Cyan
    {1, 2.7, 3},    -- Cyan Claro
    {3, 1, 1},      -- Rojo
    {2, 1, 2},  -- Morado
    {2.5, 1, 1.5},  -- Rosa
    {1, 1, 1},      -- Default
}

local colorDuration = 0.055  -- el tiempo delos colores
local totalTime = 5
local currentColorIndex = 1
local bumpActive = false
local colorlocoxd = true
local totalBumpDuration = 0  
function colorybumprarete(bump, speed, duration)
    triggerEvent('screen shake', (crochet*0.001*duration)..',0.01')
    setShaderProperty("pincush2", "zoom", bump)
    tweenShaderProperty("pincush2", "zoom", 1, speed*0.001*duration, "cubeOut")
    setShaderProperty('blur', 'strengthX', 5)
    tweenShaderProperty("blur", "strengthX", 0, speed*0.001*duration, "cubeOut")
    if colorlocoxd then
        totalTime = 0
        currentColorIndex = 1  -- Reiniciar el índice de color
        bumpActive = true
        totalBumpDuration = curStep + bump  -- Guarda el paso actual más la duración
    end
end
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0
local perlinXRange = 0.3
local perlinYRange = 0.3
local perlinZRange = 40
local bf=false
local matt=false
function update(elapsed)
    perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('perlin', 'angle', ((-0.5 + perlin(0, perlinZ, 0))*perlinZRange))
    if bf == true then
		set("camFollow.x", get("boyfriend.x")+225)
        set("camFollow.y", get("boyfriend.y")+350)
    end
    if matt == true then
		set("camFollow.x", get("dad.x")+425)
        set("camFollow.y", get("dad.y")+200)
    end
    time = time + elapsed
    setCustomShaderFloat('glitchChromatic', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    if bumpActive then
        totalTime = totalTime + elapsed

        if totalTime >= colorDuration then
            totalTime = totalTime - colorDuration  
            currentColorIndex = currentColorIndex + 1  

            if currentColorIndex > #colors then
                bumpActive = false
                totalBumpDuration = 0  --esto reinicia los colores con bumps
            end
        end

        -- y cuando termina se resetea
        if bumpActive and currentColorIndex <= #colors then
            local color = colors[currentColorIndex]
            setShaderProperty('color', 'red', color[1])
            setShaderProperty('color', 'green', color[2])
            setShaderProperty('color', 'blue', color[3])
        end
    end

end

function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end


local bumpSteps = {{256, 4},{266, 2},{268, 4}, {278, 4},{284, 4},
{288, 4},{294, 4},{300, 4},{304, 2},{314, 3},{317, 3},{320, 4},{330, 2},{332, 2}
,{342, 4},{352, 4},{358, 3},{364, 4},{372, 2},{374, 4},{378, 4},{394, 4} ,{416, 4}
,{422, 4},{424, 4},{440, 4},{448, 4},{459, 4},{470, 4},{480, 4},{492, 4}            
}
local activeBump = {}
local lastBumpStep = -1
giroypincush={380,680,696,1000,1160,1416,1480,1736,2024,2040,2344,2504}
mirrorysalto={552,648,936,1896,1992,2280}
mirrorysaltonegativo={584,616,968,1928,1960,2312}

mirrorysaltoenx={712,1352,1672,2056,2696}
function stepHit()

    for i = 1, #mirrorysaltoenx do
        if curStep == mirrorysaltoenx [i] then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
            mirror(true,true,"x","x",-2,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
        elseif curStep == mirrorysaltoenx[i]+4 then
            mirror(false,true,"","zoom",0,0.5,3.4,stepCrochet,"cubeIn")
            mirror(false,true,"","angle",0,20,3.4,stepCrochet,"cubeIn")
        elseif curStep == mirrorysaltoenx [i]+8 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end

    
    for _, bump in ipairs(bumpSteps) do
        local startStep = bump[1]
        local duration = bump[2]
    
        if curStep >= startStep and curStep < startStep + duration then
            
            if not activeBump[startStep] and lastBumpStep ~= startStep then
                colorlocoxd = true
                colorybumprarete(0.85, stepCrochet, duration) 
                activeBump[startStep] = true  
                lastBumpStep = startStep 
            end
            break 
        elseif curStep >= startStep + duration then
            activeBump[startStep] = false  -- marca el bump como inactivo qlolxd
        end
    end
    
    if curStep >= 304 and curStep < 312 or curStep >= 432 and curStep < 440 then
        if curStep % 2 == 0 then
            setShaderProperty("pincush2", "zoom", 0.8)
            tweenShaderProperty("pincush2", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
            setShaderProperty('blur', 'strengthX', 5)
            tweenShaderProperty("blur", "strengthX", 0, speed*0.001*2, "cubeOut")
        end
    end
    for i = 1, #giroypincush do
        if curStep == giroypincush [i] then
            mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeInOut")
            tweenShaderProperty("pincush","barrel",10,crochet*0.001*2,"cubeIn")
        elseif curStep == giroypincush[i]+4 then
            mirror(false,true,"","zoom",0,0,1,crochet,"cubeIn")
        elseif curStep == giroypincush [i]+8 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
            flashCamera("hud","white",0.5)
        end
    end

    for i = 1, #mirrorysalto do
        if curStep == mirrorysalto [i]-8 then
            mirror(false,true,"","zoom",0,0.5,2,crochet,"backIn")
        end
        if curStep == mirrorysalto [i] then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
            mirror(true,true,"y","y",-2,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
        elseif curStep == mirrorysalto[i]+4 then
            mirror(false,true,"","zoom",0,0.5,3.4,stepCrochet,"cubeIn")
            mirror(false,true,"","angle",0,-20,3.4,stepCrochet,"cubeIn")
        elseif curStep == mirrorysalto [i]+8 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end

    for i = 1, #mirrorysaltonegativo do
        if curStep == mirrorysaltonegativo [i]-8 then
            mirror(false,true,"","zoom",0,0.5,2,crochet,"backIn")
        end
        if curStep == mirrorysaltonegativo [i] then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
            mirror(true,true,"y","y",-2,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
        elseif curStep == mirrorysaltonegativo[i]+4 then
            mirror(false,true,"","zoom",0,0.5,3.4,stepCrochet,"cubeIn")
            mirror(false,true,"","angle",0,20,3.4,stepCrochet,"cubeIn")
        elseif curStep == mirrorysaltonegativo [i]+8 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end
    if curStep == 112 then
        mirror(true,true,"angle","angle",-360,0,6,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,0.2,3,crochet,"cubeIn")
        tweenShaderProperty("pincush","barrel",10,crochet*0.001*3,"cubeIn")
        tweenShaderProperty("bloom","brightness",0.7,crochet*0.001*3,"cubeIn")
        for i = 0,(keyCount * 2) - 1 do
            targetnoteYPos[i + 1] = _G['defaultStrum'..i..'Y'] 
            targetnoteZPos[i + 1] = 0
        end
        for i = 0,3 do
            noteAngle[i + 1] = -360
        end
        for i = 4,7 do
            noteAngle[i + 1] = 360
        end
    elseif curStep == 128 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        barras(550,crochet,2,"cubeOut")
    end

    if curStep == 248 then
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,0.2,2,crochet,"cubeIn")
        tweenShaderProperty("pincush","barrel",10,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("bloom","brightness",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 256 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        barras(630,crochet,2,"cubeOut")
    
    elseif curStep == 368 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeOut")
    elseif curStep == 388 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    end
    if curStep == 448 then
        bf = true
        mirror(false,true,"","zoom",0,0.6,2,crochet,"cubeOut")
    elseif curStep == 480 then
        bf = false
        matt = true
    elseif curStep == 496 then
        bf = true
        matt = false
        bloom(1,0,crochet,4,"linear")
    elseif curStep == 504 then
        mirror(false,true,"","zoom",0,4,5,crochet,"cubeInOut")
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
        barras(750,crochet,2,"cubeOut")
        for i = 0,(keyCount*2)-1 do
			noteAngle[i+1] = -360
			if (i >= 0 and i <= 3) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -740
			elseif (i >= 4 and i <= 7) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +740
			end
		end
    elseif curStep == 528 or curStep == 1872 then
        bf = false
        lascosasdelhud(1)
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*2,"cubeOut")
        flashCamera("hud","white",0.5)
        barras(630,crochet,2,"cubeOut")
        setStageColorSwap("hue",0.1)
        lerpSpeedX=3
        lerpSpeedAngle=3
        for i = 0,(keyCount*2)-1 do
			noteAngle[i+1] = 360
			if (i >= 0 and i <= 3) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
			elseif (i >= 4 and i <= 7) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
			end
		end
    end

    if curStep == 512 then
        tween("tres",{x=0},crochet*0.001*1,"cubeOut")
    elseif curStep == 516 then
        tween("tres",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("dos",{x=0},crochet*0.001*1,"cubeOut")
    elseif curStep == 520 then
        tween("dos",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("uno",{x=0},crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"expoIn")
        setShaderProperty("pincush","barrel",10)
        tweenShaderProperty("pincush","barrel",-10,crochet*0.001*2,"cubeIn")
    elseif curStep == 522 then
        tween("Lets Go",{y=0},crochet*0.001*1,"cubeOut")
    elseif curStep == 524 then
        tween("uno",{x=-2000},crochet*0.001*1,"cubeInOut")
        bloom(0,1,crochet,2,"linear")
    elseif curStep == 526 then
        tween("Lets Go",{y=2000},crochet*0.001*1.5,"cubeInOut")
    end

    if curStep >= 256 and curStep < 496 or curStep >= 1168 and curStep < 1296 or curStep >= 1368 and curStep < 1488  
    or curStep >= 2512 and curStep < 2624 then
        if curStep % 32 == 8 then
            colorlocoxd = false
            angulos(-25,6)
            noteRotX = 25
            noteScale = noteScale + 0.4
        elseif curStep % 32 == 24 then
            angulos(25,6)
            colorlocoxd = false
            noteRotX = -25
            noteScale = noteScale + 0.4
        end 
	end
   
    if curStep == 768 or curStep == 2112 then 
        tweenShaderProperty("pincush","barrel",-10,crochet*0.001*4,"cubeIn")
        tweenShaderProperty('mirror', 'angle', -10.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 1.5, stepCrochet*0.001*4, 'backIn')
    elseif curStep == 768+4 or curStep == 2116 then 
        tweenShaderProperty('mirror', 'angle', -20.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 2.0, stepCrochet*0.001*4, 'backIn')
    elseif curStep == 768+8 or curStep == 2120 then 
        tweenShaderProperty('mirror', 'angle', -30.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 2.5, stepCrochet*0.001*4, 'backIn')
    elseif curStep == 768+12 or curStep == 2124 then 
        tweenShaderProperty('mirror', 'angle', -40.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 3.0, stepCrochet*0.001*4, 'backIn')
    end

    if curStep >= 528 and curStep < 768 or curStep >= 1360 and curStep < 2112 then
        if curStep % 16 == 4 then
            tweenShaderProperty("pincush2", "zoom", 0.7, stepCrochet*0.001*3.7, "cubeIn")
        end
        if curStep % 16 == 8 then
            tweenShaderProperty("pincush2", "zoom", 1, stepCrochet*0.001*7.7, "cubeOut")
            setShaderProperty('blur', 'strengthX', 5)
            tweenShaderProperty("blur", "strengthX", 0, stepCrochet*0.001*8, "cubeOut")
            noteScale = noteScale + 0.4
        end 
	end

    if curStep >= 800-16 and curStep < 896 or curStep >= 2128 and curStep < 2240 then
        if curStep % 32 == 0 then
            tweenShaderProperty("mirror2", "angle", 15, stepCrochet*0.001*4, "cubeIn")
        end
        if curStep % 32 == 16 then
            tweenShaderProperty("mirror2", "angle", -15, stepCrochet*0.001*4, "cubeIn")
        end 
	end

    if curStep >= 784 and curStep < 1024 or curStep >= 2128 and curStep < 2368 then
        if curStep % 16 == 4 or curStep % 16 == 12 then
            setShaderProperty('pincush2', 'zoom', 0.8)
            tweenShaderProperty("pincush2", "zoom", 1, stepCrochet*0.001*8, "cubeOut")
        end 
	end
    if curStep == 2512 then
        perlinXRange = 0.3
        perlinYRange = 0.3
        perlinZRange = 40
    end
    if curStep == 1168 or curStep == 2512 then
        perlinSpeed = 2
        triggerEvent('toggle checker bg','0',crochet*0.001*2)
    elseif curStep == 1280 or curStep == 2624 then
        tweenShaderProperty("pincush", "barrel", -15, stepCrochet*0.001*16, "cubeIn")
    elseif curStep == 1288 or curStep == 2632 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 1292 or curStep == 2636 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1296 or curStep == 2640 then
        perlinSpeed = 0
        perlinYRange = 0
        perlinXRange = 0
        perlinZRange = 0
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*4,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 1352 then
       tweenStageColorSwap("hue",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == 2696+8 then
        tweenShaderProperty("color","red",0,crochet*0.001*8,"cubeOut")
        tweenShaderProperty("color","green",0,crochet*0.001*8,"cubeOut")
        tweenShaderProperty("color","blue",0,crochet*0.001*8,"cubeOut")
        for i = 0,(keyCount*2)-1 do
			targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] -240*downscroll
		end
    end
    if curStep >=1296 and curStep < 1352 or curStep >=2640 and curStep < 2696  then
        if curStep % 16 == 0 or curStep % 16 == 8 then
            setShaderProperty('pincush2', 'zoom', 0.7)
            tweenShaderProperty("pincush2", "zoom", 1, stepCrochet*0.001*4, "cubeOut")
        end 
        if curStep % 16 == 4 then
            angulos(-25,4)
        end 
        if curStep % 16 == 12 then
            angulos(25,4)
        end 
	end
    if curStep >= 1168+16 and curStep < 1280 or curStep >= 2512 and curStep < 2632-8 then
        if curStep % 32 == 0 then
            mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeInOut")
        end 
        if curStep % 32 == 16 then
            mirror(false,true,"","zoom",0,1,4,crochet,"cubeInOut")
        end 
	end
    if curStep == 912 or curStep == 976 or curStep == 1152 
    or curStep == 2256 or curStep == 2320 or curStep == 2496 then
        matt=true
        bf=false
        set("defaultCamZoom", 0.8)
        triggerEvent('toggle checker bg','0.1',crochet*0.001*2)
    elseif curStep == 944 or curStep == 1088 
    or curStep == 2288  or curStep == 2432  then
        matt=false
        bf=true
        set("defaultCamZoom", 0.8)
    elseif curStep == 1008 or curStep == 1104 or curStep == 1168 
    or curStep == 2352 or curStep == 2448 or curStep == 2512 then
        matt=false
        bf=false
        set("defaultCamZoom", 0.5)
    end
    if curStep == 1088 or curStep == 1152 or curStep == 2432 or curStep == 2496 then
        tweenFadeIn("blackBG",0.8,crochet*0.001*2,"cubeIn")
    elseif curStep == 1104 or curStep == 1168 or curStep == 2448 or curStep == 2512 then
        tweenFadeIn("blackBG",0,crochet*0.001*2,"cubeOut")
    end


     --second part 

     if curStep == 1360 then
        setShaderProperty('glitchPeak', 'AMT', 0)
     elseif curStep == 1392 then
        mirror(false,true,"","x",0,-1,1,crochet,"cubeOut")
     elseif curStep == 1408 or curStep == 1472 then
        mirror(false,true,"","x",0,0,1,crochet,"cubeOut")
     elseif curStep == 1456 then
        mirror(false,true,"","x",0,1,1,crochet,"cubeOut")
     end

     if curStep == 2368 then 
        tweenShaderProperty('mirror', 'zoom', 1.5, stepCrochet*0.001*4, 'backIn')
    elseif curStep == 2368+4 then 
        tweenShaderProperty('mirror', 'zoom', 2.0, stepCrochet*0.001*4, 'backIn')
    end
    if curStep == 2368+8 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeOut")
        mirror(true,true,"y","y",-4,0,2,crochet,"cubeOut")
        tweenShaderProperty("pincush","barrel",5,crochet*0.001*2,"cubeIn")
    elseif curStep == 2368+12 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 2368+16 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('pincush', 'barrel', -15)
        tweenShaderProperty("pincush","barrel",0,crochet*0.001*8,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*112)..',0.013', (crochet*0.001*64)..',0')
    end
    if curStep == 2368+16 or curStep == 2368+48 or curStep == 2368+96 then
        mirror(true,true,"x","x",-2,0,4,crochet,"backInOut")
    elseif curStep == 2368+32 or curStep == 2368+80 or curStep == 2368+112 then
        mirror(true,true,"y","y",-2,0,4,crochet,"backInOut")
    end
  
     noselolxd(1488,1608)
     noselolxd(1744,1864)
     drop(2128,2248)
     drop(784,904)
     droploco(1024)
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