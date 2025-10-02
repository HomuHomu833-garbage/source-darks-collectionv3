local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0.0
local dodgeAnim = 0
local dodgeMap = {
	{'singLEFT', 'dodgeLEFT'},
	{'singDOWN', 'dodgeDOWN'},
	{'singUP', 'dodgeUP'},
	{'singRIGHT', 'dodgeRIGHT'}
}

function update(elapsed)

    time = time + elapsed
	setCustomShaderFloat('smoke', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))
    

end

function start()
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")


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

    if not middlescroll then
		for i = 0,3 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.01,"linear")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
		end
        for i = 4,7 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.01,"linear")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
		end
    end

end

function createPost()
    initShader('barrelEffectChroma', 'BarrelBlurEffect') --con el chromaxdxddxdx
	setCameraShader('game', 'barrelEffectChroma')
	setCameraShader('hud', 'barrelEffectChroma')
	setShaderProperty('barrelEffectChroma', 'barrel', -0.15)
	setShaderProperty('barrelEffectChroma', 'zoom', 1.0)
    setShaderProperty('barrelEffectChroma', 'doChroma', true)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.7)
    initShader('mirrorGame', 'MirrorRepeatEffect') --blur
    setCameraShader('game', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame','x',0)
    setShaderProperty('mirrorGame','y',0)
    setShaderProperty('mirrorGame','angle', 0)
    initShader('bloom', 'BloomEffect')
	setCameraShader('game', 'bloom')
	setCameraShader('hud', 'bloom')
    setShaderProperty("bloom","contrast",1)
    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'doChroma', true)
    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 0.3)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
	setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
    initShader("grayscale","GreyscaleEffect")
	setCameraShader('game', 'grayscale')
	setCameraShader('hud', 'grayscale')
	setShaderProperty("grayscale","strength",1)
    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.04)
	setCustomShaderFloat('smoke', 'smokeStrength', 0.45)

    initShader('ScanlineEffect', 'ScanlineEffect')
    setCameraShader('game', 'ScanlineEffect')
    setShaderProperty('ScanlineEffect', 'strength', 8)
    setShaderProperty('ScanlineEffect', 'pixelsBetweenEachLine', 10)

    initShader('mirrorHud', 'MirrorRepeatEffect') --blur
    setCameraShader('hud', 'mirrorHud')
    setShaderProperty('mirrorHud', 'zoom', 1)
    setShaderProperty('mirrorHud','x',0)
    setShaderProperty('mirrorHud','y',0)
    setShaderProperty('mirrorHud','angle', 0)
end

function bloomBurst()
    setShaderProperty("bloom","contrast",3)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"linear")
end

function miPene()
    beatSwap = beatSwap * -1
    setShaderProperty('MirrorRepeatEffect', 'angle', -10*beatSwap)
    tweenShaderProperty('MirrorRepeatEffect','angle',0,stepCrochet*0.001*4,'cubeOut')
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

