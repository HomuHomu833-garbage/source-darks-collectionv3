local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local time = 0
local bumpzoomnose = {128,135,140,172,186,188,198,206,236}
local bloompqnose = {1216,1792}
local a = 0
local window = 0
local downscroll = 1
function createPost()


-- counts

    makeSprite("uno-rev", "uno-rev", -650, 100, 1.2)
    setObjectCamera("uno-rev", "hud")
    setActorAlpha(1, "uno-rev")
    
    makeSprite("dos-rev", "dos-rev", 1100, 100, 1.2)
    setObjectCamera("dos-rev", "hud")
    setActorAlpha(1, "dos-rev")
    
    makeSprite("tres-rev", "tres-rev", 200, 660, 1.2)
    setObjectCamera("tres-rev", "hud")
    setActorAlpha(1, "tres-rev")
    
-- texto shaggy

    makeSprite('like', 'Cosmic Truth/like', -100, 250, 0.9)
    setObjectCamera('like', 'hud')
    setActorAlpha(0, "like")

    makeSprite('dude', 'Cosmic Truth/dude', 400, 250, 0.9)
    setObjectCamera('dude', 'hud')
    setActorAlpha(0, "dude")

    makeSprite('if i', 'Cosmic Truth/if i', -250, 250, 0.9)
    setObjectCamera('if i', 'hud')
    setActorAlpha(0, "if i")

    makeSprite('keep training', 'Cosmic Truth/keep training', 350, 250, 0.9)
    setObjectCamera('keep training', 'hud')
    setActorAlpha(0, "keep training")

    makeSprite('do you think', 'Cosmic Truth/do you think', -50, 250, 0.85)
    setObjectCamera('do you think', 'hud')
    setActorAlpha(0, "do you think")

    makeSprite('i could', 'Cosmic Truth/i could', 550, 250, 0.85)
    setObjectCamera('i could', 'hud')
    setActorAlpha(0, "i could")

    makeSprite('get even', 'Cosmic Truth/get even', -150, 250, 0.85)
    setObjectCamera('get even', 'hud')
    setActorAlpha(0, "get even")

    makeSprite('stronger', 'Cosmic Truth/stronger', 500, 250, 0.85)
    setObjectCamera('stronger', 'hud')
    setActorAlpha(0, "stronger")

    makeSprite('hmph', 'Cosmic Truth/hmph', 150, 250, 0.9)
    setObjectCamera('hmph', 'hud')
    setActorAlpha(0, "hmph")

    makeSprite('like2', 'Cosmic Truth/like', -250, 250, 0.9)
    setObjectCamera('like2', 'hud')
    setActorAlpha(0, "like2")

    makeSprite('thats little', 'Cosmic Truth/thats little', 400, 250, 0.9)
    setObjectCamera('thats little', 'hud')
    setActorAlpha(0, "thats little")

    makeSprite('scary to', 'Cosmic Truth/scary to', -120, 250, 0.85)
    setObjectCamera('scary to', 'hud')
    setActorAlpha(0, "scary to")

    makeSprite('think about', 'Cosmic Truth/think about', 480, 250, 0.85)
    setObjectCamera('think about', 'hud')
    setActorAlpha(0, "think about")

-- texto bring in the ruckus

    makeSprite('bring', 'Cosmic Truth/bring', 0, -300, 0.9)
    setObjectCamera('bring', 'hud')
    setActorAlpha(1, "bring")

    makeSprite('in', 'Cosmic Truth/in', 250, -300, 0.9)
    setObjectCamera('in', 'hud')
    setActorAlpha(1, "in")

    makeSprite('the', 'Cosmic Truth/the', 500,700, 0.9)
    setObjectCamera('the', 'hud')
    setActorAlpha(1, "the")

    makeSprite('ru', 'Cosmic Truth/ru', 190, 730, 0.9)
    setObjectCamera('ru', 'hud')
    setActorAlpha(1, "ru")

    makeSprite('ckus', 'Cosmic Truth/ckus', 200, 690, 0.9)
    setObjectCamera('ckus', 'hud')
    setActorAlpha(1, "ckus")

