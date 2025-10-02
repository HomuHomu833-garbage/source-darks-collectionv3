function lascosasdelhud(s,y)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("infoTxt.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
    set("timeBarBG.alpha",s)
    set("ratingText.alpha",s)
    setActorY(y,"ratingsGroup")
end
function createPost()
    lascosasdelhud(0,-1000)
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    initShader('glowBorder', 'glowBorder')
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'transparency', 1)
    setShaderProperty('glowBorder', 'transparency2', 1)
    initShader('particles', 'particlesnew')
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.8)
    setShaderProperty('particles', 'red', 2)
    setShaderProperty('particles', 'blue', 1.5)
    setShaderProperty('particles', 'green', 1)
    initShader('speedlines', 'speedlines')
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)
    initShader("rayos","godrays")
    setCameraShader('game', 'rayos')
    setShaderProperty('rayos', 'decay', 0.5)
    setShaderProperty('rayos', 'density',0.5)
    setShaderProperty('rayos', 'weigth', 0.5)
    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 1)
    initShader('barrel2', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel2')
    setCameraShader('hud', 'barrel2')
    setShaderProperty('barrel2', 'barrel', 0)
    setShaderProperty('barrel2', 'zoom', 1)
    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.7)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)
    initShader('perlin', 'BarrelBlurEffect')--
    setCameraShader('game', 'perlin')

    setShaderProperty('perlin', 'zoom', 1)
	setShaderProperty('perlin', 'x', 0)
    setShaderProperty('perlin', 'y', 0)
    setShaderProperty('perlin', 'angle', 0)
	setShaderProperty('perlin', 'barrel', 0)
    initShader('xyY', 'PincushNewEffect')--
    setCameraShader('game', 'xyY')
    setShaderProperty('xyY', 'zoom', 1)
	setShaderProperty('xyY', 'x', 0)
    setShaderProperty('xyY', 'y', 0)
    setShaderProperty('xyY', 'angle', 0)
	setShaderProperty('xyY', 'barrel', 0)
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red',1.3)
    setShaderProperty('color', 'green', 1.3)
    setShaderProperty('color', 'blue', 1.3)
    initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 2)
    setShaderProperty('zoomblurGame', 'focusPower', 8)
    initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)

    initShader('ca2', 'ChromAbEffect')
    setCameraShader('game', 'ca2')

    setShaderProperty('ca2', 'strength', 0.002)
    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
   
    setShaderProperty('greyscale', 'strength', 1)
    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)
    initShader("vcrchroma","vcrchroma")
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'speed', 1.2)
    setShaderProperty('vcrchroma', 'strength', 1)
    initShader('bars', 'bars')
	setCameraShader('game', 'bars')

	setShaderProperty('bars', 'effect', 0)
    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
 
    setShaderProperty('ca', 'strength', 0)
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')

    setShaderProperty('EyeFishEffectGame', 'power', 0.1)
    initShader('zoomblurGamebars', 'zoomblur')
    setCameraShader('game', 'zoomblurGamebars')

    setShaderProperty('zoomblurGamebars', 'posY', 0)
    setShaderProperty('zoomblurGamebars', 'posX', 2)
    setShaderProperty('zoomblurGamebars', 'focusPower', 0)
    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('hud', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0.0)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)
    initShader('bloom', 'BloomEffect')--
    setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    makeSprite("uno", "uno", 220, 1100, 1.2)
    setObjectCamera("uno", "hud")
    setActorAlpha(1, "uno")
    makeSprite("dos", "dos", 220, -1100, 1.2)
    setObjectCamera("dos", "hud")
    setActorAlpha(1, "dos")
    makeSprite("tres", "tres", 220, 1100, 1.2)
    setObjectCamera("tres", "hud")
    setActorAlpha(1, "tres")
    makeSprite("cuatro", "cuatro", 220, 1100, 1.2)
    setObjectCamera("cuatro", "hud")
    setActorAlpha(1, "cuatro")
 
end

