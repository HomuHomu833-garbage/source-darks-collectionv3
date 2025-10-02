
function createPost()

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(1, 'chessnose')

	setActorLayer('chessnose',2)
    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0.1)
    setShaderProperty('chess', 'direction', -1.0)

	initShader('mirror', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

	initShader('mirror2', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', false)

	initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)
    setShaderProperty('bars', 'effect2', 0)
	setShaderProperty('bars', 'angle1', -0.3)
     
	initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
	setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.005)

	initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 0)

	initShader('Gaussian Blur', 'zoomblur')
    setCameraShader('game', 'Gaussian Blur')
    setCameraShader('hud', 'Gaussian Blur')
	setShaderProperty('Gaussian Blur', 'focusPower', 0)
	initShader('EyeFishEffect', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffect')
	setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0.2)
	
    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
	setCameraShader('hud', 'titleeffect')
    setShaderProperty('titleeffect', 'money',0.0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)



	initShader('bloom', 'BloomEffect')--
    setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
	setShaderProperty('bloom', 'brightness', 0)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
   
	setShaderProperty('vignette', 'size',0.3)
end
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
local time = 0
function update(elapsed)
	time = time + elapsed
	setShaderProperty('chess', 'iTime', time/2)
	perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
	local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
	setShaderProperty('ca', 'strength', strength)
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function stepHit()
	
	    if curStep == 736 then
			tweenShaderProperty("mirror","zoom",4,stepCrochet*0.001*12,"cubeOut")
			tweenShaderProperty("mirror","angle",15,stepCrochet*0.001*12,"cubeOut")
			tweenShaderProperty("mirror2","barrel",-2.5,stepCrochet*0.001*16,"cubeOut")
		elseif curStep == 748 then
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeIn")
		elseif curStep == 752 then
			bloom(2,1,crochet,2,"cubeOut")

			tweenShaderProperty("bloom","brightness",0.5,stepCrochet*0.001*16,"cubeIn")
			tweenShaderProperty("bars","effect",0.1,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("bars","angle1",0,stepCrochet*0.001*16,"cubeIn")
			tweenShaderProperty("mirror","angle",-20,stepCrochet*0.001*16,"expoIn")
			tweenShaderProperty("mirror2","y",-1,stepCrochet*0.001*16,"expoIn")
			tweenShaderProperty("mirror2","barrel",0,stepCrochet*0.001*16,"cubeIn")
			tweenShaderProperty("titleeffect","money",0.25,stepCrochet*0.001*16,"cubeIn")
		end

		if curStep == 768 then
			tweenShaderProperty("bars","effect",0,stepCrochet*0.001*8,"cubeOut")
			flashCamera("hud","",0.5)
			tweenShaderProperty("bloom","brightness",0,stepCrochet*0.001*8,"cubeOut")
		end
		if curStep == 768  then
			--setShaderProperty('mirror2', 'y', -1)
			--setShaderProperty('mirror', 'angle', -15)
			tweenShaderProperty("mirror","angle",20,stepCrochet*0.001*15.5,"cubeIn")
			tweenShaderProperty("mirror2","y",0,stepCrochet*0.001*16,"expoIn")
		elseif curStep == 776  then
			tweenShaderProperty("titleeffect","money",0,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("Gaussian Blur","focusPower",7,stepCrochet*0.001*8,"cubeIn")
		elseif curStep == 792 or curStep == 840 then
			tweenShaderProperty("titleeffect","money",0.25,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("Gaussian Blur","focusPower",7,stepCrochet*0.001*8,"cubeIn")
		elseif curStep == 832 then
			tweenShaderProperty("titleeffect","money",0,stepCrochet*0.001*8,"cubeOut")
		elseif curStep == 844 then
			tweenShaderProperty("titleeffect","money",0.25,stepCrochet*0.001*4,"cubeIn")
		elseif curStep == 848 then
			tweenShaderProperty("titleeffect","money",0,stepCrochet*0.001*4,"cubeOut")
        elseif curStep == 784 then
			bloom(2,1,crochet,2,"cubeOut")
			setShaderProperty('mirror2', 'zoom', 0.7)
			tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*15.5,"cubeOut")
			tweenShaderProperty("mirror2","y",-1,stepCrochet*0.001*16,"expoIn")
			tweenShaderProperty("Gaussian Blur","focusPower",0,stepCrochet*0.001*8,"cubeOut")
		elseif curStep == 800 then
			bloom(2,1,crochet,2,"cubeOut")
			setShaderProperty('mirror2', 'zoom', 0.7)
			tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("mirror","angle",20,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("mirror2","y",0,stepCrochet*0.001*16,"expoIn")
			tweenShaderProperty("Gaussian Blur","focusPower",0,stepCrochet*0.001*8,"cubeOut")
		elseif curStep == 808 then
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("titleeffect","money",0,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("Gaussian Blur","focusPower",7,stepCrochet*0.001*8,"cubeIn")
		elseif curStep == 816 then
			tweenShaderProperty("mirror","angle",20,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("Gaussian Blur","focusPower",0,stepCrochet*0.001*8,"cubeOut")
			bloom(2,1,crochet,2,"cubeOut")
			setShaderProperty('mirror2', 'zoom', 0.7)
			tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*8,"cubeOut")
		
			tweenShaderProperty("mirror","zoom",0.8,stepCrochet*0.001*16,"cubeIn")
		elseif curStep == 824 then
			tweenShaderProperty("titleeffect","money",0.25,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("Gaussian Blur","focusPower",7,stepCrochet*0.001*8,"cubeIn")
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*8,"cubeIn")
		end
		if curStep == 832 or curStep == 848 then
			setShaderProperty('mirror2', 'x', 0)
			tweenShaderProperty("mirror2","x",1,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("mirror","zoom",1.25,stepCrochet*0.001*4,"cubeOut")
			bloom(2,1,crochet,2,"cubeOut")
			setShaderProperty('Gaussian Blur', 'focusPower', 5)
			tweenShaderProperty("Gaussian Blur","focusPower",0,stepCrochet*0.001*8,"cubeOut")
		elseif curStep == 836 or curStep == 844 or curStep == 852 or curStep == 860 then
			tweenShaderProperty("mirror","zoom",0.8,stepCrochet*0.001*4,"cubeIn")
		elseif curStep == 840 or curStep == 856 then
			bloom(2,1,crochet,2,"cubeOut")
			tweenShaderProperty("mirror","zoom",1.25,stepCrochet*0.001*4,"cubeOut")
			setShaderProperty('mirror2', 'x', 1)
			tweenShaderProperty("mirror2","x",2,stepCrochet*0.001*8,"cubeOut")
			setShaderProperty('Gaussian Blur', 'focusPower', 5)
			tweenShaderProperty("Gaussian Blur","focusPower",0,stepCrochet*0.001*8,"cubeOut")
		elseif curStep == 864 then
			tweenShaderProperty("mirror2","barrel",-2.5,stepCrochet*0.001*32,"cubeIn")
			tweenShaderProperty("EyeFishEffect","power",1,stepCrochet*0.001*32,"cubeIn")
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*32,"cubeIn")
		elseif curStep == 880 then
			tweenShaderProperty("pixel","strength",10,stepCrochet*0.001*16,"cubeIn")
			tweenShaderProperty("bloom","brightness",0.7,stepCrochet*0.001*16,"cubeIn")
		elseif curStep == 896 then
			flashCamera("hud","",5)
			perlinCaRange = 0
			tweenShaderProperty("pixel","strength",0,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("mirror2","barrel",0,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("EyeFishEffect","power",0,stepCrochet*0.001*8,"cubeOut")
			tweenShaderProperty("bloom","brightness",0,stepCrochet*0.001*8,"cubeOut")
		end
		if curStep == 856 then
			perlinCaRange = 0.06
		end
		if curStep >= 864 and curStep < 896 then
			if curStep % 4 == 0 then
			bloom(2,1,crochet,1,"cubeOut")
			setShaderProperty('mirror2', 'zoom', 0.8)
			tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*4,"cubeOut")
			end
			if curStep >= 880 then
				if curStep % 2 == 0 then
					setShaderProperty('mirror2', 'zoom', 0.8)
					tweenShaderProperty("mirror2","zoom",1,stepCrochet*0.001*2,"cubeOut")
					bloom(2,1,crochet,0.5,"cubeOut")
				end
			end
		end
end

