local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0
local a = 0
local window = 0
angulos = {472,504,508,736,744,752,760,828,832,864,868,876,880,886,892,896,932,936,948,960,1176,1180,1288,1308,1320,1336,1352,1368,1372,1432,1436,2476,2492}
bloom = {128,256,320,384,448,512,640,704,960,1176,1280,1856,2176,2432,3456}
sobelidk = {281,920,924,1656,1816,2201,2200,2576}

function createPost()

    
    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.0)
    setShaderProperty('smoke', 'smokeStrength', 0)

	initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    initShader('colorHUD', 'ColorOverrideEffect')
    setCameraShader('hud', 'colorHUD')
    setShaderProperty('colorHUD', 'red', 0.0)
    setShaderProperty('colorHUD', 'green', 0.0)
    setShaderProperty('colorHUD', 'blue', 0.0)
    

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength',0)
    setShaderProperty('sobel', 'intensity', 4)

	initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
	setShaderProperty('pincushgame', 'angle', 0)
    setShaderProperty('pincushgame', 'x', 0)
	setShaderProperty('pincushgame', 'barrel', 0)
    setShaderProperty('pincushgame', 'doChroma', true)

    initShader('pincush', 'PincushNewEffect')
    setCameraShader('hud', 'pincush')
	setCameraShader('game', 'pincush')
    setShaderProperty('pincush', 'zoom', 0.3)
    setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
    setShaderProperty('pincush', 'angle', 20)
	setShaderProperty('pincush', 'barrel', -1)
    setShaderProperty('pincush', 'doChroma', true)

	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty("bloom","contrast",1)

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setShaderProperty('zoomblur', 'posX', 0)
    setShaderProperty('zoomblur', 'focusPower', 10)
    
    initShader('WaveBurstEffect', 'WaveBurstEffect')
    setCameraShader('hud', 'WaveBurstEffect')
    setCameraShader('game', 'WaveBurstEffect')
    setShaderProperty('WaveBurstEffect', 'strength',0)


    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.5)

	initShader('MosaicEffect', 'MosaicEffect')
	setCameraShader('hud', 'MosaicEffect')
    setCameraShader('game', 'MosaicEffect')
	setShaderProperty("MosaicEffect","strength",15)

    initShader('glowBorder', 'glowBorder')
    setCameraShader('hud', 'glowBorder')
    removeCameraShader('hud', 'glowBorder')

    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('hud', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0.0)
    setShaderProperty('glitchPeak', 'SPEED', 0)


    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)

    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    makeSprite('topBar', 'topBar', 0, -440, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1120, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 24, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'hud')
    setActorVisible(false, 'speed')
    setActorLayer('speed', layershit)

    makeSprite('uno', 'uno', -3000, 150, 1)
	setObjectCamera('uno', 'hud')

	makeSprite('dos', 'dos', 3000, 150, 1)
	setObjectCamera('dos', 'hud')

	makeSprite('tres', 'tres', -3000, 150, 1)
	setObjectCamera('tres', 'hud')

	makeSprite('cuatro', 'cuatro', 3000, 150, 1)
	setObjectCamera('cuatro', 'hud')

    -- bring in the ruckus like

    makeSprite('bring', 'Intervention/bring', 50, -300, 0.8)
    setObjectCamera('bring', 'hud')
    setActorAlpha(1, "bring")

    makeSprite('in', 'Intervention/in', 320, -300, 0.8)
    setObjectCamera('in', 'hud')
    setActorAlpha(1, "in")

    makeSprite('the', 'Intervention/the', 550, -300, 0.8)
    setObjectCamera('the', 'hud')
    setActorAlpha(1, "the")

    makeSprite('ru', 'Intervention/ru',250, 700, 0.8)
    setObjectCamera('ru', 'hud')
    setActorAlpha(1, "ru")

    makeSprite('ckus', 'Intervention/ckus', 280, 730, 0.8)
    setObjectCamera('ckus', 'hud')
    setActorAlpha(1, "ckus")

    makeSprite('like', 'Intervention/like', 120, -300, 1)
    setObjectCamera('like', 'hud')
    setActorAlpha(1, "like")


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

	for i = 0,15 do
		setActorProperty(i,"alpha",0)
    end

    fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
    swayingsmall = false
		
