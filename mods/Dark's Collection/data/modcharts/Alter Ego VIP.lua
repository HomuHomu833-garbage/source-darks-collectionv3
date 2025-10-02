
function createPost()

    makeSprite('blackBG', '', 0, 0, 1);
     makeGraphic('blackBG', 1920/getCamZoom(), 1080/getCamZoom(), '#000000');
     actorScreenCenter('blackBG');
     setActorScroll(0, 0, 'blackBG');
     setActorAlpha(0, 'blackBG');
     setActorLayer('blackBG', getActorLayer('girlfriend'));


    set("camHUD.alpha",0)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)

    initShader('particles', 'particlesnew')--
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.85)
    setShaderProperty('particles', 'red', 1)
    setShaderProperty('particles', 'green', 8)
    setShaderProperty('particles', 'blue', 1)
    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 3)

    initShader("vcrchroma","vcrchroma")
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 0)
    setShaderProperty('vcrchroma', 'speed', 1.2)
    initShader('colorgame', 'ColorOverrideEffect')
    setCameraShader('game', 'colorgame')
    setShaderProperty('colorgame', 'red', 1.5)
    setShaderProperty('colorgame', 'green',1.5)
    setShaderProperty('colorgame', 'blue', 1.5)



    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'angle', 0)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2.5)
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
    setShaderProperty('mirror2', 'doChroma', true)


    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 50)

    
    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.003)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue', 1.5)


    initShader('heat', 'HeatEffect')
    setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty('heat', 'strength', 1)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)

    makeSprite('uno', 'uno', -3000, 150, 1)
	setObjectCamera('uno', 'hud')
	makeSprite('dos', 'dos', 3000, 150, 1)
	setObjectCamera('dos', 'hud')
	makeSprite('tres', 'tres', -3000, 150, 1)
	setObjectCamera('tres', 'hud')
	makeSprite('cuatro', 'cuatro', 3000, 150, 1)
	setObjectCamera('cuatro', 'hud')
end
local time = 0
local zoom = 1
local angle = 0
local nose = false
function update(elapsed)
    
    zoom = lerp(zoom, 1, math.min(1, elapsed*12))
    setShaderProperty('bump', 'zoom', zoom)
    if nose then
    angle = lerp(angle, 0, math.min(1, elapsed*10 ))
    setShaderProperty('mirror', 'angle', angle)
    end


    time = time +elapsed
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("heat","iTime",time)
    setCustomShaderFloat("vcrchroma","iTime",time)
end
local swap = -1
local punchs = false

