local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0

function start(song)

    if not middlescroll then
		for i = 0,18 do
            tweenActorProperty(i,"alpha",0,0.1,"linear")
		end
    end
        
    print(song)

    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")

    createCustomShader("vcrshader", "vcrshader", 120)
      setCameraCustomShader("vcrshader", "game")

      createCustomShader("glitch", "glitch", 120)
    setCameraCustomShader("glitch", "game")
	setCameraCustomShader("glitch", "hud")

    removeCameraShader('game', 'glitch')
    removeCameraShader('hud', 'glitch')

      tweenFadeIn("boyfriend", 0,0.00001)

    tweenFadeIn("dadCharacter0", 0,0.00001)
    tweenFadeIn("dadCharacter1", 0,0.00001)
    tweenFadeIn("dadCharacter2", 0,0.00001)
    tweenFadeIn("dadCharacter3", 0,0.00001)

    makeSprite("green","green",0,0,0.5)
    setObjectCamera("green","hud")
    setActorAlpha(0,"green")

    makeSprite("uno-matt", "uno-matt", -2500, 100, 1.2)
    setObjectCamera("uno-matt", "hud")
    setActorAlpha(1, "uno-matt")
    
    makeSprite("dos-matt", "dos-matt", 2500, 100, 1.2)
    setObjectCamera("dos-matt", "hud")
    setActorAlpha(1, "dos-matt")
    
    makeSprite("tres-matt", "tres-matt", 200, 1100, 1.2)
    setObjectCamera("tres-matt", "hud")
    setActorAlpha(1, "tres-matt")
    
    makeSprite("cuatro-matt", "cuatro-matt", 200, -1100, 1.2)
    setObjectCamera("cuatro-matt", "hud")
    setActorAlpha(1, "cuatro-matt")


    showOnlyStrumsAltTrue()

end

function playerOneSing(a,b,c,d)
    if c == "Punch" then
        playCharacterAnimation('boyfriend', 'dodge', true)
        setCharacterPreventDanceForAnim('boyfriend', true)
    end
    if c == "Punch" then
        triggerEvent('Screen Shake','0.09,0.1','')
        miPene()
    end 
    if c == "bullet" then
        triggerEvent('Screen Shake','0.09,0.1','')
    end
end

function createPost()

    initShader('mirrorGame', 'MirrorRepeatEffect') --blur
    setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame','x',0)
    setShaderProperty('mirrorGame','y',0)
    setShaderProperty('mirrorGame','angle', 0)
    initShader('mirrorHud', 'MirrorRepeatEffect') --blur
    setCameraShader('hud', 'mirrorHud')
    setShaderProperty('mirrorHud', 'zoom', 1)
    setShaderProperty('mirrorHud','x',0)
    setShaderProperty('mirrorHud','y',0)
    setShaderProperty('mirrorHud','angle', 0)
    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
    setCameraShader('game', 'MirrorRepeatEffect')
    setCameraShader('hud', 'MirrorRepeatEffect')
    setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
    setShaderProperty('MirrorRepeatEffect','x',0)
    setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0)
    setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
    setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.25)
    initShader('barrel', 'BarrelBlurEffect')
  	setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
 	setShaderProperty('barrel', 'barrel', 0.0)
 	setShaderProperty('barrel', 'zoom', 1.0)
	setShaderProperty('barrel', 'doChroma', false)
	initShader("grayscale","GreyscaleEffect")
    setCameraShader('game', 'grayscale')
    setCameraShader('hud', 'grayscale')
    setShaderProperty("grayscale","strength", 1)
    initShader('bloom', 'BloomEffect')
	setCameraShader('game', 'bloom')
	setCameraShader('hud', 'bloom')
	setShaderProperty("bloom","contrast",1)

    makeText('Go', 'Go', 185,550,164)
    setActorFont("Go", "friday night.ttf")
    setActorScroll(0,0,'Go')
    setObjectCamera('Go', 'hud')
    setActorAlpha(0, "Go")

    makeText('Pico', 'Pico', 925,550,164)
    setActorFont("Pico", "friday night.ttf")
    setActorScroll(0,0,'Pico')
    setObjectCamera('Pico', 'hud')
    setActorAlpha(0, "Pico")

    makeText('GoUP', 'Go', 185,0,164)
    setActorFont("GoUP", "friday night.ttf")
    setActorScroll(0,0,'GoUP')
    setObjectCamera('GoUP', 'hud')
    setActorAlpha(0, "GoUP")

    makeText('PicoUp', 'Pico', 925,0,164)
    setActorFont("PicoUp", "friday night.ttf")
    setActorScroll(0,0,'PicoUp')
    setObjectCamera('PicoUp', 'hud')
    setActorAlpha(0, "PicoUp")

