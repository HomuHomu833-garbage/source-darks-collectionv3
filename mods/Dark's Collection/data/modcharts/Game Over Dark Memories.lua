local beatSwap = 1
local megalol = {524,556,588,620,652,684,1164,1196,1228,1260,1292,1324,1356,1388,1420,1452}

function createPost()

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
	setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 0)

    initShader("glitch", "glitch")
	setCameraShader("glitch", "hud")

    makeSprite('Black Stains Up', 'Black Stains Up', -50,0,0.75)
    setObjectCamera('Black Stains Up', 'hud')
    setActorAlpha(1, "Black Stains Up")

    makeSprite('Black Stains Down', 'Black Stains Down', -50,0,0.75)
    setObjectCamera('Black Stains Down', 'hud')
    setActorAlpha(1, "Black Stains Down")

    initShader('vignette', 'VignetteEffect')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 6)
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'size', 0.8)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0)
    setShaderProperty('color', 'green', 0)
    setShaderProperty('color', 'blue', 0)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    makeSprite('topBar', 'topBar', 0, -410, 2.5)
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -820, 2.6)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "topBar")

    initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setCameraShader('hud', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
	setShaderProperty('pincushgame', 'barrel', -4)
    setShaderProperty('pincushgame', 'doChroma', true)


    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle',-40)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.1)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)

    initShader('mirrorGame', 'MirrorRepeatEffect') 
	setCameraShader('game', 'mirrorGame')
	setShaderProperty('mirrorGame', 'zoom', 3.1)
	setShaderProperty('mirrorGame','x',0)
	setShaderProperty('mirrorGame','y',0)
	setShaderProperty('mirrorGame','angle', 0)

    initShader('blurmejor', 'BetterBlurEffect')
    setCameraShader('game', 'blurmejor')
    setCameraShader('hud', 'blurmejor')
    setShaderProperty('blurmejor', 'strength', 10)
    setShaderProperty('blurmejor', 'loops', 10)
    setShaderProperty('blurmejor', 'quality', 10)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0)


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

      triggerEvent('Set Camera Zoom','0.45','1')

      for i = 0,7 do
        if not middlescroll then
            if (i >= 0 and i <= 7) then
                setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700)
                tweenActorProperty(i,"alpha",0,0.1,"linear")
            end
        end
    end

end

function songStart()
    tweenShaderProperty('color', 'red', 1, crochet*0.001*8, 'cubeOut')
    tweenShaderProperty('color', 'green',1, crochet*0.001*8, 'cubeOut')
    tweenShaderProperty('color', 'blue', 1, crochet*0.001*8, 'cubeOut')
    tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*16, 'cubeInOut')
    tweenShaderProperty('MirrorRepeatEffect', 'angle',0, crochet*0.001*12, 'cubeIn')
    tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*48, 'cubeIn')
    tweenShaderProperty('blurmejor', 'strength',0, crochet*0.001*24, 'cubeIn')
    triggerEvent('Set Camera Zoom','0.75','1')
end

function lol()
    setShaderProperty('sobel', 'strength', 1)
    tweenShaderProperty('sobel', 'strength',0, crochet*0.001*2, 'cubeOut')
end

