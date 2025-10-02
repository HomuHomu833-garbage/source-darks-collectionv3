function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
   
    set("ratingText.alpha",s)
end
local time = 0
function createPost()
    initShader('HueShiftEffect', 'HueShiftEffect')
    initShader('vcrchroma', 'vcrchroma')
    setCameraShader('game', 'vcrchroma')
    makeCamera("vignette")
    lascosasdelhud(0)
    initShader('pincushGame', 'PincushNewEffect')
    setCameraShader('game', 'pincushGame')
    setShaderProperty('pincushGame', 'zoom', 3)
    setShaderProperty('pincushGame', 'angle', 0)
	setShaderProperty('pincushGame', 'x', 0)
    setShaderProperty('pincushGame', 'y', 0)
	setShaderProperty('pincushGame', 'barrel', 0)
    setShaderProperty('pincushGame', 'doChroma', true)

    
    initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 2)
    setShaderProperty('zoomblurGame', 'focusPower', 3)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.3)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('hud', 'barrel')
	setCameraShader('game', 'barrel')
	setShaderProperty('barrel', 'zoom', 1)
	setShaderProperty('barrel','x',0)
	setShaderProperty('barrel','y',0)
	setShaderProperty('barrel','angle', 0)
    setShaderProperty('barrel','barrel', 0)
    setShaderProperty('barrel', 'doChroma', true)

	initShader('perlinGame', 'PincushNewEffect')
    setCameraShader('game', 'perlinGame')

    setShaderProperty('perlinGame', 'zoom', 1)
    setShaderProperty('perlinGame', 'angle', 0)
	setShaderProperty('perlinGame', 'x', 0)
    setShaderProperty('perlinGame', 'y', 0)
	setShaderProperty('perlinGame', 'barrel', 0)
    setShaderProperty('perlinGame', 'doChroma', true)

	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

	initShader('bars', 'bars')
	setCameraShader('hud', 'bars')
	setShaderProperty('bars', 'effect', 0.6)

    initShader('barsgame', 'bars')
	setCameraShader('game', 'barsgame')
	setShaderProperty('barsgame', 'effect', 0)

    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)
    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
    setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0.3)

    for i = 0,7 do
        setActorAlpha(0,i)
    end

    makeSprite('uno-matt', 'uno-matt', -3000, 200, 0.86)
	setObjectCamera('uno-matt', 'hud')

	makeSprite('dos-matt', 'dos-matt', 3000, 200, 0.86)
	setObjectCamera('dos-matt', 'hud')

	makeSprite('tres-matt', 'tres-matt', -3000, 200, 0.86)
	setObjectCamera('tres-matt', 'hud')

	makeSprite('cuatro-matt', 'cuatro-matt', 3000, 200, 0.86)
	setObjectCamera('cuatro-matt', 'hud')

end

function songStart()
    tweenShaderProperty('zoomblurGame',"focusPower",0, stepCrochet*0.001*48,"linear")
    tweenShaderProperty('bars',"effect",0, stepCrochet*0.001*16,"cubeIn")
end
local set = true
local tween = true
local rotCam = true
local rotCamSpd = 1.5
local rotCamRange = 5
local rotCamInd = 0
function pincushGame(set,tween,value,value2,valor,valor2,s,ease)
    if set then
        setShaderProperty('pincushGame',value,valor)
    end
    if tween then
        tweenShaderProperty('pincushGame',value2,valor2, stepCrochet*0.001*s,ease)
    end
end
function barrel(set,tween,value,value2,valor,valor2,s,ease)
    if set then
        setShaderProperty('barrel',value,valor)
    end
    if tween then
        tweenShaderProperty('barrel',value2,valor2, stepCrochet*0.001*s,ease)
    end