-- shaders and others

    makeSprite('Bar Up', 'Bar Up', 0, -10, 3)
    setObjectCamera('Bar Up', 'hud')
    setActorLayer('Bar Up', layershit)
    setActorAlpha(1, "Bar Up")

    makeSprite('Bar Down', 'Bar Down', 0, -1450, 3)
    setObjectCamera('Bar Down', 'hud')
    setActorLayer('Bar Down', layershit)
    setActorAlpha(1, "Bar Down")

    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0)
    setShaderProperty('smoke', 'smokeStrength', 1.5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 20)
    setShaderProperty('vignette', 'size', 0.6)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

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

    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle',0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.5)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)

    initShader('mirrorGame', 'MirrorRepeatEffect') 
	setCameraShader('game', 'mirrorGame')
	setShaderProperty('mirrorGame', 'zoom', 1)
	setShaderProperty('mirrorGame','x',0)
	setShaderProperty('mirrorGame','y',0)
	setShaderProperty('mirrorGame','angle', 360)

    
    initShader('PincushNewEffect', 'PincushNewEffect')
	setCameraShader('game', 'PincushNewEffect')
	setCameraShader('hud', 'PincushNewEffect')
    setShaderProperty('PincushNewEffect', 'zoom', 1)
	setShaderProperty('PincushNewEffect', 'barrel', -2)
    setShaderProperty('PincushNewEffect', 'doChroma', true)

    initShader('pincushgame', 'PincushNewEffect')
	setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom', 1)
	setShaderProperty('pincushgame', 'barrel', 0)
    setShaderProperty('pincushgame', 'doChroma', true)


    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.5)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
	setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 0)

    createCustomShader("vcrshader", "vcrshader", 120)
    setCameraCustomShader("vcrshader", "game")

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
    if downscrollBool then
        downscroll = -1
    end

        for i = 0,17 do
            setActorProperty(i,"alpha",0)
            setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+250*downscroll)
        end
    

    fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
    swayingsmall = false
    
end

function songStart()

    tweenShaderProperty('color', 'red', 1.15, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'green', 1.15, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('color', 'blue', 1.15, crochet*0.001*4, 'cubeIn')
    tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*28, 'cubeInOut')
    tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*28, 'cubeInOut')
    tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*32, 'cubeIn')

    tweenShaderProperty('ca', 'strength', 0, crochet*0.001*32, 'cubeIn')
    tweenPosOut("Bar Up",0,-450,4.5)
    tweenPosOut("Bar Down",0,-1100,4.5)
end

function bumpzoom()
    setShaderProperty('MirrorRepeatEffect', 'zoom', 0.87)
    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1,stepCrochet*0.001*4,"cubeOut")
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
end

