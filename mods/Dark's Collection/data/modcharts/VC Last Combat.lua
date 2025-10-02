local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local time = 0
local megalol = {284,348}
local quelocura = {524,526,540,542,604,606,
652,654,668,670,732,734,1804,1806,1820,1822,1884,1886,
1932,1934,1948,1950,2012,2014}
local beatSwap = 1
local a = 0
local window = 0

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
end

function createPost()
          
    set("dad.y",getActorY("dad")-50)
    makeSprite('Voiid Matt Wiik 4 Green', 'Voiid Matt Wiik 4 Green', getActorX('iconP2'), getActorY('iconP2'), 0.95)
    setActorScroll(0, 0, 'Voiid Matt Wiik 4 Green')
    setActorAlpha(0, 'Voiid Matt Wiik 4 Green')
    setObjectCamera('Voiid Matt Wiik 4 Green', "hud")

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('blurmejor', 'BetterBlurEffect')
    setCameraShader('game', 'blurmejor')
    setCameraShader('hud', 'blurmejor')
    setShaderProperty('blurmejor', 'strength', 20)
    setShaderProperty('blurmejor', 'loops', 10)
    setShaderProperty('blurmejor', 'quality', 10)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 10)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0.025)
    setShaderProperty('smoke', 'smokeStrength', 1.1)

    initShader('smokeHud', 'PerlinSmokeEffect')
    setCameraShader('hud', 'smokeHud')
    setShaderProperty('smokeHud', 'waveStrength', 0)

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

    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 2)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 3)
    setShaderProperty('barrel','angle', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('barrelGame', 'BarrelBlurEffect')
    setCameraShader('game', 'barrelGame')
    setShaderProperty('barrelGame', 'barrel',0)
    setShaderProperty('barrelGame', 'zoom', 1)
    setShaderProperty('barrelGame', 'x', 0)
    setShaderProperty('barrelGame', 'y', 0)
    setShaderProperty('barrelGame', 'angle', 0)
    setShaderProperty('barrelGame', 'doChroma', true)

    initShader('barrelHud', 'BarrelBlurEffect')
    setCameraShader('hud', 'barrelHud')
    setShaderProperty('barrelHud', 'barrel',0)
    setShaderProperty('barrelHud', 'zoom', 1)
    setShaderProperty('barrelHud', 'x', 0)
    setShaderProperty('barrelHud', 'y', -4)
    setShaderProperty('barrelHud', 'angle', 0)
    setShaderProperty('barrelHud', 'doChroma', true)

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0.4)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    makeSprite('Bar Up', 'Bar Up', 0, -610, 3)
    setObjectCamera('Bar Up', 'hud')
    setActorAlpha(1, "Bar Up")

    makeSprite('Bar Down', 'Bar Down', 0, -1050, 3)
    setObjectCamera('Bar Down', 'hud')
    setActorAlpha(1, "Bar Down")

    setProperty("healthBar","alpha",0)
    setProperty("healthBarBG","alpha",0)
    setProperty("infoTxt","alpha",0)
    setProperty("iconP1","alpha",0)
    setProperty("iconP2","alpha",0)
    setProperty("scoreTxt","alpha",0)
    setProperty("timeBar","alpha",0)
    setProperty("timeBarBG","alpha",0)
    setProperty("ratingText","alpha",0)
    setProperty("ratingsGroup","alpha",0)
    setProperty("Voiid Matt Wiik 4 Green","alpha",0)

    fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
    swayingsmall = false

    if not middlescroll then
		for i = 0,3 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+640,0.01,"cubeOut")
            setActorProperty(i,"alpha",0)
		end
        for i = 4,7 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-640,0.01,"cubeOut")
            setActorProperty(i,"alpha",0)
		end
    end
    
end

