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
function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("infoTxt.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)

    set("ratingText.alpha",s)
end
local downscroll = 1
function createPost()
    lascosasdelhud(0)
    if downscrollBool then
        downscroll = -1
    end
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
    makeCamera("speedlines")
	makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    makeCamera("vignette")
    initShader('vignette', 'VignetteEffect')
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.7)

	initShader('godrays', 'godrays')--
    setCameraShader('game', 'godrays')

	setShaderProperty('godrays', 'decay', 0.5)
    setShaderProperty('godrays', 'density',0.5)
    setShaderProperty('godrays', 'weigth', 0.5)

	initShader('particles', 'particlesnew')--
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.84)
    setShaderProperty('particles', 'red', 3)
    setShaderProperty('particles', 'green', 1.5)
    setShaderProperty('particles', 'blue', 1)

	initShader('barrel', 'MirrorRepeatEffect')
	setCameraShader('game', 'barrel')
	setCameraShader('hud', 'barrel')
	setShaderProperty('barrel', 'zoom', 1)
	setShaderProperty('barrel','x',0)
	setShaderProperty('barrel','y',0)
	setShaderProperty('barrel','angle', 0)


	initShader('pincush', 'PincushNewEffect')
    setCameraShader('game', 'pincush')
	setCameraShader('hud', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
    setShaderProperty('pincush', 'angle', 0)
	setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'doChroma', true)

	initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
	setCameraShader('speedlines', 'pixel')
    setShaderProperty('pixel', 'strength', 70)

	initShader('pincushGame', 'PincushNewEffect')
    setCameraShader('game', 'pincushGame')
	setCameraShader('speedlines', 'pincushGame')
    setShaderProperty('pincushGame', 'zoom', 1)
    setShaderProperty('pincushGame', 'angle', 0)
	setShaderProperty('pincushGame', 'x', 0)
    setShaderProperty('pincushGame', 'y', 0)
	setShaderProperty('pincushGame', 'barrel', 0)
    setShaderProperty('pincushGame', 'doChroma', true)

	initShader('perlinGame', 'PincushNewEffect')
    setCameraShader('game', 'perlinGame')
	setCameraShader('speedlines', 'perlinGame')
    setShaderProperty('perlinGame', 'zoom', 1)
    setShaderProperty('perlinGame', 'angle', 0)
	setShaderProperty('perlinGame', 'x', 0)
    setShaderProperty('perlinGame', 'y', 0)
	setShaderProperty('perlinGame', 'barrel', 0)
    setShaderProperty('perlinGame', 'doChroma', true)

	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)

	initShader('barsgame', 'bars')
	setCameraShader('game', 'barsgame')
	setShaderProperty('barsgame', 'effect', 0)

	initShader('ca', 'ChromAbEffect')
	setCameraShader('hud', 'ca')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

	initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setCameraShader('hud', 'zoomblur')
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'posX', 2)
    setShaderProperty('zoomblur', 'focusPower', 0)


	initShader('soloelx', 'PincushNewEffect')
    setCameraShader('game', 'soloelx')
	setCameraShader('speedlines', 'soloelx')
	setShaderProperty('soloelx', 'zoom', 1)
	setShaderProperty('soloelx', 'y', 0)
	setShaderProperty('soloelx', 'x', 0)

	initShader('glitchPeak', 'Glitchy')
	setCameraShader('hud', 'glitchPeak')
    setCameraShader('game', 'glitchPeak')
   
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.3)

	initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

	initShader('bars', 'bars')
	setCameraShader('hud', 'bars')
	setShaderProperty('bars', 'effect', 0)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green', 1.5)
    setShaderProperty('color', 'blue', 1.5)

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar',layershit)
    setActorY(-350,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
	setActorLayer('bottomBar',layershit)
    setActorY(350,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

	initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0.5)
	initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
	setCameraShader('speedlines', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)
	
    makeText('HANK!!!', 'HANK!!!', 350,250,200)
    setActorFont("HANK!!!", "tricky.ttf")
    setActorScroll(0,0,'HANK!!!')
	setObjectCamera('HANK!!!', 'hud')
    setActorAlpha(0, "HANK!!!")
	set("HANK!!!.angle",-10)

    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 20, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'speedlines')
    setActorAlpha(0, 'speed')

	for i = 0,(keyCount*2)-1 do -- ☠️
		if i % 2 == 0 then
			targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] +750*downscroll 
			targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -750 
			targetnoteZPos[i+1] = 400 
		else 
			targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] -650*downscroll  
			targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +750 
			targetnoteZPos[i+1] = 400
		end
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
local lerpSpeedX = 1.5
local lerpSpeedY = 1.5
local lerpSpeedZ = 1.5
local lerpSpeedAngle = 1.5
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0