local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.8
local perlinXRange = 0.15
local perlinYRange = 0.15
local perlinZRange = 0
local caWave = 0
local caWaveSpeed = 3
local caWaveRange = 0
local time = 0
local xd = 0
local cam = false
local cam2 = false
local matt = false
local bf = false
function update(elapsed)
    time = time + (elapsed*2)
    xd = xd + elapsed
    setCustomShaderFloat('rayos', 'iTime', time)
    setCustomShaderFloat('vcrchroma', 'iTime', time)
    setCustomShaderFloat('heat', 'iTime', time)
    setCustomShaderFloat('glowBorder', 'iTime', time) 
    setCustomShaderFloat('particles', 'iTime', xd) 
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    setCustomShaderFloat('speedlines', 'iTime', time)
    if cam then
       set("camFollow.x",1025)
       set("camFollow.y",150)
    end
    if cam2 then
        set("camFollow.x",1125)
        set("camFollow.y",150)
    end
    if matt then
		set("camFollow.x", get("dad.x")+285)
        set("camFollow.y", get("dad.y")+240)
        set("defaultCamZoom", 1)
    end
    if bf then
		set("camFollow.x", get("boyfriend.x")+225)
        set("camFollow.y", get("boyfriend.y")+120)
        set("defaultCamZoom", 1)
    end

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
    setShaderProperty('perlin', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('perlin', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))

end

function songStart()
    cam = true
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*16,"cubeIn")
    tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*16, 'cubeInOut')
    tweenShaderProperty("zoomblurGame","focusPower",0,crochet*0.001*32,"cubeOut")
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end

function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function bumps(barrel,valor,speed,curStep)
	setShaderProperty(barrel,"zoom",valor)
	tweenShaderProperty(barrel,"zoom",1,speed*0.001*curStep,"cubeOut")
