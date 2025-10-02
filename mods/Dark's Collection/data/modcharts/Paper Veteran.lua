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
local doNoteTrail = false
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
function createPost()
    lascosasdelhud(0)
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
		targetnoteZPos[i+1] = 400 
	end
	if downscrollBool then
        downscroll = -1
    end
	for i = 0,(keyCount*2)-1 do
	    if not middlescroll then
			if (i >= 0 and i <= 3) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
			elseif (i >= 4 and i <= 7) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 720
			end
		end
	end
	for i = 0,(keyCount*2)-1 do	
        if i % 2 == 0 then
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] -150*downscroll
        else 
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] +450*downscroll
        end
    end

	
	initShader('perlin', 'PincushNewEffect')--
    setCameraShader('game', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
	setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)
	setShaderProperty('perlin', 'barrel', 0)
    setShaderProperty('perlin', 'doChroma', true)
	makeCamera("vignette")
	makeCamera("nose")

    initShader('vignette', 'VignetteEffect')--
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.1)
    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('vignette', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)
	
    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.5)
    setShaderProperty('godrays', 'density',0.5)
    setShaderProperty('godrays', 'weigth', 0.68)


	

	initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

	initShader('particles', 'particlesnew')
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.87)
    setShaderProperty('particles', 'red', 1)
    setShaderProperty('particles', 'blue', 3)
    setShaderProperty('particles', 'green', 2)
    initShader('pincushGame', 'PincushNewEffect')--
    setCameraShader('game', 'pincushGame')
	setCameraShader('nose', 'pincushGame')
    setShaderProperty('pincushGame', 'zoom', 3.5)
    setShaderProperty('pincushGame', 'angle', -20)
	setShaderProperty('pincushGame', 'x', 0)
    setShaderProperty('pincushGame', 'y', 0)
	setShaderProperty('pincushGame', 'barrel', 0)
    setShaderProperty('pincushGame', 'doChroma', true)
	initShader('soloxy', 'PincushNewEffect')--
    setCameraShader('game', 'soloxy')
	setCameraShader('nose', 'soloxy')
    setShaderProperty('soloxy', 'zoom', 1)
    setShaderProperty('soloxy', 'angle', 0)
	setShaderProperty('soloxy', 'x', 0)
    setShaderProperty('soloxy', 'y', 0)
	setShaderProperty('soloxy', 'barrel', 0)
    setShaderProperty('soloxy', 'doChroma', true)
    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)
    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue',1.5)
	initShader('colorHUD', 'ColorOverrideEffect')--
	setCameraShader('hud','colorHUD')
	setCameraShader('nose','colorHUD')
    setShaderProperty('colorHUD', 'red', 1.5)
    setShaderProperty('colorHUD', 'green',1.5)
    setShaderProperty('colorHUD', 'blue',1.5)
	initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 2)
    setShaderProperty('zoomblurGame', 'focusPower', 0)
	initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)
	initShader('glitchPeak', 'Glitchy')
	setCameraShader('hud', 'glitchPeak')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('nose', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)
	initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
	initShader('bars', 'bars')
	setCameraShader('game', 'bars')
	setShaderProperty('bars', 'effect', 0)
	initShader('bars2', 'bars')
	setCameraShader('hud', 'bars2')
	setShaderProperty('bars2', 'effect', 0)
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
	setCameraShader('nose', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.1)
    initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)
	makeSprite('uno paper', 'uno paper', -3000, 150, 1)
	setObjectCamera('uno paper', 'hud')
	makeSprite('dos paper', 'dos paper', 3000, 150, 1)
	setObjectCamera('dos paper', 'hud')
	makeSprite('tres paper', 'tres paper', -3000, 150, 1)
	setObjectCamera('tres paper', 'hud')
	makeSprite('cuatro paper', 'cuatro paper', 3000, 150, 1)
	setObjectCamera('cuatro paper', 'hud')
	makeSprite('uno', 'uno', -3000, 150, 1)
	setObjectCamera('uno', 'hud')
	makeSprite('dos', 'dos', 3000, 150, 1)
	setObjectCamera('dos', 'hud')
	makeSprite('tres', 'tres', -3000, 150, 1)
	setObjectCamera('tres', 'hud')
	makeSprite('cuatro', 'cuatro', 3000, 150, 1)
	setObjectCamera('cuatro', 'hud')
	makeSprite('Uno Veteran', 'Uno Veteran', -3000, 120, 1.2)
	setObjectCamera('Uno Veteran', 'hud')
	makeSprite('Dos Veteran', 'Dos Veteran', 3000, 120, 1.2)
	setObjectCamera('Dos Veteran', 'hud')
	makeSprite('Tres Veteran', 'Tres Veteran', -3000, 120, 1.2)
	setObjectCamera('Tres Veteran', 'hud')
	makeSprite('Cuatro Veteran', 'Cuatro Veteran', 3000, 120, 1.2)
	setObjectCamera('Cuatro Veteran', 'hud')
	makeSprite('Coin', 'Coin',450, 2000,0.5)
	setObjectCamera('Coin', 'hud')
end
function bump(speed,s)
	setShaderProperty('barrel', 'zoom', 0.9)
    tweenShaderProperty('barrel',"zoom",1, speed*0.001*s,"cubeOut")
end

local time = 0
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
local lerpSpeedX = 3.5
local lerpSpeedY = 0.5
local lerpSpeedZ = 0.5
local lerpSpeedAngle = 1
local lerpSpeednoteRotX = 5

local drunkLerp = 1
local drunk = 1
local drunkSpeed = 8
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 1
local perlinXRange = 0.1
local perlinYRange = 0.1
local rotCam = false
local rotCamSpd = 1
local rotCamRange = 15
local rotCamInd = 0

