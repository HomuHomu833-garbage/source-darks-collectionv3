local time = 0
local beatSwap = 1
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local a = 0
local window = 0

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
end

function createPost()
	initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 40)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

	
    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', -0.65)
    setShaderProperty('barrel', 'zoom', 2.5)
	setShaderProperty('barrel', 'x', 0)
	setShaderProperty('barrel', 'angle', 180)
    setShaderProperty('barrel', 'doChroma', true)

	initShader('barrelGame', 'BarrelBlurEffect')
    setCameraShader('game', 'barrelGame')
    setShaderProperty('barrelGame', 'barrel', 0)
    setShaderProperty('barrelGame', 'zoom', 1)
	setShaderProperty('barrelGame', 'x', 0)
	setShaderProperty('barrelGame', 'y', 0)
	setShaderProperty('barrelGame', 'angle', 0)
    setShaderProperty('barrelGame', 'doChroma', true)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

	initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.3)

	initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.04)
    setShaderProperty('smoke', 'smokeStrength', 1.1)

	initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 1)
    setShaderProperty('sobel', 'intensity', 2)

	initShader('MirrorRepeatEffect', 'MirrorRepeatEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
	setShaderProperty('MirrorRepeatEffect','angle', 0)

	initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.1)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.1)

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
	initShader('rain', 'rain')
    setCameraShader('game', 'rain')
	setShaderProperty('rain', 'opacity', 0.30)
	setShaderProperty('rain', 'zoom', 30)
	setShaderProperty('rain', 'raindropLength', 0.1)


	initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

end

function update(elapsed)

	a = a + (elapsed*0.25)
	
	time = time + elapsed
    setCustomShaderFloat('rain', 'iTime', time)
	setCustomShaderFloat('smoke', 'iTime', time)

	perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end

function start (song)

	tweenFadeIn("dadCharacter0", 0,0.00001)
	tweenFadeIn("bfCharacter1", 0,0.00001)
    tweenFadeIn("dadCharacter1", 0,0.00001)

	if not middlescroll then
		for i = 0,8 do
			setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+940)
			setActorProperty(i,"alpha",0)
		end
		for i = 9,18 do
			setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-940)
			setActorProperty(i,"alpha",0)
		end
	end

end

function songStart()

    tweenShaderProperty('barrel', 'zoom', 1.0, crochet*0.001*32, 'cubeInOut')
	tweenShaderProperty('barrel', 'angle', 1.0, crochet*0.001*32, 'cubeInOut')
    tweenShaderProperty('pixel', 'strength', 0.0, crochet*0.001*24, 'cubeInOut')
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*20, 'cubeInOut')
    tweenShaderProperty('color', 'green', 1.5, crochet*0.001*20, 'cubeInOut')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*20, 'cubeInOut')
	tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*24, 'cubeInOut')
    perlinZRange = 10 
    perlinSpeed = 0.5 

	if not middlescroll then
		for i = 0,8 do
			tweenActorProperty(i,"angle",360,crochet*0.001*20.5, 'cubeInOut')
			tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,20.5,"cubeInOut")
			tweenActorProperty(i,"alpha",0.8,20,"linear")
		end
		for i = 9,18 do
			tweenActorProperty(i,"angle",-360,crochet*0.001*20.5, 'cubeInOut')
			tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,20.5,"cubeInOut")
			tweenActorProperty(i,"alpha",0.8,20,"linear")
		end
	end

end

function bloomBurst()
    setShaderProperty("bloom","contrast",2.5)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"linear")
end

