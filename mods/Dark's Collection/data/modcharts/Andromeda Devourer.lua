local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0
local penerico = {8,12,16,24,32,40,44,48,58,64,72,76,80,88,96,104,110,112,122}
local holasara = {424,428,436,442,448,457,460,464,470,480,488,492,496,506,512,522,528,538,1480,1484,1488,1496,1520,1544,1548,1552,1562,1584}

function start()
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")

	createCustomShader("vcrshader", "vcrshader", 120)
      setCameraCustomShader("vcrshader", "game")

	  showOnlyStrumsAltTrue()

	  if difficulty == "9K" then
			if not middlescroll then
				tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
				for i = 0,8 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.3,"cubeOut")
					tweenActorProperty(i,"alpha",0.2,1,"linear")
				end
				for i = 9,18 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.3,"cubeOut")
				end
			end
		end
	

	
    
	if not middlescroll then
		tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
			for i = 0,14 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.3,"linear")
				tweenActorProperty(i,"alpha",0.2,1,"linear")
			end
			for i = 15,30 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.3,"linear")
			end
		end
	
end

function update(elapsed)

	time = time + elapsed
    setCustomShaderFloat('vcrshader', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end

function createPost()

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 2.0)
    setShaderProperty('barrel', 'doChroma', true)
    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',-2)
	setShaderProperty('MirrorRepeatEffect','y',0)
	setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 1.0)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
	initShader('ca', 'ChromAbEffect')
    setCameraShader('hud', 'ca')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.002)
	initShader('lineas', 'ScanlineEffect')
	setCameraShader('hud', 'lineas')
	setShaderProperty('lineas', 'strength', 0.5)
    setShaderProperty('lineas', 'pixelsBetweenEachLine', 5.0)
	initShader('grayscale', 'GreyscaleEffect')
	setCameraShader('game', 'grayscale')
	setCameraShader('hud', 'grayscale')
	setShaderProperty('grayscale', 'strength', 0.5)
	initShader('mirrorGame', 'MirrorRepeatEffect') --blur
    setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame','x',0)
    setShaderProperty('mirrorGame','y',0)
    setShaderProperty('mirrorGame','angle', 0)
	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
	initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.3)
	
    
end

function camerabumpalt()
    if curStep % 16 == 0 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 1 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
    if curStep % 16 == 4 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 5 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
    if curStep % 16 == 8 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 9 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
    if curStep % 16 == 12 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 13 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
end

function meGustaElPene()
    beatSwap = beatSwap * -1
    setShaderProperty("barrel","barrel",-0.6*beatSwap)
    tweenShaderProperty("barrel","barrel",0, stepCrochet*0.001*4, "linear")
end

function holaFelogo()
    beatSwap = beatSwap * -1
    setShaderProperty("barrel","barrel",-0.5*beatSwap)
    tweenShaderProperty("barrel","barrel",0, stepCrochet*0.001*4, "linear")
end

function barrelBurst()
    setShaderProperty("barrel","barrel",2.5)
    tweenShaderProperty("barrel","barrel",0, stepCrochet*0.001*4, "cubeOut")
end

function showOnlyStrumsAltTrue()
    setProperty("healthBar","alpha",0)
    setProperty("healthBarBG","alpha",0)
    setProperty("infoTxt","alpha",0)
    setProperty("iconP1","alpha",0)
    setProperty("iconP2","alpha",0)
    setProperty("scoreTxt","alpha",0)
    setProperty("timeBar","alpha",0)
    setProperty("timeBarBG","alpha",0)
	setProperty("ratingText","alpha",0)
	setProperty("ratingsGroup","x",0)
end

function showOnlyStrumsAltFalse()
    setProperty("healthBar","alpha",1)
    setProperty("healthBarBG","alpha",1)
    setProperty("infoTxt","alpha",1)
    setProperty("iconP1","alpha",1)
    setProperty("iconP2","alpha",1)
    setProperty("scoreTxt","alpha",1)
    setProperty("timeBar","alpha",1)
    setProperty("timeBarBG","alpha",1)
    setProperty("ratingsGroup","x",0)
	setProperty("ratingText","alpha",1)
