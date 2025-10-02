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
	for i = 0, (keyCount*2)-1 do 
		table.insert(noteXPos, 0) --setup default pos and whatever
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
		targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
		noteYPos[i+1] = _G['defaultStrum'..i..'Y']
	end
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)


    initShader('color', 'ColorOverrideEffect')
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-650,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(650,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")


    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0)

    initShader('barrel', 'PincushNewEffect')
    setCameraShader('hud', 'barrel')
	setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'zoom', 3)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'angle', 0)
	setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('mirror', 'BarrelBlurEffect')
    
	setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('pincush', 'PincushNewEffect')
	setCameraShader('game', 'pincush')
    setCameraShader('hud', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'doChroma', true)

    initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
	setShaderProperty('pincushgame', 'barrel', 0)
    setShaderProperty('pincushgame', 'doChroma', true)


    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0)

    
    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('WiggleEffect', 'WiggleEffect')
	setCameraShader('game', 'WiggleEffect')
    setShaderProperty('WiggleEffect', 'uSpeed', 4)
    setShaderProperty('WiggleEffect', 'uFrequency', 4)
    setShaderProperty('WiggleEffect', 'uWaveAmplitude', 0.01)
    setShaderProperty('WiggleEffect', 'tx', 0)
	setShaderProperty('WiggleEffect', 'ty', 0)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.3)

    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0)
    setShaderProperty('smoke', 'smokeStrength', 0)
    setShaderProperty('smoke', 'speed', 1)
    
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

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
local lerpSpeedX = 4
local lerpSpeedY = 10
local lerpSpeedZ = 4
local lerpSpeedAngle = 3
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0
local beatSwap = -1
local time = 0
local rotCam = true
local rotCamSpd = 0
local rotCamRange = 0
local rotCamInd = 0
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('WiggleEffect', 'uTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)

    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('pincush', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('pincush', 'angle', 0)
    end
end
function songStart()
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*36, 'cubeIn')
    tweenShaderProperty('color', 'green',1.5, crochet*0.001*36, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*36, 'cubeIn')
    tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*32, 'linear')
end
function bloomBurst(valor,valor2,lol,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, lol*0.001*steps, 'linear')
end
function angles(valor,valor2,lol,steps)
    setShaderProperty('mirror', 'angle',valor)
    tweenShaderProperty('mirror', 'angle', valor2, lol*0.001*steps, 'cubeOut')
end
function flechasxd(xd,s)
    for i = 0,(keyCount*2)-1 do
        if i % 2 == 0 then
            noteAngle[i+1] = xd-- -40
        else 
            noteAngle[i+1] = s-- 40
        end
    end