local time = 0
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 2 
local perlinXRange = 0.1
local perlinYRange = 0.15
local perlinZRange = 0
local rotCam = true
local rotCamSpd = 0
local rotCamRange = 0
local rotCamInd = 0

function update(elapsed)
	time = time + elapsed

    setCustomShaderFloat('glitchPeak', 'iTime', time)
	setCustomShaderFloat('particles', 'iTime', time)
	setCustomShaderFloat('godrays', 'iTime', time)
	perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
	   
	setShaderProperty('pincush', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('pincush', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))

	if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('perlinGame', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('perlinGame', 'angle', 0)
    end
		
end
local swap = -1
function nosexd(s)
	if curStep == s then
		pincush("angle",20,crochet,4,"cubeOut")
		tweenFadeIn("blackBG",0,stepCrochet*0.001*1,"cubeOut")
	elseif curStep == s+16 then
		pincush("angle",-20,crochet,4,"cubeOut")
	elseif curStep == s+28 or curStep == s+44 or curStep == s+92 or curStep == s+108 then
		pincush("zoom",0.5,stepCrochet,4,"cubeIn")
	elseif curStep == s+32 then 
		pincush("zoom",2,crochet,3,"cubeOut")
		pincush("angle",20,crochet,4,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'cubeOut')
	elseif curStep == s+48 then
		pincush("zoom",2,stepCrochet,8,"cubeOut")
		pincush("angle",-20,crochet,4,"cubeOut")
	elseif curStep == s+56 then
		pincush("zoom",3,stepCrochet,3.5,"cubeOut")
	elseif curStep == s+60 then
		swap = swap* -1
		pincush("zoom",1,stepCrochet,4,"cubeIn")
		pincush("angle",-340,crochet,3.5,"cubeInOut")
		setShaderProperty('soloelx', 'x', -2*swap)
		tweenShaderProperty('soloelx', 'x', 0, stepCrochet*0.001*8, 'cubeInOut')
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
	elseif curStep == s+64 then
		bloom(5,1,crochet,2,"cubeOut")
	elseif curStep == s+80 then
		bloom(5,1,crochet,2,"cubeOut")
		pincush("angle",-380,crochet,4,"cubeOut")
	elseif curStep == s+96 then
		pincush("zoom",2,crochet,3,"cubeOut")
		pincush("angle",-340,crochet,4,"cubeOut")
		bloom(5,1,crochet,2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'cubeOut')
	elseif curStep == s+112 then
		pincush("zoom",2,crochet,3,"cubeOut")
		pincush("angle",-380,crochet,4,"cubeOut")
		bloom(5,1,crochet,2,"cubeOut")
	end
end
function hankkk(s)
	if curStep == s or curStep == s+32 then
		pincush("zoom",1.5,crochet,2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'cubeOut')
	elseif curStep == s+8 or curStep == s+40 then
		pincush("zoom",2,stepCrochet,4,"cubeOut")
		tweenFadeIn("blackBG",0.8,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == s+12 then
		pincush("zoom",2.5,stepCrochet,2,"cubeIn")
	elseif curStep == s+14 then
		pincush("zoom",3,stepCrochet,2,"cubeOut")
	elseif curStep == s+16 or curStep == s+48 then
		pincush("zoom",1,crochet,1,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
		tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")
	elseif curStep == s+44 then
		pincush("zoom",1.5,stepCrochet,2,"cubeIn")
	elseif curStep == s+46 then
		pincush("zoom",3,stepCrochet,2,"cubeOut")
		
		tweenShaderProperty('soloelx', 'y', -2, stepCrochet*0.001*4, 'cubeInOut')
	end
	if curStep == s+48 then--702
		bloom(7,1,crochet,2,"cubeOut")
		setShaderProperty("pincushGame","angle",0)
		pincush("angle",370,crochet,3.5,"cubeInOut")
	elseif curStep == s+52 then
		tweenFadeIn("blackBG",0.6,stepCrochet*0.001*8,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.15, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == s+64 then

		bloom(6,1,crochet,2,"cubeOut")
		pincush("angle",350,crochet,2,"cubeOut")
	elseif curStep == s+72 then--728
		bloom(3,1,crochet,1,"cubeOut")
		pincush("zoom",1.5,crochet,1,"cubeOut")
		pincush("angle",370,crochet,1,"cubeOut")
	elseif curStep == s+76 then
		bloom(2,1,crochet,1,"cubeOut")
		pincush("zoom",1,crochet,1,"cubeOut")
		pincush("angle",350,stepCrochet,2,"cubeOut")
	elseif curStep == s+78 then
		pincush("angle",370,stepCrochet,2,"cubeOut")
	elseif curStep == s+80 then
		bloom(3,1,crochet,2,"cubeOut")
		pincush("zoom",2,crochet,3,"cubeOut")
		pincush("angle",-10,crochet,3,"cubeOut")
	elseif curStep == s+92 then
		bloom(4,1,crochet,1,"cubeOut")
		pincush("zoom",1.5,crochet,1,"cubeOut")
		pincush("angle",10,crochet,1,"cubeOut")
	elseif curStep == s+96 then
		bloom(4,1,crochet,1,"cubeOut")
		pincush("zoom",1,crochet,1,"cubeOut")
		pincush("angle",-10,crochet,1,"cubeOut")
	elseif curStep == s+100 then
		pincush("angle",0,crochet,1,"cubeOut")
		tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeOut')
		tweenFadeIn("blackBG",0.9,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == s+104 then
		triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.025', ',0.025')
		bloom(5,1,crochet,1,"cubeOut")
		setActorAlpha(1,"HANK!!!")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.6, crochet*0.001*1, 'cubeOut')
		pincush("angle",10,crochet,1,"cubeOut")
		pincush("zoom",1.5,crochet,1,"cubeOut")
	elseif curStep == s+108 then
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'cubeIn')
		pincush("zoom",1,crochet,1,"cubeIn")
		pincush("angle",-10,crochet,1,"cubeIn")
		tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")

	elseif curStep == s+112 then
		setActorAlpha(0,"HANK!!!")
	end
end
function bloom(contrast,value1,speed,curStep,ease)
    if bloom then
       setShaderProperty("bloom","contrast",contrast)
       tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
    end
end
function pincush(valor,numero,speed,curStep,ease)
	tweenShaderProperty('pincushGame',valor, numero, speed*0.001*curStep, ease)
end
function barras(numero,speed,curStep,ease)
	tweenShaderProperty('bars',"effect", numero, speed*0.001*curStep, ease)
end
function barrasgame(numero,speed,curStep,ease)
	tweenShaderProperty('barsgame',"effect", numero, speed*0.001*curStep, ease)
end
function songStart()
	tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*14, 'linear')
    tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*14, 'linear')
    tweenShaderProperty('bloom', 'contrast', 0.5, crochet*0.001*12, 'linear')
	tweenActorProperty("topBar","y",-750, crochet*0.001*14, 'linear')
    tweenActorProperty("bottomBar","y",750, crochet*0.001*14, 'linear')
end
local swap = 1
function fechasregresando(nose)--speed 1.5
	for i = nose,nose do
		swap = swap* -1
		targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
		targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
		targetnoteZPos[i+1] = 0 
		noteAngle[i+1] = 360*swap

	end
end
function angulos(w,step)
    setShaderProperty('pincushGame', 'angle', w, stepCrochet*0.001, 'cubeIn')
    tweenShaderProperty('pincushGame', 'angle', 0, stepCrochet*0.001*step, 'cubeOut')
end
function bumpszoom(n,speed,s2,ease)
	setShaderProperty('ca', 'strength', 0.015)
	tweenShaderProperty('ca', 'strength', 0, speed*0.001*s2,ease)
	setShaderProperty("barrel","zoom",n)
	tweenShaderProperty('barrel', 'zoom', 1, speed*0.001*s2,ease)
	setShaderProperty("zoomblur","focusPower",3)
	tweenShaderProperty('zoomblur', 'focusPower', 0, speed*0.001*s2,ease)
end
flechas = {408,440,446,472,502,504,664,696,702,728,758,792,824,830,856,886,1048,1080,1086,1112,1162,1165,1174,1194,1202,1210,1226,1238,1258,1266,1274,1304,1336,1342}--1172 final drop
bumpsnose = {296,310,342,360,374,382,410,424,438,470,488,502,510,
680,694,726,744,758,798,808,822,854,872,886,936,950,1064,1078,1110,1128,1142,1160,1163,1166,1193,1206,1257,1270,1320,1334,1366,1384,1398,1406,1448,1462}--1168 final drop
function stepHit()
	for i = 1, #flechas do
        if curStep == flechas [i]-1 then
			noteScale = noteScale + 0.4
        end
    end
	for i = 1, #bumpsnose do
        if curStep == bumpsnose [i]-1 then
			bumpszoom(0.95,stepCrochet,2,"cubeOut")
        end
    end
	
	if curStep == 64 then
		bloom(1,0.5,crochet,2,"linear")
	end
    if curStep == 128 then
		bloom(3,1,crochet,2,"linear")
		setShaderProperty('vignette', 'size',0.2)
		fechasregresando(0)
		fechasregresando(7)
    elseif curStep == 144 then
		fechasregresando(1)
		fechasregresando(6)
    elseif curStep == 160 then
		fechasregresando(2)
		fechasregresando(5)
    elseif curStep == 176 then
		fechasregresando(3)
		fechasregresando(4)
	elseif curStep == 192 then
		bloom(3,1,crochet,2,"linear")
		tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*10, 'cubeIn')
		tweenShaderProperty('pincush', 'barrel', 5, crochet*0.001*10, 'cubeIn')
	elseif curStep == 228 then
	
		tweenShaderProperty('barsgame', 'effect', 0.55, crochet*0.001*2, 'cubeIn')
	elseif curStep == 232 then
		tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*2, 'cubeIn')
		tweenShaderProperty('EyeFishEffect', 'power', 0.4, crochet*0.001*2, 'cubeIn')
	elseif curStep == 240 then
		tween("topBar",{y = -650}, crochet*0.001*2, 'cubeOut')
				tweenShaderProperty('barsgame', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tween("bottomBar",{y = 650}, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
        bumpszoom(0.9,stepCrochet,4,"cubeOut")
	elseif curStep == 246 or curStep == 250 then
		bumpszoom(0.9,stepCrochet,4,"cubeOut")
	elseif curStep == 252 then
		pincush("zoom",3.5,stepCrochet,2,"cubeOut")	
		pincush("angle",-40,stepCrochet,2,"cubeOut")	
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 254 then
		pincush("zoom",1,stepCrochet,2,"cubeIn")	
		pincush("angle",40,stepCrochet,2,"cubeIn")	
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeIn')
	elseif curStep == 256 then
		pincush("angle",0,crochet,2,"cubeOut")	
		bloom(4,1,crochet,2.5,"cubeIn")
		tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*1, 'cubeOut')
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		lascosasdelhud(1)
		perlinXRange = 0
		perlinYRange = 0
		perlinSpeed = 0
    end
	if curStep == 250 then
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*1.5, 'cubeOut')
	end
	if curStep == 266 then
		pincush("x",1,stepCrochet,4,"cubeOut")	
    elseif curStep == 270 then
		pincush("y",-1,stepCrochet,4,"cubeOut")	
	elseif curStep == 280 then
		pincush("angle",180,crochet,4,"cubeInOut")	
	elseif curStep == 286 then
		pincush("zoom",3,stepCrochet,2,"cubeOut")	
	elseif curStep == 288 then
		pincush("zoom",1,stepCrochet,2,"cubeIn")	
	elseif curStep == 298 then
		pincush("y",0,stepCrochet,4,"cubeOut")	
	elseif curStep == 302 then
		pincush("x",2,stepCrochet,4,"cubeOut")	
	elseif curStep == 312 then
		pincush("angle",-40,stepCrochet,8,"cubeIn")	
	elseif curStep == 320 then
		pincush("angle",0,crochet,2,"cubeOut")
		bloom(4,1,stepCrochet,8,"cubeOut")
    end
	if curStep == 332 then
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, stepCrochet*0.001*2, 'cubeOut')
		pincush("zoom",1.5,crochet,1,"cubeOut")
	elseif curStep == 336 or curStep == 342 or curStep == 348 then
		pincush("zoom",1,stepCrochet,1.5,"cubeIn")
		pincush("angle",-10,stepCrochet,1.5,"cubeIn")
	elseif curStep == 340 or curStep == 346 then
		pincush("zoom",1.5,stepCrochet,1.5,"cubeIn")
		pincush("angle",10,stepCrochet,1.5,"cubeIn")
	elseif curStep == 350 then
		pincush("zoom",3,crochet,0.5,"cubeIn")
		pincush("angle",-360,crochet,2,"cubeInOut")
		tweenShaderProperty('soloelx', 'x', -2, stepCrochet*0.001*8, 'cubeInOut')
	elseif curStep == 352 or curStep == 364 then
		bloom(4,1,stepCrochet,8,"cubeOut")
		tweenFadeIn("blackBG",0.7,crochet*0.001*2,"cubeIn")
	elseif curStep == 354 then
		pincush("zoom",1,crochet,0.5,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 378 then
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*1.5, 'cubeOut')
	end
	if curStep == 368 or curStep == 374 then
		swap = swap* -1
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, stepCrochet*0.001*2, 'cubeOut')
		setShaderProperty('pincushGame', 'x', -0.1*swap)
		setShaderProperty('pincushGame', 'angle', 0)
		pincush("x",0,stepCrochet,2,"cubeOut")
		pincush("zoom",2,stepCrochet,3.5,"cubeIn")
		pincush("angle",10,stepCrochet,3.5,"cubeIn")
	elseif curStep == 372 or curStep == 378 then
		pincush("zoom",1,stepCrochet,1.5,"cubeIn")
		pincush("angle",-10,stepCrochet,1.5,"cubeIn")
	elseif curStep == 380 then
		pincush("zoom",4,stepCrochet,2,"cubeOut")
		pincush("angle",20,stepCrochet,2,"cubeOut")
	elseif curStep == 382 then
		pincush("zoom",1,stepCrochet,2,"cubeIn")
		pincush("angle",-40,stepCrochet,2,"cubeIn")
	elseif curStep == 384 then
		bloom(4,1,crochet,2.5,"cubeIn")
		tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*1, 'cubeOut')
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
	end
	if curStep == 504 then
		bloom(2.5,1,crochet,1,"cubeOut")
		barras(0.6,crochet,2,"cubeIn")
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*1.5, 'cubeIn')
		tweenShaderProperty('EyeFishEffect', 'power', 0.45, crochet*0.001*2, 'cubeIn')
	elseif curStep == 508 then
		pincush("zoom",3,stepCrochet,1.5,"cubeOut")
		bloom(2.5,1,crochet,1,"cubeOut")
	elseif curStep == 510 then
		pincush("zoom",1,stepCrochet,4,"cubeIn")
	elseif curStep == 512 then
		lascosasdelhud(0)
		tweenFadeIn("blackBG",0.5,stepCrochet*0.001*1,"cubeOut")
		setShaderProperty('vignette', 'size',0.7)
		tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*1, 'cubeOut')
		barras(0,crochet,2,"cubeOut")
		tweenShaderProperty('EyeFishEffect', 'power', 0, crochet*0.001*2, 'cubeOut')
		setShaderProperty('greyscale', 'strength', 1)
		bloom(5,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		pincush("angle",0,stepCrochet,1,"")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*1, 'cubeOut')
	end
	if curStep == 544 then
		pincush("angle",180,crochet,8,"cubeIn")
	elseif curStep == 572 then
		tweenShaderProperty('soloelx', 'y', 2, stepCrochet*0.001*8, 'cubeInOut')
	elseif curStep == 576 then
		bloom(5,1,crochet,2,"cubeOut")
		pincush("angle",360,stepCrochet,3.5,"cubeIn")
	elseif curStep == 580 then
		tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*18, 'cubeIn')
	elseif curStep == 632 then
		pincush("zoom",2,stepCrochet,3.5,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 636 then
		pincush("zoom",1,stepCrochet,7.5,"cubeOut")
		pincush("angle",360,crochet,2.5,"cubeInOut")
		tweenShaderProperty('soloelx', 'x', -2, stepCrochet*0.001*8, 'cubeInOut')
		noteRotX = 360
	elseif curStep == 640 then
		lascosasdelhud(1)
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*1, 'cubeOut')
		setShaderProperty('vignette', 'size',0.3)
		bloom(8,1,crochet,2,"cubeOut")
		tweenFadeIn("blackBG",0,stepCrochet*0.001*1,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
	end
	if curStep == 768 then
		rotCam = true
        rotCamSpd = 3
        rotCamRange = 10
		setShaderProperty('greyscale', 'strength', 0)
		bloom(7,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		pincush("angle",0,crochet,2,"cubeOut")
		setActorAlpha(1, 'speed')
	elseif curStep == 888 then
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
		barrasgame(0.35,crochet,2,"cubeOut")
		pincush("zoom",1,crochet,2,"cubeOut")
	elseif curStep == 896 then
		bloom(6,1,crochet,2,"cubeOut")
		tweenShaderProperty('pixel', 'strength',0, stepCrochet*0.001*4, 'cubeOut')
		pincush("zoom",3,stepCrochet,1,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		setShaderProperty('vignette', 'size', 0.7)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		setActorAlpha(0, 'speed')
		lascosasdelhud(0)
        rotCamSpd = 0
        rotCamRange = 0
	end
	if curStep == 952 then
		pincush("angle",-360,crochet,3.5,"cubeInOut")
	elseif curStep == 960 then
		bloom(6,1,crochet,2,"cubeOut")
		barrasgame(0,crochet,20,"linear")
		pincush("zoom",1,crochet,13.5,"linear")
		tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*16, 'linear')
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*16, 'linear')
	elseif curStep == 992 or curStep == 1004 or curStep == 1008 or curStep == 1014 then
		bloom(4,1,crochet,1,"cubeOut")
	elseif curStep == 1016 then
		pincush("zoom",2,crochet,1,"cubeOut")
		setShaderProperty('pincushGame', 'angle', 360)
		pincush("angle",0,crochet,2,"cubeIn")
	elseif curStep == 1020 then
		pincush("zoom",1,crochet,1,"cubeIn")
		setShaderProperty('soloelx', 'x',2)
		tweenShaderProperty('soloelx', 'x', 0, crochet*0.001*2, 'cubeInOut')
	end
	if curStep == 1024 then
		bloom(6,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		setShaderProperty('vignette', 'size', 0.3)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		setActorAlpha(1, 'speed')
		lascosasdelhud(1)
	elseif curStep == 1144 then
		pincush("zoom",3,crochet,1,"cubeOut")
		pincush("angle",-340,crochet,1,"cubeOut")
		tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
	elseif curStep == 1148 then
		pincush("zoom",1,crochet,1,"cubeIn")
		pincush("angle",-380,crochet,1,"cubeIn")
	elseif curStep == 1152 then
		lascosasdelhud(0)
		pincush("angle",-360,crochet,2,"cubeOut")
		bloom(7,1,crochet,2,"cubeOut")
		setActorAlpha(0, 'speed')
	elseif curStep == 1160 then
		setShaderProperty('pincushGame', 'angle', 0)
		pincush("angle",-80,crochet,0.5,"cubeOut")
		pincush("zoom",2,crochet,1,"cubeOut")
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*2, 'cubeOut')
		tweenFadeIn("blackBG",0.8,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1164 then
		pincush("angle",-120,crochet,0.5,"cubeOut")
		setShaderProperty('soloelx', 'x',-2)
		tweenShaderProperty('soloelx', 'x', 0, crochet*0.001*2, 'cubeInOut')
		pincush("zoom",1,crochet,1,"cubeIn")
	elseif curStep == 1168 then
		tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*1, 'cubeOut')
		bloom(6,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		setActorAlpha(1, 'speed')
		lascosasdelhud(1)
		rotCamSpd = 3
        rotCamRange = 10
		tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1166 then
		pincush("angle",-360,crochet,2,"cubeOut")
	end
	if curStep == 1216 then
		triggerEvent('screen shake', (crochet*0.001*16)..',0.015', '0')
	end
	if curStep == 1272 then
		pincush("zoom",3,crochet,1,"cubeOut")
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('greyscale', 'strength', 0.5, crochet*0.001*2, 'cubeOut')
		barras(0.6,crochet,2,"cubeIn")
	elseif curStep == 1276 then
		pincush("zoom",1,crochet,1,"cubeIn")
	elseif curStep == 1280 then
		lascosasdelhud(0)
		rotCamSpd = 0
        rotCamRange = 0
		barras(0,crochet,2,"cubeOut")
		bloom(6,1,crochet,2,"cubeOut")
		tweenShaderProperty('pixel', 'strength', 0, crochet*0.001*1, 'cubeOut')
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
		setActorAlpha(0, 'speed')
		tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'cubeOut')
		tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1290 or curStep == 1312 or curStep == 1354 or curStep == 1376 or curStep == 1392 or curStep == 1404 then
		bloom(3,1,crochet,1,"cubeOut")
	elseif curStep == 1344 then
		bloom(7,1,crochet,1.5,"cubeOut")
	elseif curStep == 1390 then
		bloom(3,1,stepCrochet,2,"cubeOut")
	end
	if curStep == 1472 then
		bloom(6,1,crochet,2,"cubeOut")
		setShaderProperty('greyscale', 'strength', 1)
		setShaderProperty('vignette', 'size', 0.7)
	elseif curStep == 1400 then
		pincush("zoom",2,crochet,1,"cubeOut")
		pincush("angle",-50,crochet,1,"cubeOut")
	elseif curStep == 1404 then
		pincush("zoom",1,crochet,1,"cubeIn")
		pincush("angle",20,crochet,1,"cubeIn")
		noteRotX = -360
	elseif curStep == 1408 or curStep == 1536 then
		pincush("angle",0,crochet,2,"cubeOut")
	end
	if curStep == 1408 then
		bloom(6,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 1)
		tweenShaderProperty('glitchPeak', 'AMT', 0, crochet*0.001*2.5, 'cubeIn')
	elseif curStep == 1536 then 
		bloom(4,1,crochet,2,"cubeOut")
		barras(0.6,crochet,8,"cubeIn")
		pincush("zoom",2,crochet,8,"cubeIn")
		tweenShaderProperty('pixel', 'strength', 70, crochet*0.001*8, 'cubeIn')
		tweenShaderProperty('EyeFishEffect', 'power', 0.5, crochet*0.001*8, 'cubeIn')
	end
	if curStep >= 580 and curStep < 632 or curStep >= 1280 and curStep < 1402 then
        if curStep % 16 == 4 then
           angulos(15,8)
		   flechasxd(40,-40)
		   noteRotX = 10
		   noteScale = noteScale + 0.3
		elseif curStep % 16 == 12 then
			angulos(-15,8)
			flechasxd(-40,40)
			noteRotX = -10
			noteScale = noteScale + 0.3
        end 
	end
	
	if curStep >= 256 and curStep < 512 or curStep >= 768 and curStep < 896 then
        if curStep % 16 == 4 then
		   flechasxd(20,-20)
		   noteRotX = 10
		   noteScale = noteScale + 0.5
		   doModchartShit(0)
		elseif curStep % 16 == 12 then
			flechasxd(-20,20)
			noteRotX = -10
			noteScale = noteScale + 0.5
			doModchartShit(0)
        end 
	end

	if curStep >= 640 and curStep < 760 or curStep >= 1024 and curStep < 1136 then
        if curStep % 16 == 4 then
		   flechasxd(20,-20)
		   doModchartShit(2)
		   noteRotX = 10
		   noteScale = noteScale + 0.5
		elseif curStep % 16 == 12 then
			doModchartShit(2)
			flechasxd(-20,20)
			noteRotX = -10
			noteScale = noteScale + 0.5
        end 
	end

	if curStep >= 256 and curStep < 634 or curStep >= 640 and curStep < 753 or curStep >= 768 and curStep < 896  or curStep >= 896 and curStep < 960 or curStep >= 1024 and curStep < 1145 or curStep >= 1290 and curStep < 1472 then
        if curStep % 16 == 0 then
            bumpszoom(0.93,stepCrochet,4,"cubeOut")
		elseif curStep % 16 == 10 then
			bumpszoom(0.93,stepCrochet,4,"cubeOut")
        end 
	end
	if curStep >= 960 and curStep < 992 then
        if curStep % 4 == 0 then
            bumpszoom(0.93,stepCrochet,3.5,"cubeOut")
        end 
	end
	if curStep >= 992 and curStep < 1008 then
        if curStep % 2 == 0 then
            bumpszoom(0.93,stepCrochet,1.5,"cubeOut")
        end 
	end
	if curStep == 552 or curStep == 566 or curStep == 598 or curStep == 616 or curStep == 630 then
		bumpszoom(0.93,stepCrochet,2,"cubeOut")
	end
	if curStep >= 634 and curStep < 640 or curStep >= 1008 and curStep < 1016 or curStep >= 1212 and curStep < 1216 or curStep >= 1276 and curStep < 1280  then
        if curStep % 1 == 0 then
            bumpszoom(0.93,stepCrochet,0.5,"cubeOut")
        end 
	end
	--dropfinal
	if curStep >= 1168 and curStep < 1280 then
        if curStep % 16 == 0 then
            bumpszoom(0.93,stepCrochet,2,"cubeOut")
		elseif curStep % 16 == 4 then
			flechasfinal(30,-30)
			noteRotX = -15
			noteScale = noteScale + 0.5
		elseif curStep % 16 == 8 then
			bumpszoom(0.93,stepCrochet,1,"cubeOut")
		elseif curStep % 16 == 11 then
			bumpszoom(0.93,stepCrochet,2,"cubeOut")
		elseif curStep % 16 == 12 then
			flechasfinal(-30,30)
			noteRotX = 15
			noteScale = noteScale + 0.5
		elseif curStep % 16 == 14 then
			bumpszoom(0.93,stepCrochet,2,"cubeOut")
        end 
	end
	speedlinesnose(828)
	speedlinesnose(1212)
	hankkk(656)
	hankkk(1424)
	nosexd(384)
	nosexd(1024)
	bumps(256)
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
function flechasxd2(xd,s,a,f)
    for i = 0,(keyCount*2)-1 do
        if i % 2 == 0 then
            noteAngle[i+1] = xd-- -40
			noteYPos[i+1] = a*downscroll
        else 
            noteAngle[i+1] = s-- 40
			noteYPos[i+1] = f*downscroll
        end
    end
end
function flechasfinal(xd,s)
	swap = swap* -1
    for i = 0,(keyCount*2)-1 do
		if i % 2 == 0 then
            noteAngle[i+1] = xd-- -40
        else 
            noteAngle[i+1] = s-- 40
        end
    
    end
end
function speedlinesnose(s)
	if curStep == s then
		pincush("zoom",0.6,crochet,1,"cubeIn")
	elseif curStep == s+4 then--832
		pincush("zoom",1.5,crochet,4,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame', 'power', 0.15, stepCrochet*0.001*8, 'cubeOut')
		bloom(7,1,crochet,2,"cubeOut")
	elseif curStep == s+20 then--848
		pincush("zoom",2,crochet,2,"cubeOut")
	elseif curStep == s+28 then
		pincush("zoom",1,crochet,1,"cubeOut")
	elseif curStep == s+32 then
		pincush("zoom",2,stepCrochet,2,"cubeOut")
	elseif curStep == s+34 then
		pincush("zoom",1,stepCrochet,2,"cubeOut")
	elseif curStep == s+35 then
		pincush("zoom",2,stepCrochet,1,"cubeOut")
	elseif curStep == s+36 then
		pincush("zoom",1,crochet,2,"cubeOut")--864
		bloom(4,1,crochet,2,"cubeOut")
	elseif curStep == s+48 then
		pincush("zoom",2,stepCrochet,4,"cubeOut")
	elseif curStep == s+52 then
		pincush("zoom",2.8,stepCrochet,8,"cubeOut")
		bloom(4,1,crochet,2,"cubeOut")
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

local modchartState = 0

local flipShit = 1
local flipShit2 = 1
function doModchartShit(state)
    flipShit = flipShit * -1
	if state == 0 then
		flipShit = flipShit * -1
        for i = 0,1 do 
            if flipShit == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (10 * note)
            end
        end
		for i = 2,3 do 
            if flipShit == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (10 * note)
            end
        end
    elseif state == 2 then 
        flipShit2 = flipShit2 * -1
        for i = 0,1 do 
            if flipShit2 == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (10 * note)
            end
        end
        for i = 2,3 do 
            if flipShit2 == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (-10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (-10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (-10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (-10 * note)
            end
        end
	end
end