function stepHit( step )
    for i = 1, #megalol do
        if curStep == megalol [i]-1 then
            lol()
        end
    end
    if curStep >= 48 and curStep < 176 or curStep >= 1152 and curStep < 1216 then
        if curStep % 16 == 0 then
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
	    end
	end 
    if curStep >= 960 and curStep < 1152 then
        if curStep % 16 == 0 then
            tweenShaderProperty('blur', 'strength',8, crochet*0.001*2, 'linear')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('blur', 'strength',0, crochet*0.001*2, 'linear')
	    end
	end 
    if curStep >= 208 and curStep < 432 or curStep >= 512 and curStep < 576 or curStep >= 720 and curStep < 960 or curStep >= 1216 and curStep < 1472 then
        if curStep % 32 == 0 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 6 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 12 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 14 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 16 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 22 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 28 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 30 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
	    end
	end 
    if curStep >= 448 and curStep < 512 or curStep >= 1088 and curStep < 1216 then
        if curStep % 64 == 0 then
            tweenShaderProperty('mirrorGame', 'x',-2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 4 then
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 8 then
            tweenShaderProperty('mirrorGame', 'x',-2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 12 then
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 16 then
            tweenShaderProperty('mirrorGame', 'y',-2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 20 then
            tweenShaderProperty('mirrorGame', 'y',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 24 then
            tweenShaderProperty('mirrorGame', 'y',-2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 28 then
            tweenShaderProperty('mirrorGame', 'y',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 32 then
            tweenShaderProperty('mirrorGame', 'x',2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 36 then
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 40 then
            tweenShaderProperty('mirrorGame', 'x',2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 44 then
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 48 then
            tweenShaderProperty('mirrorGame', 'y',2, stepCrochet*0.001*4, 'expoOut')
            tweenShaderProperty('mirrorGame', 'x',2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 52 then
            tweenShaderProperty('mirrorGame', 'y',0, stepCrochet*0.001*4, 'expoOut')
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 56 then
            tweenShaderProperty('mirrorGame', 'y',2, stepCrochet*0.001*4, 'expoOut')
            tweenShaderProperty('mirrorGame', 'x',2, stepCrochet*0.001*4, 'expoOut')
        elseif curStep % 64 == 60 then
            tweenShaderProperty('mirrorGame', 'y',0, stepCrochet*0.001*4, 'expoOut')
            tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'expoOut')
	    end
	end 
    if curStep >= 576 and curStep < 704 or curStep >= 1344 and curStep < 1472 then
        if curStep % 32 == 0 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 4 then
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 6 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 8 then
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 12 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 14 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 16 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 20 then
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 22 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 32 == 28 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
            beatSwap = beatSwap * -1
            setShaderProperty('MirrorRepeatEffect', 'angle', -20*beatSwap)
            tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*2,'cubeOut')
        elseif curStep % 32 == 30 then
            setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
            tweenShaderProperty('MirrorRepeatEffect', 'zoom',1, stepCrochet*0.001*2, 'cubeOut')
	    end
	end 
    if curStep == 128 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 0) or (i >= 7 and i <= 7) then
                    tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,1.5,"cubeOut")
                    tweenActorProperty(i,"alpha",1,1,"linear")
                elseif (i >= 1 and i <= 1) or (i >= 6 and i <= 6) then
                    tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,2.5,"cubeOut")
                    tweenActorProperty(i,"alpha",1,2,"linear")
                elseif (i >= 2 and i <= 2) or (i >= 5 and i <= 5) then
                    tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,3.5,"cubeOut")
                    tweenActorProperty(i,"alpha",1,3,"linear")
                elseif (i >= 3 and i <= 3) or (i >= 4 and i <= 4) then
                    tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,4.5,"cubeOut")
                    tweenActorProperty(i,"alpha",1,4,"linear")
                end
            end
        end
    end
    if curStep == 176 then
        tweenShaderProperty('blurmejor', 'strength',10, crochet*0.001*2, 'cubeOut')
    elseif curStep == 188 then
        setShaderProperty("mirrorGame","angle",360)
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 192 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('vignette', 'size', 0.25)
        setShaderProperty('blurmejor', 'strength', 0)
    elseif curStep == 384 or curStep == 864 then
        tweenShaderProperty('mirrorGame', 'y',0, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 416 then
        tweenShaderProperty('blurmejor', 'strength',10, crochet*0.001*4, 'cubeOut')
    elseif curStep == 444 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*2, 'cubeIn')
        setShaderProperty("MirrorRepeatEffect","angle",360)
        tweenShaderProperty('MirrorRepeatEffect', 'angle',0, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'green',0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'blue', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',1, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 448 then
        setShaderProperty('blurmejor', 'strength', 0)
        tweenShaderProperty('color', 'red', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'green',1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'blue', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*16, 'cubeIn')
        setShaderProperty('MirrorRepeatEffect', 'barrel', 1)
    elseif curStep == 512 or curStep == 576 or curStep == 832 or curStep == 320 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('MirrorRepeatEffect', 'barrel', 0.1)
    elseif curStep == 568 or curStep == 218 or curStep == 250 or curStep == 346 or curStep == 378 or curStep == 826 or curStep == 714 or curStep == 1272 or curStep == 1336 or curStep == 1144 or curStep == 1064 or curStep == 1080 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 572 or curStep == 222 or curStep == 254 or curStep == 350 or curStep == 382 or curStep == 830 or curStep == 718 or curStep == 1276 or curStep == 1340 or curStep == 1148 or curStep == 1068 or curStep == 1084 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 700 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        setShaderProperty("mirrorGame","angle",360)
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*6, 'cubeIn')
    elseif curStep == 704 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('mirrorGame', 'zoom', 1)
    elseif curStep == 912 or curStep == 272 or curStep == 768 or curStep == 1232 or curStep == 1296 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*8, 'quartOut')
    elseif curStep == 916 or curStep == 276 or curStep == 772 or curStep == 1236 or curStep == 1300 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 920 or curStep == 280 or curStep == 776 or curStep == 1240 or curStep == 1304 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*8, 'quartOut')
    elseif curStep == 924 or curStep == 284 or curStep == 780 or curStep == 1244 or curStep == 1308 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 928 or curStep == 288 or curStep == 784 or curStep == 1248 or curStep == 1312 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 952 or curStep == 312 or curStep == 792 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty("mirrorGame","angle",-360)
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'quartOut')
        tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*6, 'quartOut')
    elseif curStep == 956 or curStep == 316 or curStep == 796 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 960 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 1152 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
    elseif curStep == 1280 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 1394 or curStep == 1402 or curStep == 624 or curStep == 632 or curStep == 688 or curStep == 696 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1398 or curStep == 1406 or curStep == 628 or curStep == 636 or curStep == 692 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1472 then
        tweenShaderProperty("blurmejor","strength",60,crochet*0.001*32,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*32,"cubeIn")
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('color', 'red', 0, crochet*0.001*36, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*36, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*36, 'cubeIn')
    end
    if curStep == 832 or curStep == 840 or curStep == 848 or curStep == 856 then
        tweenShaderProperty('mirrorGame', 'x', 1.5, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 836 or curStep == 844 or curStep == 852 or curStep == 860 then
        tweenShaderProperty('mirrorGame', 'x', -1.5, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 864 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'expoOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 984 or curStep == 1016 or curStep == 1032 or curStep == 1048 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 988 or curStep == 1036 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 992 or curStep == 1040 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1020 or curStep == 1052 then
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1024 or curStep == 1056 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 440 or curStep == 856 or curStep == 984 or curStep == 1016 or curStep == 1464 then
        tweenActorProperty("bottomBar", 'y', getActorY("bottomBar")-300, crochet*0.001*2, 'linear')
        tweenActorProperty("topBar", 'y', getActorY("topBar")+320, crochet*0.001*2, 'linear')
    elseif curStep == 448 or curStep == 864 or curStep == 992 or curStep == 1024 or curStep == 1472 then
        tweenPosOut("topBar",0,-410,0.5)
        tweenPosOut("bottomBar",0,-820,0.5)
    end
end