function playerOneSing(a, b, c, d)
    if c == "Wiik3Punch" or c == "BoxingMatchPunch" then
        if punchs then
            swap = -swap
            zoom = 0.6
            angle = 25 * swap
        end
    end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function songStart()
    tweenShaderProperty("pixel","strength",0,crochet*0.001*8,"cubeOut")
    tweenShaderProperty("mirror","zoom",1,crochet*0.001*8,"cubeOut")
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*12,"cubeOut")
end
punchslol = {1096,1104,1120,1128,1131,1136,1148}
punchslolnose = {1092,1099,1102,1110,1116,1124,1134,1142,1153}
bumpbajo = {901,908,932,942,956,972,980,992,1004}
bumpalto = {905,920,936,939,968,976,987,1000,1006}
function stepHit()
    for i = 1, #punchslol do
        if curStep == punchslol [i] then
            angle = 25
        end
    end
    for i = 1, #punchslolnose do
        if curStep == punchslolnose [i] then
            angle = -25
        end
    end
    for i = 1, #bumpbajo do
        if curStep == bumpbajo [i] then
            zoom = 0.8
        end
    end
    for i = 1, #bumpalto do
        if curStep == bumpalto [i] then
            zoom = 0.7
        end
    end
    if curStep == 240 or curStep == 880 then
        tween("uno",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 244 or curStep == 884 then
        tween("uno",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("dos",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 248 or curStep == 888 then
        tween("dos",{x=2000},crochet*0.001*1,"cubeInOut")
        tween("tres",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 252 or curStep == 892 then
        tween("tres",{x=-2000},crochet*0.001*1,"cubeInOut")
        tween("cuatro",{x=300},crochet*0.001*1,"quartOut")
    elseif curStep == 256 or curStep == 896 then
        tween("cuatro",{x=2000},crochet*0.001*1,"cubeInOut")
    end
    if curStep == 112 then
        tweenShaderProperty("pixel","strength",50,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("bloom","contrast",0,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror","zoom",3,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror2","barrel",-0.5,crochet*0.001*4,"cubeIn")
    elseif curStep == 128 then
        tween("camHUD",{alpha = 1},crochet*0.001*8,"linear")
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*16,"cubeInOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*28,"cubeIn")
        tweenShaderProperty("pixel","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*31,"cubeIn")
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*31,"cubeIn")
    elseif curStep == 252 or curStep == 380 or curStep == 636 then
        tweenShaderProperty("mirror","zoom",2,crochet*0.001*0.5,"cubeOut")
        tweenShaderProperty("mirror","angle",-20,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 254 or curStep == 382 or curStep == 638 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*0.5,"cubeIn")
        tweenShaderProperty("mirror","angle",20,crochet*0.001*0.5,"cubeIn")
    elseif curStep == 256 or curStep == 384 or curStep == 640 then
        tweenShaderProperty("mirror","angle",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 320 then
        nose = true
        bloom(4,1,crochet,2,"cubeOut")
        angle = -25
    elseif curStep == 348 then
        angle = 25
        zoom = 0.5
    elseif curStep == 352 then
        angle = -25
        zoom = 0.5
    elseif curStep == 380 then
        nose = false
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 384 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeOut")
        setShaderProperty("vcrchroma","strength",1)
    elseif curStep == 390 then
        punchs = true
        nose = true
    elseif curStep == 508 then
        tweenShaderProperty("mirror","zoom",2,crochet*0.001*0.5,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 510 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*0.5,"cubeIn")
    elseif curStep == 512 then

        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("vcrchroma","strength",0)
    end
    if curStep == 636 or curStep == 954 then
        punchs = false
        nose = false
    end
    if curStep == 640 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeOut")
        setShaderProperty("vcrchroma","strength",1)
    elseif curStep == 646 then
        nose = true
        punchs = true
    elseif curStep == 664 then
        tweenShaderProperty("mirror","zoom",2,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 665 then
        punchs = false
    elseif curStep == 666 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*0.5,"cubeIn")
    elseif curStep >= 668 and curStep < 672 and curStep % 1 == 0 then
        angle = 25
    elseif curStep == 688 or curStep == 696 then
        tweenShaderProperty("mirror","zoom",1.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 692 then
        tweenShaderProperty("mirror","zoom",2.5,crochet*0.001*1,"cubeOut")
        nose = false
    elseif curStep == 700 then
        tweenShaderProperty("mirror","zoom",1.2,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror","angle",360,crochet*0.001*2,"cubeInOut")
    elseif curStep == 704 or curStep == 736 then
        nose = true
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 760 then
        tweenShaderProperty("mirror","zoom",2,crochet*0.001*1,"cubeOut")
    elseif curStep == 764 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("mirror2","barrel",-1,crochet*0.001*1,"cubeIn")
    elseif curStep == 768 then
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("vcrchroma","strength",0)
        nose = false
        punchs = false
    elseif curStep == 880 then
        tweenShaderProperty("mirror2","barrel",-1,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror","angle",-360,crochet*0.001*6,"cubeInOut")
        tweenShaderProperty("mirror","zoom",2.5,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("pixel","strength",5,crochet*0.001*4,"cubeIn")
        bloom(1,0,crochet,4,"cubeIn")
    end

    if curStep == 896 then
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*1,"cubeOut")
        setShaderProperty('colorgame', 'red', 0)
        setShaderProperty('colorgame', 'green',1)
        setShaderProperty('colorgame', 'blue', 0)
        setActorAlpha(0.5, 'blackBG');
        setShaderProperty('sobel', 'strength',0.8)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(1,1.5,crochet,1,"cubeOut")
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("pixel","strength",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("vcrchroma","strength",1)
        setActorColor("dad",0,0,0)
        setActorColor("boyfriend",0,0,0)
        setActorColor("girlfriend",0,0,0)
       -- setShaderProperty('colorfill', 'fade', 0)
    elseif curStep == 912 then
        setShaderProperty('pixel', 'strength',100)
        tweenShaderProperty("pixel","strength",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("mirror","zoom",3,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror","angle",-720,crochet*0.001*2,"cubeOut")
    elseif curStep == 916 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeIn")
    elseif curStep == 920 then
        tweenShaderProperty("mirror","zoom",3,crochet*0.001*2,"cubeIn")
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.02')
        nose = true
    elseif curStep == 928 then
        setShaderProperty('mirror', 'zoom',0.7)
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
        angle = -25
    elseif curStep == 944 or curStep == 950 then
        angle = 25
    elseif curStep == 947 then
        angle = -25
    elseif curStep == 952 then
        tweenShaderProperty("mirror","zoom",1.2,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")

    elseif curStep == 956 then
        tweenShaderProperty("mirror","angle",-360,crochet*0.001*2.5,"cubeInOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 960 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 968 then
        tweenShaderProperty("mirror","zoom",2,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror","angle",0,crochet*0.001*6,"cubeIn")
        bloom(1.5,0.3,crochet,4,"cubeIn")
    elseif curStep == 984 then
        nose = true
        angle = 0
        bloom(0.3,1.5,crochet,1,"cubeOut")
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.02')
    elseif curStep == 992 then
        tweenShaderProperty("mirror","zoom",1.25,crochet*0.001*1,"cubeOut")
    elseif curStep == 996 then
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"expoIn")
        nose = false
    elseif curStep == 1000 then
        tweenShaderProperty("mirror","zoom",3,crochet*0.001*6,"cubeIn")
        tweenShaderProperty("mirror","angle",-360,crochet*0.001*8,"cubeIn")
    elseif curStep == 1016 then
        bloom(1.5,0,crochet,2,"cubeIn")
        tweenShaderProperty("pixel","strength",60,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 1024 then
        nose = true
        tweenShaderProperty("pixel","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror","zoom",1,crochet*0.001*32,"linear")
        bloom(0,1,crochet,28,"cubeInOut")
        setShaderProperty("vcrchroma","strength",0)
        setShaderProperty('colorgame', 'red', 1.5)
        setShaderProperty('colorgame', 'green',1.5)
        setShaderProperty('colorgame', 'blue', 1.5)
        setActorAlpha(0, 'blackBG');
        setShaderProperty('sobel', 'strength',0)
        setActorColor("dad",255,255,255)
        setActorColor("boyfriend",255,255,255)
        setActorColor("girlfriend",255,255,255)
      --  setShaderProperty('colorfill', 'fade', 1)
    elseif curStep == 1148 then
        tweenShaderProperty("mirror2","barrel",-1,crochet*0.001*1,"cubeIn")
    elseif curStep == 1152 then
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1248 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 1272 then
        bloom(1,0,crochet,2,"cubeIn")
        tween("camHUD",{alpha = 0},crochet*0.001*2,"cubeIn")
    elseif curStep >= 1200 and curStep < 1249 then
            if curStep % 16 == 0 then
                zoom = 0.7
                tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
            elseif curStep % 16 == 8 then
                tweenShaderProperty("mirror2","barrel",-1,crochet*0.001*2,"cubeIn")
            end
        
    end
    if curStep == 672 then
    
        punchs = true
        bloom(4,1,crochet,2,"cubeOut")
    end

    if (curStep >= 1 and curStep < 128 or curStep >= 1024 and curStep < 1152) 
    and curStep % 16 == 0 then
        zoom = 0.9
    end
    if curStep >= 128 and curStep < 256 and curStep % 4 == 0 then
        zoom = 0.9
    end
    if curStep >= 704 and curStep < 768 then 
        if curStep % 16 == 0 then
           zoom = 0.85
        end
        if curStep % 16 == 8 then
            zoom = 0.7
         end
    end
    if curStep >= 768 and curStep < 880 then 
        if curStep % 32 == 0 then
           zoom = 0.7
        end
        if curStep % 32 == 8 or curStep % 32 == 16 
        or curStep % 32 == 24 then
            zoom = 0.85
         end
    end
    if (curStep >= 384 and curStep < 512 or curStep >= 640 and curStep < 704 or curStep >= 880 and curStep < 896 ) 
    and curStep % 4 == 0 then
        zoom = 0.8
    end
    if curStep >= 256 and curStep < 384 or curStep >= 512 and curStep < 640 or curStep >= 1152 and curStep < 1216  then
        if curStep % 32 == 0 or curStep % 32 == 20 then
            zoom = 0.7
        elseif curStep % 32 == 4 or curStep % 32 == 16 or curStep % 32 == 24 then
            zoom = 0.85
        end
    end
end