function stepHit()
	if curStep == 232 then
		tweenShaderProperty('barrel', 'zoom', 2.5, crochet*0.001*5, 'cubeIn')
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*5, 'cubeIn')
	elseif curStep == 256 then
		tweenFadeIn("dadCharacter0", 1,1)
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0.05, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'x', 0.45, crochet*0.001*30, 'cubeIn')
		setShaderProperty('greyscale', 'strength', 0)
		setShaderProperty('barrel', 'zoom', 1)
		setShaderProperty('rain', 'opacity', 0)
		perlinZRange = 0
		bloomBurst()
	elseif curStep == 384 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*30, 'cubeIn')
	elseif curStep == 496 then
		tweenShaderProperty('barrel', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 502 then
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*8, 'cubeInOut')
		tweenShaderProperty('barrelGame', 'angle', 360, crochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('sobel', 'strength', 1, crochet*0.001*4, 'cubeIn')
	elseif curStep == 512 then
		bloomBurst()
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
		perlinZRange = 10 
	end
	if curStep >= 256 and curStep < 512 then
		if curStep % 40 == 0 then
			tweenShaderProperty("barrel", "angle", 5, stepCrochet*0.001*10, "cubeOut")
		end
		if curStep % 40 == 10 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*10, "cubeIn")
		end
		if curStep % 40 == 20 then
			tweenShaderProperty("barrel", "angle", -5, stepCrochet*0.001*10, "cubeOut")
		end
		if curStep % 40 == 30 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*10, "cubeIn")
		end
	end
	if curStep >= 512 and curStep < 1024 or curStep >= 3584 and curStep < 4096 then
        if curStep % 16 == 8 then
            triggerEvent('Add Camera Zoom','0.09','0.09')
			beatSwap = beatSwap * -1
            setShaderProperty('barrel', 'angle', -5*beatSwap)
            tweenShaderProperty('barrel','angle',0,stepCrochet*0.001*4,'cubeOut')
        end
    end
	if curStep == 544 then
		tweenShaderProperty('barrelGame', 'zoom', 0.4, crochet*0.001*12, 'cubeInOut')
	elseif curStep == 608 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*12, 'cubeInOut')
	end

	-- primer drop

	if curStep >= 1792 and curStep <= 2304 or curStep >= 4864 and curStep <= 5632 then
        for i = 0,18 do
            if not middlescroll then
                if (i >= 0 and i <= 18) then
                    setActorY(defaultStrum0Y+8*math.cos((a+i*0.4)*math.pi),i)
                end
            end
        end
    elseif curStep >= 2304 or curStep >= 5632 then
        for i = 0,18 do
            setActorY(defaultStrum0Y,i)
        end
    end

	if curStep == 1792 or curStep == 4864 then
		flashCamera('hud', '#FFFFFF', 1.5)
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		setShaderProperty("barrelGame", "angle",0)
		setShaderProperty("barrel", "barrel",-0.15)
		setShaderProperty('vignette', 'size', 0.1)
		setShaderProperty('vignette', 'red', 199)
        setShaderProperty('vignette', 'green', 41)
        setShaderProperty('vignette', 'blue', 67)
		tweenFadeIn("bfCharacter1", 0.5,2)
		perlinZRange = 30 
        perlinSpeed = 1.65
		
	end
	
	if curStep == 2296 then
		tweenShaderProperty('color', 'red', 0, crochet*0.001*3, 'cubeOut')
		tweenShaderProperty('color', 'green', 0, crochet*0.001*3, 'cubeOut')
		tweenShaderProperty('color', 'blue', 0, crochet*0.001*3, 'cubeOut')
	elseif curStep == 2298 then
		setShaderProperty('barrelGame', 'angle', 0)
		tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*4, 'cubeInOut')
	elseif curStep == 2304 then
		setShaderProperty('rain', 'opacity', 0.30)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*12, 'cubeOut')
		perlinZRange = 10 
        perlinSpeed = 0.65
		tweenShaderProperty('color', 'red', 1.5, crochet*0.001*20, 'cubeInOut')
		tweenShaderProperty('color', 'green', 1.5, crochet*0.001*20, 'cubeInOut')
		tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*20, 'cubeInOut') 
		setShaderProperty('greyscale', 'strength', 1)
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*12, 'cubeOut')
		setShaderProperty('vignette', 'size', 0.3)
		setShaderProperty('vignette', 'red', 0)
        setShaderProperty('vignette', 'green', 0)
        setShaderProperty('vignette', 'blue', 0)
		tweenFadeIn("bfCharacter1", 0,2)
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

	if curStep == 1216 or curStep == 4272+16 then
		triggerEvent('Screen Shake','4.25,0.045','')
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*16, 'cubeIn')
		tweenShaderProperty('barrelGame', 'zoom', 0.8, crochet*0.001*16, 'cubeIn')
		perlinXRange = 0.25 
		perlinYRange = 0.1 
		perlinZRange = 30 
		perlinSpeed = 1.5 
	elseif curStep == 1216+64 or curStep == 4272+16+64 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'angle', 360, crochet*0.001*4, 'cubeInOut')
		perlinXRange = 0
        perlinYRange = 0.15 
        perlinZRange = 10 
        perlinSpeed = 0.65 
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
	if curStep == 1216 or curStep == 1792 or curStep == 4288 or curStep == 4864 then
		
			for i = 4,4 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-50,1,"linear")
				tweenActorProperty(i,"alpha",0,1,"linear")
			end
			for i = 13,13 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-50,1,"linear")
				tweenActorProperty(i,"alpha",0,1,"linear")
			end
			for i = 0,3 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+50,1,"cubeInOut")
			end
			for i = 5,8 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeInOut")
			end
			for i = 9,12 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+50,1,"cubeInOut")
			end
			for i = 14,18 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeInOut")
			end
		
	elseif curStep == 1280 or curStep == 2298 or curStep == 4352 then
	    if middlescroll then
			for i = 4,4 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-1,1,"linear")
				tweenActorProperty(i,"alpha",0.8,1,"linear")
			end
			for i = 13,13 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-1,1,"linear")
				tweenActorProperty(i,"alpha",0.8,1,"linear")
			end
			for i = 0,3 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"cubeInOut")
			end
			for i = 5,8 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+10,1,"cubeInOut")
			end
			for i = 9,12 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+0,1,"cubeInOut")
			end
			for i = 14,18 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+0,1,"cubeInOut")
			end
		end
		if not middlescroll then
			for i = 4,4 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"],1,"linear")
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"linear")
				tweenActorProperty(i,"alpha",0.8,1,"linear")
			end
			for i = 13,13 do
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"],1,"linear")
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"linear")
				tweenActorProperty(i,"alpha",0.8,1,"linear")
			end
			for i = 0,3 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"cubeInOut")
			end
			for i = 5,8 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"cubeInOut")
			end
			for i = 9,12 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"cubeInOut")
			end
			for i = 14,18 do
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"],1,"cubeInOut")
			end
		end

		
	end
	if curStep >= 1024 and curStep < 1200 or curStep >= 4096 and curStep < 4288 then
        if curStep % 16 == 4 then
            triggerEvent('Add Camera Zoom','0.09','0.09')
	elseif curStep  % 16 == 12 then
		    triggerEvent('Add Camera Zoom','0.09','0.09')
	    end
	end 
	if curStep >= 1280 and curStep < 1776 or curStep >= 4352 and curStep < 4848 then
        if curStep % 16 == 8 then
            triggerEvent('Add Camera Zoom','0.15','0.15')
	    end
	end 



	--drop
	if curStep >= 1552 and curStep < 1568 or curStep >= 1584 and curStep < 1600 then
        if curStep % 16 == 0 then
            triggerEvent('Add Camera Zoom','0.09','0.09')
            tweenShaderProperty('barrelGame', 'barrel', -0.15, crochet*0.001*4, 'cubeOut')
            tweenShaderProperty('barrelGame', 'zoom', 1.0, crochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('barrelGame', 'barrel', -0.4, crochet*0.001*2, 'cubeIn')
            tweenShaderProperty('barrelGame', 'zoom', 0.9, crochet*0.001*2, 'cubeIn')
        end
    end
	if curStep >= 1792 and curStep < 1920 or curStep >= 2048 and curStep < 2176 or curStep >= 4864 and curStep < 4992 or curStep >= 5120 and curStep < 5248 then -- sxm
        if curStep % 64 == 0 then
			tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*4, 'cubeInOut')
        elseif curStep % 64 == 16 then
			tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'y', 2, crochet*0.001*4, 'cubeInOut')
		elseif curStep % 64 == 32 then
			tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*4, 'cubeInOut')
			tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        elseif curStep % 64 == 48 then
			tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
        end
    end
	if curStep >= 1920 and curStep < 2048 or curStep >= 2176 and curStep < 2304 or curStep >= 4992 and curStep < 5120 or  curStep >= 5248 and curStep < 5376 then -- bf
        if curStep % 64 == 0 then
			tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'x', -2, crochet*0.001*4, 'cubeInOut')
        elseif curStep % 64 == 16 then
			tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'y', -2, crochet*0.001*4, 'cubeInOut')
		elseif curStep % 64 == 32 then
			tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*4, 'cubeInOut')
			tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        elseif curStep % 64 == 48 then
			tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeInOut')
            tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
        end
    end
	if curStep >= 1792 and curStep < 2304 or  curStep >= 4864 and curStep < 5376 then
        if curStep % 32 == 0 then
			tweenShaderProperty('barrelGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')
		elseif curStep % 32 == 8 then
			tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		elseif curStep % 32 == 16 then
			tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*8, 'cubeIn')
		elseif curStep % 32 == 24 then
			tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    end
	end 




	-- segunda parte 

	if curStep == 2536 then

		tweenShaderProperty('barrel', 'zoom', 2.5, crochet*0.001*5, 'cubeIn')
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*5, 'cubeIn')
	elseif curStep == 2560 then
		setShaderProperty('barrel', 'barrel', -8)
		tweenShaderProperty('barrel', 'barrel', 0.05, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'x', 0.45, crochet*0.001*30, 'cubeIn')
		setShaderProperty('greyscale', 'strength', 0)
		setShaderProperty('barrel', 'zoom', 1)
		setShaderProperty('rain', 'opacity', 0)
		perlinZRange = 0
		bloomBurst()
	elseif curStep == 2688 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*30, 'cubeIn')
	elseif curStep == 2800 then
		tweenShaderProperty('barrel', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2806 then
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*8, 'cubeInOut')
		tweenShaderProperty('barrelGame', 'angle', 360, crochet*0.001*4, 'cubeInOut')
	elseif curStep == 2816 then
		bloomBurst()
		perlinZRange = 10 
	elseif curStep == 2856 or curStep == 2936 or curStep == 3032 or curStep == 3088 
	or curStep == 3168 or curStep == 3232 or curStep == 3280 or curStep == 3368 then
		tweenShaderProperty('barrelGame', 'zoom', 0.8, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 2862 or curStep == 2940 or curStep == 3120 or curStep == 3184 
	or curStep == 3248 or curStep == 3312 or curStep == 3374 then
		tweenShaderProperty('barrelGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 2868 or curStep == 2944 or curStep == 3136 or curStep == 3200
	 or curStep == 3264 or curStep == 3328 or curStep == 3368 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 3064 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeInOut')
	elseif curStep == 3048 then
		tweenShaderProperty('barrel', 'barrel', 1, crochet*0.001*6, 'cubeIn')
	elseif curStep == 3056 then
		tweenShaderProperty('sobel', 'strength', 0.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 3072 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrel', 'barrel',0, crochet*0.001*2, 'cubeOut')
		bloomBurst()
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*8, 'cubeOut')
	elseif curStep == 3584 then
		perlinZRange = 10 
	end
	if curStep == 3516 then
		tweenShaderProperty('barrelGame', 'zoom', 0.4, crochet*0.001*12, 'cubeInOut')
	elseif curStep == 3636 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*12, 'cubeInOut')
	end
	if curStep == 5360 then
		playCharacterAnimation('dadCharacter1', 'trans', true)
		set("defaultCamZoom", 0.9)
	elseif curStep == 5632 then
		setShaderProperty('barrel', 'barrel', 8)
	    tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*2, 'cubeOut')
		setShaderProperty('rain', 'opacity', 0)

		tweenShaderProperty('barrel', 'zoom', 10.0, crochet*0.001*68, 'cubeIn')
		tweenShaderProperty('barrel', 'angle', 90.0, crochet*0.001*68, 'cubeIn')
        tweenShaderProperty('pixel', 'strength', 50.0, crochet*0.001*72, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*66, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*66, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*66, 'cubeIn')
	end
	
    
	if curStep >= 3072 and curStep < 3584 then
		if curStep % 32 == 0 or curStep % 32 == 20 then
			setShaderProperty('barrel', 'zoom', 0.8)
		    tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		end
		if curStep % 32 == 8 then
			setShaderProperty('barrelGame', 'angle', 25)
		    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		end
		if curStep % 32 == 24 then
			setShaderProperty('barrelGame', 'angle', -25)
		    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		end
	end
	if curStep >= 2560 and curStep < 2816 then
		if curStep % 40 == 0 then
			tweenShaderProperty("barrel", "angle", 5, stepCrochet*0.001*10, "cubeOut")
		end
		if curStep % 40 == 10 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*10, "cubeIn")
		end
		if curStep % 40 == 20 then
			tweenShaderProperty("barrel", "angle", -5, stepCrochet*0.001*10, "cubeOut")
		end
		if curStep % 40 == 30 then
			tweenShaderProperty("barrel", "angle", 0, stepCrochet*0.001*10, "cubeIn")
		end
	end

	if curStep >= 5376 and curStep < 5632 then
		if curStep % 64 == 0 then
			set("defaultCamZoom", 0.55)
			setShaderProperty('barrel', 'barrel', 8)
		    tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
			setShaderProperty('EyeFishEffectGame', 'power', 0.2)
		elseif curStep % 64 == 48 then
			tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*4, 'cubeIn')
		end
		if curStep % 8 == 0 then
            tweenShaderProperty("barrelGame", "zoom", 2, stepCrochet*0.001*4, "cubeOut")
        end
        if curStep % 8 == 4 then
            tweenShaderProperty("barrelGame", "zoom", 1, stepCrochet*0.001*4, "cubeIn")
        end 
		if curStep % 64 == 16 then
            tweenShaderProperty("barrelGame", "angle", 20, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", 2, stepCrochet*0.001*4, "cubeOut")
		elseif curStep % 64 == 20 or curStep % 64 == 28 then
			tweenShaderProperty("barrelGame", "angle", 0, stepCrochet*0.001*4, "cubeIn")
		elseif curStep % 64 == 24 then
			tweenShaderProperty("barrelGame", "angle", -20, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", 0, stepCrochet*0.001*4, "cubeOut")
        end

		if curStep % 64 == 48 then
            tweenShaderProperty("barrelGame", "angle", -20, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", -2, stepCrochet*0.001*4, "cubeOut")
		elseif curStep % 64 == 52 or curStep % 64 == 60 then
			tweenShaderProperty("barrelGame", "angle", 0, stepCrochet*0.001*4, "cubeIn")
		elseif curStep % 64 == 56 then
			tweenShaderProperty("barrelGame", "angle", 20, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", 0, stepCrochet*0.001*4, "cubeOut")
        end
	end
	
	
	screenshake(1792)
	screenshake(1856)
	screenshake(1920)
	screenshake(1984)
	screenshake(2040)
	screenshake(2112)
	screenshake(2176)
	screenshake(2240)

	screenshake(4864)
	screenshake(4928)
	screenshake(4992)
	screenshake(5056)
	screenshake(5120)
	screenshake(5184)
	screenshake(5248)
	screenshake(5312)

	cosaqrepitexd(656,928,1200)
	cosaqrepitexd(3728,4000,4272)

end

function cosaqrepitexd(s,d,matt)
	if curStep == s then
		tweenShaderProperty('barrelGame', 'x', 1.5, crochet*0.001*4, 'cubeInOut')
	elseif curStep == s+16 or curStep == s+80 then--672 es 16
		tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*4, 'cubeInOut')
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
	elseif curStep == s+48 or curStep == s+112 then--768 es 112
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeInOut')
	elseif curStep == s+64 then--720
		tweenShaderProperty('barrelGame', 'x', -1.5, crochet*0.001*4, 'cubeInOut')
	end
	if curStep == s+144 or curStep == s+192 then--144 es 800
		tweenShaderProperty('barrelGame', 'x', 1, crochet*0.001*2, 'cubeInOut')
		if not middlescroll then
            for i = 0,8 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+640,0.5,"cubeOut")
            end
            for i = 9,18 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-640,0.5,"cubeOut")
            end
        end
	elseif curStep == s+160 or curStep == s+208 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
		if not middlescroll then
            for i = 0,8 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"cubeOut")
            end
            for i = 9,18 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"cubeOut")
            end
        end
    end

	--otra parte
	if curStep == d or curStep == d+64 then
		tweenShaderProperty('barrelGame', 'zoom', 0.65, crochet*0.001*4, 'cubeOut')
	elseif curStep == d+16 or curStep == d+80 then
		triggerEvent('Screen Shake','1.1,0.03','')
	elseif curStep == d+32 or curStep == d+96 then --32 es960 96 es 1024
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	end
	if curStep == d+96 then
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrel', 'y', 2, crochet*0.001*4, 'cubeInOut')
		perlinSpeed = 0.75 
	elseif curStep == d+128 then
		tweenShaderProperty('barrelGame', 'x', 1.5, crochet*0.001*4, 'cubeInOut')
	elseif curStep == d+144 or curStep == d+208 then--1072 es 144
		triggerEvent('set camera zoom','0.9','1')
	elseif curStep == d+160 then--1088 es 160
		tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*2, 'cubeInOut')
		triggerEvent('set camera zoom','0.5','1')
	elseif curStep == d+192 then
		tweenShaderProperty('barrelGame', 'x', 2.5, crochet*0.001*4, 'cubeInOut')
	elseif curStep == d+208+16 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
		triggerEvent('set camera zoom','0.5','1')
	end
	--matt
	if curStep == matt then
		setShaderProperty('barrelGame', 'angle', 360)
		tweenFadeIn("dadCharacter1", 1,1)
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeInOut')
	elseif curStep == matt+8 then
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*8, 'cubeOut')
	elseif curStep == matt+103 or curStep == matt+135 then
		tweenShaderProperty('barrel', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrel', 'zoom', 1.2, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == matt+107 or curStep == matt+139 then
		tweenShaderProperty('barrel', 'angle', -20, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrel', 'zoom', 1.4, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == matt+110 or curStep == matt+142 then
		tweenShaderProperty('barrel', 'angle', 20, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrel', 'zoom', 1.7, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == matt+112 or curStep == matt+144 then
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
	end
	if curStep == matt+144 then
		tweenShaderProperty('barrelGame', 'x', 1.5, crochet*0.001*4, 'cubeInOut')
	elseif curStep == matt+176 then
		tweenShaderProperty('barrelGame', 'x', 2.5, crochet*0.001*4, 'cubeInOut')
	elseif curStep == matt+208 or curStep == matt+240 then
		tweenShaderProperty('barrelGame', 'x', 2.8, crochet*0.001*1, 'cubeOut')
		triggerEvent('Screen Shake','0.3,0.03','')
	elseif curStep == matt+214 or curStep == matt+246 then
		tweenShaderProperty('barrelGame', 'x', 2.2, crochet*0.001*1, 'cubeOut')
		triggerEvent('Screen Shake','0.3,0.03','')
	elseif curStep == matt+220 or curStep == matt+252 then
		tweenShaderProperty('barrelGame', 'x', 3, crochet*0.001*1, 'cubeOut')
	elseif curStep == matt+224 or curStep == matt+256 then
		tweenShaderProperty('barrelGame', 'x', 3.3, crochet*0.001*1, 'cubeOut')
		triggerEvent('Screen Shake','0.3,0.03','')
	elseif curStep == matt+230 or curStep == matt+262 then
		tweenShaderProperty('barrelGame', 'x', 2.7, crochet*0.001*1, 'cubeOut')
		triggerEvent('Screen Shake','0.3,0.03','')
	elseif curStep == matt+236 or curStep == matt+268 then
		tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*1, 'cubeOut')
	elseif curStep == matt+272 then
		setShaderProperty('barrelGame', 'angle', -360)
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeInOut')
		bloomBurst()
	elseif curStep == matt+296 or curStep == matt+328 then
		tweenShaderProperty('barrel', 'angle', 20, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == matt+300 or curStep == matt+332 then
		tweenShaderProperty('barrel', 'angle', -20, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == matt+304 or curStep == matt+336 then
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'angle', 0)
		tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*4, 'cubeInOut')
		bloomBurst()
	end
	if curStep == matt+336 or curStep == matt+368 then
		tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*4, 'cubeOut')
		triggerEvent('Screen Shake','1.1,0.04','')
	elseif curStep == matt+400 then
		setShaderProperty('barrelGame', 'angle', 0)
		tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*4, 'cubeInOut')
		bloomBurst()
	elseif curStep == matt+416 or curStep == matt+448 then
	    tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*4, 'cubeOut')
		triggerEvent('Screen Shake','1.1,0.04','')
		tweenShaderProperty('sobel', 'strength', 1, crochet*0.001*6, 'cubeIn')
	elseif curStep == matt+432 or curStep == matt+464 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'angle', 0)
		tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*4, 'cubeInOut')
	end
	if curStep == matt+464 then
		triggerEvent('Screen Shake','0.9,0.04','')
	elseif curStep == matt+476 then
		tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == matt+480 or curStep == matt+512 then
		setShaderProperty('barrel', 'zoom', 0.9)
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
	elseif curStep ==matt+496 then
		triggerEvent('Screen Shake','0.9,0.04','')
		bloomBurst()
	elseif curStep == matt+508 then
		tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == matt+528 then
		tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'angle', 0)
		tweenShaderProperty('barrelGame', 'angle', -360, crochet*0.001*4, 'cubeInOut')
	elseif curStep == matt+584 then
		setShaderProperty('sobel', 'strength', 1)
		tweenShaderProperty('sobel', 'strength', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'angle', -360)
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeInOut')
	elseif curStep == matt+544 or curStep == matt+576 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeIn')
	elseif curStep == matt+552 then
		tweenShaderProperty('barrel', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == matt+556 then
		tweenShaderProperty('barrel', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == matt+560 then
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*4, 'cubeOut')
	end
end

function screenshake(d)
	if curStep == d or curStep == d+8 or curStep == d+18 or curStep == d+24 then
		triggerEvent('Screen Shake','0.4,0.04','')
		tweenShaderProperty('barrel', 'barrel', 0.15, crochet*0.001*4, 'cubeOut')
	elseif curStep == d+48 then
		triggerEvent('Screen Shake','1.1,0.04','')
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*4, 'cubeIn')
	end
end
	