local matt = false
local bf = false
function update(elapsed)
	time = time + elapsed
	setCustomShaderFloat('glitchPeak', 'iTime', time)
    setCustomShaderFloat('godrays', 'iTime', time)
	setCustomShaderFloat('heat', 'iTime', time)
	setCustomShaderFloat('particles', 'iTime', time)
	setCustomShaderFloat('speedlines', 'iTime', time)
	perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('soloxy', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('soloxy', 'angle', 0)
    end
	

	if matt == true then
		set("camFollow.x", get("dad.x")+225)
        set("camFollow.y", get("dad.y")+150)
        set("defaultCamZoom", 1.1)
	elseif matt == false then
		set("camFollow.x",get("dad.x")+750)
		
	end
	if bf then
		set("camFollow.x", get("boyfriend.x")+225)
        set("camFollow.y", get("boyfriend.y")+150)
        set("defaultCamZoom", 1.1)

	end

end
function flechasxdddd(s,q,n,lol)
	lerpSpeedY = 3
	lerpSpeedAngle = 5

	if curStep == lol then
		for i = s,q do
			noteYPos[i+1] = targetnoteYPos[i+1] -70*downscroll
			noteAngle[i+1] = n
		end
	end
end
function breaks(s,q,n)
	for i = s,q do
		targetnoteZPos[i+1] = 0
		noteAngle[i+1] = n
	end
end
function songStart()
	tweenShaderProperty('bloom',"contrast",1, crochet*0.001*16,"linear")
	tweenShaderProperty('greyscale',"strength",0, crochet*0.001*32,"cubeIn")
	for i = 0,(keyCount*2)-1 do	
        if i % 4 == 0 then
            noteAngle[i+1] = 360
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
            targetnoteZPos[i+1] = 0 
        else 
            noteAngle[i+1] = -360
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
            targetnoteZPos[i+1] = 0 
        end
    end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function pincushGame(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('pincushGame',value,valor)
    end
    if tween then
        tweenShaderProperty('pincushGame',value2,valor2, speed*0.001*s,ease)
    end
end
function flechastipofd()
	lerpSpeedX = 3.5
	for i = 0,(keyCount)-1 do  
		setActorX(-1180,"ratingsGroup")
		if not middlescroll then 
			if keyCount == 4 and i == 4 then 
				if not downscrollBool then 
					targetnoteYPos[i+1] = -3000
					targetnoteYPos[i+1+keyCount] = _G['defaultStrum'..((i))..'Y']
				else 
					targetnoteYPos[i+1] = 3000
					targetnoteYPos[i+1+keyCount] = _G['defaultStrum'..((i))..'Y']
				end
			end
			targetnoteXPos[i+1] = _G['defaultStrum'..((i%keyCount))..'X']+320
			targetnoteXPos[i+1+keyCount] = _G['defaultStrum'..((i%keyCount)+keyCount)..'X']+320
			if keyCount == 4 and i > 4 then 
				targetnoteXPos[i+1] = targetnoteXPos[i+1]-(66.8/2)

			end
			if keyCount == 4 and i < 4 then 
				targetnoteXPos[i+1] = targetnoteXPos[i+1]+(66.8/2)
			
			end
		else 
			targetnoteXPos[i+1+keyCount] = _G['defaultStrum'..((i%keyCount)+keyCount)..'X']
			targetnoteYPos[i+1+keyCount] = _G['defaultStrum'..((i))..'Y']
			
		end
		targetnoteZPos[i+1] = 0
		targetnoteZPos[i+1+keyCount] = -500
	end
end
function flechastipofdregresando()
	for i = 0,(keyCount)-1 do  
		lerpSpeedX = 3.5
		if keyCount == 4 and i == 4 then 
			if not downscrollBool then 
				targetnoteYPos[i+1] = _G['defaultStrum'..((i))..'Y']
				targetnoteYPos[i+1+keyCount] = -3000
			else 
				targetnoteYPos[i+1] = _G['defaultStrum'..((i))..'Y']
				targetnoteYPos[i+1+keyCount] = 3000
			end
		end

		if not middlescroll then 
			targetnoteXPos[i+1+keyCount] = _G['defaultStrum'..((i%keyCount)+keyCount)..'X']-320
			targetnoteXPos[i+1] = _G['defaultStrum'..((i%keyCount))..'X']-320
		else 
			targetnoteXPos[i+1+keyCount] = _G['defaultStrum'..((i%keyCount)+keyCount)..'X']
		end
		targetnoteZPos[i+1+keyCount] = 0
		targetnoteZPos[i+1] = -500

		if keyCount == 4 and i > 4 then 
			
			targetnoteXPos[i+1+keyCount] = targetnoteXPos[i+1+keyCount]-(66.8/2)
		end
		if keyCount == 4 and i < 4 then 
			targetnoteXPos[i+1+keyCount] = targetnoteXPos[i+1+keyCount]+(66.8/2)
		end
	end
end 
local beatSwap = 1
angles1 = {584,600,616,2296}
angles2 = {576,592,608,624,2288}
function stepHit()
	if curStep >= 384 and curStep < 640 then
		lerpSpeedX = 4
        lerpSpeedZ = 4
		lerpSpeedY = 4
        if curStep % 128 == 0 then
			flechastipofd()
		elseif curStep % 128 == 64 then
			flechastipofdregresando()
        end
	end
	for i = 1, #angles1 do
        if curStep == angles1 [i]-1 then
			pincushGame(true,true,"angle","angle",-20,0,crochet,1,"cubeOut")
        end
    end
	for i = 1, #angles2 do
        if curStep == angles2 [i]-1 then
			pincushGame(true,true,"angle","angle",20,0,crochet,1,"cubeOut")
        end
    end
	if curStep == 64 then
		pincushGame(false,true,"","angle",0,10,crochet,16,"cubeIn")
		pincushGame(false,true,"","zoom",0,1,crochet,16,"cubeIn")
	elseif curStep == 112 then
		bloom(3,1,crochet,1,"cubeOut")
	elseif curStep == 128 or curStep == 256 then
		doNoteTrail = false
		pincushGame(false,true,"","angle",0,0,crochet,2,"cubeOut")
		bloom(6,1,crochet,2,"cubeOut")
		lascosasdelhud(1)
		drunk = 0.1
		drunkLerp = 0.5
		for i = 0,(keyCount*2)-1 do
			noteAngle[i+1] = 360
			lerpSpeedAngle = 4
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
				end
			end
		end
	end
	if curStep == 144 then
		lerpSpeedX = 14
        pincushGame(false,true,"","angle",0,20,stepCrochet,6,"cubeOut")
        pincushGame(false,true,"","zoom",0,2,stepCrochet,6,"cubeOut")
    elseif curStep == 152 then
        pincushGame(false,true,"","angle",0,-10,crochet,2,"cubeIn")
        pincushGame(false,true,"","zoom",0,1,crochet,2,"cubeIn")
    elseif curStep == 160 then
        pincushGame(false,true,"","angle",0,0,crochet,2,"cubeOut")
    elseif curStep == 184 then
        pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
    elseif curStep == 188 then
        pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
    elseif curStep == 192 then
        pincushGame(true,true,"angle","angle",-20,0,crochet,2,"cubeOut")
	elseif curStep == 224 or curStep == 226 then
		pincushGame(true,true,"x","x",-0.15,0,stepCrochet,2,"cubeOut")
	elseif curStep == 230 or curStep == 232 then
		pincushGame(true,true,"x","x",0.15,0,stepCrochet,2,"cubeOut")
    elseif curStep == 240 then
		pincushGame(false,true,"","zoom",0,3,crochet,4,"cubeOut")
		pincushGame(false,true,"","angle",0,-70,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",-14, crochet*0.001*4,"linear")
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*2,"cubeOut")
	elseif curStep == 256 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		tweenShaderProperty('bars',"effect",0, crochet*0.001*1,"cubeOut")
    end
	if curStep == 272 then
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,4,"cubeOut")
		pincushGame(true,true,"angle","angle",20,0,crochet,1,"cubeOut")
		tweenShaderProperty('soloxy',"x",1, crochet*0.001*1,"cubeOut")
		tween("uno paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 276 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",-15,crochet*0.001*1,"cubeOut")
		tween("uno paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("dos paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 280 then
		pincushGame(false,true,"","zoom",0,2.5,stepCrochet,4,"cubeOut")
		pincushGame(true,true,"angle","angle",-20,0,crochet,1,"cubeOut")
		tweenShaderProperty('soloxy',"x",2, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('soloxy',"y",-14, crochet*0.001*1,"cubeOut")
		tween("dos paper",{x=3000},crochet*0.001*1,"cubeInOut")
		tween("tres paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 284 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		pincushGame(true,true,"angle","angle",20,0,crochet,2,"cubeOut")
		tweenShaderProperty('soloxy',"x",0, crochet*0.001*1,"cubeOut")
		tween("tres paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("cuatro paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 288 then
		tween("cuatro paper",{x=3000},crochet*0.001*1,"cubeInOut")
	elseif curStep == 304 then
		pincushGame(false,true,"angle","angle",0,-40,crochet,4,"cubeIn")
	elseif curStep == 320 then
		pincushGame(false,true,"angle","angle",0,0,crochet,3,"cubeOut")
	elseif curStep == 366 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,6,"cubeOut")
		pincushGame(true,true,"angle","angle",-20,0,crochet,1,"cubeOut")
	elseif curStep == 371 then
		pincushGame(true,true,"angle","angle",20,0,crochet,1,"cubeOut")
	elseif curStep == 372 then
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
	elseif curStep == 374 then
		pincushGame(true,true,"angle","angle",-20,0,stepCrochet,4,"cubeOut")
	elseif curStep == 376 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
	elseif curStep == 378 then
		pincushGame(false,true,"angle","angle",0,360,crochet,3,"cubeInOut")
	elseif curStep == 384 then
		pincushGame(true,true,"zoom","zoom",4,1,crochet,64,"linear")
		bloom(8,1,crochet,2,"cubeOut")
		lascosasdelhud(0)
		setShaderProperty('zoomblurGame', 'focusPower', 3)
		tweenShaderProperty('zoomblurGame',"focusPower",0, crochet*0.001*48,"cubeIn")
		setShaderProperty('greyscale', 'strength', 1)
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.15, crochet*0.001*1,"cubeOut")
        perlinXRange = 0
        perlinYRange = 0
	elseif curStep == 632 then
		bloom(4,0,crochet,2,"cubeOut")
		setShaderProperty('greyscale', 'strength', 0)
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*2,"cubeOut")
		tween("Coin",{y=200},crochet*0.001*1,"cubeOut")
		for i = 0,(keyCount*2)-1 do
			if i % 2 == 0 then
				noteAngle[i+1] = -360
			else
				noteAngle[i+1] = 360
			end
		 end
	elseif curStep == 636 then
		tween("Coin",{y=2000},crochet*0.001*1,"cubeInOut")	
	elseif curStep == 640 then
		lerpSpeedX = 14
		set("defaultCamZoom", 0.35)
		bloom(8,1,crochet,2,"cubeOut")
		lascosasdelhud(1)
		pincushGame(true,true,"zoom","zoom",2.5,1,crochet,2,"cubeIn")
		setActorX(0,"ratingsGroup")
		for i = 0,(keyCount*2)-1 do
			targetnoteXPos[i+1] = _G['defaultStrum'..((i))..'X']
			targetnoteYPos[i+1] = _G['defaultStrum'..((i))..'Y']
			targetnoteZPos[i+1] = 0
		end
	end
	if curStep == 656 then--voiid
		pincushGame(false,true,"","zoom",0,2.5,crochet,2,"cubeOut")
		pincushGame(false,true,"","angle",0,20,crochet,2,"cubeOut")
	elseif curStep == 664 then
		pincushGame(false,true,"","zoom",0,1,crochet,2,"cubeIn")
		pincushGame(false,true,"","angle",0,-20,crochet,2,"cubeIn")
		setShaderProperty('soloxy', 'x', 0.15)
		tweenShaderProperty('soloxy',"x",0, crochet*0.001*1,"cubeOut")
	elseif curStep == 660 then
		setShaderProperty('soloxy', 'x', -0.15)
		tweenShaderProperty('soloxy',"x",0, crochet*0.001*1,"cubeOut")
	elseif curStep == 672 then
		pincushGame(false,true,"","angle",0,0,crochet,2,"cubeOut")
	elseif curStep == 688 then
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*1,"cubeOut")
		pincushGame(false,true,"","zoom",0,0.5,crochet,1,"cubeOut")
	elseif curStep == 704 then
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeOut")
	elseif curStep == 736 or curStep == 752 then
		pincushGame(false,true,"","angle",0,10,crochet,0.5,"cubeOut")
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
	elseif curStep == 740 or curStep == 748 or curStep == 756 then
		pincushGame(false,true,"","angle",0,0,crochet,1,"cubeIn")
		pincushGame(false,true,"","zoom",0,1,crochet,0.5,"cubeIn")
	elseif curStep == 744 then
		pincushGame(false,true,"","angle",0,-10,crochet,0.5,"cubeOut")
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
	elseif curStep == 760 then
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
	elseif curStep == 764 then
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
	elseif curStep == 768 then
		bloom(4,1,crochet,2,"cubeOut")
	elseif curStep == 784 then
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*1,"cubeOut")
		pincushGame(false,true,"","zoom",0,0.8,crochet,1,"cubeOut")
	elseif curStep == 788 then
		pincushGame(false,true,"","zoom",0,0.7,crochet,1,"cubeOut")
	elseif curStep == 792 then
		pincushGame(false,true,"","zoom",0,0.6,crochet,1,"cubeOut")
	elseif curStep == 796 then
		pincushGame(false,true,"","zoom",0,0.5,crochet,1,"cubeOut")
	elseif curStep == 800 then
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,crochet,3,"cubeIn")
	elseif curStep == 816 then
		tween("uno",{x=300},crochet*0.001*1,"cubeOut")
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*1,"cubeOut")
		pincushGame(false,true,"","zoom",0,0.5,crochet,1,"cubeOut")
	elseif curStep == 820 then
		tween("uno",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("dos",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 824 then
		tween("dos",{x=3000},crochet*0.001*1,"cubeInOut")
		tween("tres",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 828 then
		tween("tres",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("cuatro",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 832 then
		tween("cuatro",{x=3000},crochet*0.001*1,"cubeInOut")
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeOut")
	elseif curStep == 888 then
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		bloom(1,0,crochet,2,"cubeOut")
	elseif curStep == 896 then
		doNoteTrail = false
		bloom(8,1,crochet,2,"cubeOut")
		pincushGame(true,true,"zoom","zoom",0.5,1,crochet,2,"cubeIn")
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel',"barrel",0, crochet*0.001*4,"cubeOut")
	end
	if curStep == 924 then
		setShaderProperty('soloxy', 'x', 0.15)
		tweenShaderProperty('soloxy',"x",0, stepCrochet*0.001*2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,2,"cubeOut")
	elseif curStep == 926 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,2,"cubeOut")
		setShaderProperty('soloxy', 'x', -0.15)
		tweenShaderProperty('soloxy',"x",0, stepCrochet*0.001*2,"cubeOut")
	elseif curStep == 928 then
		pincushGame(true,true,"angle","angle",-20,0,stepCrochet,4,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeIn")
	elseif curStep == 944 or curStep == 952 then
		beatSwap = beatSwap* -1
		pincushGame(true,true,"angle","angle",20*beatSwap,0,stepCrochet,4,"cubeOut")
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,4,"cubeOut")
	elseif curStep == 948 or curStep == 956 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
	elseif curStep == 960 then
		bloom(6,1,crochet,2,"cubeOut")
	elseif curStep == 1008 then
		tweenShaderProperty('soloxy',"x",1, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","zoom",0,2.5,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",-1, stepCrochet*0.001*4,"cubeOut")
		pincushGame(true,true,"angle","angle",-20,0,stepCrochet,4,"cubeOut")
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.15, crochet*0.001*1,"cubeOut")
	elseif curStep == 1012 then
		tweenShaderProperty('soloxy',"x",3, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",0, stepCrochet*0.001*4,"cubeOut")
		pincushGame(true,true,"angle","angle",20,0,stepCrochet,4,"cubeOut")
	elseif curStep == 1016 then
		tweenShaderProperty('soloxy',"x",2, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","zoom",0,2.5,stepCrochet,4,"cubeOut")
		pincushGame(true,true,"angle","angle",-20,0,stepCrochet,4,"cubeOut")
	elseif curStep == 1020 then
		tweenShaderProperty('soloxy',"x",0, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
	elseif curStep == 1024 then
		pincushGame(true,true,"angle","angle",20,0,stepCrochet,4,"cubeOut")
		bloom(8,1,crochet,2,"cubeOut")
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*1,"cubeOut")
		pincushGame(true,true,"zoom","zoom",0.5,1,crochet,2,"cubeIn")
	elseif curStep == 1056 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",-1, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","angle",0,20,stepCrochet,4,"cubeOut")
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.15, crochet*0.001*1,"cubeOut")
	elseif curStep == 1060 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"y",0, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1064 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"x",1, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1068 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		tweenShaderProperty('soloxy',"x",0, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","angle",0,0,stepCrochet,4,"cubeOut")
	elseif curStep == 1072 then
		tweenShaderProperty('soloxy',"y",2, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","angle",0,-20,stepCrochet,4,"cubeOut")
	elseif curStep == 1076 then
		tweenShaderProperty('soloxy',"y",3, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","zoom",0,2,stepCrochet,4,"cubeOut")
	elseif curStep == 1080 then
		tweenShaderProperty('soloxy',"x",1, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1084 then
		tweenShaderProperty('soloxy',"x",2, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1088 then
		tweenShaderProperty('soloxy',"y",4, stepCrochet*0.001*4,"cubeOut")
		pincushGame(false,true,"","angle",0,0,stepCrochet,4,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*1,"cubeOut")
	elseif curStep == 1120 then
		pincushGame(false,true,"","angle",0,180,crochet,8,"cubeIn")
		pincushGame(false,true,"","zoom",0,4,crochet,8,"cubeIn")
		tweenShaderProperty('zoomblurGame',"focusPower",3, crochet*0.001*8,"cubeIn")
	elseif curStep == 1144 then
		tweenShaderProperty('bars',"effect",0.15, crochet*0.001*2,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.1, crochet*0.001*2,"cubeOut")
	elseif curStep == 1152 then
		for i = 0,(keyCount*2)-1 do
			noteAngle[i+1] = 360
			lerpSpeedAngle = 4
			lerpSpeedX = 2.5
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -640
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +640
				end
			end
		end
		bloom(8,2,crochet,3,"cubeOut")
		lascosasdelhud(0)
		setShaderProperty('greyscale', 'strength', 1)
		setShaderProperty('vignette', 'size', 1)
		pincushGame(false,true,"","angle",0,360,crochet,64,"cubeIn")
		pincushGame(false,true,"","zoom",0,1,crochet,64,"cubeIn")
		tweenShaderProperty('zoomblurGame',"focusPower",0, crochet*0.001*60,"cubeIn")
	elseif curStep == 1168 then
		for i = 0,(keyCount*2)-1 do
			targetnoteZPos[i+1] = 1000
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
				end
			end
		end
	elseif curStep == 1376 then
		breaks(0,0,360)
		breaks(7,7,360)
	elseif curStep == 1380 then
		breaks(1,1,-360)
		breaks(6,6,-360)
	elseif curStep == 1384 then
		breaks(2,2,360)
		breaks(5,5,360)
	elseif curStep == 1388 then
		breaks(3,3,-360)
		breaks(4,4,-360)
	elseif curStep == 1400 then
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
		bloom(1,0,crochet,2,"cubeOut")
	elseif curStep == 1408 then
		setShaderProperty('vignette', 'size', 0.1)
		bloom(8,1,crochet,2,"cubeOut")
		setShaderProperty('greyscale', 'strength', 0)
		lascosasdelhud(1)
		pincushGame(true,true,"zoom","zoom",0.5,1,crochet,2,"cubeIn")
		setShaderProperty('barrel', 'barrel', -10)
		tweenShaderProperty('barrel',"barrel",0, crochet*0.001*4,"cubeOut")
	elseif curStep == 1416 then
		pincushGame(true,true,"angle","angle",-20,0,stepCrochet,4,"cubeOut")
		
	end
	if curStep == 1424 then
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
	elseif curStep == 1428 or curStep == 1434 then
		pincushGame(false,true,"","zoom",0,1,crochet,0.5,"cubeIn")
	elseif curStep == 1430 then
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
		pincushGame(true,true,"angle","angle",20,0,stepCrochet,4,"cubeOut")
	elseif curStep == 1440 then
		pincushGame(false,true,"","zoom",0,2,crochet,1,"cubeOut")
		pincushGame(false,true,"","angle",0,-20,crochet,1,"cubeOut")
		tweenShaderProperty('soloxy',"y",3, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1444 then
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
		tweenShaderProperty('soloxy',"y",4, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1448 then
		pincushGame(false,true,"","angle",0,0,crochet,1,"cubeOut")
	elseif curStep == 1464 then
		pincushGame(false,true,"","zoom",0,1.5,crochet,1,"cubeOut")
	elseif curStep == 1468 then
		pincushGame(false,true,"","angle",0,20,crochet,1,"cubeIn")
	elseif curStep == 1472 then
		pincushGame(false,true,"","angle",0,0,crochet,2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
	elseif curStep == 1520 then
		pincushGame(false,true,"","zoom",0,2,crochet,2,"cubeOut")
		pincushGame(true,true,"angle","angle",20,0,crochet,1,"cubeOut")
	elseif curStep == 1524 or curStep == 1528 then
		beatSwap = beatSwap* -1
		pincushGame(true,true,"angle","angle",-20*beatSwap,0,crochet,1,"cubeOut")
	end
	if curStep == 1528 then
		tweenShaderProperty('soloxy',"x",4, stepCrochet*0.001*12,"cubeInOut")
		pincushGame(false,true,"","zoom",0,1,crochet,2,"cubeIn")
	elseif curStep == 1532 then
		pincushGame(true,true,"angle","angle",20,0,crochet,1,"cubeOut")
	elseif curStep == 1568 then
		pincushGame(false,true,"","zoom",0,3,crochet,3,"cubeIn")
		pincushGame(false,true,"angle","angle",0,-70,crochet,3,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",0.3, crochet*0.001*3,"cubeIn")
	elseif curStep == 1580 then
		tweenShaderProperty('EyeFishEffectGame',"power",0.1, crochet*0.001*2,"cubeIn")
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
		pincushGame(false,true,"angle","angle",0,20,crochet,1,"cubeIn")
	elseif curStep == 1584 then
		pincushGame(false,true,"angle","angle",0,0,crochet,1,"cubeOut")
	elseif curStep == 1600 then
		pincushGame(false,true,"","zoom",0,2,stepCrochet,6,"cubeIn")
	elseif curStep == 1606 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,6,"cubeIn")
	elseif curStep == 1648 then
		tweenShaderProperty('soloxy',"x",2, stepCrochet*0.001*12,"cubeInOut")
		pincushGame(false,true,"","zoom",0,3,stepCrochet,16,"cubeIn")
	elseif curStep == 1656 then
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		tweenShaderProperty('bars',"effect",0.1, crochet*0.001*2,"cubeOut")
		tween("tres paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 1660 then
		tween("tres paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("cuatro paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 1664 then
		pincushGame(false,true,"","zoom",0,1.2,stepCrochet,4,"cubeOut")
		tween("cuatro paper",{x=3000},crochet*0.001*1,"cubeInOut")
		bloom(8,1,crochet,2,"cubeOut")
		setShaderProperty('greyscale', 'strength', 0.65)
		lascosasdelhud(0)
		setActorX(-1180,"ratingsGroup")
		lerpSpeedX = 3.5
		for i = 0,(keyCount*2)-1 do
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1220
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
				end
			end
		end
	elseif curStep == 1680 then
		lerpSpeedZ = 1
		for i = 0,(keyCount*2)-1 do
			targetnoteZPos[i+1] = -400 
		end
	elseif curStep == 1696 then
		lerpSpeedZ = 3.5
		for i = 0,(keyCount*2)-1 do
			targetnoteZPos[i+1] = 0 
		end
	end
	if curStep == 1672 then
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,8,"cubeOut")
	elseif curStep == 1696 or curStep == 1712 or curStep == 1760 then
		pincushGame(false,true,"","zoom",0,1.7,stepCrochet,8,"cubeOut")
		bump(crochet,1)
		beatSwap = beatSwap* -1
		noteRotX= 40*beatSwap
	elseif curStep == 1720 then
		noteRotX= 25
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,4,"cubeOut")
		bump(crochet,1)
		for i = 0,(keyCount*2)-1 do
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] 
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
				end
			end
		end
	elseif curStep == 1724 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,4,"cubeOut")
	elseif curStep == 1728 then
		pincushGame(false,true,"","zoom",0,1.7,crochet,4,"cubeOut")
		noteRotX= -25
	elseif curStep == 1752 or curStep == 1768 then
		pincushGame(false,true,"","zoom",0,1,stepCrochet,8,"cubeIn")
	elseif curStep == 1776 then
		pincushGame(false,true,"","zoom",0,1.5,stepCrochet,8,"cubeOut")
	elseif curStep == 1784 then
		pincushGame(false,true,"","zoom",0,1.2,stepCrochet,4,"cubeOut")
		bump(crochet,1)
		lerpSpeedX = 3.5
	elseif curStep == 1824 then
		bloom(6,1,crochet,2,"cubeOut")
		setStageColorSwap("hue",0.8)
	elseif curStep == 1856 then
		bloom(6,1,crochet,2,"cubeOut")
		setStageColorSwap("hue",0.4)
	elseif curStep == 1872 or curStep == 1892 or curStep == 1900 
	or curStep == 1908 then
		bump(stepCrochet,4)
	elseif curStep == 1888 then
		bloom(6,1,crochet,2,"cubeOut")
		setStageColorSwap("hue",0.2)
		lerpSpeedX = 0.5
		for i = 0,(keyCount*2)-1 do
			if (i >= 0 and i <= 3) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1220
				noteAngle[i+1] = -360
			elseif (i >= 4 and i <= 7) then
				targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 1220
				noteAngle[i+1] = 360
			end
		end
	elseif curStep == 1904 then
		tweenShaderProperty('greyscale',"strength",0, crochet*0.001*4,"cubeIn")
		tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeOut")
	elseif curStep == 1912 then
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		bloom(6,1,crochet,2,"cubeOut")
		setStageColorSwap("hue",0.5)
		lascosasdelhud(0)
		triggerEvent('toggle checker bg','0.05',crochet*0.001*2)
		lerpSpeedX = 5
		lerpSpeedZ = 3.5
		for i = 0,(keyCount*2)-1 do
			targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
			targetnoteZPos[i+1] = 0 
		end
	elseif curStep == 1920 then
		setActorX(0,"ratingsGroup")
		setStageColorSwap("hue",0)
		bloom(8,1,crochet,2,"cubeOut")
		setShaderProperty('glitchPeak', 'AMT', 0.1)
		setShaderProperty('speedlines', 'transparency', 0)
		triggerEvent('screen shake', (crochet*0.001*64)..',0.013', (crochet*0.001*64)..',0')
		lerpSpeedX = 14
		rotCam = true
	elseif curStep == 1936 or curStep == 1968 or curStep == 2064 or curStep == 2312 or curStep == 2336 then
		bf = false
		matt = true
	elseif curStep == 1952 or curStep == 1984 or curStep == 2016 or curStep == 2088 or curStep == 2144
	or curStep == 2320 or curStep == 2352 or curStep == 2672 then
		bf = false
		matt = false
		set("defaultCamZoom", 0.6)
	elseif curStep == 2000 or curStep == 2128 or curStep == 2328 
	or curStep == 2656 then
		bf = true
		matt = false
	end
	if curStep == 1792 or curStep == 1856 or curStep == 1104 then
		bf = true
		matt = false
	elseif curStep == 1824 then
		bf = false
		matt = true
	elseif curStep == 1856+32 or curStep == 1120 then
		bf = false
		matt = false
		set("defaultCamZoom", 0.6)
	end
	if curStep == 2080 or curStep == 2576 then
		tween("uno paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 2084 or curStep == 2580 then
		tween("uno paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("dos paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 2088 or curStep == 2584 then
		tween("dos paper",{x=3000},crochet*0.001*1,"cubeInOut")
	end
	if curStep == 2160 then
		matt = true
		playCharacterAnimation('dad', 'trans', true)
		setShaderProperty('barrel', 'zoom', 0.8)
        tweenShaderProperty('barrel',"zoom",1, stepCrochet*0.001*4,"cubeOut")
		rotCam = false
		tweenShaderProperty('bloom',"contrast",4, stepCrochet*0.001*16,"cubeIn")
	elseif curStep == 2164 then
		setShaderProperty('barrel', 'zoom', 0.8)
        tweenShaderProperty('barrel',"zoom",1, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 2168 then
		pincushGame(false,true,"","zoom",0,10,crochet,2,"cubeInOut")
		pincushGame(true,true,"angle","angle",360,0,crochet,4.5,"cubeInOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.3, stepCrochet*0.001*1,"cubeOut")
	elseif curStep == 2172 then
		tweenShaderProperty('EyeFishEffectGame',"power",1, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 2176 then
		matt = false
		set("defaultCamZoom", 0.6)
		tweenShaderProperty('EyeFishEffectGame',"power",0, stepCrochet*0.001*1,"cubeOut")
		bloom(8,1,crochet,2,"cubeOut")
		pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeOut")
		flashCamera("hud","white",0.5)
		flechastipofd()
		lerpSpeedX = 3.5
	end
	--final
	if curStep == 2192 then
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		pincushGame(false,true,"","zoom",0,2.5,crochet,3,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*12,"cubeOut")
	elseif curStep == 2200 then
		setShaderProperty('soloxy', 'x', 0)
		tweenShaderProperty('soloxy',"x",1, crochet*0.001*1.5,"cubeOut")
	elseif curStep == 2216 then
		setShaderProperty('soloxy', 'y', -2)
		tweenShaderProperty('soloxy',"y",0, crochet*0.001*1.5,"cubeOut")
	elseif curStep == 2220 or curStep == 2272 then
		pincushGame(true,true,"angle","angle",360,0,crochet,4,"cubeInOut")
		pincushGame(false,true,"","zoom",0,1,crochet,2,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",0, stepCrochet*0.001*12,"cubeOut")
	elseif curStep == 2230-2 or curStep == 2280 then
		tweenShaderProperty('soloxy',"x",0, crochet*0.001*1.5,"cubeOut")
	elseif curStep == 2240 then
		tweenShaderProperty('soloxy',"y",-1, crochet*0.001*1.5,"cubeOut")
		flechastipofdregresando()
	elseif curStep == 2246 then
		pincushGame(true,true,"angle","angle",-360,0,crochet,4,"cubeInOut")
		pincushGame(false,true,"","zoom",0,4,crochet,3,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*12,"cubeOut")
	elseif curStep == 2254 then
		tweenShaderProperty('soloxy',"x",1, crochet*0.001*1.5,"cubeOut")
	elseif curStep == 2266 then
		tweenShaderProperty('soloxy',"y",0, crochet*0.001*2,"cubeOut")
	elseif curStep == 2304 or curStep == 2332 then
		pincushGame(false,true,"","angle",0,20,crochet,1,"cubeOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 2336 then
		triggerEvent('screen shake', (crochet*0.001*24)..',0.013', (crochet*0.001*24)..',0')
	elseif curStep == 2316-4 or curStep == 2348-4 then
		pincushGame(false,true,"","angle",0,-20,crochet,2,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",0, stepCrochet*0.001*8,"cubeOut")
	end
	if curStep == 2304 then
		for i = 0,(keyCount*2)-1 do
			targetnoteXPos[i+1] = _G['defaultStrum'..((i))..'X']
			targetnoteYPos[i+1] = _G['defaultStrum'..((i))..'Y']
			targetnoteZPos[i+1] = 0
		end
	end
	if curStep == 2352 then
		tween("Uno Veteran",{x=200},crochet*0.001*1,"cubeOut")
	elseif curStep == 2356 then
		tween("Uno Veteran",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("Dos Veteran",{x=200},crochet*0.001*1,"cubeOut")
	elseif curStep == 2360 then
		tween("Dos Veteran",{x=3000},crochet*0.001*1,"cubeInOut")
		tween("Tres Veteran",{x=200},crochet*0.001*1,"cubeOut")
		pincushGame(false,true,"","angle",0,30,crochet,2,"cubeIn")
	elseif curStep == 2364 then
		tween("Tres Veteran",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("Cuatro Veteran",{x=200},crochet*0.001*1,"cubeOut")
	elseif curStep == 2368 then
		tween("Cuatro Veteran",{x=3000},crochet*0.001*1,"cubeInOut")
		tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*4,"cubeOut")
		for i = 0,(keyCount*2)-1 do
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1220
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
				end
			end
		end
	elseif curStep == 2400 then
		tweenShaderProperty('EyeFishEffectGame',"power",1, crochet*0.001*8,"cubeIn")
		bloom(1,4,crochet,8,"cubeIn")
	elseif curStep == 2424 then
		setShaderProperty('soloxy', 'x', -2)
		tweenShaderProperty('soloxy',"x",0, crochet*0.001*2,"cubeInOut")
		pincushGame(false,true,"","zoom",0,1,crochet,2,"cubeIn")
		pincushGame(false,true,"","angle",0,360,crochet,4,"cubeInOut")
		triggerEvent('toggle checker bg','0',crochet*0.001*2)
	elseif curStep == 2432 then
		tweenShaderProperty('EyeFishEffectGame',"power",0, stepCrochet*0.001*4,"cubeOut")
		flashCamera("hud","white",0.5)
		setShaderProperty('glitchPeak', 'AMT', 0)
		bloom(8,1,crochet,2,"cubeOut")
		setShaderProperty('greyscale', 'strength', 0.65)
	
	   setShaderProperty('speedlines', 'transparency', 1)
		drunk = 0
		drunkSpeed = 0
		drunkLerp = 0
		perlinSpeed = 1
        perlinXRange = 0.1
        perlinYRange = 0.1
		for i = 0,(keyCount*2)-1 do
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
				elseif (i >= 4 and i <= 7) then
					targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
				end
			end
		end
	elseif curStep == 2433 then
		lerpSpeedX = 3.5
		setShaderProperty('color', 'red', 1.5)
		setShaderProperty('color', 'green',1.5)
		setShaderProperty('color', 'blue',1.5)
	elseif curStep == 2648 then
		pincushGame(false,true,"","zoom",0,1.25,crochet,4,"cubeInOut")
		tweenShaderProperty('greyscale',"strength",1, stepCrochet*0.001*8,"cubeIn")
	elseif curStep == 2672 then
		tweenShaderProperty('greyscale',"strength",0, stepCrochet*0.001*16,"cubeIn")
		pincushGame(false,true,"","zoom",0,0.9,crochet,4,"cubeIn")
	elseif curStep == 2688 then
		bloom(8,1,crochet,2,"cubeOut")
		setShaderProperty('color', 'red', 2.2)
		setShaderProperty('color', 'green',2.8)
		setShaderProperty('color', 'blue',1)
		pincushGame(false,true,"","zoom",0,12,crochet,8,"cubeIn")
		pincushGame(true,true,"","angle",0,-110,crochet,12,"cubeIn")
		tweenShaderProperty('EyeFishEffectGame',"power",1, crochet*0.001*6,"cubeIn")
	elseif curStep == 2704 then
		bloom(1,4,crochet,4,"cubeIn")
	elseif curStep == 2716 then
		tweenShaderProperty('bars2',"effect",0.6, stepCrochet*0.001*4,"cubeOut")
	end
	if curStep >= 2368 and curStep < 2424 then
        if curStep % 16 == 0 then
            setShaderProperty('soloxy', 'x', 2)
		    tweenShaderProperty('soloxy',"x",0, crochet*0.001*2,"cubeInOut")
			setShaderProperty('soloxy', 'y', 2)
		    tweenShaderProperty('soloxy',"y",0, crochet*0.001*2,"cubeInOut")
			pincushGame(false,true,"","angle",0,-20,crochet,2,"cubeOut")
		elseif curStep % 16 == 8 then
			setShaderProperty('soloxy', 'y', 2)
		    tweenShaderProperty('soloxy',"y",0, crochet*0.001*2,"cubeInOut")
			setShaderProperty('soloxy', 'x', -2)
		    tweenShaderProperty('soloxy',"x",0, crochet*0.001*2,"cubeInOut")
			
			pincushGame(false,true,"","angle",0,20,crochet,2,"cubeOut")
        end 
	end
	if curStep >= 2368 and curStep < 2432 then
		if curStep % 8 == 0 then
			pincushGame(false,true,"","zoom",0,2.5,crochet,1,"cubeOut")
		elseif curStep % 8 == 4 then
			pincushGame(false,true,"","zoom",0,1,crochet,1,"cubeIn")
		end
		
	end
	if curStep >= 2352 and curStep < 2368 then
        if curStep % 4 == 0 then
			pincushGame(true,true,"zoom","zoom",3.5,1,crochet,1,"cubeOut")
		end
	end
	if curStep >= 2560 and curStep < 2688 then
        if curStep % 16 == 0 then
			bump(stepCrochet,4)
			beatSwap = beatSwap* -1
			for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 70*beatSwap
                noteAngle[i+1] = -40*beatSwap
            end
		end
	end
	if curStep == 2332 then
		setShaderProperty('glitchPeak', 'AMT', 0.2)
        setShaderProperty('glitchPeak', 'SPEED', 0.5)
    end
	if curStep >= 1920 and curStep < 2432 then
        if curStep % 32 == 0 then
			tweenShaderProperty('color',"red",1, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"blue",1.5, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"green",2.5, crochet*0.001*2,"linear")
		elseif curStep % 32 == 8 then
			tweenShaderProperty('color',"red",1, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"blue",2.5, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"green",1.5, crochet*0.001*2,"linear")
		elseif curStep % 32 == 16 then
			tweenShaderProperty('color',"red",2, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"blue",1.5, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"green",1, crochet*0.001*2,"linear")
		elseif curStep % 32 == 24 then
			tweenShaderProperty('color',"red",2.5, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"blue",1, crochet*0.001*2,"linear")
			tweenShaderProperty('color',"green",1.5, crochet*0.001*2,"linear")
        end 
	end
	if curStep >= 2160 and curStep < 2176 then
        if curStep % 2 == 0 then
			noteScale = noteScale + 0.4
        end 
	end
	if curStep >= 1912 and curStep < 1920 then
        if curStep % 2 == 0 then
			bump(stepCrochet,2)
        end 
	end
	if curStep >= 1792 and curStep < 1912 then
        if curStep % 32 == 0 then
            pincushGame(false,true,"","zoom",0,1.7,crochet,4,"cubeOut")
			bump(stepCrochet,4)
			lerpSpeedZ = 3.5
			lerpSpeednoteRotX = 3.5
			beatSwap = beatSwap* -1
			noteRotX= 40*beatSwap
			for i = 0,(keyCount*2)-1 do
				targetnoteZPos[i+1] = 0 
                noteAngle[i+1] = -40*beatSwap
			end
		elseif curStep % 32 == 16 then
			pincushGame(false,true,"","zoom",0,1,crochet,4,"cubeIn")
			lerpSpeedZ = 0.7
		    for i = 0,(keyCount*2)-1 do
			    targetnoteZPos[i+1] = -400 
		    end
        end 
	end
	if curStep >= 604 and curStep < 608 then
        if curStep % 2 == 0 then
			pincushGame(true,true,"angle","angle",20,0,stepCrochet,2,"cubeOut")
        end 
	end
	if curStep >= 384 and curStep < 562 then
        if curStep % 16 == 0 then
            setShaderProperty('soloxy', 'y', 2)
		    tweenShaderProperty('soloxy',"y",0, crochet*0.001*4,"quartInOut")
        end 
	end
	if curStep >= 862 and curStep < 880 then
		
        if curStep % 8 == 0 then
            pincushGame(false,true,"","angle",0,10,stepCrochet,2,"cubeOut")
		    pincushGame(false,true,"","zoom",0,1.3,stepCrochet,2,"cubeOut")
		elseif curStep % 8 == 2 then
			pincushGame(false,true,"","angle",0,0,stepCrochet,2,"cubeIn")
			pincushGame(false,true,"","zoom",0,1,stepCrochet,2,"cubeIn")
		elseif curStep % 8 == 4 then
			pincushGame(false,true,"","angle",0,-10,stepCrochet,2,"cubeOut")
		    pincushGame(false,true,"","zoom",0,1.3,stepCrochet,2,"cubeOut")
		elseif curStep % 8 == 6 then
			pincushGame(false,true,"","angle",0,0,stepCrochet,2,"cubeIn")
			pincushGame(false,true,"","zoom",0,1,stepCrochet,2,"cubeIn")
        end 
		if curStep % 4 == 0 then
			bump(stepCrochet,4)
			lerpSpeedY = 16
			lerpSpeedZ = 16
			lerpSpeednoteRotX = 12
			beatSwap = beatSwap* -1
			for i = 0,(keyCount*2)-1 do
				noteRotX = 25*beatSwap
				noteZPos[i+1] = targetnoteZPos[i+1] + 100
				if i % 2 == 0 then
					noteAngle[i+1] = -25*beatSwap
				else
					noteAngle[i+1] = 25*beatSwap
				end
			end
		end
	end
	if curStep >= 880 and curStep < 888 then
		if curStep % 2 == 0 then
			bump(stepCrochet,2)
			noteScale = noteScale + 0.4
		end
        if curStep % 2 == 0 then
            pincushGame(false,true,"","angle",0,10,stepCrochet,1,"cubeOut")
		    pincushGame(false,true,"","zoom",0,1.3,stepCrochet,1,"cubeOut")
		elseif curStep % 2 == 1 then
			pincushGame(false,true,"","angle",0,0,stepCrochet,1,"cubeIn")
			pincushGame(false,true,"","zoom",0,1,stepCrochet,1,"cubeIn")
		end
	end
	
	if curStep >= 128 and curStep < 384 or curStep >= 640 and curStep < 864 or curStep >= 896 and curStep < 1152 
	or curStep >= 1408 and curStep < 1664 or curStep >= 1920 and curStep < 2160 or curStep >= 2176 and curStep < 2432 then
        if curStep % 32 == 0 then
            bump(crochet,1)
			lerpSpeedAngle = 10
			lerpSpeedZ = 14
			lerpSpeedY = 20
			noteScale = noteScale + 0.4
		elseif curStep % 64 == 14 then
			bump(crochet,1)
			noteScale = noteScale + 0.4
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteYPos[i+1] = targetnoteYPos[i+1] + 50*downscroll
					noteAngle[i+1] = 45
				else
					noteYPos[i+1] = targetnoteYPos[i+1] - 50*downscroll
					noteAngle[i+1] = -45
				end
			 end
		elseif curStep % 64 == 20 then
			bump(crochet,1)
			for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 70
                noteAngle[i+1] = -40
            end
		elseif curStep % 64 == 28 then
			bump(crochet,0.5)
			noteScale = noteScale + 0.4
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteZPos[i+1] = targetnoteZPos[i+1] - 100
					noteAngle[i+1] = -45
				else
					noteZPos[i+1] = targetnoteZPos[i+1] + 100
				end
			 end
		elseif curStep % 64 == 30 then
			bump(crochet,0.5)
			noteScale = noteScale + 0.4
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteZPos[i+1] = targetnoteZPos[i+1] + 100
				else
					noteZPos[i+1] = targetnoteZPos[i+1] - 100
					noteAngle[i+1] = 45
				end
			 end
		elseif curStep % 64 == 32 then
			bump(crochet,1)
		elseif curStep % 64 == 44 then
			bump(crochet,1)
			for i = 0,7 do
                noteXPos[i+1] = targetnoteXPos[i+1] + 70
                noteAngle[i+1] = 40
            end
		elseif curStep % 64 == 50 then
			bump(crochet,1)
			noteScale = noteScale + 0.4
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteYPos[i+1] = targetnoteYPos[i+1] - 50*downscroll
					noteAngle[i+1] = -45
				else
					noteYPos[i+1] = targetnoteYPos[i+1] + 50*downscroll
					noteAngle[i+1] = 45
				end
			 end
		elseif curStep % 64 == 54 then
			bump(crochet,1)
		elseif curStep % 64 == 60 then
			bump(crochet,0.5)
			noteScale = noteScale + 0.2
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteZPos[i+1] = targetnoteZPos[i+1] + 100
					noteAngle[i+1] = 45
				else
					noteZPos[i+1] = targetnoteZPos[i+1] - 100
					
				end
			 end
		elseif curStep % 64 == 62 then
			bump(crochet,0.5)
			noteScale = noteScale + 0.2
			for i = 0,(keyCount*2)-1 do
				if i % 2 == 0 then
					noteZPos[i+1] = targetnoteZPos[i+1] - 100
				else
					noteZPos[i+1] = targetnoteZPos[i+1] + 100
					noteAngle[i+1] = -45
				end
			 end
        end 
		if curStep % 32 == 8 then
			noteScale = noteScale + 0.2
            for i = 0,(keyCount*2)-1 do
                noteRotX = 15
				noteAngle[i+1] = 25
			end
		elseif curStep % 32 == 24 then
			noteScale = noteScale + 0.2
			for i = 0,(keyCount*2)-1 do
                noteRotX = -15
				noteAngle[i+1] = -25
			end
		end
	end
	flechasxdddd(0,0,-360,96)
	flechasxdddd(1,1,360,100)
	flechasxdddd(2,2,-360,104)
	flechasxdddd(3,3,360,108)
	flechasxdddd(2,2,360,112)
	flechasxdddd(1,1,-360,120)

	flechasxdddd(3,3,360,32)
	flechasxdddd(2,2,-360,36)
	flechasxdddd(1,1,360,40)
	flechasxdddd(0,0,-360,44)

	flechasxdddd(0,0,360,48)
	flechasxdddd(1,1,-360,52)
	flechasxdddd(2,2,360,56)
	flechasxdddd(3,3,-360,60)

	flechasxdddd(1,1,360,88)
	flechasxdddd(3,3,360,64)
	flechasxdddd(0,0,-360,76)

	flechasxdddd(1,2,360,660)
	flechasxdddd(5,6,-360,664)

	flechasxdddd(1,2,360,1392)
	flechasxdddd(5,6,-360,1400)

	flechasxdddd(1,2,360,1968)
	flechasxdddd(5,6,-360,1976)

	flechasxdddd(0,0,360,1912)
	flechasxdddd(7,7,360,1912)

	flechasxdddd(1,1,-360,1914)
	flechasxdddd(6,6,-360,1914)

	flechasxdddd(2,2,360,1916)
	flechasxdddd(5,5,360,1916)

	flechasxdddd(3,3,-360,1918)
	flechasxdddd(4,4,-360,1918)

	doNoteTrail = false
    if (curStep >= 1 and curStep < 128) or (curStep >= 736 and curStep < 768) or (curStep >= 864 and curStep < 896) 
        or (curStep >= 1056 and curStep < 1088) or (curStep >= 1664 and curStep < 1920) then 
        doNoteTrail = true
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
			end			
			setRenderedNotePos(totalNotePos[1],totalNotePos[2], i)
		end
	end
end
function getXOffset(data, curPos)
	local xOffset = 0
	if drunk ~= 0 then 
		xOffset = xOffset + drunk * (math.cos( ((songPos*0.001) + ((data%keyCount)*0.2)) * (drunkSpeed*0.2)) * 112*0.5);
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
local zNear = 0
local zFar = 1000
local zRange = zNear - zFar 
local tanHalfFOV = math.tan(math.pi/4)
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
local noteTrailCount = 0
local noteTrailCap = 50
function playerOneSingExtra(data, id, noteType, isSus)
    if not isSus and doNoteTrail then 
        makeNoteTrail(data, id, noteType)
    end
end
function playerTwoSingExtra(data, id, noteType, isSus)
    if not isSus and doNoteTrail then 
        makeNoteTrail(data, id, noteType)
    end
end

function makeNoteTrail(data, id, noteType)

    local trail = 'default'..noteTrailCount

    local yVal = 150
    if not downscrollBool then 
        yVal = yVal * -1
    end

    destroySprite(trail)
    makeNoteCopy(trail, id)
    setActorAlpha(0.5, trail)
    tweenActorProperty(trail, 'y', getActorY(trail)+yVal, stepCrochet*0.001*16, 'linear')
    tweenActorProperty(trail, 'alpha', 0, stepCrochet*0.001*16, 'expoInOut')

    setObjectCamera(trail, 'hud')

    noteTrailCount = noteTrailCount + 1
    if noteTrailCount > noteTrailCap then 
        noteTrailCount = 0
    end
end