end

function stepHit( step )
	for i = 1, #penerico do
        if curStep == penerico [i]-1 then
			meGustaElPene()
         end
    end
	for i = 1, #holasara do
        if curStep == holasara [i]-1 then
			holaFelogo()
         end
    end
    if curStep == 1 then
		tweenFadeOut("BlackBox",0,12,"")
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*10, 'cubeInOut')
		tweenShaderProperty('MirrorRepeatEffect', 'x', 0, crochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*15, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 112 then
		tweenShaderProperty('mirrorGame', 'x', 0.5, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'cubeInOut')
		triggerEvent('Set Camera Zoom','1.1','1')
	end
	if curStep == 120 then
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*12, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*12, 'cubeIn')
	elseif curStep == 128 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
		setShaderProperty('mirrorGame', 'x', 0)
		triggerEvent('Set Camera Zoom','0.5','1')
		setShaderProperty("MirrorRepeatEffect","barrel",0.1)
		tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
	end
	if curStep == 160 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
	end
	if curStep == 192 or curStep == 320 then
		tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == 256 then
		tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
	end
	if curStep == 128 then
		perlinYRange = 0.2
        perlinSpeed = 0.95
        perlinXRange = 0.3
        perlinzRange = 20
		setShaderProperty('barrel', 'barrel', -3)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('bn', 'strength', 0)

    end
	if difficulty == "9k" then
		if curStep == 128 then
			if not middlescroll then
				tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
				for i = 0,8 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,0.3,"cubeOut")
					tweenActorProperty(i,"alpha",1,1,"linear")
				end
				for i = 9,18 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+10,0.3,"cubeOut")
				end
			end
		end
	end
	if curStep == 160 or curStep == 224 or curStep == 288 or curStep == 352 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, crochet*0.001*2, 'cubeInOut')
		barrelBurst()
	elseif curStep == 184 or curStep == 312 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 188 or curStep == 316 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 192 or curStep == 256 or curStep == 320 or curStep == 384 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		barrelBurst()
	elseif curStep == 248 or curStep == 376 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 252 or curStep == 380 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
    end
	if curStep == 368 then
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', -3, stepCrochet*0.001*14, 'cubeIn')
	end
	if curStep == 384 then
		setShaderProperty("MirrorRepeatEffect","barrel",0)
	end
	if curStep == 400 then
		setShaderProperty('mirrorGame','angle', 20)
		setShaderProperty('mirrorGame','zoom', 0.7)
		flashCamera('game', 'White', 0.2)
	elseif curStep == 408 then
		setShaderProperty('mirrorGame','angle', -20)
		flashCamera('game', 'White', 0.2)
	elseif curStep == 412 then
		tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
	end
    if curStep == 416 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	    setShaderProperty('barrel', 'barrel', -3)
	    tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		end
	if curStep == 424 or curStep == 456 or curStep == 488 or curStep == 520 or curStep == 600 or curStep == 728 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 428 or curStep == 460 or curStep == 492 or curStep == 524 or curStep == 604 or curStep == 732 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 432 or curStep == 464 or curStep == 496 or curStep == 528 or curStep == 608 or curStep == 736 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 432 or curStep == 496 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*30, 'cubeIn')
	elseif curStep == 480 or curStep == 544 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 440 or curStep == 472 or curStep == 504 or curStep == 536 or curStep == 664 or curStep == 792 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 444 or curStep == 476 or curStep == 508 or curStep == 540 or curStep == 668 or curStep == 796 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 448 or curStep == 480 or curStep == 512 or curStep == 544 or curStep == 672 or curStep == 800 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 544 or curStep == 672 then
		tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*2, 'cubeOut')
	elseif curStep == 592 or curStep == 656 or curStep == 720 or curStep == 784 then
		tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeOut')
	elseif curStep == 608 or curStep == 736 then
		tweenShaderProperty('mirrorGame', 'x', -1, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 576 or curStep == 640 or curStep == 688 or curStep == 752 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
		triggerEvent('Screen Shake','2.1,0.05','')
	elseif curStep == 608 or curStep == 672 or curStep == 720 or curStep == 784 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 608 then
		tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*4, 'cubeInOut')
	elseif curStep == 672 then
		tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
	end
	if curStep == 800 or curStep == 864 then
		flashCamera('hud', '#000000', 2.5)
		setShaderProperty('barrel', 'barrel', 0.7)
		setShaderProperty('mirrorGame', 'zoom', 3)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*15, 'cubeInOut')
	end
	if curStep == 920 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 924 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 928 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeIn')
		perlinYRange = 0.2
        perlinSpeed = 1.35
        perlinXRange = 0.3
        perlinzRange = 20
		setShaderProperty('barrel', 'barrel', -3)
		tweenShaderProperty('barrel', 'barrel', 0.9, crochet*0.001*4, 'cubeOut')
		
		end
	if curStep == 936 or curStep == 968 or curStep == 1000 or curStep == 1032 or curStep == 1064 or curStep == 1096 or curStep == 1128 or curStep == 1160 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 940 or curStep == 972 or curStep == 1004 or curStep == 1036 or curStep == 1068 or curStep == 1100 or curStep == 1132 or curStep == 1164 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 944 or curStep == 976 or curStep == 1008 or curStep == 1040 or curStep == 1072 or curStep == 1104 or curStep == 1136 or curStep == 1168 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 944 or curStep == 976 or curStep == 1008 or curStep == 1040 or curStep == 1068 or curStep == 1100 or curStep == 1132 or curStep == 1164 then
		tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 960 or curStep == 992 or curStep == 1024 or curStep == 1056 or curStep == 1084 or curStep == 1116 or curStep == 1148 or curStep == 1180 then
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 952 or curStep == 984 or curStep == 1016 or curStep == 1048 or curStep == 1080 or curStep == 1112 or curStep == 1144 or curStep == 1176 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 956 or curStep == 988 or curStep == 1020 or curStep == 1052 or curStep == 1084 or curStep == 1116 or curStep == 1148 or curStep == 1180 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 960 or curStep == 992 or curStep == 1024 or curStep == 1056 or curStep == 1088 or curStep == 1120 or curStep == 1152 or curStep == 1184 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 1056 or curStep == 1072 or curStep == 1088 or curStep == 1104 or curStep == 1120 or curStep == 1136 or curStep == 1152 or curStep == 1168 then
		triggerEvent('Screen Shake','0.55,0.05','')
	end
	if curStep == 1184 then
		setShaderProperty('MirrorRepeatEffect', 'zoom', 4)
		flashCamera('hud', '#000000', 2.5)
		setShaderProperty('barrel', 'barrel', 1)
		setShaderProperty('mirrorGame', 'zoom', 1)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*15, 'cubeInOut')
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*15, 'cubeInOut')
		tweenFadeIn("healthBar",0,1)
        tweenFadeIn("healthBarBG",0,1)
        tweenFadeIn("infoTxt",0,1)
        tweenFadeIn("iconP1",0,1)
        tweenFadeIn("iconP2",0,1)
        tweenFadeIn("scoreTxt",0,1)
        tweenFadeIn("timeBar",0,1)
        tweenFadeIn("timeBarBG",0,1)
        tweenFadeIn("ratingText",0,1)
		
        end
	if curStep == 1290 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*12, 'cubeOut')
	end
	if curStep == 1316 then
		tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 0.4, crochet*0.001*10, 'cubeIn')
	elseif curStep == 1344 then
		tweenShaderProperty('mirrorGame', 'y', 4, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == 1368 then
		tweenShaderProperty('mirrorGame', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1372 then
		tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1376 or curStep == 1408 then
		tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 1392 then
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1424 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 1428 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, crochet*0.001*2, 'cubeIn')
	elseif curStep == 1434 then 
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*8, 'cubeInOut')
	elseif curStep == 1440 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
		tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
		
		end
	
	if curStep == 1480 or curStep == 1512 or curStep == 1544 or curStep == 1576 or curStep == 600 or curStep == 728 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1484 or curStep == 1516 or curStep == 1548 or curStep == 1580 or curStep == 604 or curStep == 732 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1488 or curStep == 1520 or curStep == 1552 or curStep == 1584 or curStep == 608 or curStep == 736 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 1488 or curStep == 1552 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*30, 'cubeIn')
	elseif curStep == 1536 or curStep == 1600 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 1496 or curStep == 1528 or curStep == 1560 or curStep == 1592 or curStep == 1720 or curStep == 1848 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1500 or curStep == 1532 or curStep == 1564 or curStep == 1596 or curStep == 1724 or curStep == 1852 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1504 or curStep == 1536 or curStep == 1568 or curStep == 1600 or curStep == 1728 or curStep == 1856 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep >= 128 and curStep < 384 or curStep >= 544 and curStep < 800 or curStep >= 928 and curStep < 1184 or curStep >= 1600 and curStep < 1856 or curStep >= 1984 and curStep < 2224 then
        camerabumpalt()
	end
	if curStep == 1600 or curStep == 1728 then
		tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1648 or curStep == 1712 or curStep == 1776 or curStep == 1840 then
		tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1664 or curStep == 1792 then
		tweenShaderProperty('mirrorGame', 'x', -1, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1632 or curStep == 1696 or curStep == 1744 or curStep == 1808 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
		triggerEvent('Screen Shake','2.1,0.05','')
	elseif curStep == 1664 or curStep == 1728 or curStep == 1776 or curStep == 1840 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1664 then
		tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*4, 'cubeInOut')
	elseif curStep == 1728 then
		tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
	end
	if curStep == 1856 or curStep == 1920 then
		flashCamera('hud', '#000000', 2.5)
		setShaderProperty('barrel', 'barrel', 0.7)
		setShaderProperty('mirrorGame', 'zoom', 3)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*15, 'cubeInOut')
	end
	if curStep == 1976 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1980 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1984 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeIn')
		perlinYRange = 0.2
        perlinSpeed = 1.65
        perlinXRange = 0.3
        perlinzRange = 20
		setShaderProperty('barrel', 'barrel', -3)
		tweenShaderProperty('barrel', 'barrel', 0.9, crochet*0.001*4, 'cubeOut')
		
		end
	if curStep == 1992 or curStep == 2024 or curStep == 2056 or curStep == 2088 or curStep == 2120 or curStep == 2152 or curStep == 2184 or curStep == 2216 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1996 or curStep == 2028 or curStep == 2060 or curStep == 2092 or curStep == 2124 or curStep == 2156 or curStep == 2188 or curStep == 2220 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2000 or curStep == 2032 or curStep == 2064 or curStep == 2096 or curStep == 2128 or curStep == 2160 or curStep == 2192 or curStep == 2224 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 2000 or curStep == 2032 or curStep == 2064 or curStep == 2096 or curStep == 2128 or curStep == 2160 or curStep == 2192 or curStep == 2224 then
		tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2016 or curStep == 2048 or curStep == 2080 or curStep == 2112 or curStep == 2144 or curStep == 2176 or curStep == 2208 then
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 2008 or curStep == 2040 or curStep == 2072 or curStep == 2104 or curStep == 2136 or curStep == 2168 or curStep == 2200 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 2012 or curStep == 2044 or curStep == 2076 or curStep == 2108 or curStep == 2140 or curStep == 2172 or curStep == 2204 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2016 or curStep == 2048 or curStep == 2080 or curStep == 2112 or curStep == 2144 or curStep == 2176 or curStep == 2208 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 2048 or curStep == 2064 or curStep == 2080 or curStep == 2096 or curStep == 2176 or curStep == 2192 or curStep == 2208 or curStep == 2224 then
		triggerEvent('Screen Shake','0.55,0.05','')
	end
	if curStep == 2224 then
		tweenShaderProperty('barrel', 'barrel', 2, stepCrochet*0.001*16, 'cubeIn')
	elseif curStep == 2240 then
		setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 6, stepCrochet*0.001*80, 'cubeInOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -120, crochet*0.001*25, 'cubeInOut')
		tweenFadeOut("BlackBox",1,6,"")
	end
end