end
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('vcrchroma', 'iTime', time)
    setCustomShaderFloat('HueShiftEffect', 'iTime', time)

    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('perlinGame', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('perlinGame', 'angle', 0)
    end
end
function bloom(contrast,value1,speed,curStep,ease)
    if bloom then
       setShaderProperty("bloom","contrast",contrast)
       tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
    end
end
local swap = -1
function stepHit()
    if curStep == 112 then
        pincushGame(false,true,"","zoom",1,1,16,"cubeIn")
        tweenShaderProperty('EyeFishEffect',"power",0, crochet*0.001*4,"cubeIn")
        barrel(false,true,"","barrel",1,10,16,"cubeIn")
        tweenShaderProperty('bars',"effect",0.6, stepCrochet*0.001*16,"cubeIn")
    elseif curStep == 128 then
        barrel(true,true,"barrel","barrel",-8,0,8,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        lascosasdelhud(1)
        tweenShaderProperty('bars',"effect",0, stepCrochet*0.001*8,"cubeOut")
        for i = 0,7 do
           tweenActorProperty(i,"alpha",1, crochet*0.001*2,"cubeOut")
           tweenActorProperty(i,"angle",360, crochet*0.001*4,"cubeInOut")
        end
        rotCamSpd = 1.5
        rotCamRange = 0
    elseif curStep == 192 or curStep == 224 or curStep == 320 then
        pincushGame(false,true,"","zoom",1,0.6,4,"cubeOut")
    elseif curStep == 208 or curStep == 240 then
        pincushGame(false,true,"","zoom",1,1,16,"cubeIn")
    elseif curStep == 376 then
        pincushGame(false,true,"","zoom",1,2,4,"cubeOut")
    elseif curStep == 380 then
        pincushGame(false,true,"","zoom",1,1,4,"cubeIn")
    end
    if curStep == 256 then
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0.5)
        pincushGame(false,true,"","zoom",0.4,0.6,16,"linear")
        tweenShaderProperty('barsgame',"effect",0.1, stepCrochet*0.001*8,"cubeOut")
    elseif curStep == 288 then
        pincushGame(false,true,"","zoom",1,1,32,"linear")
    elseif curStep == 320 then
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        if not middlescroll then
            for i = 0,7 do
                setActorX(-280,"ratingsGroup")
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,stepCrochet*0.001*4,"cubeOut")
                        tweenActorProperty(i,"alpha",0.3,0.5,"linear")
                    elseif (i >= 4 and i <= 7) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,stepCrochet*0.001*4,"cubeOut")
                    end
                end
            end
        end
    elseif curStep == 380 then
        barrel(false,true,"","barrel",1,5,4,"cubeOut")
        tweenShaderProperty('EyeFishEffect',"power",1, stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 384 then
        barrel(true,true,"barrel","barrel",-8,0.3,8,"cubeOut")
        tweenShaderProperty('EyeFishEffect',"power",0, stepCrochet*0.001*4,"cubeOut")
    end
    if curStep == 376 then
        tweenActorProperty('uno-matt', 'x', 350.0,stepCrochet *0.001*2, 'cubeOut')
    elseif curStep == 378 then
        tweenActorProperty('dos-matt', 'x', 300.0, stepCrochet*0.001*2, 'cubeOut')
		tweenActorProperty('uno-matt', 'x', -1000.0, stepCrochet*0.001*2, 'cubeInOut')
    elseif curStep == 380 then
        tweenActorProperty('tres-matt', 'x', 350.0, stepCrochet*0.001*2, 'cubeOut')
		tweenActorProperty('dos-matt', 'x', 1500.0, stepCrochet*0.001*2, 'cubeInOut')
    elseif curStep == 382 then
        tweenActorProperty('cuatro-matt', 'x', 300.0, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('tres-matt', 'x', -1500.0, stepCrochet*0.001*2, 'cubeInOut')
    elseif curStep == 384 then
        tweenActorProperty('cuatro-matt', 'x', 1500.0, stepCrochet*0.001*2, 'cubeInOut')
    end
    if curStep == 392 or curStep == 456 then
        pincushGame(false,true,"","x",0,1,4,"cubeOut")
    elseif curStep == 400 or curStep == 432  then
        pincushGame(false,true,"","y",0,1,4,"cubeOut")
        pincushGame(false,true,"","zoom",1,0.6,4,"cubeOut")
    elseif curStep == 416 or curStep == 448 or curStep == 480 or curStep == 512 then
        pincushGame(false,true,"","y",0,0,4,"cubeOut")
        pincushGame(false,true,"","zoom",1,1,4,"cubeOut")
    elseif curStep == 424 then
        pincushGame(false,true,"","x",0,2,4,"cubeOut")
    elseif curStep == 464 or curStep == 496 then
        pincushGame(false,true,"","y",0,-1,4,"cubeOut")
        pincushGame(false,true,"","zoom",1,0.6,4,"cubeOut")
    elseif curStep == 488 then
        pincushGame(false,true,"","x",0,0,4,"cubeOut")
    elseif curStep == 504 then
        barrel(false,true,"","barrel",1,5,8,"cubeIn")
        pincushGame(false,true,"","zoom",1,2.5,4,"cubeOut")
    elseif curStep == 508 then
        pincushGame(false,true,"","zoom",1,1,4,"cubeIn")
    end
    if curStep == 512 then
        barrel(true,true,"barrel","barrel",-8,0,8,"cubeOut")
        setCameraShader('game', 'HueShiftEffect')
    elseif curStep == 520 then
        pincushGame(false,true,"","zoom",1,0.6,4,"cubeOut")
    elseif curStep == 540 or curStep == 604 or curStep == 632 then
        pincushGame(false,true,"","zoom",1,3,4,"cubeOut")
    elseif curStep == 544 or curStep == 608 or curStep == 636 then
        pincushGame(false,true,"","zoom",1,1,4,"cubeIn")
    elseif curStep == 568 then
        pincushGame(false,true,"","x",0,1,4,"cubeOut")
    elseif curStep == 576 then
        pincushGame(false,true,"","x",0,0,4,"cubeOut")
    elseif curStep == 640 or curStep == 704 then
        pincushGame(false,true,"","x",0,2,6,"cubeOut")
        pincushGame(true,true,"y","y",-10,0,64,"linear")
        barrel(true,true,"barrel","barrel",8,0,12,"cubeOut")
        tweenShaderProperty('barsgame',"effect",0, stepCrochet*0.001*16,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*4,"cubeOut")
        rotCamSpd = 2.5
        rotCamRange = 15
    elseif curStep == 760 then
        tweenShaderProperty('barsgame',"effect",0.6, stepCrochet*0.001*8,"cubeIn")
        triggerEvent('toggle checker bg','0',crochet*0.001*2)
    elseif curStep == 768 then
        tweenShaderProperty('barsgame',"effect",0.1, stepCrochet*0.001*8,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0.5)
        pincushGame(false,true,"","zoom",0.4,0.5,64,"linear")
        tweenShaderProperty('EyeFishEffectGame',"power",0.1, stepCrochet*0.001*4,"cubeOut")
        removeCameraShader("game","HueShiftEffect")
        rotCamSpd = 0
        rotCamRange = 0
        if not middlescroll then
            for i = 0,7 do
                setActorX(0,"ratingsGroup")
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,stepCrochet*0.001*4,"cubeOut")
                    elseif (i >= 4 and i <= 7) then
                        tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,stepCrochet*0.001*4,"cubeOut")
                    end
                end
            end
        end
        for i = 0,7 do
            tweenActorProperty(i,"alpha",1, crochet*0.001*2,"cubeOut")
            tweenActorProperty(i,"angle",360, crochet*0.001*4,"cubeInOut")
        end
    elseif curStep == 832 then
        bloom(4,1,crochet,2,"cubeOut")
        pincushGame(false,true,"","zoom",0.4,1,64,"linear")
      
    end
    if curStep == 632 then
        triggerEvent('toggle checker bg','0.2',crochet*0.001*2)
    elseif curStep == 896 then
        bloom(1,0,crochet,32,"linear")
        pincushGame(false,true,"","zoom",0.4,4,128,"cubeIn")
        pincushGame(false,true,"","angle",0.4,90,128,"cubeIn")
        tweenActorProperty("camHUD","alpha",0,crochet*0.001*32,"cubeIn")
    end 
    if curStep >= 0 and curStep < 48 or curStep >= 64 and curStep < 112 then
        if curStep % 16 == 0 then
           pincushGame(true,true,"y","y",-2,0,16,"cubeInOut")
        end 
	end
    if curStep >= 48 and curStep < 64 or curStep >= 112 and curStep < 128 then
        if curStep % 8 == 0 then
           pincushGame(true,true,"y","y",-2,0,8,"cubeInOut")
        end 
	end
    if curStep >= 128 and curStep < 384 then
        swap = swap* -1
        if curStep % 32 == 0 then
            barrel(true,true,"barrel","barrel",-0.5,0,8,"cubeOut")
        elseif curStep % 32 == 6 then
            barrel(true,true,"zoom","zoom",0.9,1,4,"cubeOut")
        elseif curStep % 32 == 8 then
            pincushGame(true,true,"angle","angle",15*swap,0,4,"cubeOut")
        elseif curStep % 32 == 12 then
            barrel(true,true,"zoom","zoom",0.9,1,4,"cubeOut")
        elseif curStep % 32 == 20 then
            barrel(true,true,"zoom","zoom",0.9,1,4,"cubeOut")
        elseif curStep % 32 == 24 then
            pincushGame(true,true,"angle","angle",-15*swap,0,4,"cubeOut")
        elseif curStep % 32 == 26 then
            barrel(true,true,"zoom","zoom",0.9,1,4,"cubeOut")
       
        end 
	end
    if curStep >= 512 and curStep < 632 then
        if curStep % 16 == 0 then
            barrel(true,true,"y","y",0.1,0,3.5,"cubeOut")
            pincushGame(false,true,"","zoom",1,1,4,"cubeOut")
        elseif curStep % 16 == 4 then
            barrel(true,true,"y","y",-0.1,0,3.5,"cubeOut")
        elseif curStep % 16 == 8 then
            barrel(true,true,"x","x",0.1,0,3.5,"cubeOut")
            pincushGame(false,true,"","zoom",1,0.6,4,"cubeOut")
        elseif curStep % 16 == 12 then
            barrel(true,true,"x","x",-0.1,0,3.5,"cubeOut")
        end 
	end
    if curStep >= 640 and curStep < 768 then
        if curStep % 16 == 0 then
            pincushGame(false,true,"","zoom",1,3,8,"cubeOut")
            tweenShaderProperty('EyeFishEffectGame',"power",0.25, stepCrochet*0.001*8,"cubeOut")
        elseif curStep % 16 == 8 then
            pincushGame(false,true,"","zoom",1,1,8,"cubeIn")
            tweenShaderProperty('EyeFishEffectGame',"power",0.1, stepCrochet*0.001*8,"cubeIn")
        end 
	end

    if curStep >= 400 and curStep < 432 or curStep >= 464 and curStep < 496 then
        if curStep % 32 == 6 then
           triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 7 then
            triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 10 then
            triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 13 then
            triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 22 then
            triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 26 then
            triggerEvent("ca burst","0.02","0.02")
        elseif curStep % 32 == 29 then
            triggerEvent("ca burst","0.02","0.02")
        end 
	end
    if curStep >= 384 and curStep < 633 then
        swap = swap* -1
        if curStep % 16 == 0 then
            pincushGame(true,true,"angle","angle",15*swap,0,3.5,"linear")
        elseif curStep % 16 == 4 then
            pincushGame(true,true,"angle","angle",-15*swap,0,3.5,"linear")
        elseif curStep % 16 == 8 then
            pincushGame(true,true,"angle","angle",15*swap,0,3.5,"linear")
        elseif curStep % 16 == 11 then
            barrel(true,true,"zoom","zoom",0.8,1,1.5,"cubeOut")
        elseif curStep % 16 == 14 then
            barrel(true,true,"zoom","zoom",0.8,1,1.5,"cubeOut")
        end 
	end
    if curStep >= 640 and curStep < 768 then
        swap = swap* -1
        if curStep % 16 == 0 then
            barrel(true,true,"zoom","zoom",0.88,1,3.5,"cubeOut")
        elseif curStep % 16 == 4 then
            barrel(true,true,"zoom","zoom",0.88,1,3.5,"cubeOut")
        elseif curStep % 16 == 8 then
            barrel(true,true,"zoom","zoom",0.88,1,3.5,"cubeOut")
        elseif curStep % 16 == 11 then
            barrel(true,true,"zoom","zoom",0.9,1,2,"cubeOut")
        elseif curStep % 16 == 14 then
            barrel(true,true,"zoom","zoom",0.9,1,1.5,"cubeOut")
        end 
	end
end