function songStart()

    tweenShaderProperty('color', 'red', 1.25, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'green', 1.25, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.25, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*34, 'cubeInOut')
    tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*28, 'cubeIn')
    tweenShaderProperty('blurmejor', 'strength', 0, crochet*0.001*32, 'cubeIn')
    tweenShaderProperty("barrelHud","y",0,crochet*0.001*32,"cubeIn")
    perlinXRange = 0.25 
    perlinYRange = 0.25
    perlinZRange = 12
    perlinSpeed = 1.4 
    for i = 0,7 do
        if not middlescroll then
            if (i >= 0 and i <= 0) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,3.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,3.5,"linear")
            elseif (i >= 7) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,3.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,3.5,"linear")
            elseif (i >= 1 and i <= 1) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,4.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,4.5,"linear")
            elseif (i >= 6 and i <= 6) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,4.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,4.5,"linear")
            elseif (i >= 2 and i <= 2) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,5.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,5.5,"linear")
            elseif (i >= 5 and i <= 5) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,5.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,5.5,"linear")
            elseif (i >= 3 and i <= 3) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,6.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,6.5,"linear")
            elseif (i >= 4 and i <= 4) then
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,6.5,"cubeInOut")
                tweenActorProperty(i,"alpha",1,6.5,"linear")
            end
        end
    end

end

function lol()
    setShaderProperty('sobel', 'strength', 1)
    tweenShaderProperty('sobel', 'strength',0, crochet*0.001*4, 'cubeOut')
    tweenShaderProperty('barrelGame', 'zoom',0.5, crochet*0.001*2, 'cubeOut')
end

function nosexd()
    beatSwap = beatSwap * -1
    setShaderProperty('barrelHud', 'x', -0.15*beatSwap)
    tweenShaderProperty('barrelHud','x',0,stepCrochet*0.001*2.5,'cubeOut')
end

