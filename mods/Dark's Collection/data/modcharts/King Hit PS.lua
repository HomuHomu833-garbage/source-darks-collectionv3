local time = 0

function createPost()
    set("dad.x",getActorX('dad')-150)
        set("boyfriend.x",getActorX('boyfriend')-100)
    set("dad.y",getActorY('dad')-20)
  --  triggerEvent('Change Ui Skin', 'default')

    --Shader Stuff
    initShader('PerlinSmokeEffect', 'PerlinSmokeEffect')
    setCameraShader('game', 'PerlinSmokeEffect')
    setCameraShader('hud', 'PerlinSmokeEffect')
    setShaderProperty("PerlinSmokeEffect","waveStrength",0)
    setShaderProperty("PerlinSmokeEffect","smokeStrength",0.5)
    setShaderProperty("PerlinSmokeEffect","speed",0.4)

    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
	setCameraShader('hud', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 3)

    initShader("grayscale","GreyscaleEffect")
    setCameraShader('game', 'grayscale')
    setCameraShader('hud', 'grayscale')
    setShaderProperty("grayscale","strength",1)

    initShader('blur1', 'BlurEffect')
    setCameraShader('game', 'blur1')
    setCameraShader('hud', 'blur1')
    setShaderProperty('blur1', 'strength', 0)

	initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
    setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
    setShaderProperty('MirrorRepeatEffect','x',0)
    setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)

    initShader('mirror', 'BarrelBlurEffect')
    setCameraShader('game', 'mirror')
    setShaderProperty("mirror","zoom",0.50)
    setShaderProperty("mirror","angle", 0)
    setShaderProperty("mirror","x",0)
    setShaderProperty("mirror","y",0)
    setShaderProperty('mirror', 'barrel', 0.0)
    setShaderProperty('mirror', 'doChroma', false)

    initShader('mirrorHUD', 'BarrelBlurEffect')
    setCameraShader('hud', 'mirrorHUD')
    setShaderProperty("mirrorHUD","zoom",1)
    setShaderProperty("mirrorHUD","angle", 0)
    setShaderProperty("mirrorHUD","x",0)
    setShaderProperty("mirrorHUD","y", 0)
    setShaderProperty('mirrorHUD', 'barrel', 0.0)
    setShaderProperty('mirrorHUD', 'doChroma', false)



  

    initShader('blur', 'BarrelBlurEffect')
    setCameraShader('game', 'blur')
    setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'barrel', 0.00)
    setShaderProperty('blur', 'zoom', 1.0)
    setShaderProperty('blur', 'doChroma', true)

        initShader('ca', 'ChromAbEffect')   
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.003)


    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0) 

    initShader('colorfill', 'ColorFillEffect')
    setCameraShader('game', 'colorfill')
    setCameraShader('hud', 'colorfill')
    setShaderProperty('colorfill', 'red', 0.0)
    setShaderProperty('colorfill', 'green', 0.0)
    setShaderProperty('colorfill', 'blue', 0.0)
    setShaderProperty('colorfill', 'fade', 1.0)

    initShader('MosaicEffect', 'MosaicEffect')
    setCameraShader('game', 'MosaicEffect')
	setShaderProperty("MosaicEffect","strength",25)

    initShader('pixelhud', 'MosaicEffect')
    setCameraShader('hud', 'pixelhud')
    setShaderProperty('pixelhud', 'strength', 25)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty("bloom","contrast",1)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 1)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 10)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.1)

    if modcharts then 
        local offscreen = -200
        if downscrollBool then 
            offscreen = 720+200
        end
        for i = 0,7 do 
            setActorY(offscreen, i)
        end
    end


end

function songStart()
    tweenShaderProperty('color', 'red', 1.5, crochet*0.001*16*4, 'expoOut')
    tweenShaderProperty('color', 'green', 1.5, crochet*0.001*16*4, 'expoOut')
    tweenShaderProperty('color', 'blue', 1.5, crochet*0.001*16*4, 'expoOut')
    tweenShaderProperty('grayscale', 'strength', 0.0, stepCrochet*0.001*56, 'expoIn')
    tweenShaderProperty('scanline', 'strength', 0.0, stepCrochet*0.001*64, 'expoIn')
    tweenShaderProperty('mirror', 'zoom', 1.5, stepCrochet*0.001*64, 'cubeIn')
    tweenShaderProperty('MosaicEffect', 'strength', 0, stepCrochet*0.001*64, 'cubeIn')
    tweenShaderProperty('pixelhud', 'strength', 0, stepCrochet*0.001*64, 'cubeIn')
