function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
function createPost()
	lascosasdelhud(0,crochet,0.1,"cubeOut")
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920/getCamZoom(), 1080/getCamZoom(), '#000000')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))

	initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")

    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)
	
	
    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
	setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.005)


	
    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
	setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 50)

	initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle',0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

	initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

	initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)


	

	initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)

	initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.5)

	initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.1)

end
local time = 0
local matt = false
local bf = false
local zoom = 1
function update(elapsed)
	zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('mirror2', 'zoom', zoom)
    time = time + elapsed
    setCustomShaderFloat("glitchy","iTime",time)
	setCustomShaderFloat("titleeffect","uTime",time*2)
	setCustomShaderFloat("heat","iTime",time)
	if matt then
        set("camFollow.x", get("dad.x")+150)
        set("camFollow.y", get("dad.y")+250)
        set("defaultCamZoom", 0.9)
    end
	if bf then
        set("camFollow.x", get("boyfriend.x")+200)
        set("camFollow.y", get("boyfriend.y")+150)
        set("defaultCamZoom", 0.9)
    end
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
	bloom(0,1,crochet,16,"linear")
	tweenShaderProperty('pixel',"strength",0, crochet*0.001*6,"linear")
end
local lol = true
local black = true
function stepHit()
	if curStep == 88 then
		bloom(1,0,crochet,2,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		--mirror(false,true,"","zoom",0,0,2,crochet,"cubeOut")
		tweenShaderProperty('pixel',"strength",50, crochet*0.001*2,"cubeOut")
	elseif curStep == 96 then
		tweenShaderProperty('greyscale',"strength",0, crochet*0.001*2,"cubeOut")
		bloom(0,1,crochet,8,"cubeIn")
		mirror(true,true,"zoom","zoom",0,1,6,crochet,"cubeIn")
		tweenShaderProperty('pixel',"strength",0, crochet*0.001*7,"cubeIn")
	elseif curStep == 120 then
		mirror(false,true,"","zoom",0,3,1.5,crochet,"cubeOut")
	elseif curStep == 126 then
		mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
	elseif curStep == 128 then
		lascosasdelhud(1,crochet,2,"cubeOut")
		bloom(4,1,crochet,2,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
	end
	if curStep == 184 then
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
	elseif curStep == 188 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
	elseif curStep == 192 or curStep == 1440 then
		bloom(4,1,crochet,2,"cubeOut")
	end

	if curStep == 240 or curStep == 368 then
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
	elseif curStep == 252 or curStep == 380 then
		mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
	elseif curStep == 256 then
		matt = true
		bloom(4,1,crochet,2,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
	elseif curStep == 288 or curStep == 352 then
		matt = false
		bf = true
	elseif curStep == 320 then
		matt = true
		bf = false
	end
	if curStep == 368 then
		matt = false
		bf = false
		set("defaultCamZoom", 0.5)
	end
	if curStep == 384 then
		matt = true
		bf = false
		setProperty('', 'cameraSpeed', 7)
		
		setShaderProperty('titleeffect', 'money',0.92)
		bloom(4,1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",0)
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"x",-1, crochet*0.001*1,"cubeOut")
		tweenFadeIn("blackBG",1,crochet*0.001*3,"cubeIn") 
		setShaderProperty('glitchy', 'AMT', 0.05)
	elseif curStep == 504  then
		tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
		tweenShaderProperty('mirror2',"x",-1, crochet*0.001*2,"expoIn")
		mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
	elseif curStep == 512 then
		matt = true
			bf = false
			setProperty('', 'cameraSpeed', 7)
		setStageColorSwap("hue",0.9)--0.7
		lol = false
		bloom(4,1,crochet,2,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",0)
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('mirror2',"x",-1, crochet*0.001*1,"cubeOut")
	    tweenFadeIn("blackBG",1,crochet*0.001*3,"cubeIn") 
	elseif curStep == 576 then
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
	elseif curStep == 616 or curStep == 1512 then
		mirror(false,true,"","zoom",0,4,2,crochet,"cubeIn")
	elseif curStep == 624 or curStep == 1520 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
	elseif curStep == 632 or curStep == 1528 then
		lascosasdelhud(0,crochet,2,"cubeOut")
	elseif curStep == 1472 then
		bloom(4,1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
	end
	if curStep == 640 then
		matt = true
			bf = false
			setProperty('', 'cameraSpeed', 5)
		setShaderProperty('titleeffect', 'money',1.1)
		bloom(4,1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",-1)
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"x",0, crochet*0.001*1,"cubeOut")
		tweenFadeIn("blackBG",1,crochet*0.001*3,"cubeIn") 
	elseif curStep == 768 then
		matt = false
		bf = false
		set("defaultCamZoom", 0.6)
		setProperty('', 'cameraSpeed', 1)
		setShaderProperty('glitchy', 'AMT', 0)
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('pixel',"strength",5, crochet*0.001*1,"cubeOut")
		tweenShaderProperty('greyscale',"strength",1, crochet*0.001*1,"cubeOut")
		setShaderProperty('titleeffect', 'money',0.3)
		flashCamera("hud","black",crochet*0.001*16)
		tweenFadeIn("blackBG",0.8,crochet*0.001*1,"cubeOut") 
		setShaderProperty('titleeffect', 'money',0.67)
		setStageColorSwap("hue",0)
	elseif curStep == 896 then
		bloom(4,1,crochet,2,"cubeOut")
		tweenShaderProperty('greyscale',"strength",0, crochet*0.001*1,"cubeOut")
	elseif curStep == 900 then
		tweenShaderProperty('greyscale',"strength",1, crochet*0.001*1,"cubeIn")
	elseif curStep == 992 then
		tweenShaderProperty('greyscale',"strength",0, crochet*0.001*4,"cubeOut")
	elseif curStep == 1008 then
		bloom(4,1,crochet,2,"cubeOut")
		tweenShaderProperty('pixel',"strength",0, crochet*0.001*2,"cubeOut")
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut") 
	elseif curStep == 1020 or curStep == 1028 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
	elseif curStep == 1024 then
		bloom(4,1,crochet,2,"cubeOut")
		setShaderProperty('titleeffect', 'money',1.1)
		setShaderProperty("pixel","strength",20)
		tweenShaderProperty('pixel',"strength",0, crochet*0.001*2,"cubeOut")
		setShaderProperty('glitchy', 'AMT', 0.05)
		lascosasdelhud(1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
	    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",-1)
		tweenShaderProperty('mirror2',"x",0, crochet*0.001*1,"cubeOut")
	end
	--1040
	
	

	if curStep == 1136 then
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
	elseif curStep == 1144 or curStep == 1136 or curStep == 1336 then
		setShaderProperty("mirror2","x",0)
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
		tweenShaderProperty('mirror2',"x",1, crochet*0.001*2,"expoIn")
		mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
		black = false 
	elseif curStep == 1152 or curStep == 1344 then
		matt = true
			bf = false
			setProperty('', 'cameraSpeed', 7)
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",0)
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"x",-1, crochet*0.001*1,"cubeOut")
		bloom(4,1,crochet,2,"cubeOut")
		--lol = false
	elseif curStep == 1216 then
		lol = true
	elseif curStep == 1340 then
		lol = false
	elseif curStep == 1392 or curStep == 1472 then
		matt = false
		bf = false
		set("defaultCamZoom", 0.6)
		setProperty('', 'cameraSpeed', 1)
	elseif curStep == 1400 then
	
		setShaderProperty("mirror2","y",0)
		setShaderProperty("mirror2","x",2)
		tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
		tweenShaderProperty('mirror2',"x",0, crochet*0.001*2,"expoIn")
	elseif curStep == 1408 then
		bloom(4,1,crochet,2,"cubeOut")
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*2,"cubeOut")
	elseif curStep == 1432 then
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
	elseif curStep == 1436 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
	elseif curStep == 1536 then
		bloom(4,1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
		    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			setShaderProperty("mirror2","y",-1)
		    tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
	elseif curStep == 1664 then
		setShaderProperty('glitchy', 'AMT', 0)
		bloom(4,1,crochet,2,"cubeOut")
		setShaderProperty('titleeffect', 'money',0.67)
		mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
		    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			setShaderProperty("mirror2","y",-1)
		    tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
			tweenShaderProperty('greyscale',"strength",1, crochet*0.001*1,"cubeOut")
	elseif curStep == 1784 then
		mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
	elseif curStep == 1792 or curStep == 1920 then
		bloom(4,1,crochet,2,"cubeOut")
		tweenShaderProperty('greyscale',"strength",0, crochet*0.001*1,"cubeIn")
	elseif curStep == 1796 or curStep == 1924 then
		tweenShaderProperty('greyscale',"strength",1, crochet*0.001*1,"cubeOut")
	end
	if curStep == 1912 or curStep == 1920 then
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
	elseif curStep == 1916 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
	end
	if curStep == 1920 then
		tweenShaderProperty('bars',"effect",0.6, crochet*0.001*16,"cubeOut")
		tween("camHUD",{alpha = 0}, crochet*0.001*8,"cubeOut")
	end
	if curStep > 384 and curStep <= 497 or curStep > 512 and curStep <= 575 or curStep > 1152 and curStep <= 1328
	or curStep > 1344 and curStep <= 1391   then
		if curStep % 64 == 0 or curStep % 64 == 32 then
			matt = true
			bf = false
			setProperty('', 'cameraSpeed', 7)
		elseif curStep % 64 == 16 then
			matt = false
			bf = true
		elseif curStep % 64 == 48 then
			matt = false
			bf = false
			set("defaultCamZoom", 0.5)
		end
        if curStep % 32 == 0 then
			if lol then
			bloom(4,1,crochet,2,"cubeOut")
			mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
			end
		    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			setShaderProperty("mirror2","x",0)
			tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
			setShaderProperty("mirror2","y",0)
		    tweenShaderProperty('mirror2',"x",-1, crochet*0.001*1,"cubeOut")
			if black then
			tweenFadeIn("blackBG",1,crochet*0.001*3,"cubeIn") 
			end
		elseif curStep % 32 == 4 or curStep % 32 == 20 then
			if lol then
			mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
			end
		elseif curStep % 32 == 8 then
			tweenShaderProperty('mirror2',"x",-2, crochet*0.001*2,"expoIn")
		elseif curStep % 32 == 16 then
			if black then
			tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut") 
			end
			if lol then
			mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
			end
		elseif curStep % 32 == 24 then
			tweenShaderProperty('mirror2',"y",-2, crochet*0.001*2,"expoIn")
			tweenShaderProperty('mirror2',"x",0, crochet*0.001*2,"expoIn")
		end
	end

	if curStep > 640 and curStep <= 767 then -- drop
        if curStep % 32 == 0 then	
			matt = true
			bf = false
			setProperty('', 'cameraSpeed', 5)
			mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			setShaderProperty("mirror2","x",-1)
			tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
			setShaderProperty("mirror2","y",0)
		    tweenShaderProperty('mirror2',"x",0, crochet*0.001*1,"cubeOut")
			tweenFadeIn("blackBG",1,crochet*0.001*3,"cubeIn") 
		elseif curStep % 32 == 8 then
			tweenShaderProperty('mirror2',"x",1, crochet*0.001*2,"expoIn")
		elseif curStep % 32 == 12 then
			mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
		elseif curStep % 32 == 16 then
			matt = false
			bf = true
			tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut") 
			mirror(true,true,"angle","angle",360,0,2,crochet,"cubeOut")
		elseif curStep % 32 == 24 then
			tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
			tweenShaderProperty('mirror2',"x",0, crochet*0.001*2,"expoIn")
		end
	end

	if curStep > 1536 and curStep <= 1663 then -- drop2
        if curStep % 32 == 0 then	
			mirror(false,true,"","zoom",0,3,1.5,crochet,"cubeOut")
		    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			setShaderProperty("mirror2","y",-1)
		    tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		elseif curStep % 32 == 6 then
			mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
		elseif curStep % 32 == 20 then
			mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
		elseif curStep % 32 == 16 then
			mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
			mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		elseif curStep % 32 == 24 then
			tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
			
		end
	end
	if curStep > 128 and curStep <= 240 or curStep > 256 and curStep <= 640 or
	curStep > 768 and curStep <= 1536 then
		if curStep % 16 == 4 or curStep % 16 == 12 then
			zoom = 0.8
		end
	end
locobug(1040)
locobug(1040+32)
locobug(1104)
end

function locobug(s)
	if curStep == s then
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
	elseif curStep == s+4 or curStep == s+20 then
		mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
	elseif curStep == s+8 then
		setShaderProperty("mirror2","x",0)
		tweenShaderProperty('mirror2',"y",-1, crochet*0.001*2,"expoIn")
		tweenShaderProperty('mirror2',"x",1, crochet*0.001*2,"expoIn")
	elseif curStep == s+16 then
		bloom(4,1,crochet,2,"cubeOut")
		mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
		mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
		setShaderProperty("mirror2","x",0)
		tweenShaderProperty('mirror2',"y",0, crochet*0.001*1,"cubeOut")
		setShaderProperty("mirror2","y",0)
		tweenShaderProperty('mirror2',"x",-1, crochet*0.001*1,"cubeOut")
	elseif curStep == s+24 then
		tweenShaderProperty('mirror2',"x",-2, crochet*0.001*2,"expoIn")
	end
end
