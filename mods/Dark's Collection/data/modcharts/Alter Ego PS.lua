function createPost()
    
    initShader('mirror', 'BarrelBlurEffect')
	setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2)
    setShaderProperty('mirror', 'angle', -10)
    setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
    initShader('bars', 'bars')
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)
    initShader('mirror2', 'BarrelBlurEffect')
	setCameraShader('hud', 'mirror2')
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
    setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
    setShaderProperty('mirror2', 'barrel', 0)
    initShader('fish', 'EyeFishEffect')--
    setCameraShader('game', 'fish')
    setShaderProperty('fish', 'power', 0.2)
    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 3)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    
    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.4)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.001)

    
	initShader('bloom', 'BloomEffect')--
    --setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
	setShaderProperty('bloom', 'brightness', -1)
    initShader('bloom2', 'BloomEffect')--
    setCameraShader('game', 'bloom2')
    setShaderProperty('bloom2', 'contrast', 1)
	setShaderProperty('bloom2', 'brightness', 0)
end
lol = 1
time = 0
function update(elapsed)
    time = time + elapsed
    setShaderProperty('glitchPeak', 'iTime', time)
    zoom = lerp(zoom, 1, elapsed * 2)
    setShaderProperty('mirror2', 'zoom', zoom)
    bloom2 = lerp(bloom2, 0, elapsed * 4)
    setShaderProperty('bloom2', 'brightness', bloom2)
    angle = lerp(angle, 0, elapsed * 4)
    setShaderProperty('mirror2', 'angle', angle)
    x = lerp(x, 0, elapsed * 4)
    setShaderProperty('mirror2', 'x', x)
    ca = lerp(ca, 0.001, elapsed * 8)
    setShaderProperty('ca', 'strength', ca)
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function startSong()
    tweenShader("mirror","angle",0,crochet*0.001*32,"linear")
    tweenShader("mirror","zoom",1,crochet*0.001*32,"linear")
    tweenShader("fish","power",0,crochet*0.001*32,"linear")
    tweenShader("bloom","brightness",0,crochet*0.001*32,"linear")
end
function playerOneSing(a, b, c, d)
    if c == "paperpunch" or c == "papersword" then
        lol = -lol
        playCharacterAnimation('boyfriend', "dodge", true)
        ca = 0.01
        if c == "paperpunch" then
            angle = 10 * lol
            bloom2 = 0.5
        end
    end
end