end

function bloomBurst()
    setShaderProperty("bloom","contrast",3)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"linear")
end

function sobel()
    setShaderProperty("sobel","strength",1)
    tweenShaderProperty("sobel","strength",0,stepCrochet*0.001*8,"linear")
end

function camerabump()
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

function camerabumpalt()
    if curStep % 16 == 0 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 1 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
    if curStep % 16 == 8 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 0.95, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep % 16 == 9 then
        tweenShaderProperty("MirrorRepeatEffect", "zoom", 1, stepCrochet*0.001*2, "cubeOut")
    end
end

function cameraswinging()
    if curStep % 16 == 0 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 365, stepCrochet*0.001*4, "cubeOut")
    end
    if curStep % 16 == 4 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 360, stepCrochet*0.001*4, "cubeIn")
    end
    if curStep % 16 == 8 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 355, stepCrochet*0.001*4, "cubeOut")
    end
    if curStep % 16 == 12 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 360, stepCrochet*0.001*4, "cubeIn")
    end
end

function pixelModeon()
  
    tweenShaderProperty('MosaicEffect', 'strength', 6.0, crochet*0.001*16, 'expoOut')
    tweenShaderProperty('scanline', 'strength', 1, crochet*0.001*16, 'expoIn')
end

function pixelModeoff()
    --tweenShaderProperty('MosaicEffect', 'strength', 10.0, crochet*0.001*16, 'cubeOut')        
    tweenShaderProperty('scanline', 'strength', 0, crochet*0.001*16, 'expoIn')

end