function stepHit(step)

    for i = 1, #bumpzoomnose do
        if curStep == bumpzoomnose [i]-1 then
            bumpzoom()
        end
    end

    for i = 1, #bloompqnose do
        if curStep == bloompqnose [i]-1 then
            setShaderProperty("bloom","contrast",4.5)
           tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        end
    end

    if curStep == 128 then--128,135,140,172,186,188,198,206,236
		tweenActorProperty(0,"angle",get("0.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(17,"angle",get("17.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(0,"alpha",get("0.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(17,"alpha",get("17.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 135 then
        tweenActorProperty(1,"angle",get("1.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(16,"angle",get("16.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(1,"alpha",get("1.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(16,"alpha",get("16.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 140 then
        tweenActorProperty(2,"angle",get("2.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(15,"angle",get("15.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(2,"alpha",get("2.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(15,"alpha",get("15.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 172 then
        tweenActorProperty(3,"angle",get("3.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(14,"angle",get("14.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(3,"alpha",get("3.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(14,"alpha",get("14.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 186 then
        tweenActorProperty(4,"angle",get("4.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(13,"angle",get("13.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(4,"alpha",get("4.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(13,"alpha",get("13.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 188 then
        tweenActorProperty(5,"angle",get("5.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(12,"angle",get("12.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(5,"alpha",get("5.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(12,"alpha",get("12.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 198 then
        tweenActorProperty(6,"angle",get("6.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(11,"angle",get("11.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(6,"alpha",get("6.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(11,"alpha",get("11.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 206 then
        tweenActorProperty(7,"angle",get("7.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(10,"angle",get("10.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(7,"alpha",get("7.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(10,"alpha",get("10.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 236 then
        tweenActorProperty(8,"angle",get("8.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tweenActorProperty(9,"angle",get("9.angle")+360,stepCrochet*0.001*8,"cubeOut")
        tweenActorProperty(8,"alpha",get("8.alpha")+1,stepCrochet*0.001*4,"cubeOut")
		tweenActorProperty(9,"alpha",get("9.alpha")+1,stepCrochet*0.001*4,"cubeOut")
    end

    if curStep == 120 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 124 then
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 128 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        setShaderProperty("barrel","barrel",4.5)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-150, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+150, crochet*0.001*2, 'linear')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'linear')
    elseif curStep == 240 then
        tweenPosOut("Bar Up",0,-450,1.5)
        tweenPosOut("Bar Down",0,-1100,1.5)
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*6, 'quartOut')
        for i = 0,18 do
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+20,1,"expoOut")
        end
    end
    if curStep == 248 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')

        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 256 then
        setShaderProperty('pincushgame', 'barrel', -2)
        setShaderProperty('PincushNewEffect', 'barrel', 0)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
     
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0,crochet*0.001*4,"cubeOut")
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
    elseif curStep == 272 then
        tweenShaderProperty('mirrorGame', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 280 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 288 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 296 or curStep == 360 then
        setShaderProperty('sobel', 'strength', 1)
        tweenShaderProperty('sobel', 'strength',0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 312 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty("mirrorGame","angle",-360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*8, 'quartOut')
    elseif curStep == 316 or curStep == 380 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 320 then
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 336 then
        tweenShaderProperty('mirrorGame', 'x', 0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 344 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 352 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 376 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty("mirrorGame","angle",360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*8, 'quartOut')
    end
    if curStep == 384 or curStep == 448 or curStep == 576 or curStep == 640 or curStep == 704 or curStep == 1600 or curStep == 1664 or curStep == 1728 then
        setShaderProperty("barrel","barrel",1.2)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
    end
    if curStep == 400 or curStep == 432 or curStep == 464 or curStep == 496 then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.004', (crochet*0.001*4)..',0.0055')
        tweenShaderProperty('mirrorGame', 'zoom',0.7, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 416 or curStep == 480 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 440 or curStep == 424 or curStep == 488 or curStep == 504 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 444 or curStep == 492 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 448 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 508 or curStep == 428 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 512 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*4, 'quartOut')
        setShaderProperty("barrel","barrel",-8)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        tweenFadeIn("healthBar",0,1)
        tweenFadeIn("healthBarBG",0,1)
        tweenFadeIn("infoTxt",0,1)
        tweenFadeIn("iconP1",0,1)
        tweenFadeIn("iconP2",0,1)
        tweenFadeIn("scoreTxt",0,1)
        tweenFadeIn("timeBar",0,1)
        tweenFadeIn("timeBarBG",0,1)
        tweenFadeIn("ratingText",0,1)
    end
    if curStep == 432 or curStep == 496 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end
    -- text
    if curStep == 492 then
        tweenActorProperty("bring", 'y',100, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('barrel', 'barrel', 6,crochet*0.001*6,"cubeIn")
    elseif curStep == 496 then
        tweenActorProperty("in", 'y', 100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 500 then
        tweenActorProperty("the", 'y',100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 504 then
        tweenActorProperty("ru", 'y',350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 508 then
        tweenActorProperty("ckus", 'y',350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 512 then
        tweenActorProperty("bring", 'y', -400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("in", 'y', -400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("the", 'y', -400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("ru", 'y',750, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("ckus", 'y', 750, stepCrochet*0.001*4, 'expoOut')
        perlinSpeed = 2
        perlinXRange = 0.2
        perlinYRange = 0.15
        perlinZRange = 20
    end

    -- drop

    if curStep == 528 or curStep == 592 then -- sxm
        tweenShaderProperty('mirrorGame', 'x', 1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 536 or curStep == 600 then
        tweenShaderProperty('mirrorGame', 'x', -0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 544 or curStep == 608 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 552 or curStep == 616 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 556 or curStep == 620 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 560 or curStep == 624 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 568 or curStep == 632 then
        tweenShaderProperty('mirrorGame', 'x', 1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 576 or curStep == 640 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    end

    if curStep == 656 or curStep == 720 then -- bfs
        tweenShaderProperty('mirrorGame', 'x', 0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 664 or curStep == 728 then
        tweenShaderProperty('mirrorGame', 'x', -1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 672 or curStep == 736 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 680 or curStep == 744 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 684 or curStep == 748 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 688 or curStep == 752 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 696 or curStep == 760 then
        tweenShaderProperty('mirrorGame', 'x', 0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 704 or curStep == 768 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    end
    
    if curStep == 760 then

        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-150, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+150, crochet*0.001*2, 'linear')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 768 then
        setShaderProperty('pincushgame', 'barrel', -4)
        flashCamera('hud', '#000000', 4)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')

        tweenPosOut("Bar Up",0,-450,3.5)
        tweenPosOut("Bar Down",0,-1100,3.5)
        setShaderProperty("MirrorRepeatEffect","barrel",-8)
        setShaderProperty('mirrorGame','angle', 360)
        setShaderProperty('mirrorGame','zoom', 3)
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*32, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*32, 'cubeInOut')
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
        if not middlescroll then   
            for i = 0,8 do
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-650)
            end
            for i = 9,17 do
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+650)
            end
        end
    end

    if curStep == 896 then
        setShaderProperty('pincushgame', 'barrel', -2)
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-150, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+150, crochet*0.001*2, 'linear')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenActorProperty(0,"angle",get("0.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(1,"angle",get("1.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(2,"angle",get("2.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(3,"angle",get("3.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(4,"angle",get("4.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(5,"angle",get("5.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(6,"angle",get("6.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(7,"angle",get("7.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(8,"angle",get("8.angle")+360,stepCrochet*0.001*10,"cubeOut")
    end
    if curStep == 1016 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1020 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    end
    if curStep == 1018 then
        tweenPosOut("Bar Up",0,-450,0.5)
        tweenPosOut("Bar Down",0,-1100,0.5)
    end
    if curStep == 1024 then
        setShaderProperty("MirrorRepeatEffect","barrel",4)
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenActorProperty(9,"angle",get("9.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(10,"angle",get("10.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(11,"angle",get("11.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(12,"angle",get("12.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(13,"angle",get("13.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(14,"angle",get("14.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(15,"angle",get("15.angle")+360,stepCrochet*0.001*10,"cubeOut")
		tweenActorProperty(16,"angle",get("16.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenActorProperty(17,"angle",get("17.angle")+360,stepCrochet*0.001*10,"cubeOut")
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        for i = 9,17 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,1,"expoOut")
        end
        for i = 0,8 do
            tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,1,"expoOut")
        end
    end

    if curStep == 1040 or curStep == 1104 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -30, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1048 or curStep == 1112 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 30, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1056 or curStep == 1120 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1060 or curStep == 1124 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1064 or curStep == 1128 then
        tweenShaderProperty('mirrorGame', 'x', 1, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1072 or curStep == 1136 then
        tweenShaderProperty('mirrorGame', 'x', 2, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1080 or curStep == 1144 then
        tweenShaderProperty('mirrorGame', 'zoom', 4, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1084 or curStep == 1148 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1088 or curStep == 1152 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
    end

    if curStep >= 1168 and curStep < 1280 or curStep >= 1792 and curStep < 1920 then
        if curStep % 16 == 0 then
			tweenShaderProperty('mirrorGame', 'angle', -30,stepCrochet *0.001*4, 'cubeOut')
            tweenShaderProperty('mirrorGame', 'x', 1.5, stepCrochet*0.001*4, 'cubeInOut')
        elseif curStep % 16 == 4 then
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('mirrorGame', 'angle', 30,stepCrochet *0.001*4, 'cubeOut')
            tweenShaderProperty('mirrorGame', 'x', -1.5, stepCrochet*0.001*4, 'cubeInOut')
        elseif curStep % 16 == 12 then
            tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*4, 'cubeIn')
        end
    end

    if curStep == 1272 then
        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-150, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+150, crochet*0.001*2, 'linear')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel',-1, crochet*0.001*2, 'linear')
    elseif curStep == 1280 then
        tweenPosOut("Bar Up",0,-450,0.5)
        tweenPosOut("Bar Down",0,-1100,0.5)
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end

    if curStep == 1280 then
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
    elseif curStep == 1296 then
        tweenShaderProperty('mirrorGame', 'x', -0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1304 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1312 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1320 or curStep == 1384 then
        setShaderProperty('sobel', 'strength', 1)
        tweenShaderProperty('sobel', 'strength',0, crochet*0.001*4, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1336 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty("mirrorGame","angle",-360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'y', 4, crochet*0.001*8, 'quartOut')
    elseif curStep == 1340 or curStep == 1404 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1344 then
        setShaderProperty("bloom","contrast",2.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 1360 then
        tweenShaderProperty('mirrorGame', 'x', 0.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == 1368 then
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 1376 then
        tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1400 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty("mirrorGame","angle",360)
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*6, 'quartOut')
        tweenShaderProperty('mirrorGame', 'y', 2, crochet*0.001*8, 'quartOut')
    end

    if curStep >= 256 and curStep < 496 or curStep >= 512 and curStep < 768 or curStep >= 1024 and curStep < 1520 or curStep >= 1568 and curStep < 1920 then
        if curStep % 16 == 8 then
			bumpzoom()
        end
    end

    if curStep >= 1008 and curStep < 1024 then
        if curStep % 16 == 8 then
            setShaderProperty('color', 'red', 0.0)
            setShaderProperty('color', 'green', 0.0)
            setShaderProperty('color', 'blue', 0.0)
            tweenShaderProperty('color', 'red', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'green', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'blue', 1.15, stepCrochet*0.001*2, 'cubeIn')
        elseif curStep % 16 == 10 then
            setShaderProperty('color', 'red', 0.0)
            setShaderProperty('color', 'green', 0.0)
            setShaderProperty('color', 'blue', 0.0)
            tweenShaderProperty('color', 'red', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'green', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'blue', 1.15, stepCrochet*0.001*2, 'cubeIn')
        elseif curStep % 16 == 12 then
            setShaderProperty('color', 'red', 0.0)
            setShaderProperty('color', 'green', 0.0)
            setShaderProperty('color', 'blue', 0.0)
            tweenShaderProperty('color', 'red', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'green', 1.15, stepCrochet*0.001*2, 'cubeIn')
            tweenShaderProperty('color', 'blue', 1.15, stepCrochet*0.001*2, 'cubeIn')
        elseif curStep % 16 == 14 then
            setShaderProperty('color', 'red', 0.0)
            setShaderProperty('color', 'green', 0.0)
            setShaderProperty('color', 'blue', 0.0)
            tweenShaderProperty('color', 'red', 1.15, stepCrochet*0.001*4, 'cubeIn')
            tweenShaderProperty('color', 'green', 1.15, stepCrochet*0.001*4, 'cubeIn')
            tweenShaderProperty('color', 'blue', 1.15, stepCrochet*0.001*4, 'cubeIn')
        end
    end

    if curStep >= 1152 and curStep < 1280 or curStep >= 1792 and curStep < 1920 then
        if curStep % 64 == 0 then
            tweenActorProperty(0,"angle",get("0.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(8,"angle",get("8.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 8 then
            tweenActorProperty(9,"angle",get("9.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(17,"angle",get("17.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 16 then
            tweenActorProperty(1,"angle",get("1.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(7,"angle",get("7.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 24 then
            tweenActorProperty(10,"angle",get("10.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(16,"angle",get("17.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 32 then
            tweenActorProperty(2,"angle",get("2.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(6,"angle",get("6.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 40 then
            tweenActorProperty(11,"angle",get("11.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(15,"angle",get("15.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 48 then
            tweenActorProperty(3,"angle",get("3.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(5,"angle",get("5.angle")+360,stepCrochet*0.001*10,"cubeOut")
        elseif curStep % 64 == 56 then
            tweenActorProperty(12,"angle",get("12.angle")+360,stepCrochet*0.001*10,"cubeOut")
            tweenActorProperty(14,"angle",get("14.angle")+360,stepCrochet*0.001*10,"cubeOut")
        end
    end

    -- text

    if curStep == 896 then
        setActorAlpha(1, "like")
        tweenFadeOut("like", 0,0.75, "")
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -0.25, crochet*0.001*2, 'cubeOut')
    elseif curStep == 900 then
        setActorAlpha(1, "dude")
        tweenFadeOut("dude", 0,0.75, "")
    elseif curStep == 906 then
        setActorAlpha(1, "if i")
        tweenFadeOut("if i", 0,0.85, "")
    elseif curStep == 910 then
        setActorAlpha(1, "keep training")
        tweenFadeOut("keep training", 0,1.15, "")
    elseif curStep == 923 then
        setActorAlpha(1, "do you think")
        tweenFadeOut("do you think", 0,0.85, "")
    elseif curStep == 931 then
        setActorAlpha(1, "i could")
        tweenFadeOut("i could", 0,0.5, "")
    elseif curStep == 933 then
        setActorAlpha(1, "get even")
        tweenFadeOut("get even", 0,0.65, "")
    elseif curStep == 940 then
        setActorAlpha(1, "stronger")
        tweenFadeOut("stronger", 0,0.95, "")
    elseif curStep == 967 then
        setActorAlpha(1, "hmph")
        tweenFadeOut("hmph", 0,0.74, "")
    elseif curStep == 976 then
        setActorAlpha(1, "like2")
        tweenFadeOut("like2", 0,0.65, "")
    elseif curStep == 980 then
        setActorAlpha(1, "thats little")
        tweenFadeOut("thats little", 0,0.95, "")
    elseif curStep == 990 then
        setActorAlpha(1, "scary to")
        tweenFadeOut("scary to", 0,0.95, "")
    elseif curStep == 996 then
        setActorAlpha(1, "think about")
        tweenFadeOut("think about", 0,1.15, "")
    end

    if curStep == 1408 or curStep == 448 or curStep == 576 or curStep == 640 or curStep == 704 then
        setShaderProperty("barrel","barrel",1.2)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*2,"cubeOut")
    end
    if curStep == 1424 or curStep == 1456 or curStep == 1488 or curStep == 1520 then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.004', (crochet*0.001*4)..',0.0055')
        tweenShaderProperty('mirrorGame', 'zoom',0.7, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1440 or curStep == 1504 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1464 or curStep == 1528 or curStep == 1448 or curStep == 1512 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1468 or curStep == 1452 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1472 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("bloom","contrast",4.5)
        tweenShaderProperty("bloom","contrast",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 1532 or curStep == 1516 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1564 then
        setShaderProperty('sobel', 'strength', 1)
        tweenShaderProperty('sobel', 'strength',0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1456 or curStep == 1520 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end
    -- text
    if curStep == 1516 then
        tweenActorProperty("bring", 'y',100, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('barrel', 'barrel', 6,crochet*0.001*6,"cubeIn")
    elseif curStep == 1520 then
        tweenActorProperty("in", 'y',100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1524 then
        tweenActorProperty("the", 'y', 100, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1528 then
        tweenActorProperty("ru", 'y',350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1532 then
        tweenActorProperty("ckus", 'y', 350, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1536 then
        tweenActorProperty("bring", 'y', -400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("in", 'y', -400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("the", 'y',-400, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("ru", 'y', 750, stepCrochet*0.001*4, 'expoOut')
        tweenActorProperty("ckus", 'y',750, stepCrochet*0.001*4, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty("mirrorGame","zoom",4)
        flashCamera('hud', '#000000', 4)
        tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*8, 'cubeInOut')

        setShaderProperty("greyscale","strength",1)
  
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
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
    elseif curStep == 1568 then
        setShaderProperty("barrel","barrel",-8)
        setShaderProperty("mirrorGame","x",0)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        perlinSpeed = 2
        perlinXRange = 0.2
        perlinYRange = 0.15
        perlinZRange = 20
    end

    if curStep == 1584 then -- sxm
        tweenShaderProperty('mirrorGame', 'x', 1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1592 then
        tweenShaderProperty('mirrorGame', 'x', -0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1600 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1608 or curStep == 1640 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1612 or curStep == 1644 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1616 or curStep == 1648 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1624 or curStep == 1656 then
        tweenShaderProperty('mirrorGame', 'x', 1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1632 or curStep == 1664 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    end

    if curStep == 1680 or curStep == 1744 then -- bfs
        tweenShaderProperty('mirrorGame', 'x', 0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1688 or curStep == 1752 then
        tweenShaderProperty('mirrorGame', 'x', -1.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1696 or curStep == 1760 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1704 or curStep == 1768 then
        tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 1708 or curStep == 1772 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 30, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1712 or curStep == 1776 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1720 or curStep == 1784 then
        tweenShaderProperty('mirrorGame', 'x', 0.5,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 1728 or curStep == 1792 then
        tweenShaderProperty('mirrorGame', 'x', 0,stepCrochet*0.001*4,"cubeOut")
    end
    if curStep == 1784 then

        tweenActorProperty("Bar Down", 'y', getActorY("Bar Down")-150, crochet*0.001*2, 'linear')
        tweenActorProperty("Bar Up", 'y', getActorY("Bar Up")+150, crochet*0.001*2, 'linear')
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', -1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1792 then
        tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')

        tweenPosOut("Bar Up",0,-450,0.5)
        tweenPosOut("Bar Down",0,-1100,0.5)
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        perlinZRange = 0
    end
    if curStep == 1920 then
        setShaderProperty('pincushgame', 'barrel', -5)
        tweenShaderProperty('mirrorGame', 'x', 0,crochet*0.001*4,"elasticInOut")
        setShaderProperty("barrel","barrel",-8)
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*4,"cubeOut")
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom', 10,crochet*0.001*32,"cubeIn")
        tweenShaderProperty('color', 'red', 0, crochet*0.001*28, 'cubeIn')
        tweenShaderProperty('color', 'green', 0, crochet*0.001*28, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*28, 'cubeIn')
    end

    if curStep == 1072 then
        tweenActorProperty("uno-rev", 'x', getActorX("uno-rev")+900, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1076 then
        tweenActorProperty("dos-rev", 'x', getActorX("dos-rev")-900, stepCrochet*0.001*4, 'expoOut')
        tweenPosOut("uno-rev",-1300,100,0.6)
    elseif curStep == 1080 then
        tweenPosOut("dos-rev",1300,100,0.6)
        tweenActorProperty("tres-rev", 'y', getActorY("tres-rev")-600, stepCrochet*0.001*4, 'expoOut')
    elseif curStep == 1084 then
        tweenPosOut("tres-rev",200,-1100,0.6)
    end

end

function update(elapsed)
    a = a + (elapsed*1.25) 
    if curStep >= 512 and curStep <= 768 or curStep >= 1568 and curStep <= 1792 then
        for i = 0,17 do
                if (i >= 0 and i <= 17) then
                    setActorY(defaultStrum0Y+14*math.cos((a+i*0.25)*math.pi),i)
                end
            end
    elseif curStep >= 768 or curStep >= 1792 then
        for i = 0,17 do
            setActorY(defaultStrum0Y,i)
        end
    end

    time = time + elapsed
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('MirrorRepeatEffect', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('MirrorRepeatEffect', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('MirrorRepeatEffect', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end