function stepHit()
    if curStep >= 256 and curStep < 768 or curStep >= 896 and curStep < 1152 or curStep >= 1280 then
        if curStep % 4 == 0 then
            zoom = 0.9
        end
        if curStep % 8 == 0 then
            set("defaultCamZoom", math.random() * 0.2 + 0.55)
        end
    end
    if curStep == 128 or curStep == 1280 then
        bloom(4,1,crochet,4,"linear")
    elseif curStep == 248 then
        tweenShader("mirror","zoom",0.8,crochet*0.002,"cubeIn")
        tweenShader("greyscale","strength",0,crochet*0.002,"cubeIn")
    elseif curStep == 256 then
        tweenShader("mirror","zoom",1,crochet*0.002,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 348 or curStep == 604 then
        setShaderProperty('titleeffect', 'money',0.66)
    elseif curStep == 352 or curStep == 608 or curStep == 960 or curStep == 1072 then
        bloom(2,1,crochet,2,"cubeOut")
        setShaderProperty('titleeffect', 'money',0)
    elseif curStep == 384 then
        tweenShader("greyscale","strength",1,crochet*0.004,"cubeIn")
    elseif curStep == 400 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShader("greyscale","strength",0,crochet*0.001,"cubeOut")
    elseif curStep == 512 then
        tweenShader("bloom","brightness",-0.1,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"linear")
    elseif curStep == 632 then
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 640 then
        bloom(2,1,crochet,4,"linear")
        setShaderProperty('bloom', 'brightness',0)
        tweenShader("greyscale","strength",0,crochet*0.001,"cubeOut")
    elseif curStep == 768 then
        bloom(2,1,crochet,4,"linear")
        tweenShader("greyscale","strength",1,crochet*0.032,"cubeIn")
    elseif curStep == 880 then
        bloom(1,0,crochet,3.5,"cubeIn")
        tweenShader("mirror","zoom",3,crochet*0.004,"cubeIn")
        tweenShader("mirror","angle",-10,crochet*0.001,"cubeOut")
    elseif curStep == 884 then
        tweenShader("mirror","angle",10,crochet*0.0005,"cubeOut")
    elseif curStep == 886 then
        tweenShader("mirror","angle",-10,crochet*0.0005,"cubeOut")
    elseif curStep == 888 then
        tweenShader("mirror","angle",180,crochet*0.002,"cubeIn")
    elseif curStep == 896 then
        bloom(2,1,crochet,4,"linear")
        tweenShader("mirror","angle",360,crochet*0.001,"cubeOut")
        tweenShader("mirror","zoom",1,crochet*0.001,"cubeOut")
        tweenShader("greyscale","strength",0,crochet*0.001,"cubeOut")
    end
    if curStep == 912 or curStep == 918 then
        angle,bloom2,zoom = 10,0.5,0.8
    elseif curStep == 915 then
        angle,bloom2,zoom = -10,0.5,0.8
    end
    if curStep == 918 then
        setShaderProperty('mirror', 'angle',0)
        tweenShader("mirror","angle",10,crochet*0.001,"cubeOut")
        tweenShader("mirror","zoom",3,crochet*0.001,"cubeOut")
        tweenShader("fish","power",0.2,crochet*0.001,"cubeOut")
        setShaderProperty('bloom', 'brightness',-0.1)
    elseif curStep == 922 then
        tweenShader("mirror","angle",-10,crochet*0.0005,"cubeIn")
    elseif curStep == 924 then
        tweenShader("mirror","zoom",1,crochet*0.0005,"cubeIn")
        tweenShader("mirror2","barrel",-4,crochet*0.001,"cubeIn")
        setShaderProperty('sobel', 'strength', 0.9)
        setShaderProperty('titleeffect', 'money',0.6)
    elseif curStep == 926 then
        setShaderProperty('mirror', 'zoom',3)
        tweenShader("mirror","zoom",1,crochet*0.0005,"cubeOut")
    elseif curStep == 928 then
        bloom(2,1,crochet,2,"cubeOut")
        setShaderProperty('sobel', 'strength', 0)
        tweenShader("mirror","angle",0,crochet*0.001,"cubeOut")
        tweenShader("fish","power",0,crochet*0.001,"cubeOut")
        setShaderProperty('bloom', 'brightness',0)
        tweenShader("mirror2","barrel",0,crochet*0.001,"cubeOut")
        setShaderProperty('titleeffect', 'money',0)
    elseif curStep == 944 then
        tweenShader("mirror","zoom",1.5,crochet*0.001,"cubeOut")
        tweenShader("mirror","angle",10,crochet*0.001,"cubeOut")
        tweenShader("greyscale","strength",1,crochet*0.001,"cubeOut")
    elseif curStep == 948 then
        tweenShader("greyscale","strength",0,crochet*0.001,"cubeIn")
        tweenShader("mirror","zoom",1,crochet*0.001,"cubeIn")
        tweenShader("mirror","angle",0,crochet*0.001,"cubeIn")
        bloom(3,1,crochet,1,"cubeOut")
    elseif curStep == 968 then
        bloom(1,0.3,crochet,3,"cubeIn")
    elseif curStep == 980 then
        bloom(0.3,1,crochet,2,"cubeOut")
    elseif curStep == 988 then
        bloom(1,0,crochet,1,"cubeIn")
    elseif curStep == 992 then
        bloom(2,1,crochet,2,"cubeOut")
        tweenShader("mirror","zoom",2,crochet*0.001,"cubeOut")
        setShaderProperty('glitchPeak', 'AMT', 0.2)
    elseif curStep == 996 then
        tweenShader("mirror","zoom",1,crochet*0.001,"cubeIn")
    elseif curStep == 1000 then
        setShaderProperty('glitchPeak', 'AMT', 0)
        bloom(1,0.5,crochet,2,"cubeIn")
    elseif curStep == 1016 then
        bloom(0.5,0.3,crochet,2,"cubeIn")
        tweenShader("mirror","angle",-180 ,crochet*0.002,"cubeIn")
    elseif curStep == 1024 then
        bloom(2,1,crochet,2,"cubeOut")
        tweenShader("mirror","angle",-360 ,crochet*0.001,"cubeOut")
    elseif curStep == 1032 then
        tweenShader("mirror","x",4 ,crochet*0.0025,"cubeInOut")
    elseif curStep == 1040 then
        setShaderProperty('mirror', 'angle',0)
        tweenShader("mirror","zoom",1.5 ,stepCrochet*0.002,"cubeOut")
        tweenShader("mirror","angle",25 ,stepCrochet*0.002,"cubeOut")
        tweenShader("greyscale","strength",1,crochet*0.001,"cubeIn")
    elseif curStep == 1042 then
        tweenShader("mirror","zoom",3 ,stepCrochet*0.002,"cubeOut")
        tweenShader("mirror","angle",180 ,stepCrochet*0.002,"cubeOut")
    elseif curStep == 1044 then
        tweenShader("mirror","zoom",1 ,stepCrochet*0.002,"cubeIn")
        bloom(1,0.5,stepCrochet,2,"cubeIn")
    elseif curStep == 1046 then
        tweenShader("greyscale","strength",0,stepCrochet*0.002,"cubeOut")
        bloom(0.5,1,crochet,0.5,"cubeOut")
        tweenShader("mirror","angle",360 ,stepCrochet*0.002,"cubeOut")
    elseif curStep == 1048 then
        setShaderProperty('mirror', 'angle',0)
        tweenShader("mirror","zoom",0.7 ,crochet*0.002,"cubeIn")
        tweenShader("mirror","angle",25 ,crochet*0.002,"cubeIn")
    elseif curStep == 1056 then
        tweenShader("mirror","zoom",1 ,crochet*0.001,"cubeOut")
        tweenShader("mirror","angle",-10 ,crochet*0.001,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1060 then
        tweenShader("mirror","angle",0 ,crochet*0.0005,"cubeIn")
    elseif curStep == 1096 then
        tweenShader("greyscale","strength",1,stepCrochet*0.002,"cubeOut")
        tweenShader("mirror","zoom",2 ,crochet*0.002,"cubeIn")
        tweenShader("mirror","angle",25 ,crochet*0.002,"cubeIn")
    elseif curStep == 1104 then
        bloom(0,1,crochet,2,"linear")
        setShaderProperty('mirror', 'zoom',0.8)
        tweenShader("greyscale","strength",0,stepCrochet*0.0002,"cubeOut")
        tweenShader("mirror","zoom",1 ,stepCrochet*0.008,"cubeOut")
        tweenShader("mirror","angle",0 ,stepCrochet*0.0002,"cubeOut")
    elseif curStep == 1124 then
        bloom(1,0.35,stepCrochet,1,"cubeOut")
        tweenShader("mirror","zoom",3 ,stepCrochet*0.004,"cubeOut")
    elseif curStep == 1128 then
        tweenShader("mirror","x",-8 ,stepCrochet*0.008,"cubeOut")
    elseif curStep == 1136 then
        tweenShader("mirror","zoom",2 ,stepCrochet*0.003,"cubeOut")
    elseif curStep == 1139 then
        tweenShader("mirror","zoom",1.5 ,stepCrochet*0.003,"cubeOut")
    elseif curStep == 1142 then
        tweenShader("mirror","zoom",1 ,stepCrochet*0.003,"cubeOut")
    elseif curStep == 1144 then
        bloom(0.35,0,stepCrochet,8,"cubeIn")
    elseif curStep == 1148 then
        angle = 10
    elseif curStep == 1150 then
        angle = -10
    elseif curStep == 1152 then
        bloom2 = 1
    elseif curStep == 1168 then
        bloom(0,1,crochet,12,"cubeIn")
    elseif curStep == 1232 then
        tweenShader("greyscale","strength",1,stepCrochet*0.002,"cubeOut")
        tweenShader("mirror","zoom",3 ,stepCrochet*0.004,"cubeOut")   
    elseif curStep == 1244 then
        tweenShader("greyscale","strength",0,stepCrochet*0.002,"cubeOut")
        tweenShader("mirror","zoom",1 ,stepCrochet*0.004,"cubeOut")   
    elseif curStep == 1408 then
        flashCamera("hud","",1)
        setShaderProperty('bloom', 'contrast',0)
        tween("camHUD",{alpha = 0},1)
    end
    if curStep == 1136 or curStep == 1142 then
        angle,bloom2,x = -10,0.1,-0.1
    elseif curStep == 1139 then
        angle,x = 10,0.1
    end
    if curStep >= 1096 and curStep < 1104 then
        if curStep % 2 == 0 then
            setShaderProperty('bloom', 'contrast',0)
        end
        if curStep % 2 == 1 then
            setShaderProperty('bloom', 'contrast',1)
        end
    end
    if curStep == 924 or curStep == 926 or curStep == 956 or curStep == 1000 then
        angle = 10
    elseif curStep == 925 or curStep == 1004 then
        angle = -10
    end
end