function stepHit()
    for i = 1, #megalol do
        if curStep == megalol [i]-1 then
            lol()
        end
    end
    for i = 1, #quelocura do
        if curStep == quelocura [i]-1 then
            nosexd()
        end
    end
    if curStep == 128 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty('scanline', 'strength', 0.5)
        perlinSpeed = 0
        perlinXRange = 0 
        perlinYRange = 0
        perlinZRange = 0
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
    if curStep >= 144 and curStep < 176 or curStep >= 208 and curStep < 240 then
        if curStep % 16 == 0 then
            tweenShaderProperty('barrel', 'angle', 15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('barrel', 'angle', -15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        end
    end
    if curStep >= 848 and curStep < 1024 then
        if curStep % 16 == 0 then
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        end
    end
    if curStep >= 384 and curStep < 448 then
        if curStep % 64 == 8 then
            tweenShaderProperty('barrelGame', 'angle', 15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 16 then
            tweenShaderProperty('barrelGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 24 then
            tweenShaderProperty('barrelGame', 'angle', 15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 32 then
            tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 40 then
            tweenShaderProperty('barrelGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 48 then
            tweenShaderProperty('barrelGame', 'angle', 15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        elseif curStep % 64 == 54 then
            tweenShaderProperty('barrelGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
            tweenShaderProperty('ca', 'strength',0.02, crochet*0.001*2, 'linear')
        end
    end
    if curStep == 176 or curStep == 240 then
        tweenShaderProperty('barrel', 'zoom', 1.5, crochet*0.001*2, 'cubeOut')
    elseif curStep == 184 or curStep == 248 then
        tweenShaderProperty('barrel', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 188 or curStep == 252 then
        tweenShaderProperty('barrel', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 192 or curStep == 256 then
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 248 then
        setShaderProperty('barrelHud', 'y', 0)
        tweenShaderProperty("barrelHud","y",2,crochet*0.001*4,"cubeInOut")
    end
    if curStep == 256 or curStep == 320 then
        setShaderProperty("barrel","barrel",-2)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 260 or curStep == 324 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 292 or curStep == 356 then
        tweenShaderProperty('barrelGame', 'zoom', 0.75, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 304 or curStep == 368 then
        tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrelGame', 'angle', -40, crochet*0.001*2, 'cubeOut')
    elseif curStep == 312 or curStep == 376 then
        tweenShaderProperty('barrelGame', 'angle', 35, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 316 or curStep == 380 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 384 then
        tweenShaderProperty('barrelGame', 'x', 1.5, crochet*0.001*2, 'cubeInOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 400 or curStep == 432 then
        triggerEvent('set Camera Zoom','0.85','1')
    elseif curStep == 412 or curStep == 444 then
        triggerEvent('set Camera Zoom','0.6','1')
    elseif curStep == 416 then
        tweenShaderProperty('barrelGame', 'x', -1.5, crochet*0.001*2, 'cubeInOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 440 or curStep == 504 or curStep == 632 or curStep == 760 then
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-350, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+450, crochet*0.001*2, 'linear')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -1, crochet*0.001*2, 'linear')
    elseif curStep == 448 or curStep == 512 or curStep == 640 or curStep == 768 or curStep == 832 then
        tweenPosOut("Bar Up",0,-610,0.5)
        tweenPosOut("Bar Down",0,-1050,0.5)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 480 or curStep == 512 or curStep == 832 or curStep == 960 then
        setShaderProperty("barrel","barrel",-2)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
    end
    if curStep == 512 then
        perlinSpeed = 0.9
        perlinXRange = 0.2 
        perlinYRange = 0.15
    end
    if curStep == 448 then
        tweenShaderProperty('ca', 'strength',0, crochet*0.001*2, 'linear')
        setShaderProperty('barrelGame', 'x', 0)
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 512 then
        tweenShaderProperty("barrelGame","angle",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 524 or curStep == 652 then
        tweenShaderProperty("barrelGame","angle",90,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",2.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 526 or curStep == 654 then
        tweenShaderProperty("barrelGame","angle",180,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",1,stepCrochet*0.001*6,"cubeIn")
    elseif curStep == 528 or curStep == 656 then
        tweenShaderProperty("barrelGame","angle",390,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 532 or curStep == 660 then
        tweenShaderProperty("barrelGame","angle",360,crochet*0.001*2,"cubeOut")
    elseif curStep == 540 or curStep == 668 then
        tweenShaderProperty("barrelGame","angle",250,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",2.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 542 or curStep == 670 then
        tweenShaderProperty("barrelGame","angle",140,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",1,stepCrochet*0.001*6,"cubeIn")
    elseif curStep == 544 or curStep == 672 then
        tweenShaderProperty("barrelGame","angle",-30,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 548 or curStep == 676 then
        tweenShaderProperty("barrelGame","angle",0,crochet*0.001*2,"cubeOut")
    end
    if curStep == 552 or curStep == 680 then
        tweenShaderProperty('barrelGame', 'x', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 560 or curStep == 576 or curStep == 688 or curStep == 704 then
        tweenShaderProperty('barrelGame', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 568 or curStep == 696 then
        tweenShaderProperty('barrelGame', 'x', -1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 584 or curStep == 600 or curStep == 712 or curStep == 728 then
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 588 or curStep == 716 then
        tweenShaderProperty('barrelGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 592 or curStep == 720 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 604 or curStep == 732 then
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 608 or curStep == 736 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 624 or curStep == 752 then
        tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 632 or curStep == 760 then
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 636 or curStep == 764 then
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 640 or curStep == 768 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 768 then
        tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 772 or curStep == 788 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 776 or curStep == 792 then
        tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 780 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 784 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 796 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 800 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'x', -1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 808 then
        tweenShaderProperty('barrelGame', 'x', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 816 then
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty('barrelGame', 'zoom', 1.5, crochet*0.001*2, 'linear')
        tweenShaderProperty('barrelGame', 'angle', 25, crochet*0.001*2, 'linear')
        tweenShaderProperty('blurmejor', 'strength', 10, crochet*0.001*3, 'cubeIn')
    elseif curStep == 824 then
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*2, 'linear')
        tweenShaderProperty('barrelGame', 'angle', -25, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-350, crochet*0.001*2, 'cubeIn')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+450, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 828 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 832 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'x', 3, crochet*0.001*4, 'cubeInOut')
        setShaderProperty('blurmejor', 'strength', 0)
        perlinSpeed = 2
        perlinXRange = 0.2 
        perlinYRange = 0.25
        perlinZRange = 12
    end
    if curStep == 848 or curStep == 960 then
        tweenShaderProperty('barrelGame', 'x', 1, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 1.7, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 864 or curStep == 976 then
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('barrelGame', 'x', 3, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 2.3, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 880 or curStep == 992 then
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 896 then
        tweenShaderProperty('barrelGame', 'y', 3, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 2.3, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 912 then
        tweenShaderProperty('barrelGame', 'y', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 1.7, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 920 then
        tweenShaderProperty('barrelGame', 'x', 3, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 936 then
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('barrelGame', 'zoom', 3, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 952 or curStep == 1016 then
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*6, 'cubeIn')
        tweenShaderProperty('barrelGame', 'angle', -30, stepCrochet*0.001*6, 'cubeIn')
    elseif curStep == 956 or curStep == 1020 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1008 then
        tweenShaderProperty('barrelGame', 'x', 2, crochet*0.001*4, 'cubeInOut')
    end
    if curStep == 1016 then
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-380, crochet*0.001*4, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+480, crochet*0.001*4, 'linear')
    elseif curStep == 1032 then
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeInOut')
        setProperty("healthBar","alpha",0)
        setProperty("healthBarBG","alpha",0)
        setProperty("infoTxt","alpha",0)
        setProperty("iconP1","alpha",0)
        setProperty("iconP2","alpha",0)
        setProperty("scoreTxt","alpha",0)
        setProperty("timeBar","alpha",0)
        setProperty("timeBarBG","alpha",0)
        setProperty("ratingText","alpha",0)
        setProperty("ratingsGroup","alpha",0)
        setShaderProperty('blurmejor', 'strength', 20)
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 7) then
                    setActorProperty(i,"alpha",0)
                elseif (i >= 0 and i <= 3) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+640)
                elseif (i >= 4 and i <= 7) then
                    setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-640)
                end
            end
        end
    elseif curStep == 1056 then
        tweenPosOut("Bar Up",0,-610,1)
        tweenPosOut("Bar Down",0,-1050,1)
        tweenShaderProperty('blurmejor', 'strength', 0, crochet*0.001*24, 'cubeIn')
    elseif curStep == 1088 then
        for i = 4,7 do
            tweenActorProperty(i,"alpha",1,1,"linear")
        end
    elseif curStep == 1120 or curStep == 1792 then
        for i = 0,3 do
            tweenActorProperty(i,"alpha",1,1,"linear")
        end
    elseif curStep == 1152 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                   tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,3,"cubeOut")
                elseif (i >= 4 and i <= 7) then
                   tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,3,"cubeOut")
                end
            end
        end
    elseif curStep == 1248 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1260 then
        tweenShaderProperty('ca', 'strength', 0.02, crochet*0.001*4, 'linear')
    elseif curStep == 1280 then
        setShaderProperty('ca', 'strength', 0)
        setShaderProperty("barrel","barrel",-6)
        tweenShaderProperty("barrel","barrel",0.5,crochet*0.001*2,"cubeOut")
        setShaderProperty('smokeHud', 'waveStrength', 0.045)
          setStageColorSwap('hue', 0.53)
        perlinSpeed = 2.25
        perlinXRange = 0.25
        perlinYRange = 0.25
        perlinZRange = 20
    end
    if curStep == 1340 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",2,crochet*0.001*2,"cubeOut")
    elseif curStep == 1352 or curStep == 1416 or curStep == 1480 or curStep == 1536 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",1,stepCrochet*0.001*6,"cubeIn")
    elseif curStep == 1400 or curStep == 1464 or curStep == 1528 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",1.3,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1402 or curStep == 1466 or curStep == 1530 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",1.6,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1404 or curStep == 1468 or curStep == 1532 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",2,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1406 or curStep == 1470 or curStep == 1534 then
        tweenShaderProperty("MirrorRepeatEffect","zoom",2.3,stepCrochet*0.001*2,"cubeOut")
    end
    if curStep == 1296 or curStep == 1360 then
        tweenShaderProperty('barrelGame', 'x', 1.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1312 or curStep == 1376 then
        tweenShaderProperty('barrelGame', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1328 or curStep == 1392 then
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 1424 or curStep == 1488 or curStep == 1680 then
        tweenShaderProperty('barrelGame', 'x', 0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1440 or curStep == 1504 or curStep == 1696 then
        tweenShaderProperty('barrelGame', 'x', -1.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1456 or curStep == 1520 or curStep == 1712 then
        tweenShaderProperty('barrelGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1728 or curStep == 1736 or curStep == 1744 or curStep == 1752 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1732 or curStep == 1740 or curStep == 1748 or curStep == 1756 then
        tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1544 or curStep == 1608 or curStep == 1760 then
        tweenShaderProperty('barrelGame', 'x', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1552 or curStep == 1616 or curStep == 1768 then
        tweenShaderProperty('barrelGame', 'y', -1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1560 or curStep == 1624 or curStep == 1776 then
        tweenShaderProperty('barrelGame', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1568 or curStep == 1632 or curStep == 1784 then
        tweenShaderProperty('barrelGame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1576 or curStep == 1640 then
        tweenShaderProperty('barrelGame', 'x', -1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1580 or curStep == 1648 then
        tweenShaderProperty('barrelGame', 'y', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1592 or curStep == 1656 then
        tweenShaderProperty('barrelGame', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1600 or curStep == 1664 then
        tweenShaderProperty('barrelGame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty("barrel","barrel",-2)
        tweenShaderProperty("barrel","barrel",0.5,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1784 then
        setShaderProperty("barrelGame","x",-2)
        tweenShaderProperty("barrelGame","x",0,crochet*0.001*4,"cubeInOut")
    end
    if curStep == 1792 then
        setShaderProperty("barrel","barrel",-6)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        setShaderProperty('smokeHud', 'waveStrength',0)
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
        tweenFadeIn("Voiid Matt Wiik 4 Green",1,1,"")
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
    elseif curStep == 1804 or curStep == 1932 then
        tweenShaderProperty("barrelGame","angle",90,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",2.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1806 or curStep == 1934 then
        tweenShaderProperty("barrelGame","angle",180,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",1,stepCrochet*0.001*6,"cubeIn")
    elseif curStep == 1808 or curStep == 1936 then
        tweenShaderProperty("barrelGame","angle",390,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 1812 or curStep == 1940 then
        tweenShaderProperty("barrelGame","angle",360,crochet*0.001*2,"cubeOut")
    elseif curStep == 1820 or curStep == 1948 then
        tweenShaderProperty("barrelGame","angle",250,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",2.5,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == 1822 or curStep == 1950 then
        tweenShaderProperty("barrelGame","angle",140,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("barrelGame","zoom",1,stepCrochet*0.001*6,"cubeIn")
    elseif curStep == 1824 or curStep == 1952 then
        tweenShaderProperty("barrelGame","angle",-30,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 1828 or curStep == 1956 then
        tweenShaderProperty("barrelGame","angle",0,crochet*0.001*2,"cubeOut")
    end
    if curStep == 1832 or curStep == 1960 then
        tweenShaderProperty('barrelGame', 'x', 1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1840 or curStep == 1856 or curStep == 1968 or curStep == 1984 then
        tweenShaderProperty('barrelGame', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1848 or curStep == 1976 then
        tweenShaderProperty('barrelGame', 'x', -1.5, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 1864 or curStep == 1880 or curStep == 1992 or curStep == 2008 then
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1868 or curStep == 1996 then
        tweenShaderProperty('barrelGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1872 or curStep == 2000 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1884 or curStep == 2012 then
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1888 or curStep == 2016 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1904 or curStep == 2032 then
        tweenShaderProperty('barrelGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1912 or curStep == 2040 then
        tweenShaderProperty('barrelGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1916 or curStep == 2044 then
        tweenShaderProperty('barrelGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1920 or curStep == 2048 then
        tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    end
    if curStep == 2048 then
        setShaderProperty("barrel","barrel",-6)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('color', 'red', 0, crochet*0.001*64, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*64, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*64, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*48, 'cubeIn')
        tweenShaderProperty('blurmejor', 'strength', 20, crochet*0.001*48, 'cubeIn')
    end
    if curStep >= 448 and curStep < 512 then
        if curStep % 16 == 0 then
			tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
            tweenShaderProperty('barrelGame', 'angle', 35, stepCrochet*0.001*8, 'quartOut')
        elseif curStep % 16 == 4 then
			tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
		elseif curStep % 16 == 8 then
            tweenShaderProperty('barrelGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
            tweenShaderProperty('barrelGame', 'angle', -35, stepCrochet*0.001*8, 'quartOut')
        elseif curStep % 16 == 12 then
            tweenShaderProperty('barrelGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        end
    end
    if curStep == 1250 then
        playCharacterAnimation('dad', 'trans', true)
    elseif curStep == 1272 then
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-350, crochet*0.001*2, 'cubeIn')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+450, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -1, crochet*0.001*2, 'linear')
    elseif curStep == 1280 then
        tweenPosOut("Bar Up",0,-610,0.5)
        tweenPosOut("Bar Down",0,-1050,0.5)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2080 then
        tweenFadeIn("healthBar",0,4)
        tweenFadeIn("healthBarBG",0,4)
        tweenFadeIn("infoTxt",0,4)
        tweenFadeIn("iconP1",0,4)
        tweenFadeIn("scoreTxt",0,4)
        tweenFadeIn("timeBar",0,4)
        tweenFadeIn("timeBarBG",0,4)
        tweenFadeIn("ratingText",0,4)
        tweenFadeIn("Voiid Matt Wiik 4 Green",0,4,"")
        for i = 0,7 do
            tweenActorProperty(i,"alpha",0,4,"linear")
        end
    end

    --eventos xd

    if curStep == 1056 or curStep == 1184 then
        triggerEvent('set Camera Zoom','0.7','1')
    elseif curStep == 1088 or curStep == 1160 or curStep == 1248 then
        triggerEvent('set Camera Zoom','0.8','1')
    elseif curStep == 1120 or curStep == 1202 then
        triggerEvent('set Camera Zoom','0.9','1')
    elseif curStep == 1152 or curStep == 1216 then
        triggerEvent('set Camera Zoom','1','1')
    elseif curStep == 1258 then
        triggerEvent('set Camera Zoom','0.6','1')
    elseif curStep == 1408 then
        flashCamera('game', '#FFFFFF', 1)
    end

    -- las flechitas moviendose

    if curStep == 1280 then
        setActorY(-1000000,"ratingsGroup")
        window = -3.5
    elseif curStep == 1792 then
        window = 0 
    end  
    if curStep >= 832 and curStep <= 1024 or curStep >= 1280 and curStep <= 1792 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 7) then
                    setActorY(defaultStrum0Y+12*math.cos((a+i*0.55)*math.pi),i)
                end
            end
        end
    elseif curStep >= 1792 or curStep >= 1024 then
        for i = 0, 7 do
            tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
            tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
        end
    end
end

function update(elapsed)

    a = a + (elapsed*1.25) 
    if curStep >= 1280 and curStep <= 1794 then
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorX(getActorX(i)+(math.sin(2.35*(a))*window),i)
                    setActorProperty(i,"alpha",0.25)
                elseif (i >= 4 and i <= 7) then
                    setActorX(getActorX(i)+(math.sin(-2.35*(a))*window),i)
                end
            end
        end
    end

    setActorX(getActorX('iconP2'), 'Voiid Matt Wiik 4 Green')
	setActorY(getActorY('iconP2'), 'Voiid Matt Wiik 4 Green')

    time = time + elapsed
    setCustomShaderFloat('smoke', 'iTime', time)
    setCustomShaderFloat('smokeHud', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end