end
local saltosxd={312,824}
local saltaytemblor={408,920}
local bloomxdxd={400,656,672,688,720,752,1600,1664,1728,1808,2112,2240}
local cosoxd=true
function stepHit()
    for i = 1, #bloomxdxd do
        if curStep == bloomxdxd [i] then
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #saltosxd do
        if curStep == saltosxd [i] then
            tweenShaderProperty('EyeFishEffectGame', 'power',0.25, crochet*0.001*1, 'cubeOut')
            mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
            tweenFadeIn("blackBG",0.7,stepCrochet*0.001*1,"cubeIn")
        elseif curStep == saltosxd [i]+4 then
            mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
            tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeIn")
        elseif curStep == saltosxd [i]+8 then
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeOut')
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #saltaytemblor do
        if curStep == saltaytemblor [i] then
            mirror(false,true,"","zoom",0,2,4,stepCrochet,"cubeOut")
        elseif curStep == saltaytemblor [i]+4 then
            mirror(false,true,"","zoom",0,0.7,4,stepCrochet,"cubeIn")
        elseif curStep == saltaytemblor [i]+8 then
            tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*4, 'cubeIn')
            mirror(false,true,"","zoom",0,2.5,4,crochet,"cubeIn")
            tweenFadeIn("blackBG",1,stepCrochet*0.001*16,"cubeIn")
            triggerEvent('screen shake', (crochet*0.001*4)..',0.025', (crochet*0.001*4)..',0')
            caWaveRange = 0.35
        elseif curStep == saltaytemblor [i]+24 then
            tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeIn")
            caWaveRange = 0
        elseif curStep == saltaytemblor [i]+32 then
            mirror(false,true,"","zoom",0,2,4,stepCrochet,"cubeOut")
            mirror(false,true,"","angle",0,15,4,stepCrochet,"cubeOut")
        elseif curStep == saltaytemblor [i]+36 then
            mirror(false,true,"","zoom",0,0.7,4,stepCrochet,"cubeIn")
            mirror(false,true,"","angle",0,-15,4,stepCrochet,"cubeIn")
        elseif curStep == saltaytemblor [i]+40 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
    if curStep == 176 then
        removeCameraShader("hud","bloom")
        tweenShaderProperty("bloom","contrast",0,crochet*0.001*16,"cubeIn")
        tweenShaderProperty('perlin', 'barrel',-1, crochet*0.001*14, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('bars', 'effect', 0.6, crochet*0.001*15, 'cubeIn')
        tweenShaderProperty('mirror', 'zoom', 2.5, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirror', 'angle', -15, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirror', 'x', -0.7, crochet*0.001*16, 'cubeIn')
    elseif curStep == 240 then
        --tween("dad", {x = getActorX("dad") + 1000}, crochet * 0.001 * 2, "cubeOut")
        --tween("boyfriend", {x = getActorX("boyfriend") - 1000}, crochet * 0.001 * 2, "cubeOut")
        --tween("gf", {x = getActorX("gf") - 1000}, crochet * 0.001 * 2, "cubeOut")
    elseif curStep == 248 then
        setCameraShader('hud', 'bloom')
        bloom(10,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 0)
        tweenShaderProperty('perlin', 'barrel',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        mirror(true,true,"x","x",-2,0,1.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        setShaderProperty('greyscale', 'strength',0)
        mirror(false,true,"","zoom",0,0.7,8,stepCrochet,"cubeIn")
    elseif curStep == 252 then
      --  mirror(false,true,"","zoom",0,0.7,4,stepCrochet,"cubeIn")
    elseif curStep == 256 then
        cam = false
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        lascosasdelhud(1,0)
    end
    if curStep == 352 or curStep == 864 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*7, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*7, 'cubeIn')
        mirror(false,true,"","zoom",0,1.4,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
    elseif curStep == 360 or curStep == 872 then
        mirror(false,true,"","zoom",0,1.8,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
    elseif curStep == 368 or curStep == 880 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
    elseif curStep == 376 or curStep == 888 then
        mirror(false,true,"","zoom",0,3.2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 380 or curStep == 892 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeIn')
    end
    if curStep == 504 or curStep == 1016 then
        tweenShaderProperty('glowBorder', 'transparency', 0.5, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 380 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 384 or curStep == 576 or curStep == 896 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 440 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 448 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
    elseif curStep == 564 then
        mirror(false,true,"","y",0,0.3,1,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 568 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,0,1,crochet,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*2)..',0.01', (crochet*0.001*4)..',0')
    elseif curStep == 572 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 616 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 620 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 624 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
    elseif curStep == 632 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.25, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.15, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty("zoomblurGame","focusPower",4,crochet*0.001*2,"cubeIn")
    elseif curStep == 636 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 640 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 648 or curStep == 712 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeIn')
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*8,"cubeIn")
    elseif curStep == 664 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty("zoomblurGame","focusPower",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 668 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 672 or curStep == 744 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 696 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty("zoomblurGamebars","focusPower",8,crochet*0.001*2,"cubeIn")
        tweenShaderProperty('perlin', 'barrel',5, crochet*0.001*2, 'cubeIn')
    elseif curStep == 700 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 704 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.25, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.2, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 732 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("zoomblurGamebars","focusPower",0,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    elseif curStep == 736 then
        tweenShaderProperty('perlin', 'barrel',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 748 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == 752 or curStep == 760 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 756 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    end
    if curStep == 760 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeIn')
        tweenFadeIn("blackBG",0,stepCrochet*0.001*8,"cubeIn")
        tweenShaderProperty('glowBorder', 'transparency', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 768 then
        bloom(10,1,crochet,2,"cubeOut")
        lascosasdelhud(0,-1000)
        perlinSpeed = 0.8
        perlinXRange = 0.15
        perlinYRange = 0.15
    elseif curStep == 992 then
        cosoxd = false
    elseif curStep == 1408 or curStep == 2048 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.05, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1472 or curStep == 1848 or curStep == 2040 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 1536 then
        setShaderProperty('glowBorder', 'transparency', 1)
        perlinSpeed = 0.8
        perlinXRange = 0.15
        perlinYRange = 0.15
        cam2 = false
        lascosasdelhud(1,0)
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 0)
        setShaderProperty('speedlines', 'transparency', 1)
        set("defaultCamZoom", 0.7)
        caWaveRange = 0
        setShaderProperty('glitchPeak', 'AMT', 0.05)
        setProperty('', 'cameraSpeed', 1)
    end
    if curStep == 1536 or curStep == 1600 or curStep == 1632 
    or curStep == 1664 or curStep == 1728 or curStep == 1760
    or curStep == 1776 then
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeOut")
    elseif curStep == 1568 or curStep == 1616 or curStep == 1640 
    or curStep == 1696 or curStep == 1744 or curStep == 1768 then
        mirror(false,true,"","angle",0,10,2,crochet,"cubeOut")
    elseif curStep == 1648 or curStep == 1784 then
       mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 1656 then
        mirror(false,true,"","angle",0,-25,2,crochet,"cubeIn")
    end
    if curStep == 1776 then
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlin', 'barrel',-2, crochet*0.001*3.5, 'cubeIn')
        tweenStageColorSwap('hue',-0.1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1784 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.15, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.15, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1792 then
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 1)
        tweenShaderProperty('perlin', 'barrel',0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT', 0)
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
    elseif curStep == 1808 then
        tweenShaderProperty('greyscale', 'strength',0.8, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1832 or curStep == 2024 then
        mirror(false,true,"","zoom",0,1,6,crochet,"expoIn")
    elseif curStep == 1856 then
        perlinSpeed = 0.8
        perlinXRange = 0.15
        perlinYRange = 0.15
        bumps("barrel2",0.85,stepCrochet,8)
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1888 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
    elseif curStep == 1904 then
        mirror(true,true,"angle","angle",-360,0,8,crochet,"cubeInOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1920 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1952 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1968 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 1968 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeIn")
    elseif curStep == 1972 or curStep == 1980 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == 1976 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeIn")
    elseif curStep == 1984 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        bumps("barrel2",0.85,stepCrochet,8)
    elseif curStep == 2000 then
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
    elseif curStep == 2008 then
        tweenShaderProperty('EyeFishEffectGame', 'power',0.15, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.2, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 2048 then
        --mirror(false,true,"","zoom",0,0.75,2,crochet,"cubeOut")
        matt = true
        caWaveRange = 0.03
        caWaveSpeed = 5
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('vignette', 'size',0.7, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('screen shake', (stepCrochet*0.001*256)..',0.02', (crochet*0.001*4)..',0')
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        lascosasdelhud(0,-1000)
    elseif curStep == 2080 then
        tweenShaderProperty('vignette', 'size',1.3, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2168 then
        tweenShaderProperty('vignette', 'size',0.3, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 2176 then
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        matt = false
        cam2 = true
    elseif curStep == 2288 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*3.7, 'cubeIn')
    elseif curStep == 2296 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 2304 then
        setShaderProperty('greyscale', 'strength', 0)
        bloom(8,1,crochet,2,"cubeOut")
        bumps("barrel2",0.85,stepCrochet,8)
        tweenShaderProperty('perlin', 'barrel',5, crochet*0.001*16, 'cubeIn')
        mirror(false,true,"","zoom",0,0.8,16,crochet,"cubeIn")
        perlinSpeed = 0.8
        perlinXRange = 0.15
        perlinYRange = 0.15
    elseif curStep == 2304+8 then
        tweenShaderProperty('bloom', 'contrast',0, crochet*0.001*14, 'cubeIn')
    end
    if curStep >= 2048 and curStep < 2176  then
	    if curStep % 64 == 0 then
            tween("dad", {y = getActorY("dad")+70}, crochet * 0.001 *8, "linear")
        elseif curStep % 64 == 32 then
            tween("dad", {y = getActorY("dad")-70}, crochet * 0.001 * 8, "linear")
        end
    end
    if curStep >= 1824 and curStep < 1856 or curStep >= 2016 and curStep < 2048 then
	    if curStep % 16 == 0 then
            bloom(3,1,crochet,2,"cubeOut")
            setShaderProperty('greyscale', 'strength', 0)
            tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1.5, 'cubeIn')
            setShaderProperty("xyY","y",0)
            tweenShaderProperty('xyY', 'y',3, crochet*0.001*2, 'expoOut')
        elseif curStep % 16 == 8 then
            bloom(3,1,crochet,2,"cubeOut")
            setShaderProperty('greyscale', 'strength', 0)
            tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1.5, 'cubeIn')
            setShaderProperty("xyY","y",3)
            tweenShaderProperty('xyY', 'y',6, crochet*0.001*2, 'expoOut')
        end
    end
    if curStep >= 256 and curStep < 768 or curStep >= 1792 and curStep < 2048 then
	    if curStep % 128 == 16 or curStep % 128 == 48 or curStep % 128 == 80
        or curStep % 128 == 112 then
            bumps("barrel",0.85,stepCrochet,8)
        elseif curStep % 128 == 24 then
            bumps("barrel2",0.85,stepCrochet,8)
        elseif curStep % 128 == 36 or curStep % 128 == 38 then
            bumps("barrel2",0.95,stepCrochet,2)
        elseif curStep % 128 == 40 or curStep % 128 == 44 or curStep % 128 == 76 
        or curStep % 128 == 100 or curStep % 128 == 104 or curStep % 128 == 108 then
            bumps("barrel2",0.9,stepCrochet,4)
        elseif curStep % 128 == 56 or curStep % 128 == 88 or curStep % 128 == 120 then
            bumps("barrel2",0.85,stepCrochet,8)
        end
    end
    if curStep == 2212 or curStep == 2216 or curStep == 2294 then
        bumps("barrel2",0.85,stepCrochet,4)
    elseif curStep == 2240 or curStep == 2272 then
        bumps("barrel2",0.85,stepCrochet,8)
    end
    if curStep >= 1536 and curStep < 1792 then
	    if curStep % 128 == 0 or curStep % 128 == 64 or curStep % 128 == 96 
        or curStep % 128 == 120 then
            bumps("barrel2",0.85,stepCrochet,8)
        elseif curStep % 128 == 36 or curStep % 128 == 40 then
            bumps("barrel2",0.9,stepCrochet,4)
        end
    end
    if curStep >= 512 and curStep < 560 or curStep >= 576 and curStep < 608 or  curStep >= 752 and curStep < 769 then
        if curStep % 16 == 0 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        end
	    if curStep % 16 == 8 then
            mirror(false,true,"","zoom",0,0.85,2,crochet,"cubeIn")
        end
    end
    saltosconcounts(480)
    saltosconcounts(992)
    dropxd(1024)
    dropxd(1280)
end

function saltosconcounts(steps)
    if curStep == steps or curStep == steps+8 or curStep == steps+16 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.15, crochet*0.001*2, 'cubeOut')
    elseif curStep == steps+4 or curStep == steps+12 or curStep == steps+20 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == steps+24 then
        tweenShaderProperty('zoomblurGame', 'focusPower',0, crochet*0.001*2, 'cubeOut')
        if cosoxd then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        end
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenStageColorSwap('hue',0.12, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('perlin', 'barrel',-2, crochet*0.001*2, 'cubeIn')
    elseif curStep == steps+28 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeIn")
    elseif curStep == steps+32 then
        tweenShaderProperty('perlin', 'barrel',0, crochet*0.001*2, 'cubeOut')
        if cosoxd then
           mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
           mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
           setShaderProperty('vcrchroma', 'strength', 1)
        end
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == steps+16 then
        mirror(true,true,"x","x",-2,0,3,crochet,"cubeInOut")
    end
    if curStep == steps then
        tweenShaderProperty('zoomblurGame', 'focusPower',5, crochet*0.001*1, 'cubeOut')
        tweenActorProperty("uno", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+8 then
        tweenActorProperty("uno", 'y',750, stepCrochet*0.001*6, 'cubeOut')
        tweenActorProperty("dos", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+16 then
        tweenActorProperty("dos", 'y',-400, stepCrochet*0.001*6, 'cubeOut')
        tweenActorProperty("tres", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+24 then
        tweenActorProperty("tres", 'y',750, stepCrochet*0.001*6, 'cubeOut')
    end
end
function cosogrey()
    setShaderProperty('greyscale', 'strength', 0)
    tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*3.5, 'cubeIn')
    bloom(4,1,crochet,2,"cubeOut")
end
function dropxd(s)
    --bumps
    if curStep == s+32 or curStep == s+40 or curStep == s+44 or curStep == s+56 or curStep == s+76
    or curStep == s+128+64+12 or curStep == s+128+64+24 or curStep == s+128+64+36 or curStep == s+128+64+40
    or curStep == s+128+64+44  then
        bumps("barrel2",0.9,stepCrochet,4)
    end
    if curStep == s+36 or curStep == s+38 then
        bumps("barrel2",0.9,stepCrochet,2)
    end
    if curStep == s then
        setProperty('', 'cameraSpeed', 3)
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
        mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('speedlines', 'transparency', 0)
        --mirror(false,true,"","zoom",0,0.65,2,crochet,"cubeOut")
        caWaveRange = 0.03
        caWaveSpeed = 5
        matt = true
        triggerEvent('screen shake', (stepCrochet*0.001*256)..',0.015', (crochet*0.001*4)..',0')
    elseif curStep == s+8 or curStep == s+24  then
     --   mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        matt = false
        bf = true
    elseif curStep == s+16 then
       -- mirror(false,true,"","zoom",0,0.65,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
        matt = true
        bf = false
    elseif curStep == s+32 then
        bf = false
        cam2 = true
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        setShaderProperty("xyY","x",0)
        tweenShaderProperty('xyY', 'x',-1, crochet*0.001*3, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+64 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        bf = true
    elseif curStep == s+80 then
       -- mirror(false,true,"","zoom",0,0.65,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,2,crochet,"cubeIn")
        matt = true
        bf = false
    elseif curStep == s+88 then 
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == s+96 then
        cam2 = true
        --mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        matt = false
        bf = false
    elseif curStep == s+112 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*3.5, 'cubeIn')
        mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
        setShaderProperty('xyY', 'y',0)
        tweenShaderProperty('xyY', 'y',1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == s+116 then
        tweenShaderProperty('xyY', 'x',0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == s+120 then
        tweenShaderProperty('xyY', 'y',2, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == s+124 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
    elseif curStep == s+128 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('vignette', 'size',0.7, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*3.5, 'cubeIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,2,crochet,"cubeOut")
        matt = true
        cam2 = false
    end
    if curStep == s+128+16 then
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
        cosogrey()
    elseif curStep == s+128+32 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        cosogrey()
    elseif curStep == s+128+48 then
        cosogrey()
    elseif curStep == s+128+56 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",40,0,2,crochet,"cubeOut")
        tweenShaderProperty('vignette', 'size',0.3, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == s+128+64 then
        cosogrey()
        mirror(true,true,"angle","angle",-45,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        matt = false
        bf = true
    elseif curStep == s+128+64+8 then
        mirror(false,true,"","angle",0,45,2,crochet,"cubeIn")
    elseif curStep == s+128+80 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('greyscale', 'strength',0.7, crochet*0.001*3.5, 'cubeIn')
    elseif curStep == s+128+96 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*3.5, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.5, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+104 then
        mirror(false,true,"","zoom",0,1,2,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*2, 'expoIn')
    elseif curStep == s+128+112 then
        tweenShaderProperty('perlin', 'barrel',15, crochet*0.001*3.7, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0.5, crochet*0.001*3.5, 'cubeIn')
    elseif curStep == s+128+128 then
        tweenShaderProperty('perlin', 'barrel',0, crochet*0.001*2, 'cubeOut')
        bf = false
    
    end
end
