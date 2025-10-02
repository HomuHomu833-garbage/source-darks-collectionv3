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


function playerTwoSing(data,time,type)
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.010)
    else
        setHealth(0.001)
    end
end

function update(elapsed)
	a = a + (elapsed*1.25) 
    if curStep >= 2176 and curStep <= 2688 or curStep >= 3504 and curStep <= 3632 then
        for i = 0,25 do
            if not middlescroll then
                if (i >= 0 and i <= 25) then
                    setActorY(defaultStrum0Y+14*math.cos((a+i*0.45)*math.pi),i)
                end
            end
        end
    elseif curStep >= 2688 or curStep >= 3632 then
        for i = 0,25 do
            setActorY(defaultStrum0Y,i)
        end
    end

    time = time + elapsed
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    setCustomShaderFloat('DistortionEffect', 'iTime', time)
	setCustomShaderFloat('smoke', 'iTime', time)
	setCustomShaderFloat('glitchChromatic', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('perlin', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    
end


function createPost()

	makeSprite('topBar', 'topBar', 0, -400,3)
    setObjectCamera('topBar', 'hud')
	setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1150, 3)
    setObjectCamera('bottomBar', 'hud')
	setActorLayer('bottomBar', layershit)
    setActorAlpha(1, "bottomBar")

	initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
    setShaderProperty('blur', 'strength', 0)

	initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setCameraShader('hud', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH', 0)

	initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

	initShader("DistortionEffect","DistortionEffect")
	setCameraShader('hud', 'DistortionEffect')
    setCameraShader('game', 'DistortionEffect')
	setShaderProperty("DistortionEffect","size", 0.05)

	initShader("grayscale","GreyscaleEffect")
    setCameraShader('game', 'grayscale')
    setCameraShader('hud', 'grayscale')
    setShaderProperty("grayscale","strength", 1)

	initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('hud', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0.05)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)

	initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
	setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 0)

	initShader('betterblurGame', 'BetterBlurEffect')
    setCameraShader('game', 'betterblurGame')
    setShaderProperty('betterblurGame', 'strength', 5)
    setShaderProperty('betterblurGame', 'loops', 5)
    setShaderProperty('betterblurGame', 'quality', 7)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 5)
    setShaderProperty('vignette', 'size', 0.6)

	initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 0.5)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

	initShader('barrelGame', 'BarrelBlurEffect')
    setCameraShader('game', 'barrelGame')
    setShaderProperty('barrelGame', 'barrel', 0.0)
    setShaderProperty('barrelGame', 'zoom', 0.8)
    setShaderProperty('barrelGame', 'angle', 0)
    setShaderProperty('barrelGame', 'x', 0)
    setShaderProperty('barrelGame', 'y', 0)
    setShaderProperty('barrelGame', 'doChroma', true)

	initShader('perlin', 'MirrorRepeatEffect')
	setCameraShader('game', 'perlin')
    setCameraShader('hud', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
    setShaderProperty('perlin', 'angle', 0)
    setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)

	initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

	initShader('pincushGame', 'PincushNewEffect')
	setCameraShader('game', 'pincushGame')
    setShaderProperty('pincushGame', 'zoom', 1)
	setShaderProperty('pincushGame', 'barrel', -2.5)
    setShaderProperty('pincushGame', 'doChroma', true)

    initShader('pincushHud', 'PincushNewEffect')
	setCameraShader('hud', 'pincushHud')
    setShaderProperty('pincushHud', 'zoom', 1)
	setShaderProperty('pincushHud', 'barrel', -2.5)
    setShaderProperty('pincushHud', 'doChroma', true)

	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

	initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.04)
    setShaderProperty('smoke', 'smokeStrength', 0)

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

	tweenFadeIn("dadCharacter0", 0,0.00001)
    tweenFadeIn("dadCharacter1", 0,0.00001)
    tweenFadeIn("dadCharacter2", 0,0.00001)
    tweenFadeIn("dadCharacter3", 0,0.00001)

	tweenFadeIn("bfCharacter0", 0,0.00001)
    tweenFadeIn("bfCharacter1", 0,0.00001)
    tweenFadeIn("bfCharacter2", 0,0.00001)
    tweenFadeIn("bfCharacter3", 0,0.00001)
	tweenFadeIn("girlfriend", 0,0.00001)

	for i = 4,5 do
		setActorProperty(i,"alpha",0)
	end
	for i = 7,8 do
		setActorProperty(i,"alpha",0)
	end
	for i = 17,18 do
		setActorProperty(i,"alpha",0)
	end
	for i = 20,21 do
		setActorProperty(i,"alpha",0)
	end
	for i = 0,25 do
		if not middlescroll then
			if (i >= 0 and i <= 3) then
				setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+150)
			elseif (i >= 9 and i <= 12)then
				setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10)
			elseif (i >= 13 and i <= 16)then
			    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20)
			elseif (i >= 22 and i <= 25) then
				setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-180)
			elseif (i >= 6 and i <= 6)then
				setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+70)
			elseif (i >= 19 and i <= 19)then
				setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-100)
			end
		end
	end

	fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
    swayingsmall = false
	