function stepHit (step)
    if curStep == 224 or curStep == 1504 then
        tweenPosOut("uno-matt",225,100,0.25)
    elseif curStep == 232 or curStep == 1512 then
        tweenPosOut("uno-matt",-1300,100,0.25)
        tweenPosOut("dos-matt",225,100,0.25)
    elseif curStep == 240 or curStep == 1520 then
        tweenPosOut("dos-matt",1300,100,0.25)
        tweenPosOut("tres-matt",200,125,0.25)
    elseif curStep == 248 or curStep == 1528 then
        tweenPosOut("tres-matt",200,1100,0.25)
        tweenPosOut("cuatro-matt",200,125,0.25)
    elseif curStep == 256 or curStep == 1536 then
        tweenPosOut("cuatro-matt",200,-1100,0.25)
    end
    if curStep == 1 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*50, 'cubeIn')
		tweenFadeOut("BlackBox",0,9,"")
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.85
    end
    if curStep == 128 or curStep == 1408 then
        if not middlescroll then
            for i = 0,0 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
            for i = 4,4 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
        end
    elseif curStep == 144 or curStep == 1424 then
        if not middlescroll then
            for i = 1,1 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
            for i = 5,5 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
        end
    elseif curStep == 160 or curStep == 1440 then
        if not middlescroll then
            for i = 2,2 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
            for i = 6,6 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
        end
    elseif curStep == 176 or curStep == 1456 then
        if not middlescroll then
            for i = 3,3 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
            for i = 7,7 do
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+10,0.5,"linear")
            end
        end
    elseif curStep == 192 or curStep == 1472 then
        if not middlescroll then
            for i = 0,3 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.5,"cubeOut")
            end
        end
    elseif curStep == 208 or curStep == 1488 then
        if not middlescroll then
            for i = 4,7 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.5,"cubeOut")
            end
        end
    end
    if curStep == 248 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 249 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 250 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 251 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 255 then
        bloomBurst()
        tweenShaderProperty('grayscale', 'strength', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('vignette', 'size', 0.25)
        tweenShaderProperty('mirrorGame', 'y', -2, stepCrochet*0.001*6, 'cubeInOut')
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
    if curStep == 376 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 380 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 384 then
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
    end
    if curStep == 416 or curStep == 480 or curStep == 1696 or curStep == 1760 or curStep == 2720 or curStep == 2784 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.4, crochet*0.001*2, 'cubeIn')
        triggerEvent('Screen Shake','1.2,0.02','')
    elseif curStep == 448 or curStep == 512 or curStep == 1728 or curStep == 1790 or curStep == 2752 or curStep == 2816 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 512 or curStep == 639 or curStep == 1023 or curStep == 1791 or curStep == 2303 then
        bloomBurst()
        triggerEvent("Screen Shake","1,0.004","1,0.004")
    end
    if curStep == 528 or curStep == 544 or curStep == 576 or curStep == 608 or curStep == 623 or curStep == 736 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeIn')
        triggerEvent("Screen Shake","0.55,0.02","")
    elseif curStep == 540 or curStep == 572 or curStep == 604 or curStep == 620 or curStep == 760 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    end

    if curStep == 568 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 569 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 570 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 571 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 575 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end

    if curStep == 632 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 633 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 634 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 635 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 639 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end

    if curStep == 667 or curStep == 792 or curStep == 856 or curStep == 952 or curStep == 1048 or curStep == 1112 or curStep == 1208 then
        tweenShaderProperty('mirrorGame', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 670 or curStep == 795 or curStep == 859 or curStep == 955 or curStep == 1051 or curStep == 1115 or curStep == 1211 then
        tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 674 or curStep == 799 or curStep == 863 or curStep == 959 or curStep == 1055 or curStep == 1119 or curStep == 1215 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end
    if curStep == 696 or curStep == 824 or curStep == 920 or curStep == 984 or curStep == 1080 or curStep == 1176 or curStep == 1240 then
        tweenShaderProperty('mirrorGame', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 699 or curStep == 827 or curStep == 923 or curStep == 987 or curStep == 1083 or curStep == 1179 or curStep == 1243 then
        tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 703 or curStep == 831 or curStep == 927 or curStep == 991 or curStep == 1087 or curStep == 1183 or curStep == 1247 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end
    if curStep == 720 or curStep == 736 or curStep == 743 or curStep == 752 or curStep == 760 or curStep == 1984 or curStep == 2000 or curStep == 2016 or curStep == 2026 or curStep == 2032 or curStep == 2040 then
        miPene()
    end
    if curStep == 752 or curStep == 880 or curStep == 1008 or curStep == 1136 or curStep == 2032 or curStep == 2160 or curStep == 2288 or curStep == 2416 or curStep == 2544 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -4, crochet*0.001*4, 'cubeIn')
    elseif curStep == 768 or curStep == 896 or curStep == 1024 or curStep == 1152 or curStep == 2048 or curStep == 2176 or curStep == 2304 or curStep == 2432 or curStep == 2560 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*1, 'cubeOut')
    end
    if curStep == 768 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*6, 'cubeInOut')
        bloomBurst()
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.90
    elseif curStep == 800 or curStep == 928 or curStep == 1056 or curStep == 1184 then
        tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 832 or curStep == 880 or curStep == 960 or curStep == 1024 or curStep == 1088 or curStep == 1136 or curStep == 1256 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 864 or curStep == 992 or curStep == 1120 or curStep == 1216 then
        tweenShaderProperty('mirrorGame', 'x', -1, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 896 or curStep == 1156 then
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*6, 'cubeInOut')
    end
    if curStep == 784 or curStep == 832 or curStep == 912 or curStep == 928 or curStep == 960 or curStep == 1040 or curStep == 1088 or curStep == 1104 or curStep == 1168 or curStep == 1184 or curStep == 1216 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeIn')
        triggerEvent("Screen Shake","0.55,0.02","")
    elseif curStep == 800 or curStep == 870 or curStep == 924 or curStep == 956 or curStep == 992 or curStep == 1056 or curStep == 1100 or curStep == 1112 or curStep == 1180 or curStep == 1212 or curStep == 1240 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    end
    if curStep == 880 or curStep == 1136 then
        triggerEvent("Screen Shake","1.25,0.03","")
    end
    if curStep == 1024 or curStep == 2304 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*6, 'cubeInOut')
    end
    if curStep == 1263 then
        tweenShaderProperty('mirrorGame', 'zoom', -0.85, crochet*0.001*5, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', -2, crochet*0.001*5, 'cubeOut')
	end
    if curStep == 1279 then
        showOnlyStrumsAltTrue()
        flashCamera('hud', '#000000', 4.5)
        setShaderProperty('MirrorRepeatEffect', 'barrel', -2)
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, crochet*0.001*5, 'cubeOut')
		setShaderProperty('mirrorGame', 'zoom', 0.5)
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('grayscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.85
        if not middlescroll then
            for i = 0,3 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.01,"linear")
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
            end
            for i = 4,7 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.01,"linear")
                tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+700,0.01,"linear")
            end
        end
    elseif curStep == 1288 then
        setShaderProperty('vignette', 'size', 0.7)
        tweenShaderProperty('mirrorGame ', 'zoom', 1, crochet*0.001*50, 'cubeIn')
    end
    if curStep == 1528 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1529 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1530 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1531 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1535 then
        bloomBurst()
        tweenShaderProperty('grayscale', 'strength', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('vignette', 'size', 0.25)
        tweenShaderProperty('mirrorGame', 'y', -2, stepCrochet*0.001*6, 'cubeInOut')
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
    if curStep == 1656 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1660 then 
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1664 then
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'cubeInOut')
    end
    if curStep == 1808 or curStep == 1824 or curStep == 1840 or curStep == 1872 or curStep == 1888 or curStep == 1904 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeIn')
        triggerEvent("Screen Shake","0.55,0.02","")
    elseif curStep == 1820 or curStep == 1836 or curStep == 1884 or curStep == 1900 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    end

    if curStep == 1912 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1913 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1914 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1915 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1919 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    end

    if curStep == 1848 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.125, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 35, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1849 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.25, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1850 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.5, stepCrochet*0.001*1, 'cubeOut')
    end
    if curStep == 1851 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1856 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end

    if curStep == 1944 or curStep == 2072 or curStep == 2136 or curStep == 2232 or curStep == 1048 or curStep == 1112 or curStep == 1208 then
        tweenShaderProperty('mirrorGame', 'angle', 25, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1947 or curStep == 2075 or curStep == 2139 or curStep == 2235 or curStep == 1051 or curStep == 1115 or curStep == 1211 then
        tweenShaderProperty('mirrorGame', 'angle', -10, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1951 or curStep == 2079 or curStep == 2143 or curStep == 2239 or curStep == 1055 or curStep == 1119 or curStep == 1215 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end
    if curStep == 1976 or curStep == 2104 or curStep == 2200 or curStep == 2264 or curStep == 1080 or curStep == 1176 or curStep == 1240 then
        tweenShaderProperty('mirrorGame', 'angle', -25, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 1979 or curStep == 2107 or curStep == 2203 or curStep == 2267 or curStep == 1083 or curStep == 1179 or curStep == 1243 then
        tweenShaderProperty('mirrorGame', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1983 or curStep == 2111 or curStep == 2207 or curStep == 2271 or curStep == 1087 or curStep == 1183 or curStep == 1247 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        bloomBurst()
    end
    if curStep == 2064 or curStep == 2112 or curStep == 2160 or curStep == 2208 or curStep == 2240 or curStep == 2320 or curStep == 2368 or curStep == 2384 or curStep == 2400 or curStep == 2416 or curStep == 2448 or curStep == 2464 or curStep == 2496 then
        tweenShaderProperty('mirrorGame', 'zoom', 0.5, stepCrochet*0.001*2, 'cubeIn')
        triggerEvent("Screen Shake","0.55,0.02","")
    elseif curStep == 2080 or curStep == 2156 or curStep == 2176 or curStep == 2236 or curStep == 2252 or curStep == 2336 or curStep == 2380 or curStep == 2396 or curStep == 2412 or curStep == 2432 or curStep == 2460 or curStep == 2492 or curStep == 2508 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
    end
    if curStep == 2160 or curStep == 2416 then
        triggerEvent("Screen Shake","1.25,0.03","")
    end
    if curStep == 1791 then
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.90
    end
    if curStep == 1919 then
        bloomBurst()
        triggerEvent("Screen Shake","1,0.004","1,0.004")
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.85
    end
    if curStep == 2047 then
        tweenShaderProperty('mirrorGame', 'y', 2, stepCrochet*0.001*6, 'cubeInOut')
        bloomBurst()
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.90
    elseif curStep == 2064 or curStep == 2208 or curStep == 2336 or curStep == 2464 then
        tweenShaderProperty('mirrorGame', 'x', 1, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2112 or curStep == 2160 or curStep == 2240 or curStep == 2304 or curStep == 2368 or curStep == 2432 or curStep == 2496 then
        tweenShaderProperty('mirrorGame', 'x', 0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2144 or curStep == 2272 or curStep == 1120 or curStep == 2400 then
        tweenShaderProperty('mirrorGame', 'x', -1, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2176 or curStep == 2432 then
        tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*6, 'cubeInOut')
    end
    if curStep == 2559 then
        setShaderProperty('vignette', 'size', 0)
        bloomBurst()
        perlinXRange = 0.2 
		perlinYRange = 0.2 
		perlinZRange = 12.5 
		perlinSpeed = 0.85
    end
    if curStep == 2607 then
        tweenFadeIn("BlackBox",0.7,5,"")
    end
    if curStep == 2798 then
        tweenFadeOut("BlackBox",0,1,"")
    end
    if curStep == 2815 then
        triggerEvent("camera flash","white","1")
    end
    if curStep == 2816 then
        tweenFadeOut("BlackBox",1,1,"")
    end
end

function playerOneSing(a,b,c,d)
    if c == "swordOrange" then
        dodgeAnim = dodgeAnim + 1
        local anim = dodgeAnim%4
        playCharacterAnimation('boyfriend', dodgeMap[anim+1][2], true)
        setCharacterPreventDanceForAnim('boyfriend', true)
    end
end
function playerTwoSing(data, time, type)
	if getHealth() - 0.02 > 0 then
		setHealth(getHealth() - 0.014)
	else
		setHealth(0.040)
	end
end
function playerTwoSingHeld(data, time, type)
    if getHealth() - 0.02 > 0 then
        setHealth(getHealth() - 0.007)
    else
        setHealth(0.040)
	end
end