end
function drop(s)
    if curStep == s+8 then
        angles(-20,0,stepCrochet,4)
        setShaderProperty('mirror', 'y',-2)
        tweenShaderProperty('mirror', 'y', 0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pincushgame', 'barrel', 5, stepCrochet*0.001*2, 'cubeOut')
       
    elseif curStep == s+12 or curStep == s+44 then
        angles(20,0,stepCrochet,4)
        tweenShaderProperty('mirror', 'zoom',1, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
       
    elseif curStep == s+24 then
        tweenShaderProperty('mirror', 'y', 1, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+28 then
        tweenShaderProperty('mirror', 'y', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror', 'zoom',1, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+32 then
        bloomBurst(5,1,crochet,1)
        setShaderProperty("barrel","barrel",-4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*1, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        tweenShaderProperty('mirror', 'y', 4, crochet*0.001*2, 'expoOut')
    elseif curStep == s+36  then
        angles(20,0,stepCrochet,4)
    elseif curStep == s+40 then
        angles(-20,0,stepCrochet,4)
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pincushgame', 'barrel', 5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+48 then
       
        tweenShaderProperty('mirror', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == s+60 then
        tweenShaderProperty('mirror', 'x', 0, crochet*0.001*2, 'elasticInOut')
    elseif curStep == s+72 then
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+76 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+80 then
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+84 then
        tweenShaderProperty('mirror', 'zoom', 0.6, crochet*0.001*1, 'cubeOut')
    end
end
bumpbloom = {128,160,192}
bloom = {306}
pincush = {224,378,468,474}
bumpshake = {256,276,288,312,340,352,384,448,1024}
bumpshakeotro = {284,288,294,320}
function stepHit()
    drop(512)
    drop(608)
    drop(1208)
    drop(1312)
    for i = 1,#bumpbloom do 
        if curStep == bumpbloom[i]-1 then 
           bloomBurst(5,1,crochet,2)
           setShaderProperty("mirror","zoom",0.7)
           tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*3, 'cubeOut')
           setShaderProperty("pincushgame","barrel",-4)
           tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*3, 'cubeOut')
        end
    end
    for i = 1,#bloom do 
        if curStep == bloom[i]-1 then 
           bloomBurst(5,1,crochet,1)
           setShaderProperty("pincushgame","barrel",-4)
           tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*1, 'cubeOut')
           triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        end
    end
    for i = 1,#pincush do 
        if curStep == pincush[i]-1 then 
           setShaderProperty("pincushgame","barrel",-4)
           tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        end
    end
    for i = 1, #bumpshake do
        if curStep == bumpshake [i]-1 then
            bloomBurst(5,1,crochet,1)
            setShaderProperty("mirror","zoom",0.7)
            tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*2, 'cubeOut')
            setShaderProperty("pincushgame","barrel",-4)
            tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*2, 'cubeOut')
            triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        end
    end
    for i = 1, #bumpshakeotro do
        if curStep == bumpshakeotro [i]-1 then
            setShaderProperty("mirror","zoom",0.87)
            tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*2, 'cubeOut')
            triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        end
    end
    if curStep == 232 then
        tweenShaderProperty('mirror', 'zoom', 3, crochet*0.001*5.6, 'cubeIn')
        tweenFadeIn("blackBG",0.8,crochet*0.001*5.5,"cubeIn")
    elseif curStep == 256 then
        tweenFadeIn("blackBG",0,stepCrochet*0.001*2,"cubeOut")
    end
    if curStep == 268 then
        tweenShaderProperty('barrel', 'zoom', 1.5, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', -1, crochet*0.001*1, 'cubeIn')
    elseif curStep == 272 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 324 then
        tweenShaderProperty('barrel', 'x', -2, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('barrel', 'zoom', 0.8, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',550, crochet*0.001*1, 'cubeIn')
        tweenActorProperty('topBar', 'y',-550, crochet*0.001*1, 'cubeIn')
    elseif curStep == 328 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel', -4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 332 then
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 336 then
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 340 then
        tweenShaderProperty('barrel', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('barrel', 'zoom', 0.8, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',550, crochet*0.001*1, 'cubeIn')
        tweenActorProperty('topBar', 'y',-550, crochet*0.001*1, 'cubeIn')
    elseif curStep == 344 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel', -4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 348 then
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 352 then
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 360 then
        tweenShaderProperty('barrel', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',550, crochet*0.001*1, 'cubeOut')
        tweenActorProperty('topBar', 'y',-550, crochet*0.001*1, 'cubeOut')
    elseif curStep == 364 then
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0.2, crochet*0.001*1, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',650, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-650, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 368 then
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 376 then
        removeCameraShader("hud","barrel")
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 378 then
        tweenShaderProperty('barrel', 'x', -0.2, crochet*0.001*1.5, 'cubeIn')
        tweenShaderProperty('barrel', 'y', -0.2, crochet*0.001*1.5, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 5, crochet*0.001*1.5, 'cubeIn')
    elseif curStep == 384 then
        tweenShaderProperty('barrel', 'x', 0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('barrel', 'y', 0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 388 then
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 392 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep >= 256 and curStep < 512 then--1024 1280
        if curStep % 32 == 0 then
            flechasxd(20,-20)
            triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        elseif curStep % 32 == 8 then
            flechasxd(-20,20)
        elseif curStep % 32 == 20 then
            flechasxd(20,-20)
        elseif curStep % 32 == 24 then
            flechasxd(-20,20)
        end
    end
    if curStep == 456 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'x', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 5, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 460 then
        tweenShaderProperty('barrel', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 464 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*12, 'cubeIn')
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*12, 'cubeIn')
    elseif curStep == 468 then
        tweenShaderProperty('barrel', 'x', 0, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 496 then
        tweenShaderProperty('barrel', 'zoom', 2.5, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 504 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 508 then
        setShaderProperty("barrel","y",-2)
        tweenShaderProperty('barrel', 'y', 0, stepCrochet*0.001*8, 'cubeOut')
    end
    if curStep >= 512 and curStep < 768 or curStep >= 1024 and curStep < 1536 then--1024 1280
        if curStep % 32 == 0 then
            noteRotX = 30
            flechasxd(40,-40)
            setShaderProperty("pincush","barrel",-4)
            tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*2, 'cubeOut')
            triggerEvent('screen shake', (stepCrochet*0.001*2.5)..',0.015', '')
        elseif curStep % 32 == 8 then
            noteRotX = -30
            flechasxd(360,-360)
        elseif curStep % 32 == 20 then
            noteRotX = 30
            flechasxd(-40,40)
        elseif curStep % 32 == 24 then
            noteRotX = -30
            flechasxd(-360,360)
        end
    end
    if curStep == 720 then
        tweenShaderProperty('barrel', 'y', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 728 then
        tweenShaderProperty('barrel', 'y', 2, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 736 then
        bloomBurst(5,1,crochet,2)
        tweenShaderProperty('mirror', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 740 then
        tweenShaderProperty('mirror', 'angle', 360, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 744 then
        tweenShaderProperty('mirror', 'zoom', 0.6, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 752 then
        tweenShaderProperty('bloom', 'contrast', 0, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 768 then
         rotCam = true
         rotCamSpd = 1
        rotCamRange = 5
        tweenShaderProperty('pincushgame', 'barrel', 2, crochet*0.001*4, 'cubeIn')
        bloomBurst(5,1,crochet,2)
       setShaderProperty("mirror","zoom",3)
       tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*16, 'linear')
       setShaderProperty("greyscale","strength",1)
       tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 824 then
        tweenShaderProperty('mirror', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 832 then
        tweenShaderProperty('mirror', 'x', 0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 848 then
        tweenShaderProperty('mirror', 'x', 0, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 864 then
        tweenShaderProperty('mirror', 'zoom', 0.6, crochet*0.001*4, 'linear')
    elseif curStep == 896 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*16, 'linear')
        bloomBurst(5,1,crochet,2)
    elseif curStep == 1004 then
        tweenShaderProperty('bloom', 'contrast', 0, stepCrochet*0.001*3, 'cubeIn')
        tweenShaderProperty('EyeFishEffect', 'power', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1008 then
        bloomBurst(5,1,crochet,2)
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -10, crochet*0.001*3.5, 'cubeIn')
    elseif curStep == 1024 then
        rotCam = false
         rotCamSpd = 0
        rotCamRange = 0
        tweenShaderProperty('pincushgame', 'barrel', 0, crochet*0.001*1, 'cubeIn')
    end
    if curStep == 1048 then
        tweenShaderProperty('mirror', 'zoom', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1052 then
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1056 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1060 then
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1072 then
        tweenShaderProperty('mirror', 'zoom', 0.6, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1088 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*1, 'cubeOut')
        bloomBurst(5,1,crochet,2)
    elseif curStep == 1104 then
        tweenShaderProperty('mirror', 'x', 1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1110 then
        tweenShaderProperty('mirror', 'x', 2, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1116 then
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1120 then
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeIn')
        bloomBurst(5,1,crochet,2)
    elseif curStep == 1124 then
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1136 then
        angles(-20,0,stepCrochet,8)
    elseif curStep == 1144 then
        angles(20,0,stepCrochet,8)
    end
    if curStep == 1408 then
        angles(-360,0,stepCrochet,8)
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1424 then
        tweenShaderProperty('mirror', 'y', 2, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1440 then
        tweenShaderProperty('mirror', 'y', 4, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1456 then
        tweenShaderProperty('mirror', 'zoom', 0.6, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1464 then
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1468 then
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1472 then
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom',1, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1476 then
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenFadeIn("blackBG",0.8,crochet*0.001*16,"linear")
        rotCam = true
        rotCamSpd = 1
        rotCamRange = 5
    elseif curStep == 1520 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1536 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*32, 'linear')
        bloomBurst(0,1,crochet,16)
        setShaderProperty('vignette', 'size',0.7)
        setShaderProperty('smoke', 'smokeStrength', 1.5)
    elseif curStep == 1696 then
        bloomBurst(1,0,crochet,12)
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