end

function bloomnose(valor,contrast,steps)
	setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', contrast, crochet*0.001*steps, 'cubeOut')
end

function angleRarilloRarete(lol,quelocura,lollol)
	beatSwap = beatSwap * -1
	setShaderProperty('barrelGame', 'angle',quelocura*beatSwap)
    tweenShaderProperty('barrelGame', 'angle', lollol, stepCrochet*0.001*lol, 'cubeOut')
end

function xrarilloRarete(pene,teta,culo)
	setShaderProperty('barrelGame', 'x',teta*beatSwap)
    tweenShaderProperty('barrelGame', 'x', culo, stepCrochet*0.001*pene, 'cubeOut')
end

function songStart()

    tweenShaderProperty('color', 'red', 1.1, crochet*0.001*12, 'cubeIn')
    tweenShaderProperty('color', 'green',1.1, crochet*0.001*12, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.1, crochet*0.001*12, 'cubeIn')
    tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('betterblurGame', 'strength', 0, crochet*0.001*56, 'cubeIn')
	tweenShaderProperty('DistortionEffect', 'size', 0, crochet*0.001*32, 'cubeIn')

end

function primerDropRarilloRarete(step)
	if curStep == step then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
	elseif curStep == step+8 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == step+16 then
		tweenShaderProperty('barrelGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == step+24 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4.5, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y', -2)
		tweenShaderProperty('barrelGame', 'y', 0, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == step+28 then
		setShaderProperty('barrelGame', 'y', -2)
		tweenShaderProperty('barrelGame', 'y', 0, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == step+32 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == step+40 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4.5, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == step+44 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == step+48 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4.5, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == step+52 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, stepCrochet*0.001*4, 'cubeOut')
	end

end

function anglespqnofuncionabien(que)
	if curStep == que then
		angleRarilloRarete(8,15,0)
		xrarilloRarete(8,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		triggerEvent('Add Camera Zoom','0.05','0.05')
	elseif curStep == que+8 then
		angleRarilloRarete(8,15,0)
		xrarilloRarete(8,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		triggerEvent('Add Camera Zoom','0.05','0.05')
	elseif curStep == que+16 then
		angleRarilloRarete(8,15,0)
		xrarilloRarete(8,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		triggerEvent('Add Camera Zoom','0.05','0.05')
	elseif curStep == que+24 then
		angleRarilloRarete(4,15,0)
		xrarilloRarete(4,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		triggerEvent('Add Camera Zoom','0.05','0.05')
	elseif curStep == que+28 then
		angleRarilloRarete(4,15,0)
		xrarilloRarete(4,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		triggerEvent('Add Camera Zoom','0.05','0.05')
	end

end

function stepHit()
	if (curStep >= 496 and curStep < 512) then
        if curStep % 4 == 0 then
			setShaderProperty('barrel', 'zoom',0.75)
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        end
    end
	if curStep == 320 then
		tweenFadeIn("bfCharacter1", 1,1)
	elseif curStep == 512 then
		tweenFadeIn("dadCharacter3", 1,1)
	end
	if curStep == 80 then
		tweenShaderProperty('barrel', 'barrel', -8, crochet*0.001*12, 'cubeIn')
	elseif curStep == 128 then
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		tweenFadeIn("dadCharacter0", 1,1)
	elseif curStep == 192 then
		tweenFadeIn("bfCharacter0", 1,1)
		tweenFadeIn("girlfriend", 1,1)
	elseif curStep == 256 or curStep == 320 or curStep == 512 then
		bloomnose(3.5,1,4)
		tweenShaderProperty('barrelGame', 'zoom', 0.4, stepCrochet*0.001*8, 'cubeOut')
		tweenFadeIn("dadCharacter1", 1,1)
	elseif curStep == 384 then
		bloomnose(3.5,1,4)
		tweenShaderProperty("smoke", "smokeStrength", 3.5, crochet*0.001*16, "cubeIn")
		tweenShaderProperty('barrelGame', 'zoom', 0.8,crochet *0.001*16, 'cubeIn')
		tweenFadeIn("dadCharacter2", 1,1)
	elseif curStep == 448 then
		tweenFadeIn("bfCharacter2", 1,1)
	elseif curStep == 576 then
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*16, 'cubeIn')
		tweenShaderProperty('barrelGame', 'zoom', 0.8,crochet *0.001*16, 'cubeIn')
		tweenFadeIn("bfCharacter3", 1,1)
	elseif curStep == 608 then
		tweenShaderProperty('barrelGame', 'zoom', 10, crochet*0.001*8, 'cubeIn')
		tweenShaderProperty('pincushGame', 'barrel', -4.5, crochet*0.001*8, 'cubeOut')
	elseif curStep == 640 then
		tweenShaderProperty("smoke", "smokeStrength", 5.5, crochet*0.001*4, "cubeIn")
		tweenShaderProperty('barrelGame', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('pincushHud', 'barrel', -6, stepCrochet*0.001*8, 'cubeOut')
		setShaderProperty('barrelGame', 'angle',360)
		tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		flashCamera('hud', '#FFFFFF', 1)
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-150, crochet*0.001*8, 'expoOut')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+150, crochet*0.001*8, 'expoOut')
		tweenFadeIn("dadCharacter0", 0,2)
        tweenFadeIn("dadCharacter1", 0,2)
        tweenFadeIn("dadCharacter2", 0,2)
        tweenFadeIn("dadCharacter3", 0,2)

	    tweenFadeIn("bfCharacter0", 0,2)
        tweenFadeIn("bfCharacter1", 0,2)
        tweenFadeIn("bfCharacter2", 0,2)
        tweenFadeIn("bfCharacter3", 0,2)
	    tweenFadeIn("girlfriend", 0,2)
		for i = 0,25 do
			tweenActorProperty(i,"alpha",0,2,"cubeOut")
		end
	elseif curStep == 752 then
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-150, crochet*0.001*4, 'cubeIn')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+150, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('pincushHud', 'barrel', -1, stepCrochet*0.001*16, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*16, 'cubeOut')
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 3) then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+110)
				elseif (i >= 9 and i <= 12)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-70)
				--bfs
				elseif (i >= 13 and i <= 16)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+80)
				elseif (i >= 22 and i <= 25) then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-100)
                --medio
				elseif (i >= 6 and i <= 6)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20)
				elseif (i >= 19 and i <= 19)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10)

				elseif (i >= 4 and i <= 5)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+210)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20)
				elseif (i >= 7 and i <= 8)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+210)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20)

				elseif (i >= 17 and i <= 18)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+210)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10)
				elseif (i >= 20 and i <= 21)then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+210)
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10)
				end
			end
		end
	elseif curStep == 784 then
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 3) or (i >= 9 and i <= 12) or (i >= 13 and i <= 16) or (i >= 22 and i <= 25) or (i >= 6 and i <= 6) or (i >= 19 and i <= 19) then
					tweenActorProperty(i,"alpha",1,2,"cubeOut")
				end
			end
		end
	elseif curStep == 800 then
	    tweenFadeIn("bfCharacter0", 1,2)
        tweenFadeIn("bfCharacter1", 1,2)
        tweenFadeIn("bfCharacter2", 1,2)
        tweenFadeIn("bfCharacter3", 1,2)
	    tweenFadeIn("girlfriend", 1,2)
		for i = 0,25 do
			if not middlescroll then
				if (i >= 4 and i <= 5) or (i >= 7 and i <= 8) or (i >= 17 and i <= 18) or (i >= 20 and i <= 21)then
					tweenActorProperty(i,"alpha",1,2,"cubeOut")
					tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250,1,"cubeOut")
				elseif (i >= 0 and i <= 3) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"cubeOut")
				elseif (i >= 9 and i <= 12) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"cubeOut")
					--bfs
				elseif (i >= 13 and i <= 16) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeOut")
				elseif (i >= 22 and i <= 25) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeOut")
				end
			end
		end
	elseif curStep == 816 then
		tweenShaderProperty("smoke", "smokeStrength", 0, crochet*0.001*16, "cubeIn")
		tweenPosOut("topBar",0,-450,3.5)
        tweenPosOut("bottomBar",0,-1100,3.5)
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('vignette', 'size', 0.2, crochet*0.001*16, 'cubeIn')
		setShaderProperty('barrel', 'barrel',-4)
        tweenShaderProperty('barrel', 'barrel', 0, stepCrochet*0.001*8, 'cubeOut')
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 25) then
					tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,2.5,"cubeOut")
				end
			end
		end
	end




	if (curStep >= 864 and curStep < 1088) then
        if curStep % 32 == 0 then
			setShaderProperty('barrelGame', 'y',-2)
			tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
			tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'quartOut')
			setShaderProperty('pincushGame', 'barrel',-6.5)
			tweenShaderProperty('pincushGame', 'barrel', -2.5, crochet*0.001*4, 'cubeOut')
		end
	end
	if (curStep >= 848 and curStep < 1072) then
        if curStep % 16 == 0 then
			tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*8, 'quartOut')
			beatSwap = beatSwap * -1
	        setShaderProperty('barrelGame', 'angle',25*beatSwap)
            tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
		end
	end
	

    if curStep == 832 then
		triggerEvent('screen shake', (crochet*0.001*64)..',0.0055', (crochet*0.001*64)..',0.0055')
		flashCamera('hud', '#FFFFFF', 1)
		setShaderProperty('barrel', 'barrel',2)
		setShaderProperty('grayscale', 'strength',0.5)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 1072 then
		tweenShaderProperty('DistortionEffect', 'size', 0.1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('glitchPeak', 'AMT', 0.5, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.5, crochet*0.001*4, 'cubeIn')
	elseif curStep == 1080 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*16, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', -90, stepCrochet*0.001*16, 'quartOut')
	elseif curStep == 1088 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('DistortionEffect', 'size', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'AMT', 0.1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.1, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-8)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
		setShaderProperty('grayscale', 'strength',0)
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
		perlinYRange = 0.2
		perlinSpeed = 1.5
	elseif curStep == 1112 or curStep == 1176 or curStep == 1240 or curStep == 1304 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*8, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1118 or curStep == 1182 or curStep == 1246 or curStep == 1310 then
		tweenShaderProperty('pincushGame', 'barrel', -2.5, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeIn')
	elseif curStep == 1136 or curStep == 1200 or curStep == 1264 or curStep == 1320 then
		tweenShaderProperty('glitchChromatic', 'GLITCH', 0.4, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1152 or curStep == 1216 or curStep == 1280 then
		setShaderProperty('barrel', 'barrel',2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchChromatic', 'GLITCH', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 1340 then
		setShaderProperty('barrel', 'barrel',2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchChromatic', 'GLITCH', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('vignette', 'size', 0.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1344 then
		setShaderProperty('barrel', 'angle',20)
		tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-100, crochet*0.001*4, 'cubeOut')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+100, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1360 then
		setShaderProperty('barrel', 'angle',-20)
		tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1368 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*16, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', -90, stepCrochet*0.001*16, 'quartOut')
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-50, crochet*0.001*2, 'linear')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+50, crochet*0.001*2, 'linear')
		tweenShaderProperty('pincushHud', 'barrel', -2.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1376 then
		setShaderProperty('barrel', 'barrel',2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		flashCamera('hud', '#FFFFFF', 2)
		tweenShaderProperty('vignette', 'size', 0.15, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'angle',360)
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('barrelGame', 'angle', 20, stepCrochet*0.001*6, 'cubeIn')
		tweenShaderProperty('pincushHud', 'barrel', -1, crochet*0.001*4, 'cubeOut')
		tweenPosOut("topBar",0,-400,0.5)
        tweenPosOut("bottomBar",0,-1150,0.5)
	elseif curStep == 1380 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeIn')
	end

	if (curStep >= 1376 and curStep < 1504) then
        if curStep % 16 == 0 then
			setShaderProperty('barrel', 'zoom',0.75)
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        end
    end



	if curStep == 1408 or curStep == 1416 or curStep == 1472 or curStep == 1480 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
		bloomnose(2.5,1,4)
	elseif curStep == 1424 or curStep == 1488 then
		setShaderProperty('barrel', 'angle',360)
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 1432 or curStep == 1496 then
		tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', 20, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1436 or curStep == 1500 then
		tweenShaderProperty('barrelGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('barrelGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1440 or curStep == 1504 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, crochet*0.001*2, 'cubeOut')
		setShaderProperty('barrel', 'barrel',3)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	end
    
	if curStep == 1504 then
		tweenShaderProperty("smoke", "smokeStrength", 2, crochet*0.001*4, "cubeIn")
	end

	if curStep == 1536 or curStep == 1600 then
		tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 1520 or curStep == 1584 then
		setShaderProperty('barrelGame', 'x',-2)
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 1552 or curStep == 1616 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 1564 or curStep == 1628 then
		tweenShaderProperty('barrelGame', 'zoom', 20, stepCrochet*0.001*6, 'cubeOut')
	elseif curStep == 1568 then
		bloomnose(2.5,1,4)
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 1632 then
		setShaderProperty('barrelGame', 'zoom',4)
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*8, 'cubeInOut')
		bloomnose(2.5,1,4)
		flashCamera('hud', '#FFFFFF', 1)
	elseif curStep == 1655 then
		setShaderProperty('barrel', 'y',-4)
        tweenShaderProperty('barrel', 'y', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 1664 or curStep == 1680 or curStep == 1728 or curStep == 1744 then
		tweenShaderProperty('barrel', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1672 or curStep == 1736 then
		tweenShaderProperty('barrel', 'zoom', 3, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1688 or curStep == 1752 then
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1696 or curStep == 1760 then
		setShaderProperty('barrelGame', 'y',-4)
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 1719 then
		setShaderProperty('barrelGame', 'y',-4)
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	end
	if curStep == 1760 then
		bloomnose(2.5,1,4)
		tweenShaderProperty('grayscale', 'strength', 1, crochet*0.001*8, 'cubeOut')
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.7, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 1776 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 1792 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 1808 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1816 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1820 then
		tweenShaderProperty('barrelGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
	    tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1824 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    setShaderProperty('barrel', 'barrel',4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	elseif curStep == 1856 then
		tweenShaderProperty('grayscale', 'strength', 0, crochet*0.001*2, 'cubeOut')
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	end


	if curStep == 1872 then
		tweenShaderProperty('DistortionEffect', 'size', 0.1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('glitchPeak', 'AMT', 0.5, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.5, crochet*0.001*4, 'cubeIn')
	end
	if curStep == 1880 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*16, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', -90, stepCrochet*0.001*16, 'quartOut')
	elseif curStep == 1888 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('DistortionEffect', 'size', 0.01, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'AMT', 0.15, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.15, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-8)
        tweenShaderProperty('barrel', 'barrel', 0.5, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
		setShaderProperty('grayscale', 'strength',0)
		flashCamera('hud', '#FFFFFF', 3)
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
		setActorY(-1000000,"ratingsGroup")
		perlinYRange = 0.2
		perlinXRange = 0.3
		perlinSpeed = 2
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 12) then
					tweenActorProperty(i,"alpha",0,1,"cubeOut")
				elseif (i >= 13 and i <= 25) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,1,"cubeOut")
				end
			end
		end
	end
	if curStep == 2128 then
		tweenShaderProperty('bloom', 'contrast',20, crochet*0.001*4, 'cubeIn')
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-150, crochet*0.001*2, 'expoOut')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+150, crochet*0.001*2, 'expoOut')
	elseif curStep == 2136 then
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-85, crochet*0.001*2, 'linear')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+150, crochet*0.001*2, 'linear')
	elseif curStep == 2144 then
		tweenShaderProperty('bloom', 'contrast',1, crochet*0.001*2, 'cubeOut')
		setActorY(0,"ratingsGroup")
		perlinYRange = 0
		perlinXRange = 0
		perlinSpeed = 0
		for i = 0,25 do
			tweenActorProperty(i,"alpha",0,1,"cubeOut")
		end
	elseif curStep == 2160 then
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 25) then
					tweenActorProperty(i,"alpha",1,1,"cubeOut")
				end
			end
		end
	elseif curStep == 2156 then
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 12) then
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
				elseif (i >= 13 and i <= 25) then	
					setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-40)
					setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250)
				end
			end
		end
	elseif curStep == 2168 then
		for i = 0,25 do
			if not middlescroll then
				if (i >= 4 and i <= 4) or (i >= 8 and i <= 8) or (i >= 17 and i <= 17) or (i >= 21 and i <= 21)then
					tweenActorProperty(i,"alpha",0,1.5,"cubeOut")
					tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+70,1,"cubeOut")
				elseif (i >= 0 and i <= 3) then -- hyperx
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+60,1,"cubeOut")
				elseif (i >= 9 and i <= 12) then -- hyperx
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,1,"cubeOut")

				elseif (i >= 13 and i <= 16) then -- bfs
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+0,1,"cubeOut")
				elseif (i >= 22 and i <= 25) then -- bfs
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-80,1,"cubeOut")
				end
			end
		end

	elseif curStep == 2176 then
		flashCamera('hud', '#FFFFFF', 1.5)
		tweenPosOut("topBar",0,-400,0.5)
        tweenPosOut("bottomBar",0,-1150,0.5)
		tweenShaderProperty('DistortionEffect', 'size', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'AMT', 0.1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.1, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.85, crochet*0.001*4, 'cubeOut')
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 25) then
					tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,1,"expoOut")
				end
			end
		end
	end


	if curStep == 2192 or curStep == 2320 then
		tweenShaderProperty('barrelGame', 'x', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 2208 or curStep == 2336 then
		tweenShaderProperty('barrelGame', 'y', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 2224 or curStep == 2352 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 2240 or curStep == 2368 then
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'elasticInOut')
		triggerEvent('screen shake', (crochet*0.001*8)..',0.0055', (crochet*0.001*8)..',0.001')
	elseif curStep == 2256 or curStep == 2384 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 2272 or curStep == 2400 then
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
		triggerEvent('screen shake', (crochet*0.001*8)..',0.0075', (crochet*0.001*8)..',0.001')
	elseif curStep == 2304 or curStep == 2432 then
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'angle',-360)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	end
	if curStep == 2432 then
		flashCamera('hud', 'red', 1)
	end

	if curStep == 2560 then
		tweenShaderProperty('mirrorGame', 'x', 0.5, stepCrochet*0.001*6, 'expoOut')
		tweenShaderProperty('mirrorGame', 'zoom', 1.35, stepCrochet*0.001*4, 'cubeOut')
	elseif curStep == 2568 then
		tweenShaderProperty('mirrorGame', 'x', -0.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2576 then
		tweenShaderProperty('mirrorGame', 'x', -1.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2584 then
		tweenShaderProperty('mirrorGame', 'x', -2.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2592 then
		tweenShaderProperty('mirrorGame', 'x', -3.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2600 then
		tweenShaderProperty('mirrorGame', 'x', -4.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2608 then
		tweenShaderProperty('mirrorGame', 'x', -5.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2616 then
		tweenShaderProperty('mirrorGame', 'x', -6.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2624 then
		tweenShaderProperty('mirrorGame', 'x', -7.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2632 then
		tweenShaderProperty('mirrorGame', 'x', -8.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2640 then
		tweenShaderProperty('mirrorGame', 'x', -9.5, stepCrochet*0.001*6, 'expoOut')
	elseif curStep == 2648 then
		tweenShaderProperty('mirrorGame', 'x', -10.5, stepCrochet*0.001*6, 'expoOut')

	elseif curStep == 2656 then
		tweenShaderProperty('mirrorGame', 'x', 4, crochet*0.001*8, 'cubeInOut')
		tweenShaderProperty('mirrorGame', 'angle', 90, crochet*0.001*8, 'cubeIn')
	elseif curStep == 2688 then
		flashCamera('hud', 'red', 1.5)
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-2)
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
		setShaderProperty('mirrorGame', 'angle',360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	end

	if curStep == 2736 then
		tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*8, 'expoOut')
	elseif curStep == 2752 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'expoOut')
	elseif curStep == 2832 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*16, 'cubeOut')
		setShaderProperty('mirrorGame', 'angle',360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
		tweenShaderProperty('pincushGame', 'barrel', -4.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 2896 then
		beatSwap = beatSwap * -1
	    setShaderProperty('mirrorGame', 'angle',20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 2.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 2912 then
		beatSwap = beatSwap * -1
	    setShaderProperty('mirrorGame', 'angle',20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
	elseif curStep == 2928 then
		beatSwap = beatSwap * -1
	    setShaderProperty('mirrorGame', 'angle',20*beatSwap)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('mirrorGame', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 2944 then
		flashCamera('hud', 'white', 1.5)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 2956 then
		tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchChromatic', 'GLITCH', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('vignette', 'size', 0.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 2960 then
		setShaderProperty('barrel', 'angle',20)
		tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-100, crochet*0.001*4, 'cubeOut')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+100, crochet*0.001*4, 'cubeOut')
	elseif curStep == 2976 then
		setShaderProperty('barrel', 'angle',-20)
		tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*4, 'cubeOut')
	elseif curStep == 2984 then
		tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*16, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', -90, stepCrochet*0.001*16, 'quartOut')
		tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-50, crochet*0.001*2, 'linear')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+50, crochet*0.001*2, 'linear')
		tweenShaderProperty('pincushHud', 'barrel', -2.5, crochet*0.001*4, 'cubeOut')
	elseif curStep == 2992 then
		setShaderProperty('barrel', 'barrel',2)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		flashCamera('hud', '#FFFFFF', 2)
		tweenShaderProperty('vignette', 'size', 0.15, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'angle',360)
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('barrelGame', 'angle', 20, stepCrochet*0.001*6, 'cubeIn')
		tweenShaderProperty('pincushHud', 'barrel', -1, crochet*0.001*4, 'cubeOut')
		tweenPosOut("topBar",0,-400,0.5)
        tweenPosOut("bottomBar",0,-1150,0.5)
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
		tweenShaderProperty("smoke", "smokeStrength", 0, crochet*0.001*4, "cubeIn")
		perlinYRange = 0.2
		perlinSpeed = 1.5
	elseif curStep == 2996 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeIn')
	end

	if (curStep >= 2992 and curStep < 3120) then
        if curStep % 16 == 0 then
			setShaderProperty('barrel', 'zoom',0.75)
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        end
    end


	if curStep == 3024 or curStep == 3032 or curStep == 3088 or curStep == 3096 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
		bloomnose(2.5,1,4)
	elseif curStep == 3040 or curStep == 3104 then
		setShaderProperty('barrel', 'angle',360)
		tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 3048 or curStep == 3112 then
		tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('barrelGame', 'angle', 20, stepCrochet*0.001*6, 'quartOut')
		tweenShaderProperty('pincushGame', 'barrel', -4, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3052 or curStep == 3116 then
		tweenShaderProperty('barrelGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('barrelGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 3056 or curStep == 3120 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('pincushGame', 'barrel', -2.5, crochet*0.001*2, 'cubeOut')
		setShaderProperty('barrel', 'barrel',3)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	end
    
	if curStep == 3120 then
		tweenShaderProperty("smoke", "smokeStrength", 2, crochet*0.001*4, "cubeIn")
	end

	if curStep == 3152 or curStep == 3216 then
		tweenShaderProperty('barrelGame', 'zoom', 0.6, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 3136 or curStep == 3200 then
		setShaderProperty('barrelGame', 'x',-2)
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 3168 or curStep == 3232 then
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 3180 or curStep == 3244 then
		tweenShaderProperty('barrelGame', 'zoom', 20, stepCrochet*0.001*6, 'cubeOut')
	elseif curStep == 3184 then
		bloomnose(2.5,1,4)
		tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 3248 then
		setShaderProperty('barrelGame', 'zoom',4)
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*8, 'cubeInOut')
		bloomnose(2.5,1,4)
		flashCamera('hud', '#FFFFFF', 1)
	elseif curStep == 3270 then
		setShaderProperty('barrel', 'y',-4)
        tweenShaderProperty('barrel', 'y', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 3280 or curStep == 3296 or curStep == 3344 or curStep == 3360 then
		tweenShaderProperty('barrel', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3288 or curStep == 3352 then
		tweenShaderProperty('barrel', 'zoom', 3, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3304 or curStep == 3368 then
		tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3312 or curStep == 3376 then
		setShaderProperty('barrelGame', 'y',-4)
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	elseif curStep == 3334 then
		setShaderProperty('barrelGame', 'y',-4)
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
	end


	if curStep == 3376 then
		bloomnose(2.5,1,4)
		tweenShaderProperty('grayscale', 'strength', 1, crochet*0.001*8, 'cubeOut')
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.7, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 3394 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 3408 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	elseif curStep == 3424 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3432 then
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3436 then
		tweenShaderProperty('barrelGame', 'angle', -20, stepCrochet*0.001*4, 'cubeIn')
	    tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 3440 then
		tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
	    setShaderProperty('barrel', 'barrel',4)
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	elseif curStep == 3472 then
		tweenShaderProperty('grayscale', 'strength', 0, crochet*0.001*2, 'cubeOut')
		beatSwap = beatSwap * -1
	    setShaderProperty('barrelGame', 'angle',20*beatSwap)
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
		setShaderProperty('blur', 'strength', 9)
        tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
	end

	if curStep == 3520 then
		tweenShaderProperty('barrelGame', 'x', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 3504 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	elseif curStep == 3536 then
		tweenShaderProperty('barrelGame', 'y', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 3552 then
		tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 3568 then
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'elasticInOut')
		triggerEvent('screen shake', (crochet*0.001*8)..',0.0055', (crochet*0.001*8)..',0.001')
	elseif curStep == 3584 then
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*4, 'elasticInOut')
	elseif curStep == 3600 then
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*8, 'cubeIn')
		triggerEvent('screen shake', (crochet*0.001*8)..',0.0075', (crochet*0.001*8)..',0.001')
	elseif curStep == 3616 then
		setShaderProperty('barrelGame', 'angle',-360)
        tweenShaderProperty('barrelGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
	end
	if curStep == 3504 then
		flashCamera('hud', 'red', 1)
	end


-- segundo drop

    if curStep == 3632 then
		tweenShaderProperty('DistortionEffect', 'size', 0.01, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'AMT', 0.15, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('glitchPeak', 'SPEED', 0.15, stepCrochet*0.001*4, 'cubeOut')
		setShaderProperty('barrel', 'barrel',-8)
		tweenShaderProperty('barrel', 'barrel', 0.5, crochet*0.001*4, 'cubeOut')
		setShaderProperty('barrelGame', 'y',-4)
		tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*2, 'cubeInOut')
		flashCamera('hud', '#FFFFFF', 3)
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
		setActorY(-1000000,"ratingsGroup")
		perlinYRange = 0.2
		perlinXRange = 0.3
		perlinSpeed = 2
		for i = 0,25 do
			if not middlescroll then
				if (i >= 0 and i <= 12) then
					tweenActorProperty(i,"alpha",0,1,"cubeOut")
				elseif (i >= 13 and i <= 25) then
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,1,"cubeOut")
				end
			end
		end
	end


	if curStep == 3888 then
		perlinYRange = 0
		perlinXRange = 0
		perlinSpeed = 0
		flashCamera('hud', 'red', 1)
		triggerEvent('screen shake', (crochet*0.001*64)..',0.0125', (crochet*0.001*64)..',0.001')
	elseif curStep == 3952 then
		tweenShaderProperty('barrel', 'barrel', -1, crochet*0.001*16, 'cubeIn')
	elseif curStep == 4012 then
		tweenShaderProperty('barrelGame', 'zoom', 20, stepCrochet*0.001*8, 'cubeOut')
	elseif curStep == 4016 then
		setShaderProperty('barrel', 'barrel',-8)
		tweenShaderProperty('barrel', 'barrel', 0.5, crochet*0.001*4, 'cubeOut')
		flashCamera('hud', '#FFFFFF',1)
		setShaderProperty('barrelGame', 'zoom',0.5)
		tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*16, 'cubeIn')
		setShaderProperty('grayscale', 'strength',1)
		tweenShaderProperty('color', 'red', 0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*16, 'cubeIn')
		for i = 0,25 do
			tweenActorProperty(i,"alpha",0,1.5,"cubeOut")
		end
	end


	if (curStep >= 2432 and curStep < 2688) then
        if curStep % 16 == 0 then
			setShaderProperty('barrel', 'zoom',0.75)
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
		elseif curStep % 16 == 8 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
        end
    end


   if curStep == 2688 then
	for i = 0,25 do
		if not middlescroll then
			if (i >= 4 and i <= 4) or (i >= 8 and i <= 8) then
				tweenActorProperty(i,"alpha",1,1.5,"cubeOut")
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,1,"cubeOut")
			elseif (i >= 0 and i <= 3) then -- hyperx
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"cubeOut")
			elseif (i >= 9 and i <= 12) then -- hyperx
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"cubeOut")

			elseif (i >= 13 and i <= 16) then -- bfs
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeOut")
			elseif (i >= 22 and i <= 25) then -- bfs
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeOut")
			elseif (i >= 17 and i <= 21) or (i >= 17 and i <= 17) or (i >= 21 and i <= 21) then -- bfs
				tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"cubeOut")
				tweenActorProperty(i,"alpha",1,1.5,"cubeOut")
				tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,1,"cubeOut")
			end
		end
	end
 end






	
	if (curStep >= 1504 and curStep < 1616) or (curStep >= 1632 and curStep < 1760) or (curStep >= 3120 and curStep < 3232) or (curStep >= 3248 and curStep < 3376) then
        if curStep % 16 == 0 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
		elseif curStep % 16 == 8 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
        end
    end

	if (curStep >= 1624 and curStep < 1632) or (curStep >= 3240 and curStep < 3248) then
	   if curStep % 4 == 0 then
		angleRarilloRarete(4,15,0)
		xrarilloRarete(4,-0.1,0)
		setShaderProperty('blur', 'strength', 9)
		tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
	end
 end




	if (curStep >= 1088 and curStep < 1344) or (curStep >= 1888 and curStep < 2144) then
        if curStep % 32 == 0 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
			triggerEvent('Add Camera Zoom','0.05','0.05')
		elseif curStep % 32 == 8 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
			triggerEvent('Add Camera Zoom','0.05','0.05')
		elseif curStep % 32 == 16 then
			angleRarilloRarete(8,15,0)
			xrarilloRarete(8,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
			triggerEvent('Add Camera Zoom','0.05','0.1')
		elseif curStep % 32 == 24 then
			angleRarilloRarete(4,15,0)
			xrarilloRarete(4,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
			triggerEvent('Add Camera Zoom','0.05','0.05')
		elseif curStep % 32 == 28 then
			angleRarilloRarete(4,15,0)
			xrarilloRarete(4,-0.1,0)
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*6,"cubeOut")
			triggerEvent('Add Camera Zoom','0.05','0.05')
        end
    end
    primerDropRarilloRarete(1896)
	primerDropRarilloRarete(1960)
	primerDropRarilloRarete(2024)
	primerDropRarilloRarete(2088)
	primerDropRarilloRarete(3640)
	primerDropRarilloRarete(3768)
	primerDropRarilloRarete(3832)
	primerDropRarilloRarete(3704)


	anglespqnofuncionabien(3632)
	anglespqnofuncionabien(3664)
	anglespqnofuncionabien(3696)
	anglespqnofuncionabien(3728)
	anglespqnofuncionabien(3760)
	anglespqnofuncionabien(3792)
	anglespqnofuncionabien(3824)
	anglespqnofuncionabien(3856)


	if (curStep >= 3888 and curStep < 4016) then
		if curStep % 16 == 0 then
			tweenShaderProperty("barrelGame", "angle", 10, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", 0.05, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty('color', 'red', 1, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'green', 0.4, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'blue', 0.4, stepCrochet*0.001*4, 'cubeIn')
		elseif curStep % 16 == 4 then
			tweenShaderProperty("barrelGame", "angle", 0, stepCrochet*0.001*4, "cubeIn")
			tweenShaderProperty("barrelGame", "x", 0, stepCrochet*0.001*4, "cubeIn")
			tweenShaderProperty('color', 'red', 0.5, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'green', 1.5, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'blue', 0.5, stepCrochet*0.001*4, 'cubeIn')
		elseif curStep % 16 == 8 then
			tweenShaderProperty("barrelGame", "angle", -10, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty("barrelGame", "x", -0.05, stepCrochet*0.001*4, "cubeOut")
			tweenShaderProperty('color', 'red', 0.5, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'green', 1, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'blue', 2, stepCrochet*0.001*4, 'cubeIn')
		elseif curStep % 16 == 12 then
			tweenShaderProperty("barrelGame", "angle", 0, stepCrochet*0.001*4, "cubeIn")
			tweenShaderProperty("barrelGame", "x", 0, stepCrochet*0.001*4, "cubeIn")
			tweenShaderProperty('color', 'red', 1, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'green', 1, stepCrochet*0.001*4, 'cubeIn')
			tweenShaderProperty('color', 'blue', 1, stepCrochet*0.001*4, 'cubeIn')
		end
    end


    if curStep == 768 or curStep == 2944 then
	    tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeOut")
    end
     if curStep == 2688 then
	    tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*4, "cubeOut")
	end
end



function playerOneSing()
    if c == "caution" then -- nombre de la nota
        triggerEvent("ca burst","0.008","0.015")
    end
end