end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, stepCrochet*0.001*steps, 'cubeOut')
end

function sobel(valor,valor2,steps)
    setShaderProperty('sobel', 'strength',valor)
    tweenShaderProperty('sobel', 'strength', valor2, stepCrochet*0.001*steps, 'cubeOut')
end
function anglesmirror(valor,valor2,steps)
	beatSwap = beatSwap * -1
	setShaderProperty('pincush', 'angle',valor,stepCrochet*0.001, 'cubeIn')
    tweenShaderProperty('pincush', 'angle', valor2, stepCrochet*0.001*steps, 'cubeOut')
    setShaderProperty('zoomblur', 'posX', 5)
    setShaderProperty('zoomblur', 'focusPower', 10)
    tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*4, 'cubeOut')
    tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*4, 'cubeOut')
end

function songStart()
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('color', 'green',1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('colorHUD', 'red', 1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('colorHUD', 'green',1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('colorHUD', 'blue', 1.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('pincush', 'angle', 0, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('pincush', 'barrel', -0.5, crochet*0.001*16, 'cubeIn')
    tweenShaderProperty('zoomblur', 'focusPower', 0, crochet*0.001*32, 'cubeIn')
	tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*32, 'cubeIn')
	tweenShaderProperty('MosaicEffect', 'strength', 0, crochet*0.001*48, 'cubeIn')
    perlinXRange = 0.1
    perlinYRange = 0.1
    perlinZRange = 12.5
    perlinSpeed = 0.9
end

function stepHit() 

	for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(3,1,12)
        end
    end

	for i = 1, #sobelidk do
        if curStep == sobelidk [i]-1 then
			sobel(0.8,0,12)
        end
    end

	for i = 1, #angulos do
        if curStep == angulos [i]-1 then
            anglesmirror(-15*beatSwap,0,4)
        end
    end

	if curStep == 112 then
	    for i = 0,15 do
		    tweenActorProperty(i,"alpha",1,2,"cubeOut")
        end
	elseif curStep == 128 or curStep == 192 then
		beatSwap = beatSwap * -1
		setShaderProperty('mirrorGame', 'angle', 360*beatSwap)
		tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
	elseif curStep == 176 or curStep == 240 then
		setShaderProperty('mirrorGame', 'x', -2)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 184 or curStep == 248 then
		setShaderProperty('mirrorGame', 'x', 2)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
		tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 188 or curStep == 252 then
		tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 256 then
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	end

	if curStep == 272 or curStep == 336 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 275 or curStep == 339 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.6, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 278 or curStep == 342 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 281 or curStep == 345 or curStep == 320 or curStep == 384 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*3, 'cubeOut')
		tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*3, 'cubeOut')
	elseif curStep == 312 or curStep == 352 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.8, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 315 or curStep == 368 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 318 or curStep == 376 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.4, stepCrochet*0.001*2, 'cubeOut')
	end
    if curStep == 280 then
		tweenActorProperty('dos', 'x', 200.0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 288 then
        tweenActorProperty('dos', 'x', 1500.0, stepCrochet*0.001*8, 'expoOut')
	end



    if curStep == 400 or curStep == 464 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 406 or curStep == 470 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
		tweenShaderProperty('pincushgame', 'barrel', -4, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 416 or curStep == 480 then
		tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*4, 'expoOut')
	elseif curStep == 440 or curStep == 504 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 444 or curStep == 508 then
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 416 or curStep == 432 or curStep == 480 or curStep == 496 then
		beatSwap = beatSwap * -1
		setShaderProperty('mirrorGame', 'x', -2*beatSwap)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*12, 'elasticInOut')
	end
	if curStep == 480 then
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
	elseif curStep == 512 then
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setProperty("healthBar","alpha",1)
        setProperty("healthBarBG","alpha",1)
        setProperty("infoTxt","alpha",1)
        setProperty("iconP1","alpha",1)
        setProperty("iconP2","alpha",1)
        setProperty("scoreTxt","alpha",1)
        setProperty("timeBar","alpha",1)
        setProperty("timeBarBG","alpha",1)
        setProperty("ratingText","alpha",1)
        setProperty("ratingsGroup","x",1)
	end
	if curStep >= 504 and curStep < 512 then
	    if curStep % 4 == 0 then
		    setShaderProperty('color', 'red', 0)
		    setShaderProperty('color', 'blue', 0)
		    setShaderProperty('color', 'green', 0)
		    tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*4, 'cubeOut')
		    tweenShaderProperty('color', 'green',1.5, stepCrochet*0.001*4, 'cubeOut')
		    tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*4, 'cubeOut')
	    end
	end


	if curStep == 560 or curStep == 568 or curStep == 624 or curStep == 632 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 564 or curStep == 572 or curStep == 628 or curStep == 636 or curStep == 700 or curStep == 764 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 656 or curStep == 720 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 659 or curStep == 723 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 662 or curStep == 726 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 704 or curStep == 768 then
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
	end
    if curStep == 736 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 768 then
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeIn')
	end

	if curStep >= 512 and curStep < 768 or curStep >= 1024 and curStep < 1264 or curStep >= 2304 and curStep < 2432 or curStep >= 2496 and curStep < 2560 or curStep >= 3072 and curStep < 3328 or curStep >= 3456 and curStep < 3584 then
	    if curStep % 8 == 0 then
		    beatSwap = beatSwap * -1
		    setShaderProperty('mirrorGame', 'x', -0.1*beatSwap)
		    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'cubeOut')
			setShaderProperty('mirrorGame', 'angle',-20*beatSwap)
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
            setShaderProperty('zoomblur', 'posX', 5)
            setShaderProperty('zoomblur', 'focusPower', 10)
            tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*8, 'cubeOut')
           tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*8, 'cubeOut')
	    end
	end

	if curStep >= 544 and curStep < 576 or curStep >= 608 and curStep < 640 or curStep >= 2336 and curStep < 2368 or curStep >= 2400 and curStep < 2432 or curStep >= 3104 and curStep < 3136 or curStep >= 3168 and curStep < 3200 then
	    if curStep % 8 == 0 then
		    setShaderProperty('mirrorGame', 'y', -4)
		    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
	    end
	end

    if curStep >= 672 and curStep < 704 or curStep >= 736 and curStep < 768 or curStep >= 2528 and curStep < 2560 or curStep >= 3232 and curStep < 3264 or curStep >= 3296 and curStep < 3328 or curStep >= 3488 and curStep < 3520 or curStep >= 3552 and curStep < 3584 then
	    if curStep % 8 == 0 then
		    setShaderProperty('pincushgame', 'x', -4)
		    tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
	    end
	end


    if curStep == 788 or curStep == 852 then
        tweenShaderProperty('pincushgame', 'x', 1, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 0.85, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 796 or curStep == 812 or curStep == 860 or curStep == 876 then
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 804 or curStep == 868 then
        tweenShaderProperty('pincushgame', 'x', -1, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 0.85, stepCrochet*0.001*4, 'cubeIn')

    elseif curStep == 820 or curStep == 884 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 824 or curStep == 888 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 828 or curStep == 892 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 832 or curStep == 896 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*6, 'cubeOut')
    end



    if curStep == 920 or curStep == 960 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*6, 'cubeOut')
    elseif curStep == 924 or curStep == 976 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 932 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 944 or curStep == 948 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'x', -4*beatSwap)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 952 or curStep == 954 or curStep == 956 or curStep == 958 then
        beatSwap = beatSwap * -1
        setShaderProperty('mirrorGame', 'x', -4*beatSwap)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 992 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*5, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'x', 3, stepCrochet*0.001*15, 'linear')
	elseif curStep == 1004 then
		tweenShaderProperty('mirrorGame', 'zoom', 4, stepCrochet*0.001*10, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'x', 8, stepCrochet*0.001*15, 'linear')
    elseif curStep == 1008 then
        tweenShaderProperty('MosaicEffect', 'strength', 6, crochet*0.001*4, 'cubeIn')
	elseif curStep == 1016 then
		tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*12, 'cubeOutIn')
	elseif curStep == 1024 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*16, 'expoOut')
        setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end


    if curStep == 1040 then
        tweenShaderProperty('pincushgame', 'x', -0.5, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 1056 then
        tweenShaderProperty('pincushgame', 'angle', 185, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'zoom', 1.3, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1072 then
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('pincushgame', 'angle', -40, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1088 then
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincushgame', 'x', -4)
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1104 then
        tweenShaderProperty('pincushgame', 'x', 0.5, stepCrochet*0.001*8, 'cubeInOut')
    elseif curStep == 1120 then
        tweenShaderProperty('pincushgame', 'angle', -185, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'zoom', 1.3, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1136 then
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('pincushgame', 'angle', 45, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1152 then
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('pincushgame', 'x', -4)
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
    end


    if curStep == 1168 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1171 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1174 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1176 then
        setShaderProperty('MosaicEffect', 'strength', 0)
    elseif curStep == 1184 then
        tweenShaderProperty('MosaicEffect', 'strength', 6, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1200 or curStep == 1208 then
        setShaderProperty('pincushgame', 'x', -4)
        tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1248 then
        tweenShaderProperty('MosaicEffect', 'strength', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 2, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*2)..',0.009', (crochet*0.001*2)..',0.009')
    elseif curStep == 1280 then
        setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1216 or curStep == 1232 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*2)..',0.009', (crochet*0.001*2)..',0.009')
    elseif curStep == 1224 or curStep == 1240 or curStep == 1256 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1264 then
        setShaderProperty('pincushgame', 'angle', 360)
        tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
    elseif curStep == 1268 or curStep == 1272 or curStep == 1276 then
        beatSwap = beatSwap * -1
		setShaderProperty('pincushgame', 'x', -2*beatSwap)
		tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1280 then
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
        setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end


    if curStep == 1296 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*8, 'quartOut')
    elseif curStep == 1304 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*8, 'quartOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1312 then
        setShaderProperty('mirrorGame', 'x', -4)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1328 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*8, 'quartOut')
    elseif curStep == 1336 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'quartOut')
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1344 then
        setShaderProperty('mirrorGame', 'x', 4)
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1364 or curStep == 1372 then
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1368 then
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1376 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1392 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1400 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1404 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 1424 or curStep == 1456 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 1428 or curStep == 1460 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 1440 or curStep == 1472 then
        setShaderProperty('pincushgame', 'angle', 360)
		tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 1448 or curStep == 1480 then
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1488 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1494 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1500 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1504 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 1520 then
        tweenShaderProperty('mirrorGame', 'zoom', 20, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -8, crochet*0.001*4, 'cubeIn')
        tweenStageColorSwap('hue', 0.1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1536 then
        setShaderProperty('mirrorGame', 'zoom', 0.5)
        tweenShaderProperty('pincushgame', 'barrel', -1, crochet*0.001*4, 'cubeOut')
        tweenStageColorSwap('hue', 0, crochet*0.001*4, 'cubeOut')
	    tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'expoOut')
        setShaderProperty('barrel', 'barrel', -4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        perlinSpeed = 1.75
        perlinXRange = 0.1
        perlinYRange = 0
        perlinZRange = 12
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

    if curStep == 1360 then
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1364 then
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
    end

	if curStep == 480 or curStep == 2272 then -- or curStep == 992 or curStep == 1504 or curStep == 2272 then
        tweenActorProperty('uno', 'x', 270.0,stepCrochet *0.001*8, 'expoOut')
    end
    if curStep == 488 or curStep == 2280 then -- or curStep == 1000 or curStep == 1512 or curStep == 2280 then
        tweenActorProperty('dos', 'x', 200.0, stepCrochet*0.001*8, 'expoOut')
		tweenActorProperty('uno', 'x', -1000.0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 496 or curStep == 2288 then
        tweenActorProperty('tres', 'x', 270.0, stepCrochet*0.001*8, 'expoOut')
		tweenActorProperty('dos', 'x', 1500.0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 504 or curStep == 2296 then
        tweenActorProperty('cuatro', 'x', 200.0, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty('tres', 'x', -1500.0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 512 or curStep == 2304 then
        tweenActorProperty('cuatro', 'x', 1500.0, stepCrochet*0.001*8, 'expoOut')
    end

    if curStep == 1504 or curStep == 2400 then
        tweenActorProperty("bring", 'y',100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1512 or curStep == 2408 then
        tweenActorProperty("in", 'y',100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1516 or curStep == 2412 then
        tweenActorProperty("the", 'y',100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1520 or curStep == 2416 then
        tweenActorProperty("ru", 'y',350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1528 or curStep == 2424 then
        tweenActorProperty("ckus", 'y',350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1536 or curStep == 2432 then

        tweenActorProperty("bring", 'y',-400, stepCrochet*0.001*14, 'expoOut')
        tweenActorProperty("in", 'y',-400, stepCrochet*0.001*14, 'expoOut')
        tweenActorProperty("the", 'y',-400, stepCrochet*0.001*14, 'expoOut')
        tweenActorProperty("ru", 'y',750, stepCrochet*0.001*14, 'expoOut')
        tweenActorProperty("ckus", 'y',750, stepCrochet*0.001*14, 'expoOut')
        tweenActorProperty("like", 'y',250, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1544 or curStep == 2440 then
        tweenActorProperty("like", 'y',-400, stepCrochet*0.001*16, 'expoOut')
    end
    if curStep >= 1024 and curStep < 1264 or curStep >= 1536 and curStep < 2048 then
	    if curStep % 8 == 0 then
		    beatSwap = beatSwap * -1
		    setShaderProperty('pincush', 'y', -0.07*beatSwap)
		    tweenShaderProperty('pincush', 'y', 0, stepCrochet*0.001*8, 'cubeOut')
            setShaderProperty('zoomblur', 'focusPower', 10)
           tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*8, 'cubeOut')
	    end
	end

    if curStep == 1552 then
	    tweenShaderProperty('mirrorGame', 'x', 1.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1568 then
        tweenShaderProperty('mirrorGame', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1578 or curStep == 1708 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1600 or curStep == 1728 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.65, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1632 or curStep == 1760 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*6, 'cubeIn')
    elseif curStep == 1664 or curStep == 1792 then
        setShaderProperty('mirrorGame', 'x', -4)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1680 then
        tweenShaderProperty('mirrorGame', 'x', 0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1696 then
        tweenShaderProperty('mirrorGame', 'x', -1.5, crochet*0.001*2, 'cubeInOut')
	end

    if curStep == 1792 or curStep == 1824 or curStep == 1920 or curStep == 1952 then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.015', (crochet*0.001*4)..',0')
    end
    if curStep == 1824 then
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1840 or curStep == 1968 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.9, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 1844 or curStep == 1972 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.8, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1848 or curStep == 1976 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1852 or curStep == 1980 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1856 or curStep == 1984 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('screen shake', (crochet*0.001*16)..',0.015', (crochet*0.001*16)..',0.004')
    elseif curStep == 1888 or curStep == 2016 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
        tweenStageColorSwap('hue', 0.1, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1914 or curStep == 2044 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*6, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*6, 'cubeIn')
        tweenStageColorSwap('hue', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1920 then
        setShaderProperty('mirrorGame', 'angle', -360)
	    tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 1936 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*6, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 1952 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 2016 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2048 then
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end


    if curStep == 2048 or curStep == 2112 then
		beatSwap = beatSwap * -1
		setShaderProperty('mirrorGame', 'angle', 360*beatSwap)
		tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
	elseif curStep == 2096 or curStep == 2160 then
		setShaderProperty('mirrorGame', 'x', -2)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 2104 or curStep == 2168 then
		setShaderProperty('mirrorGame', 'x', 2)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
		tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*4, 'quartOut')
	elseif curStep == 2108 or curStep == 2172 then
		tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2176 then
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	end

	if curStep == 2192 or curStep == 2256 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('pincushgame', 'barrel', -3.5, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2195 or curStep == 2259 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.6, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2198 or curStep == 2262 then
		tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2201 or curStep == 2265 or curStep == 2240 or curStep == 2304 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*3, 'cubeOut')
		tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*3, 'cubeOut')
	elseif curStep == 2232 or curStep == 2272 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.8, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2235 or curStep == 2288 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2238 or curStep == 2296 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.4, stepCrochet*0.001*2, 'cubeOut')
	end
    if curStep == 2272 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2304 then
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 2200 then
		tweenActorProperty('dos', 'x', 200.0, stepCrochet*0.001*8, 'expoOut')
    end
    if curStep == 2208 then
        tweenActorProperty('dos', 'x', 1500.0, stepCrochet*0.001*8, 'expoOut')
	end

    if curStep == 2432 then
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty('mirrorGame', 'zoom', 0.8, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 2440 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 2448 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 2456 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 2464 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*10, 'cubeOut')
    elseif curStep == 2480 then
        setShaderProperty('mirrorGame', 'x', -4)
		tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    end




    if curStep == 2352 or curStep == 2360 or curStep == 2416 or curStep == 2424 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 2356 or curStep == 2364 or curStep == 2420 or curStep == 2428 or curStep == 2556 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2512 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2515 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2518 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2560 then
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
	end
    if curStep == 2528 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2560 then
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
        flashCamera('hud', '#000000', 1)
        perlinSpeed = 1.75
        perlinXRange = 0.1
        perlinYRange = 0.1
        perlinZRange = 20
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom', 0.8, crochet*0.001*4, 'cubeIn')
        setCameraShader("hud","glowBorder")
        setShaderProperty('vignette', 'size', 0)
        setShaderProperty('greyscale', 'strength', 1)

        tweenShaderProperty('color', 'red', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*4, 'cubeIn')
	 
        tweenFadeIn("bfCharacter0", 0,0.00001)
        tweenFadeIn("bfCharacter1", 0,0.00001)
	    tweenFadeIn("girlfriend", 0,0.00001)

        setShaderProperty('smoke', 'waveStrength', 0.05)
        setShaderProperty('smoke', 'smokeStrength', 1.5)

    
        for i = 8,15 do
            setActorProperty(i,"alpha",0)
        end
    elseif curStep == 2800 then
        for i = 0,7 do
            tweenActorProperty(i,"alpha",0,1,"cubeIn")
        end
        for i = 8,15 do
            tweenActorProperty(i,"alpha",1,1,"cubeIn")
        end
    elseif curStep == 3056 then
        for i = 0,7 do
            tweenActorProperty(i,"alpha",1,1,"cubeIn")
        end
	end
    if curStep == 3072 then
        removeCameraShader("hud","glowBorder")
        setShaderProperty('vignette', 'size', 0.5)
        tweenFadeIn("dadCharacter0", 1,1)
	    tweenFadeIn("dadCharacter1", 1,1)
        setShaderProperty('barrel', 'barrel', -4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('smoke', 'waveStrength', 0)
        setShaderProperty('smoke', 'smokeStrength', 0)
        setActorVisible(true, 'speed')
        setShaderProperty('glitchPeak', 'AMT', 0)
        setShaderProperty('glitchPeak', 'SPEED', 0)
    elseif curStep == 2592 then
        tweenShaderProperty('barrel', 'zoom', 1.1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2608 or curStep == 2848 then
        tweenShaderProperty('mirrorGame', 'x', -1, stepCrochet*0.001*12, 'quadOut')
    elseif curStep == 2624 or curStep == 2864 then
        tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*12, 'quadOut')
    elseif curStep == 2640 or curStep == 2880 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*12, 'quadOut')
    elseif curStep == 2660 or curStep == 2916 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.9, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2664 or curStep == 2920 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2688 or curStep == 2944 then
        setShaderProperty('mirrorGame', 'angle', -360)
	    tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
    elseif curStep == 2712 or curStep == 2960 then
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*16, 'expoOut')
    elseif curStep == 2728 or curStep == 2984 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.4, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2736 or curStep == 2992 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2752 or curStep == 3008 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, crochet*0.001*6, 'cubeIn')
    elseif curStep == 3040 then
        tweenShaderProperty('barrel', 'barrel', 1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2808 or curStep == 3064 then
        setShaderProperty('mirrorGame', 'x', -4)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*16, 'quadOut')
    elseif curStep == 2816 then
        tweenFadeIn("bfCharacter0", 1,1)
	    tweenFadeIn("girlfriend", 1,1)

        tweenFadeIn("dadCharacter0", 0,1)
	    tweenFadeIn("dadCharacter1", 0,1)
    elseif curStep == 2856 then
        tweenFadeIn("bfCharacter1", 1,1.7)
    end

    if curStep == 3120 or curStep == 3128 or curStep == 3184 or curStep == 3192 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 3124 or curStep == 3132 or curStep == 3188 or curStep == 3196 or curStep == 3260 or curStep == 3324 or curStep == 3516 or curStep == 3580 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 3216 or curStep == 3280 or curStep == 3472 or curStep == 3536 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 3219 or curStep == 3283 or curStep == 3475 or curStep == 3539 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.9, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 3222 or curStep == 3286 or curStep == 3478 or curStep == 3542 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1300, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-300, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 3264 or curStep == 3328 or curStep == 3520 or curStep == 3584 then
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-420, stepCrochet*0.001*4, 'cubeIn')
	end
    if curStep == 3296 or curStep == 3552 then
        tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 3328 or curStep == 3584 then
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('mirrorGame', 'y', -4)
	    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 3360 or curStep == 3424 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.6, crochet*0.001*4, 'cubeIn')
        triggerEvent('screen shake', (crochet*0.001*8)..',0.025', (crochet*0.001*8)..',0.004')
    elseif curStep == 3392 or curStep == 3456 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        setShaderProperty('mirrorGame', 'x', -4)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*12, 'expoOut')
    elseif curStep == 3400 then
        setShaderProperty('mirrorGame', 'x', -4)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
	end
    if curStep == 3456 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 3584 then
        setActorVisible(false, 'speed')
        setShaderProperty('smoke', 'smokeStrength', 1.5)
    elseif curStep == 3616 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
        triggerEvent('screen shake', (crochet*0.001*16)..',0.009', (crochet*0.001*16)..',0.009')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 3648 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 3680 then
        for i = 0,15 do
            tweenActorProperty(i,"alpha",0,1,"cubeIn")
        end
        tweenShaderProperty('color', 'red', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*8, 'cubeIn')
    end





    if curStep == 1856 or curStep == 1864 or curStep == 1872 or curStep == 1880 or curStep == 1888 or curStep == 1896 or curStep == 1984 or curStep == 1992 or curStep == 2000 or curStep == 2008 or curStep == 2016 or curStep == 2024 then
        setShaderProperty('mirrorGame', 'x', -4)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 1904 or curStep == 1908 or curStep == 1912 or curStep == 1916 or curStep == 2032 or curStep == 2036 or curStep == 2040 or curStep == 2044 then
        setShaderProperty('mirrorGame', 'x', -2)
	    tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'expoOut')
    end

    if curStep >= 1024 and curStep < 1264 or curStep >= 1536 and curStep < 2048  or curStep >= 3072 and curStep < 3584 then
	    if curStep % 16 == 0 then
            tweenShaderProperty('barrel', 'zoom', 0.95, stepCrochet*0.001*8, 'cubeIn')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('barrel', 'zoom', 1.0, stepCrochet*0.001*8, 'cubeOut')
        end
    end

    if curStep >= 1536 and curStep < 2048 then
        if curStep % 16 == 0 then
            tweenShaderProperty('color', 'red', 1.4, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 1.3, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 2 then
            tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 0.9, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 0.9, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 4 then
            tweenShaderProperty('color', 'red', 0.9, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 0.9, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 6 then
            tweenShaderProperty('color', 'red', 0.9, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 0.9, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green',1.2, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 0.9, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 10 then
            tweenShaderProperty('color', 'red', 0.7, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 0.95, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 1.25, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 12 then
            tweenShaderProperty('color', 'red', 1.1, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 1.3, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 0.9, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 14 then
            tweenShaderProperty('color', 'red', 1.5, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*2, 'cubeOut')
            tweenShaderProperty('color', 'blue', 1.5, stepCrochet*0.001*2, 'cubeOut')
        end
    end
   
    if curStep >= 512 and curStep < 768 or curStep >= 1024 and curStep < 1280 or curStep >= 1536 and curStep < 2048 or curStep >= 2304 and curStep < 2560  or curStep >= 3072 and curStep < 3584 then
	    if curStep % 16 == 0 then

            --sxm

            setActorProperty(0,"angle",-40)
            tweenActorProperty(0,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(1,"angle",-40)
            tweenActorProperty(1,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(2,"angle",-40)
            tweenActorProperty(2,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(3,"angle",-40)
            tweenActorProperty(3,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(4,"angle",-40)
            tweenActorProperty(4,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(5,"angle",-40)
            tweenActorProperty(5,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(6,"angle",-40)
            tweenActorProperty(6,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(7,"angle",-40)
            tweenActorProperty(7,"angle",0,stepCrochet*0.001*8,"cubeOut")

            --bf

            setActorProperty(8,"angle",-40)
            tweenActorProperty(8,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(9,"angle",-40)
            tweenActorProperty(9,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(10,"angle",-40)
            tweenActorProperty(10,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(11,"angle",-40)
            tweenActorProperty(11,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(12,"angle",-40)
            tweenActorProperty(12,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(13,"angle",-40)
            tweenActorProperty(13,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(14,"angle",-40)
            tweenActorProperty(14,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(15,"angle",-40)
            tweenActorProperty(15,"angle",0,stepCrochet*0.001*8,"cubeOut")

        elseif curStep % 16 == 8 then
            triggerEvent('Add Camera Zoom','0.1','0.1')
                --sxm

                setActorProperty(0,"angle",40)
                tweenActorProperty(0,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(1,"angle",40)
                tweenActorProperty(1,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(2,"angle",40)
                tweenActorProperty(2,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(3,"angle",40)
                tweenActorProperty(3,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(4,"angle",40)
                tweenActorProperty(4,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(5,"angle",40)
                tweenActorProperty(5,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(6,"angle",40)
                tweenActorProperty(6,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(7,"angle",40)
                tweenActorProperty(7,"angle",0,stepCrochet*0.001*8,"cubeOut")
    
                --bf
    
                setActorProperty(8,"angle",40)
                tweenActorProperty(8,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(9,"angle",40)
                tweenActorProperty(9,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(10,"angle",40)
                tweenActorProperty(10,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(11,"angle",40)
                tweenActorProperty(11,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(12,"angle",40)
                tweenActorProperty(12,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(13,"angle",40)
                tweenActorProperty(13,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(14,"angle",40)
                tweenActorProperty(14,"angle",0,stepCrochet*0.001*8,"cubeOut")
                setActorProperty(15,"angle",40)
                tweenActorProperty(15,"angle",0,stepCrochet*0.001*8,"cubeOut")
    
	    end
	end

end



function update(elapsed)

    a = a + (elapsed*1.25) 
    if curStep >= 2560 and curStep <= 3072 then
        for i = 0,15 do
                if (i >= 0 and i <= 15) then
                    setActorY(defaultStrum0Y+5*math.cos((a+i*0.45)*math.pi),i)
                end
            end
    elseif curStep >= 3072 then
        for i = 0,15 do
            setActorY(defaultStrum0Y,i)
        end
    end

    time = time + elapsed
    setCustomShaderFloat('glowBorder', 'iTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end