end

function cameraswinging()
    if curStep % 16 == 0 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 5, stepCrochet*0.001*4, "cubeOut")
    end
    if curStep % 16 == 4 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 0, stepCrochet*0.001*4, "cubeIn")
    end
    if curStep % 16 == 8 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", -5, stepCrochet*0.001*4, "cubeOut")
    end
    if curStep % 16 == 12 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 0, stepCrochet*0.001*4, "cubeIn")
    end
end

function cameraswinging2()
    if curStep % 20 == 0 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 5, stepCrochet*0.001*6, "cubeOut")
    end
    if curStep % 20 == 5 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 0, stepCrochet*0.001*6, "cubeIn")
    end
    if curStep % 20 == 10 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", -5, stepCrochet*0.001*6, "cubeOut")
    end
    if curStep % 20 == 15 then
        tweenShaderProperty("MirrorRepeatEffect", "angle", 0, stepCrochet*0.001*6, "cubeIn")
    end
end

function showOnlyStrumsAltTrue()
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

function showOnlyStrumsAltFalse()
    setProperty("healthBar","alpha",1)
    setProperty("healthBarBG","alpha",1)
    setProperty("infoTxt","alpha",1)
    setProperty("iconP1","alpha",1)
    setProperty("iconP2","alpha",1)
    setProperty("scoreTxt","alpha",1)
    setProperty("timeBar","alpha",1)
    setProperty("timeBarBG","alpha",1)
    setProperty("ratingsGroup","x",0)
	setProperty("ratingText","alpha",1)
end

function bloomBurst()
    setShaderProperty("bloom","contrast",2.5)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*6,"linear")
end

function MirrorNose2()
    setShaderProperty("MirrorRepeatEffect","zoom",0.9)
    tweenShaderProperty("MirrorRepeatEffect","zoom",1,crochet*0.001*2,"cubeOutIn")   
end

function miPene()
    beatSwap = beatSwap * -1
    setShaderProperty('MirrorRepeatEffect', 'angle', -10*beatSwap)
    tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*4,'cubeOut')
end