function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('PerlinSmokeEffect', 'iTime', time)
    
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
    perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('blur', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('blur', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('blur', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
end
local lololol = 1 
function playerOneSing(a,b,c,d)
    if c == "Punch Paper" then
       
        playCharacterAnimation('boyfriend', 'dodge', true)
        setCharacterPreventDanceForAnim('boyfriend', true)
        setShaderProperty("ca", "strength",0.005)
        tweenShaderProperty("ca","strength",0,stepCrochet*0.001*4,"cubeOut")
    end
end


function stepHit(step)
    if curStep == 56 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*8, 'cubeOut')
    end
    if curStep == 64 then
		setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -10)
		--end
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 88 or curStep == 96 or curStep == 116 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9875, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 90 or curStep == 98 or curStep == 118 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 124 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9875, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 125 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.975, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 126 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9625, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 127 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*5, 'cubeOut')
    end
    if curStep == 128 then
        sobel()
        bloomBurst()
    end
    if curStep == 152 or curStep == 160 or curStep == 176 or curStep == 180 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9875, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 154 or curStep == 162 or curStep == 178 or curStep == 182 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 184 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 188 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 192 then
        bloomBurst()
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*16, 'cubeOut')
    end
    if curStep == 196 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep == 256 then
        bloomBurst()
    end
    if curStep == 264 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 266 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 267 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 268 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 272 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 318 or curStep == 326 or curStep == 334 or curStep == 354 or curStep == 362 or curStep == 374 then
        tweenShaderProperty('mirror', 'x', -0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 322 or curStep == 330 or curStep == 342 or curStep == 358 or curStep == 366 then
        tweenShaderProperty('mirror', 'x', 0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 320 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 328 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 336 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 344 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 352 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 360 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 368 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 376 then
        tweenShaderProperty('mirror', 'y', -2, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 382 then
        tweenShaderProperty('mirror', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 384 then
        sobel()
    end
    if curStep == 392 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 394 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 395 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 396 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 400 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 408 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 412 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 416 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 440 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 444 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 448 then
		setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2.5)
		--end
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 448 and curStep < 576 then
        cameraswinging()
        camerabump()
    end
    if curStep == 568 then
        tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty("sobel","strength",1,stepCrochet*0.001*8,"linear")
    end
    if curStep == 576 then
        tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*1, 'cubeOut')
        sobel()
    end
    if curStep == 584 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep == 640 then
        bloomBurst()
    end
    if curStep == 648 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 650 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 651 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 652 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 656 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 696 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 700 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 704 then
		setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2.5)
		--end
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 704 and curStep < 832 then
        cameraswinging()
        camerabump()
    end
    if curStep == 832 then
        bloomBurst()
        setShaderProperty('grayscale', 'strength', 0.5)
    end
    if curStep >= 832 and curStep < 896 then
        camerabumpalt()
    end
    if curStep == 840 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep >= 896 and curStep < 944 then
        camerabump()
    end
    if curStep == 944 or curStep == 946 or curStep == 948 or curStep == 950 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.975, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep == 945 or curStep == 947 or curStep == 949 or curStep == 951 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*1, "cubeOut")
    end
    if curStep == 952 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9875, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 953 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.975, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 954 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9625, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 955 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.95, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 956 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.9375, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 958 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.925, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 960 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.0, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty("grayscale", "strength", 0)
        bloomBurst()
        sobel()
    end
    if curStep == 968 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep == 1214 or curStep == 1222 or curStep == 1230 or curStep == 1250 or curStep == 1258 or curStep == 1270 then
        tweenShaderProperty('mirror', 'x', -0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1218 or curStep == 1226 or curStep == 1238 or curStep == 1254 or curStep == 1262 then
        tweenShaderProperty('mirror', 'x', 0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1216 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1224 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1232 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1240 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1248 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1256 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1264 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1272 then
        tweenShaderProperty('mirror', 'y', -2, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1278 then
        tweenShaderProperty('mirror', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1288 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1290 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1291 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1292 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1296 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1304 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1308 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1312 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1406 or curStep == 1414 or curStep == 1422 or curStep == 1442 or curStep == 1450 or curStep == 1462 then
        tweenShaderProperty('mirror', 'x', -0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1410 or curStep == 1418 or curStep == 1430 or curStep == 1446 or curStep == 1454 then
        tweenShaderProperty('mirror', 'x', 0.5, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1408 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1416 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1424 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1432 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1440 then
        tweenShaderProperty('mirror', 'y', 1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1448 then
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1456 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', -1, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1464 then
        tweenShaderProperty('mirror', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'y', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 1470 then
        tweenShaderProperty('mirror', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1464 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 1468 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 1472 then
		setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2.5)
		--end
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 1472 and curStep < 1600 then
        cameraswinging()
    end
    if curStep == 1592 then
        tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty("sobel","strength",1,stepCrochet*0.001*8,"linear")
    end
    if curStep == 1600 then
        tweenShaderProperty('grayscale', 'strength', 0.5, stepCrochet*0.001*4, 'cubeOut')
        sobel()
    end
    if curStep == 1608 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep == 1664 then
        bloomBurst()
    end
    if curStep == 1672 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1674 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1675 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1676 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1680 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1724 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1728 then
        bloomBurst()
        tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1736 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    if curStep == 1792 then
        bloomBurst()
    end
    if curStep == 1800 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1802 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1803 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1804 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1808 then
        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1848 then
		tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.25, stepCrochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 1852 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 1856 then
		setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2.5)
		--end
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*2, 'cubeOut')
    end
    if curStep >= 1856 and curStep < 1984 then
        cameraswinging()
        camerabump()
    end
    if curStep == 1976 then
        tweenShaderProperty('grayscale', 'strength', 1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty("sobel","strength",1,stepCrochet*0.001*8,"linear")
    end
    if curStep == 1984 then
        sobel()
        tweenShaderProperty('grayscale', 'strength', 0, stepCrochet*0.001*1, 'cubeOut')
        setShaderProperty('mirror', 'zoom', 0.6)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -5)
		--end
		tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*8, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*16, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1992 then
        setShaderProperty("MirrorRepeatEffect", "angle", 0)
    end
    --ending
    if curStep == 2048 then
        tweenShaderProperty('color', 'red', -1.0, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('color', 'green', -1.0, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('color', 'blue', -1.0, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('grayscale', 'strength', 1.0, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('scanline', 'strength', 1.0, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('MosaicEffect', 'strength', 25, crochet*0.001*26, 'cubeIn')
        tweenShaderProperty('pixelhud', 'strength', 25, crochet*0.001*26, 'cubeIn')
    end
    if curStep == 2112 then
        bloomBurst()
    end
    --Pixel
    if curStep == 1072 then
        pixelModeon()
    elseif curStep == 1200 then
        pixelModeoff()
    elseif curStep == 1216 then
        tweenShaderProperty('MosaicEffect', 'strength', 0.0, crochet*0.001*1, 'cubeOut')
        --tweenShaderProperty('raymarch', 'x', 0, crochet*0.001*1, 'cubeOut')
        --tweenShaderProperty('raymarch', 'y', 180, crochet*0.001*1, 'cubeOut')
        if modcharts and not opponentPlay then 
            local offscreen = -200
            if downscrollBool then 
                offscreen = 720+200
            end
            for i = 0,7 do 
                setActorY(offscreen, i)
            end
        end
    end
end

print("Mod Chart script loaded :)")