function camerabumpalt()
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

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.003)
    else
        setHealth(0.020)
    end
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('vcrshader', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end

function stepHit(curStep)

    --bloom

    if curStep == 704 or curStep == 768 or curStep == 1024 or curStep == 1216 or curStep == 1280 or curStep == 1584 or curStep == 1664 or curStep == 1728 or curStep == 1792 or curStep == 1856 or curStep == 1984 or curStep == 2048 or curStep == 2368 or curStep == 2432 or curStep == 2688 or curStep == 2880 or curStep == 2944 or curStep == 3136 or curStep == 3200 or curStep == 3456 or curStep == 3584 or curStep == 3648 or curStep == 3712 or curStep == 3840 or curStep == 3872 or curStep == 3904 or curStep == 3936 or curStep == 3968 or curStep == 4352 or curStep == 4416 or curStep == 4480 or curStep == 4544 then
       bloomBurst()
    end

    -- texto 

    if curStep == 1312 or curStep == 1696 or curStep == 2976 or curStep == 3360 or curStep == 3616 or curStep == 3744 then
        setActorAlpha(1, "GoUP")
        tweenFadeOut("GoUP", 0,0.39, "")
    end
    if curStep == 1316 or curStep == 1700 or curStep == 2980 or curStep == 3364 or curStep == 3620 or curStep == 3748 then
        setActorAlpha(1, "PicoUp")
        tweenFadeOut("PicoUp", 0,0.39, "")
    end

    if curStep == 1320 or curStep == 1704 or curStep == 2984 or curStep == 3368 or curStep == 3624 or curStep == 3752 then
        setActorAlpha(1, "Go")
        tweenFadeOut("Go", 0,0.39, "")
    end
    if curStep == 1324 or curStep == 1708 or curStep == 2988 or curStep == 3372 or curStep == 3628 or curStep == 3756 then
        setActorAlpha(1, "Pico")
        tweenFadeOut("Pico", 0,0.39, "")
    end
    -- counts 

    if curStep == 240 or curStep == 1200 or curStep == 1648 or curStep == 2864 or curStep == 3312 or curStep == 4208 then
        tweenPosOut("uno-matt",225,100,0.25)
    elseif curStep == 244 or curStep == 1204 or curStep == 1652 or curStep == 2868 or curStep == 3316 or curStep == 4212 then
        tweenPosOut("uno-matt",-1300,100,0.25)
        tweenPosOut("dos-matt",225,100,0.25)
    elseif curStep == 248 or curStep == 1208 or curStep == 1656 or curStep == 2872 or curStep == 3320 or curStep == 4216 then
        tweenPosOut("dos-matt",1300,100,0.25)
        tweenPosOut("tres-matt",200,125,0.25)
    elseif curStep == 252 or curStep == 1212 or curStep == 1660 or curStep == 2876 or curStep == 3324 or curStep == 4220 then
        tweenPosOut("tres-matt",200,1100,0.25)
        tweenPosOut("cuatro-matt",200,125,0.25)
    elseif curStep == 256 or curStep == 1216 or curStep == 1664 or curStep == 2880 or curStep == 3328 or curStep == 4224 then
        tweenPosOut("cuatro-matt",200,-1100,0.25)
    end
    if curStep == 1 then
        if not middlescroll then
            for i = 0,8 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-480,0.5,"linear")
            end
            for i = 9,18 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+480,0.5,"linear")
            end
        end
    end      
    if curStep == 129 then
        if not middlescroll then
            for i = 0,8 do
                tweenActorProperty(i,"alpha",1,1,"linear")
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"linear")
            end
        end
    end
    if curStep == 252 then
        if not middlescroll then
            for i = 9,18 do
                tweenActorProperty(i,"alpha",1,1,"linear")
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"linear")
            end
        end
    end
    if curStep == 2 then
        perlinYRange = 0.3
        perlinSpeed = 1.3
    end
    if curStep == 112 or curStep == 368 or curStep == 2224 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -4, crochet*0.001*4, 'cubeIn')
    elseif curStep == 127 or curStep == 384 or curStep == 2240 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*1, 'cubeOut')
    end
    if curStep == 128 then
        tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*12, "cubeInOut")
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, crochet*0.001*0.5, 'cubeOut')
        tweenShaderProperty('barrel', 'barrel', -2, crochet*0.001*0.5, 'cubeOut')
        flashCamera('hud', '#FFFFFF', 1.5)
        tweenFadeOut("dadCharacter1", 1,0.00001)
    elseif curStep == 132 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*3, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*3, 'cubeIn')
    elseif curStep == 160 or curStep == 416 or curStep == 496 or curStep == 1088 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 192 or curStep == 512 or curStep == 1152 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenFadeOut("dadCharacter3", 1,0.00001)
    elseif curStep == 256 then
        tweenFadeOut("boyfriend", 1,0.00001)
    elseif curStep == 288 or curStep == 1616 then
        tweenShaderProperty('mirrorGame', 'x', 0.5, stepCrochet*0.001*2, 'cubeInOut')
        triggerEvent('Set Camera Zoom','1.1','1')
    elseif curStep == 320 or curStep == 1632 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'cubeInOut')
        triggerEvent('Set Camera Zoom','0.5','1')
    elseif curStep == 360 or curStep == 368 or curStep == 372 or curStep == 376 or curStep == 380 or curStep == 1128 or curStep == 1136 or curStep == 1140 or curStep == 1144 or curStep == 1148 or curStep == 1152 or curStep == 2288 or curStep == 2296 or curStep == 2300 then
        miPene()   
    elseif curStep == 384 then
        tweenFadeOut("dadCharacter2", 1,0.00001)
    elseif curStep == 448 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenFadeOut("dadCharacter0", 1,0.00001)
    elseif curStep == 512 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 560 or curStep == 628 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*4, 'cubeOut')
    elseif curStep == 572 or curStep == 640 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 656 then
        tweenShaderProperty('mirrorGame', 'x', 3, stepCrochet*0.001*8, 'cubeInOut')
    end
    if curStep == 704 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'linear')
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*10, 'cubeInOut')
        triggerEvent('Screen Shake','1.2,0.02','')
    elseif curStep == 736 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*4, 'cubeOut')
    elseif curStep == 768 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 832 then
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*12, 'cubeOut')
        triggerEvent('Screen Shake','1.2,0.02','')
    elseif curStep == 896 or curStep == 960 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -6)
	   tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
       tweenShaderProperty('mirrorGame', 'angle', 340, stepCrochet*0.001*1, 'cubeOut')
       tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 904 or curStep == 968 then
        tweenShaderProperty('mirrorGame', 'angle', 380, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 912 then
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'y', 3, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 928 then
        tweenShaderProperty('mirrorGame', 'y', -4, stepCrochet*0.001*25, 'linear')
    elseif curStep == 944 or curStep == 1008 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*10, 'linear')
    elseif curStep == 961 or curStep == 1024 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 976 then
        tweenShaderProperty('mirrorGame', 'y', -3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*1, 'cubeOut')
    elseif curStep == 992 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*25, 'linear')
    elseif curStep == 1040 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 1136 or curStep == 2800 then
        triggerEvent('Screen Shake','1.2,0.02','')
    end
    if curStep == 448 or curStep == 1024 or curStep == 1056 or curStep == 1088 or curStep == 1120 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2)
	   tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1216 or curStep == 1344 or curStep == 2880 or curStep == 3008 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 1280 or curStep == 1408 or curStep == 2944 or curStep == 3072 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    -- una parte del primer drop

    if curStep == 1144 or curStep == 1208 or curStep == 1334 or curStep == 1720 or curStep == 1848 or curStep == 2872 or curStep == 3000 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1146 or curStep == 1210 or curStep == 1336 or curStep == 1722 or curStep == 1852 or curStep == 2874 or curStep == 3002 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1147 or curStep == 1211 or curStep == 1337 or curStep == 1723 or curStep == 1853 or curStep == 2875 or curStep == 3003 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1148 or curStep == 1212 or curStep == 1338 or curStep == 1724 or curStep == 1854 or curStep == 2876 or curStep == 3004 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1152 or curStep == 1216 or curStep == 1342 or curStep == 1728 or curStep == 1858 or curStep == 2880 or curStep == 3008 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end

    -- antes del primer drop

    if curStep == 1152 or curStep == 2816 then
        tweenShaderProperty('barrel', 'barrel', -0.25, crochet*0.001*2, 'cubeOut')
        flashCamera('hud', '#FFFFFF', 1.5)
    elseif curStep == 1184 or curStep == 1248 or curStep == 1392 or curStep == 2848 or curStep == 2912 or curStep == 2992 or curStep == 3056 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
        triggerEvent('Screen Shake','1.2,0.02','')
    elseif curStep == 1200 or curStep == 1264 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1280 or curStep == 2944 then
        tweenShaderProperty('barrel', 'barrel', -0.5, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1408 or curStep == 3072 then
        tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1584 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.8, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1590 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.6, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -10, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1596 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.5, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 10, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1600 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -4)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1664 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.5, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1920 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -10)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1920 or curStep == 4096 or curStep == 3072 then
        perlinYRange = 0.3
        perlinSpeed = 1.3
        perlinXRange = 0
        perlinzRange = 0
    end
    if curStep >= 1152 and curStep < 1408 then
        camerabumpalt()
    elseif curStep >= 2816 and curStep < 3072 then
        camerabumpalt()
    end
    if curStep >= 1408 and curStep < 1632 then
        cameraswinging()
    elseif curStep >= 1984 and curStep < 2240 then
        cameraswinging()
    elseif curStep >= 3072 and curStep < 3296 then
        cameraswinging()
    elseif curStep >= 4096 and curStep < 4592 then
        cameraswinging2()
    end
    if curStep == 1456 or curStep == 1520 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1472 or curStep == 1536 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 1648 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1648+4 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1660 then 
        tweenShaderProperty('MirrorRepeatEffect', 'y', 4, crochet*0.001*4, 'cubeInOut')
    end
    if (curStep >= 144 and curStep < 358) or (curStep >= 1040 and curStep < 1120) or (curStep >= 2704 and curStep < 2784) then  
        if curStep % 16 == 0 then
            MirrorNose2()
            miPene()
        end
    end
    if (curStep >= 384 and curStep < 1024) or (curStep >= 2304 and curStep < 2688) then  
        if curStep % 16 == 0 then
            MirrorNose2()
            miPene()
		elseif curStep % 16 == 8 then
			MirrorNose2()
            miPene()
        end
    end
    if curStep == 1280 or curStep == 2944 or curStep == 4096 then
        if not middlescroll then
            for i = 1,9 do 
                for i = 1,9 do
                    tweenPosOut(i-1,getActorX(i-1)+330,getActorY(i-1),0.85)
                end
            end
            for i = 9,17 do
                tweenFadeOut(i,0,0.85)
            end
        end
    end
    if curStep == 1340 or curStep == 3004 or curStep == 4346 then
        if not middlescroll then
            tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)-300,getActorY(i-1),0.85)
                    tweenFadeIn(i-1,1,0.85)
                end
            end
            for i= 1,9 do
                for i = 1,9 do
                    tweenPosOut(i-1,getActorX(i-1)-350,getActorY(i-1),0.85)
                end
                tweenFadeOut(i-1,0,0.85)
            end
        end
    end
    if curStep == 1408 or curStep == 3068 then
        tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
        if not middlescroll then
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)+300,getActorY(i-1),0.85)
                end
            end
            for i = 0,9 do
                for i = 0,9 do
                    tweenPosOut(i-1,getActorX(i-1)+20,getActorY(i-1),0.85)
                end
            end
            for i = 0,8 do
                tweenFadeIn(i,1,0.85)
            end
        end
    end    

    -- primer drop y los colores

    if curStep == 1664 then
        tweenFadeIn("green",0.5,0.2,"")
        flashCamera('hud', '#FFFFFF', 1.5)
        perlinXRange = 0.25
        perlinYRange = 0.2
        perlinZRange = 12
        perlinSpeed = 1.7
    end
    if curStep == 1272 or curStep == 1400 or curStep == 1784 or curStep == 1912 or curStep == 2232 or curStep == 2296 or curStep == 2424 or curStep == 2936 or curStep == 3064 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1276 or curStep == 1404 or curStep == 1788 or curStep == 1916 or curStep == 2236 or curStep == 2300 or curStep == 2428 or curStep == 2940 or curStep == 3068 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1280 or curStep == 1408 or curStep == 1792 or curStep == 1920 or curStep == 2240 or curStep == 2304 or curStep == 2432 or curStep == 2944 or curStep == 3072 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1696 or curStep == 1760 or curStep == 1824 or curStep == 1888 then
        triggerEvent('Screen Shake','2.5,0.02','')
    end
    if curStep == 1712 or curStep == 1776 or curStep == 1824 or curStep == 1888 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1724 or curStep == 1852 or curStep == 2240 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 1788 or curStep == 1916 or curStep == 2304 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 1984 then
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 2016 or curStep == 2112 or curStep == 2208 or curStep == 2064 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2048 or curStep == 2160 or curStep == 2104 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
    end
    if curStep == 2112 or curStep == 2176 then
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2128 then
        tweenShaderProperty('mirrorGame', 'x', -2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2144 or curStep == 2208 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2160 or curStep == 2224 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2192 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 1152 or curStep == 1664 or curStep == 1792 or curStep == 2816 or curStep == 3328 or curStep == 3584 then
        if not middlescroll then
            for i = 13,18 do
                tweenActorProperty(i,"alpha",0,1,"linear")
            end
            for i = 9,12 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+180,0.5,"linear")
            end
        end
    end
    if curStep == 1212 or curStep == 1722 or curStep == 1852 or curStep == 2876 or curStep == 3452 or curStep == 3836 then
        if not middlescroll then
            for i = 13,18 do
                tweenActorProperty(i,"alpha",1,0.5,"linear")
            end
            for i = 9,12 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+15,0.5,"linear")
            end
        end
    end
    if (curStep >= 1664 and curStep < 1920) or (curStep >= 3328 and curStep < 4096) then
        if curStep % 20 == 0 then
            tweenStageColorSwap('hue', 0, crochet*0.001*1, 'linear')
            MirrorNose2()
        elseif curStep % 20 == 2 then
            tweenStageColorSwap('hue', 0.2, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 4 then
            tweenStageColorSwap('hue', 0.1, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 6 then
            tweenStageColorSwap('hue', 0.3, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 8 then
            tweenStageColorSwap('hue', 0.5, crochet*0.001*1, 'linear')
            MirrorNose2()
        elseif curStep % 20 == 10 then
            tweenStageColorSwap('hue', 0.4, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 12 then
            tweenStageColorSwap('hue', 0.6, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 14 then
            tweenStageColorSwap('hue', 0.8, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 16 then
            tweenStageColorSwap('hue', 0.7, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 18 then
            tweenStageColorSwap('hue', 0.9, crochet*0.001*1, 'linear')
        elseif curStep % 20 == 20 then
            tweenStageColorSwap('hue', 1.0, crochet*0.001*1, 'linear')
        end
    end

    -- continuacion

    if curStep == 2240 then
        tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*1, "cubeOut")
        flashCamera('hud', '#FFFFFF', 1.5)
        tweenShaderProperty('vignette', 'size', 0.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2256 then
        MirrorNose2()
    elseif curStep == 2272 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2304 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*1, "cubeOut")
        flashCamera('hud', '#FFFFFF', 1.5)
        tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 2320 or curStep == 2384 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.65, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 2360 or curStep == 2808 or curStep == 3190 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 2362 or curStep == 2810 or curStep == 3192 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 2363 or curStep == 2811 or curStep == 3193 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 2364 or curStep == 2812 or curStep == 3194 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 2368 or curStep == 2816 or curStep == 3198 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 2432 then
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*12, 'cubeOut')
        triggerEvent('Screen Shake','1.2,0.02','')
    elseif curStep == 2464 then
        tweenShaderProperty('mirrorGame', 'angle', 420, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2472 then
        tweenShaderProperty('mirrorGame', 'angle', 345, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2476 then
        tweenShaderProperty('mirrorGame', 'angle', 360, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2480 or curStep == 2544 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2492 or curStep == 2556 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2496 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == 2528 then
        tweenShaderProperty('mirrorGame', 'angle', 70, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2536 then
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2540 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 2560 or curStep == 2624 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -6)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -20, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2568 or curStep == 2630 then
        tweenShaderProperty('mirrorGame', 'angle', 20, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2576 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'y', 3, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2592 then
        tweenShaderProperty('mirrorGame', 'y', -4, stepCrochet*0.001*25, 'linear')
    elseif curStep == 2640 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'y', -3, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 2656 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*25, 'linear')
    elseif curStep == 2608 or curStep == 2672 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, stepCrochet*0.001*10, 'linear')
    elseif curStep == 2625 or curStep == 2688 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 2792 or curStep == 2800 or curStep == 2804 or curStep == 2808 or curStep == 2812 or curStep == 2816 then
        miPene()
    end
    if curStep == 2688 or curStep == 2720 or curStep == 2752 or curStep == 2784 then
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2)
	   tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 3120 or curStep == 3248 then
        tweenShaderProperty('mirrorGame', 'angle', 70, stepCrochet*0.001*6, 'cubeIn')
    elseif curStep == 3136 or curStep == 3264 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 3152 or curStep == 3280 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 3168 or curStep == 3296 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3200 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 3308 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*2, 'cubeInOut')
    end
    if curStep == 3312 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, crochet*0.001*2, 'cubeOut')
    elseif curStep == 3316 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 3324 then 
        tweenShaderProperty('MirrorRepeatEffect', 'y', 6, crochet*0.001*4, 'cubeInOut')
    end
    if curStep == 2816 then
        perlinXRange = 0.25
        perlinYRange = 0.2
        perlinZRange = 12
        perlinSpeed = 1.7
    end

    -- segundo drop 
    if curStep == 3328 then
        tweenFadeIn("green",0.5,0.2,"")
        flashCamera('hud', '#FFFFFF', 1.5)
        perlinXRange = 0.25
        perlinYRange = 0.2
        perlinZRange = 12
        perlinSpeed = 1.7
    end
    if curStep == 3360 or curStep == 3424 or curStep == 3488 or curStep == 3552 or curStep == 3616 or curStep == 3680 then
        triggerEvent('Screen Shake','2.5,0.02','')
    end
    if curStep == 3360 or curStep == 3424 or curStep == 3488 or curStep == 3552 or curStep == 3616 or curStep == 3680 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3384 or curStep == 3512 or curStep == 3640 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3386 or curStep == 3514 or curStep == 3642 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 3387 or curStep == 3515 or curStep == 3643 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 3388 or curStep == 3516 or curStep == 3644 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3392 or curStep == 3520 or curStep == 3648 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3392 or curStep == 3520 or curStep == 3648 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 3456 or curStep == 3584 or curStep == 3712 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 3448 or curStep == 3576 or curStep == 3704 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3452 or curStep == 3580 or curStep == 3708 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3456 or curStep == 3584 or curStep == 3712 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end

    -- ultimo drop
    if curStep == 3712 then
        triggerEvent('Screen Shake','2.5,0.03','')
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
        flashCamera('hud', '#FFFFFF', 1)
    end
    if curStep == 3736 or curStep == 3800 or curStep == 3864 or curStep == 3928 or curStep == 3992 or curStep == 4056 or curStep == 4152 or curStep == 4344 or curStep == 4472 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3738 or curStep == 3802 or curStep == 3866 or curStep == 3930 or curStep == 3994 or curStep == 4058 or curStep == 4154 or curStep == 4346 or curStep == 4474 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 3739 or curStep == 3803 or curStep == 3867 or curStep == 3931 or curStep == 3995 or curStep == 4059 or curStep == 4153 or curStep == 4347 or curStep == 4475 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 3740 or curStep == 3804 or curStep == 3868 or curStep == 3932 or curStep == 3996 or curStep == 4060 or curStep == 4154 or curStep == 4348 or curStep == 4476 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3744 or curStep == 3808 or curStep == 3872 or curStep == 3936 or curStep == 4000 or curStep == 4064 or curStep == 4158 or curStep == 4352 or curStep == 4480 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3744 or curStep == 3776 or curStep == 3848 or curStep == 3872 or curStep == 3936 or curStep == 3968 or curStep == 4196 or curStep == 4452 then
        triggerEvent('Screen Shake','2.5,0.02','')
    end
    if curStep == 3752 or curStep == 3784 or curStep == 3816 or curStep == 3848 or curStep == 3880 or curStep == 3912 or curStep == 3976 or curStep == 4008 or curStep == 4040 or curStep == 4072 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3768 or curStep == 3832 or curStep == 3896 or curStep == 3960 or curStep == 4024 or curStep == 4088 or curStep == 4216 or curStep == 4408 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3772 or curStep == 3836 or curStep == 3900 or curStep == 3964 or curStep == 4028 or curStep == 4092 or curStep == 4220 or curStep == 4412 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 3776 or curStep == 3840 or curStep == 3904 or curStep == 3968 or curStep == 4032 or curStep == 4096 or curStep == 4224 or curStep == 4416 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 3840 or curStep == 3904 or curStep == 4032 or curStep == 4352 then
        tweenShaderProperty('mirrorGame', 'x', 2, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 3872 or curStep == 3968 or curStep == 4224 or curStep == 4480 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    end
    if curStep == 4032 or curStep == 4040 or curStep == 4048 or curStep == 4056 or curStep == 4064 or curStep == 4072 or curStep == 4080 or curStep == 4088 then
        triggerEvent('Screen Shake','0.1,0.02','')
    end
    if curStep == 4080 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -4, crochet*0.001*4, 'cubeIn')
    elseif curStep == 4096 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*1, 'cubeOut')
    end
    if curStep == 3584 or curStep == 3840 then
        perlinXRange = 0.25
        perlinYRange = 0.2
        perlinZRange = 12
        perlinSpeed = 2
    elseif curStep == 3712 or curStep == 3968 then
        perlinXRange = 0.3
        perlinYRange = 0.2
        perlinZRange = 15
        perlinSpeed = 2.3
    end
    if curStep == 1920 then
        tweenFadeOut("green",0,0.1,"")
        tweenStageColorSwap('hue', 0, crochet*0.001*1, 'linear')
    end
    if curStep == 4096 then
        tweenFadeOut("green",0,0.1,"")
        tweenStageColorSwap('hue', 0, crochet*0.001*1, 'linear')
        tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*1, "cubeOut")
        flashCamera('hud', '#FFFFFF', 1.5)
        tweenShaderProperty('vignette', 'size', 0.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('barrel', 'barrel', -0.3, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 4128 or curStep == 4192 or curStep == 4256 or curStep == 4304 or curStep == 4384 or curStep == 4448 or curStep == 4512 or curStep == 4560 or curStep == 672 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.7, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 4228 or curStep == 4544 or curStep == 704 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 4596 then
        tweenShaderProperty('barrel', 'barrel', -3, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 4608 then
        flashCamera('hud', '#FFFFFF', 1.5)
        tweenFadeOut("BlackBox",1,0.5,"")
    end
    if curStep == 3328 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0.5, crochet*0.001*2, 'cubeIn')
    elseif curStep == 3584 or curStep == 3840 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 3712 or curStep == 3968 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1.3, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 32 then
        tweenFadeOut("BlackBox",0,1.15,"")
    end
    if curStep == 224 or curStep == 912 or curStep == 976 or curStep == 1440 or curStep == 1488 or curStep == 1952 or curStep == 2432 or curStep == 2800 then
        triggerEvent('Set Camera Zoom','0.95','1')
    end
    if curStep == 256 or curStep == 928 or curStep == 992 or curStep == 1456 or curStep == 1520 or curStep == 1984 or curStep == 2448 or curStep == 2816 then
        triggerEvent('Set Camera Zoom','0.5','1')
    end
    if curStep == 192 or curStep == 320 or curStep == 384 or curStep == 512 or curStep == 640 or curStep == 704 or curStep == 832 or curStep == 920 or curStep == 1048 or curStep == 2432 or curStep == 2584 or curStep == 2648 or curStep == 2744 or curStep == 2808 then
        for i = 0, 18 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
     end
    if curStep == 1128 then
        playCharacterAnimation('dadCharacter3', 'trans', true)
    end
    if curStep == 2304 or curStep == 4096 then
        playCharacterAnimation('boyfriend', 'reaction', true)
    end
    if curStep == 2436 then
        playCharacterAnimation('boyfriend', 'hey', true)
    end
    if curStep == 2792 then
        playCharacterAnimation('dadCharacter3', 'trans', true)
    end
    if curStep == 1935 then
        playCharacterAnimation('dadCharacter3', 'destrans', true)
    end
end
