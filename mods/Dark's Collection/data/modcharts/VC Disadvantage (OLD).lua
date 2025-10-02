local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local beatSwap = 1
local time = 0
arrowmove = {256,272,304,336,368,400,432,464,496,504,512,560,592,624,656,688,720,752,1024,1040,1072,1104,1136,1168,1280,1232,1264,1272,1280,1296,1328,1360,1392,1424,1456,1488,1520,1528,1536
,1680,1712,1744,1808,1840,1872,1904,1936,1968,2000,2032}
bloom = {256,384,400,448,576,640,656,672,720,736,752,768,896,960,1536,1600,1664,1728,1792,1808,1856,1920,1984,2112,2240,2304}
saltosbumps = {272,280,292,294,296,300,304,332,336,344,460,464,472,484,488,492,536,548,552,556,612,620,678,716,720,728,1536,1572,1576,1600,1632,1656,1664,1680,1700,1704,1712,1728,1744
,1760,1784,1864,1872,1880,1892,1896,1900,1912,1920,1944,1956,1960,1964,2212,2216,2240}

function createPost()   
    makeCamera("speedlines")
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('hud', 'smoke')
    setShaderProperty("smoke","waveStrength",0)
    setShaderProperty("smoke","smokeStrength",2)
    setShaderProperty("smoke","speed",1.5)
   

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')

    setShaderProperty('color', 'red', 0.0)
    setShaderProperty('color', 'green', 0.0)
    setShaderProperty('color', 'blue', 0.0)

    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('hud', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0.0)
    setShaderProperty('glitchPeak', 'SPEED', 0)

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

    initShader('betterblurGame', 'BetterBlurEffect')
    setCameraShader('game', 'betterblurGame')
    setShaderProperty('betterblurGame', 'strength', 15)
    setShaderProperty('betterblurGame', 'loops', 10)
    setShaderProperty('betterblurGame', 'quality', 5)

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH', 0.05)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')
    setCameraShader('speedlines', 'mirrorGame')
    setShaderProperty('mirrorGame', 'zoom', 1)
    setShaderProperty('mirrorGame', 'angle', 0)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('pincush', 'PincushNewEffect')
    setCameraShader('hud', 'pincush')
	setCameraShader('game', 'pincush')
    setShaderProperty('pincush', 'zoom', 0.6)
    setShaderProperty('pincush', 'x', 0)
    setShaderProperty('pincush', 'y', 0)
    setShaderProperty('pincush', 'angle', 0)
	setShaderProperty('pincush', 'barrel', -1)
    setShaderProperty('pincush', 'doChroma', true)

    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)


    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    initShader('vcrshader', 'vcrshader')
	setCameraShader('game', 'vcrshader')

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setShaderProperty('zoomblur', 'posX', 0)
    setShaderProperty('zoomblur', 'focusPower', 0)

    initShader('godrays', 'godrays')
    setCameraShader('game', 'godrays')
	setCameraShader('hud', 'godrays')
    
    initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)

    initShader('colorHud', 'ColorOverrideEffect')
    setCameraShader('hud', 'colorHud')

    setShaderProperty('colorHud', 'red', 0.0)
    setShaderProperty('colorHud', 'green', 0.0)
    setShaderProperty('colorHud', 'blue', 0.0)

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

    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 24, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'speedlines')
    setActorVisible(false, 'speed')
    setActorLayer('speed', layershit)

    makeSprite('topBar', 'topBar', 0, -440, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1120, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")


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

    for i = 0,7 do
        if not middlescroll then
            if (i >= 0 and i <= 3) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320)
                setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+70)
                setActorProperty(i,"alpha",0)
            elseif (i >= 4 and i <= 7) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320)
                setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+70)
                setActorProperty(i,"alpha",0)
            end
        end
    end

end
function nose(steps)
    if curStep == steps then
        tweenFadeIn("blackBG",0.9,crochet*0.001*4,"cubeIn")
        tweenShaderProperty('mirrorGame', 'zoom',3.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*4, 'cubeIn')
        setShaderProperty('glitchPeak', 'AMT', 0.15)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
        triggerEvent('screen shake', (crochet*0.001*4)..',0.025', (crochet*0.001*4)..',0')
    elseif curStep == steps+16 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.1, crochet*0.001*2, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT',0)
        setShaderProperty('glitchPeak', 'SPEED', 0)
        tweenFadeIn("blackBG",0,crochet*0.001*2,"cubeOut")
    end
end

function saltosconcounts(steps)
    if curStep == steps or curStep == steps+8 or curStep == steps+16 then
        tweenShaderProperty('mirrorGame', 'zoom',2, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == steps+4 or curStep == steps+12 or curStep == steps+20 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    end

    if curStep == steps+24 then
        setShaderProperty('mirrorGame', 'x',-2)
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*12, 'expoOut')
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle',-50, stepCrochet*0.001*4, 'quartOut')
        setShaderProperty('zoomblur', 'posX', 5)
        setShaderProperty('zoomblur', 'focusPower', 10)
        tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*12, 'cubeOut')
       tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*12, 'cubeOut')
    elseif curStep == steps+28 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle',25, stepCrochet*0.001*4, 'cubeIn')
        tweenStageColorSwap('hue', 0.1, crochet*0.001*2, 'cubeOut')
    elseif curStep == steps+32 then
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*4, 'cubeOut')
        bloomBurst(3,1,4)
        setCameraShader('game', 'vcrshader')
        setShaderProperty('glitchChromatic', 'GLITCH', 0.07)
        setShaderProperty('vignette', 'size', 0.5)
    end

    if curStep == steps then
        tweenActorProperty("uno", 'y',150, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty('bottomBar', 'y',-1250, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-350, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength', 30, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == steps+8 then
        tweenActorProperty("uno", 'y',750, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty("dos", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+16 then
        tweenActorProperty("dos", 'y',-400, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty("tres", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+24 then
        tweenActorProperty("tres", 'y',750, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength', 1, crochet*0.001*4, 'cubeOut')
    end
end

function saltosconcounts2(steps)
    if curStep == steps or curStep == steps+8 or curStep == steps+16 then
        tweenShaderProperty('mirrorGame', 'zoom',2, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == steps+4 or curStep == steps+12 or curStep == steps+20 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    end

    if curStep == steps+24 then  
       setShaderProperty('mirrorGame', 'x',-2)
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*12, 'expoOut')
       
        setShaderProperty('zoomblur', 'posX', 5)
        setShaderProperty('zoomblur', 'focusPower', 10)
        tweenShaderProperty('zoomblur', 'posX', 0, stepCrochet*0.001*12, 'cubeOut')
       tweenShaderProperty('zoomblur', 'focusPower', 0, stepCrochet*0.001*12, 'cubeOut')

    end

    if curStep == steps then
        tweenActorProperty("uno", 'y',150, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty('bottomBar', 'y',-1250, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-350, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength', 30, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == steps+8 then
        tweenActorProperty("uno", 'y',750, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty("dos", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+16 then
        tweenActorProperty("dos", 'y',-400, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty("tres", 'y',150, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+24 then
        tweenActorProperty("tres", 'y',750, stepCrochet*0.001*8, 'expoOut')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*6, 'cubeOut')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*6, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength', 1, crochet*0.001*4, 'cubeOut')
    end
end

function cagadaspriteparte(steps)

    if curStep == steps then
        setActorVisible(true, 'speed')
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',-0.225, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle',-15, stepCrochet*0.001*8, 'expoOut')
        bloomBurst(3,1,4)
        setShaderProperty('vignette', 'size', 2)
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 1.5)
    elseif curStep == steps+8 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x',0.15, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*8, 'cubeOut')

    elseif curStep == steps+16 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',-0.225, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle',15, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+24 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x',0.15, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == steps+48 then
        tweenShaderProperty('mirrorGame', 'x',-1, crochet*0.001*2, 'expoOut')
        tweenShaderProperty('barrel', 'zoom',3, crochet*0.001*2, 'expoOut')
        tweenShaderProperty('pincush', 'barrel',-4.5, crochet*0.001*2, 'cubeInOut')
    elseif curStep == steps+58 then
        tweenShaderProperty('barrel', 'zoom',0.7, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel',-1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+62 then
        tweenShaderProperty('barrel', 'zoom',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == steps+64 then
        bloomBurst(2.5,1,4)
    elseif curStep == steps+76 then
        tweenShaderProperty('mirrorGame', 'angle',15, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == steps+80 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',-0.799, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == steps+88 then
        tweenShaderProperty('mirrorGame', 'angle',-15, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+92 then
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*4, 'cubeOut')
    elseif curStep == steps+96 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'x',-1.15, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == steps+112 then
        tweenShaderProperty('greyscale', 'strength',0.8, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',2, stepCrochet*0.001*6, 'expoOut')
        setShaderProperty('mirrorGame', 'y',0)
        tweenShaderProperty('mirrorGame', 'y',1, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == steps+116 then
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+120 then
        tweenShaderProperty('mirrorGame', 'y',2, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == steps+124 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+128 then
        bloomBurst(2.5,1,4)
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('vignette', 'size', 2.5)
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',-0.225, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle',20, crochet*0.001*2, 'cubeOut')
        setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    elseif curStep == steps+130 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == steps+144 then
        tweenShaderProperty('mirrorGame', 'angle',-20, crochet*0.001*2, 'cubeOut')
        bloomBurst(2.5,1,4)
    elseif curStep == steps+160 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*2, 'cubeOut')
        bloomBurst(2.5,1,4)
    elseif curStep == steps+168 then
        bloomBurst(2.5,1,4)
        tweenShaderProperty('vignette', 'size',1.2, crochet*0.001*8, 'cubeOut')
    elseif curStep == steps+184 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == steps+194 then
        tweenShaderProperty('mirrorGame', 'angle',20, stepCrochet*0.001*6, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',1, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == steps+200 then
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == steps+216 then
        tweenShaderProperty('barrel', 'zoom',3, stepCrochet*0.001*6, 'quartOut')
        tweenShaderProperty('pincush', 'barrel',-4.5, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+224 then
        tweenShaderProperty('barrel', 'zoom',0.7, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == steps+228 then
        tweenShaderProperty('barrel', 'zoom',1, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel',-1, crochet*0.001*4, 'cubeOut')
    end


end

function masbumps(bumps)
    
    if curStep == bumps+4 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == bumps+6 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == bumps+8 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == bumps+12 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+24 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == bumps+32 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == bumps+42 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+46 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+52 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == bumps+68 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+72 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+76 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == bumps+92 then
        setShaderProperty('pincushgame', 'zoom',0.75)
        tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
    end
end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, crochet*0.001*steps, 'cubeOut')
end

function bumps(valor,valor2,steps)
    setShaderProperty('pincushgame', 'zoom',valor)
    tweenShaderProperty('pincushgame', 'zoom', valor2, stepCrochet*0.001*steps, 'cubeOut')
end

function songStart()
    tweenShaderProperty('color', 'red', 1, crochet*0.001*24, 'cubeOutIn')
    tweenShaderProperty('color', 'green',1, crochet*0.001*24, 'cubeOutIn')
    tweenShaderProperty('color', 'blue', 1, crochet*0.001*24, 'cubeOutIn')
    tweenShaderProperty('pincush', 'zoom', 1, crochet*0.001*16, 'cubeInOut')
    tweenShaderProperty('betterblurGame', 'strength', 0, crochet*0.001*48, 'cubeIn')
    perlinXRange = 0.15
    perlinYRange = 0.15
    perlinSpeed = 0.5
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('vcrshader', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)
    setCustomShaderFloat('heat', 'iTime', time)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end


function stepHit()
    
	for i = 1, #bloom do
        if curStep == bloom [i]-1 then
            bloomBurst(2.5,1,4)
        end
    end

    for i = 1, #saltosbumps do
        if curStep == saltosbumps [i]-1 then
            bumps(0.75,1,4)
        end
    end

    for i = 1, #arrowmove do
        if curStep == arrowmove [i]-1 then
            beatSwap = beatSwap * -1
            setActorProperty(0,"angle",-40*beatSwap)
            tweenActorProperty(0,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(1,"angle",40*beatSwap)
            tweenActorProperty(1,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(2,"angle",-40*beatSwap)
            tweenActorProperty(2,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(3,"angle",40*beatSwap)
            tweenActorProperty(3,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(4,"angle",-40*beatSwap)
            tweenActorProperty(4,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(5,"angle",40*beatSwap)
            tweenActorProperty(5,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(6,"angle",-40*beatSwap)
            tweenActorProperty(6,"angle",0,stepCrochet*0.001*8,"cubeOut")
            setActorProperty(7,"angle",40*beatSwap)
            tweenActorProperty(7,"angle",0,stepCrochet*0.001*8,"cubeOut")
        end
    end





    if curStep == 176 then
        tweenShaderProperty('zoomblur', 'focusPower', 10, crochet*0.001*14, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*16, 'cubeIn')

        tweenShaderProperty('colorHud', 'red', 1.5, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('colorHud', 'green',1.5, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('colorHud', 'blue', 1.5, crochet*0.001*16, 'cubeIn')

        tweenActorProperty('bottomBar', 'y',-1440, crochet*0.001*16, 'cubeIn')
        tweenActorProperty('topBar', 'y',-150, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', -4, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -70, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'x', -0.4, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('smoke', 'smokeStrength', 0, crochet*0.001*16, 'cubeIn')
    elseif curStep == 232 then
        for i = 0,7 do
            tweenActorProperty(i,"alpha",1,0.5,"cubeOut")
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-10,1,2,"cubeOut")
        end
    elseif curStep == 248 then
        removeCameraShader("game","vcrshader")
        setShaderProperty('vignette', 'size', 0.5)
        setShaderProperty('zoomblur', 'posX', 0)
        setShaderProperty('zoomblur', 'focusPower', 0)
        setShaderProperty('mirrorGame', 'zoom', 0.6)
        tweenShaderProperty('mirrorGame', 'zoom', 2.5, stepCrochet*0.001*6, 'quartOut')
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue',1.5)
        setShaderProperty('colorHud', 'red', 1.5)
        setShaderProperty('colorHud', 'green', 1.5)
        setShaderProperty('colorHud', 'blue',1.5)
        
        setShaderProperty('mirrorGame', 'x',-4)
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*8, 'cubeOut')
        bloomBurst(3.5,1,4)
        setShaderProperty('glitchChromatic', 'GLITCH', 0)
        setShaderProperty('greyscale', 'strength',0)
        tweenActorProperty('bottomBar', 'y',-1120, stepCrochet*0.001*24, 'expoOut')
        tweenActorProperty('topBar', 'y',-440, stepCrochet*0.001*24, 'expoOut')
        tweenShaderProperty('pincush', 'barrel', -1, stepCrochet*0.001*24, 'expoOut')
        tweenFadeIn("healthBar",1,1)
        tweenFadeIn("healthBarBG",1,1)
        tweenFadeIn("infoTxt",1,1)
        tweenFadeIn("iconP1",1,1)
        tweenFadeIn("iconP2",1,1)
        tweenFadeIn("scoreTxt",1,1)
        tweenFadeIn("timeBar",1,1)
        tweenFadeIn("timeBarBG",1,1)
        tweenFadeIn("ratingText",1,1)
    elseif curStep == 254 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 256 then
        setActorProperty(0,"angle",-70)
        tweenActorProperty(0,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(1,"angle",70)
        tweenActorProperty(1,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(2,"angle",-70)
        tweenActorProperty(2,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(3,"angle",70)
        tweenActorProperty(3,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(4,"angle",-70)
        tweenActorProperty(4,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(5,"angle",70)
        tweenActorProperty(5,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(6,"angle",-70)
        tweenActorProperty(6,"angle",0,stepCrochet*0.001*24,"expoOut")
        setActorProperty(7,"angle",70)
        tweenActorProperty(7,"angle",0,stepCrochet*0.001*24,"expoOut")
        for i = 0,7 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+10,1,"expoOut")
                elseif (i >= 4 and i <= 7) then
                    tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-10,1,"expoOut")
                end
            end
        end
    elseif curStep == 258 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
    end

    if curStep >= 304 and curStep < 320 or curStep >= 352 and curStep < 384 or curStep >= 512 and curStep < 624  or curStep >= 648 and curStep < 672 then
	    if curStep % 16 == 0 then
            tweenShaderProperty('barrel', 'zoom', 0.85, stepCrochet*0.001*8, 'cubeIn')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('barrel', 'zoom', 1.0, stepCrochet*0.001*8, 'cubeOut')
        end
    end

    if curStep == 312 or curStep == 824 then
        tweenShaderProperty('mirrorGame', 'zoom',3, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, stepCrochet*0.001*6, 'quartOut')
        tweenFadeIn("blackBG",0.5,stepCrochet*0.001*2,"cubeIn")
    elseif curStep == 318 or curStep == 830 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.1, stepCrochet*0.001*4, 'cubeIn')
        bloomBurst(2.5,1,4)
    elseif curStep == 320 or curStep == 832 then
        tweenFadeIn("blackBG",0,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 322 or curStep == 834 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end

    if curStep == 352 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 1.4, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 360 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.8, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 368 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.8, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('pincushgame', 'barrel', -3, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 376 then
        tweenShaderProperty('mirrorGame', 'zoom', 3.7, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 380 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushgame', 'barrel', -1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 384 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 408 or curStep == 920 then
        tweenShaderProperty('mirrorGame', 'zoom',1.5, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 412 or curStep == 924 then
        tweenShaderProperty('mirrorGame', 'zoom',0.6, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.1, stepCrochet*0.001*4, 'cubeOut')
    end
    if curStep == 440 then
        tweenShaderProperty('greyscale', 'strength',1, stepCrochet*0.001*6, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',2, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle',15, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 444 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 448 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength',0)
    end


    if curStep == 952 then
        tweenShaderProperty('mirrorGame', 'zoom',2, stepCrochet*0.001*4, 'quartOut')
        tweenShaderProperty('mirrorGame', 'angle',15, stepCrochet*0.001*4, 'quartOut')
    elseif curStep == 956 then
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 960 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 568 then
        setShaderProperty('greyscale', 'strength',1)
        setShaderProperty('mirrorGame', 'y', 0.15)
        tweenShaderProperty('mirrorGame', 'y', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',1.8, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 572 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 616 then
        setShaderProperty('greyscale', 'strength',1)
        tweenShaderProperty('mirrorGame', 'zoom',1.8, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle',20, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 620 then
        tweenShaderProperty('mirrorGame', 'zoom',0.7, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle',10, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*4, 'cubeOut')
    elseif curStep == 624 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 632 then
        setShaderProperty('greyscale', 'strength',1)
        tweenShaderProperty('mirrorGame', 'zoom',1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength',35, crochet*0.001*2, 'cubeOut')
    elseif curStep == 636 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel',-2.7, stepCrochet*0.001*2, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1200, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-350, crochet*0.001*4, 'cubeOut')
        setShaderProperty('greyscale', 'strength',0)
    elseif curStep == 640 then
        tweenShaderProperty('mirrorGame', 'zoom',3.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 648 then
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 664 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel',-1, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*4, 'cubeOut')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*4, 'cubeOut')
    elseif curStep == 668 then
        tweenShaderProperty('mirrorGame', 'zoom',1.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 672 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 696 then
        tweenShaderProperty('mirrorGame', 'zoom',1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('betterblurGame', 'strength',55, crochet*0.001*4, 'cubeIn')
        setShaderProperty('greyscale', 'strength',0)
    elseif curStep == 700 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 704 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 730 then
        tweenShaderProperty('mirrorGame', 'zoom',1.5, stepCrochet*0.001*6, 'cubeIn')
        tweenShaderProperty('betterblurGame', 'strength',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 736 then
        tweenShaderProperty('mirrorGame', 'zoom',1.1, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 744 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',0.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 748 then
        tweenShaderProperty('mirrorGame', 'zoom',0.85, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 752 then
        tweenShaderProperty('greyscale', 'strength',0, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 756 then
        tweenShaderProperty('mirrorGame', 'zoom',0.85, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 760 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 768 or curStep == 1024 then
        setShaderProperty('barrel', 'barrel', -6)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end


    if curStep == 768 then
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
        tweenShaderProperty('smoke', 'smokeStrength', 2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 992 then
        tweenShaderProperty('smoke', 'smokeStrength', 0, crochet*0.001*8, 'cubeIn')
    end

    if curStep == 1024 then
        for i = 0,3 do
            if not middlescroll then
                if (i >= 0 and i <= 3) then
                    setActorProperty(i,"alpha",0)
                end
            end
        end
    end


    if curStep == 864 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.4, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 872 then
        tweenShaderProperty('mirrorGame', 'zoom', 1.8, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 880 then
        tweenShaderProperty('mirrorGame', 'zoom', 2.8, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 888 then
        tweenShaderProperty('mirrorGame', 'zoom', 3.7, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('mirrorGame', 'angle', -15, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 892 then
        tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', 15, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'barrel', 0.1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 896 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 1536 then
        tweenShaderProperty('mirrorGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
        
        setShaderProperty('glitchPeak', 'AMT',0.05)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
        setShaderProperty('glitchChromatic', 'GLITCH', 0.0)
        setShaderProperty('barrel', 'barrel', -2)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0.5, crochet*0.001*4, 'cubeOut')
        setActorVisible(false, 'speed')
    elseif curStep == 1568 or curStep == 1616 or curStep == 1640 or curStep == 1696 or curStep == 1744 or curStep == 1768 then
        tweenShaderProperty('mirrorGame', 'angle', 15, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1600 or curStep == 1632 or curStep == 1648 or curStep == 1728 or curStep == 1760 then
        tweenShaderProperty('mirrorGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1656 or curStep == 1776 then
        tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1660 then
        tweenShaderProperty('mirrorGame', 'angle',-25, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1664 then
        tweenShaderProperty('mirrorGame', 'angle', -15, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 1768 then
        tweenShaderProperty('mirrorGame', 'zoom',5.5, crochet*0.001*6, 'cubeIn')
        tweenShaderProperty('betterblurGame', 'strength',30, crochet*0.001*6, 'cubeIn')
        tweenStageColorSwap('hue', -0.05, crochet*0.001*2, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1200, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-370, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel',-2.5, crochet*0.001*6, 'cubeIn')
    elseif curStep == 1784 then
        for i = 0,3 do
            if (i >= 0 and i <= 3) then
                tweenActorProperty(i,"alpha",1,0.5,"cubeOut")
            end
        end
    elseif curStep == 1792 then
        setShaderProperty('glitchChromatic', 'GLITCH', 0.07)
        setShaderProperty('glitchPeak', 'AMT',0)
        setShaderProperty('glitchPeak', 'SPEED', 0)
        setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        perlinXRange = 0
        perlinYRange = 0
        perlinSpeed = 0
    elseif curStep == 1824 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*8, 'cubeIn')
        tweenShaderProperty('betterblurGame', 'strength',0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel',-1, crochet*0.001*8, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*8, 'cubeIn')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*8, 'cubeIn')
    elseif curStep == 1856 then
        setShaderProperty('greyscale', 'strength',1)
        perlinXRange = 0.15
        perlinYRange = 0.15
        perlinSpeed = 0.5
    elseif curStep == 1888 then
        setShaderProperty('greyscale', 'strength',0)
    elseif curStep == 1900 then
        setShaderProperty('mirrorGame', 'angle',-360)
        tweenShaderProperty('mirrorGame', 'angle',0, crochet*0.001*6, 'cubeInOut')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1908 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*2, 'cubeOut')
    end


    if curStep == 1940 then
        tweenActorProperty("dos", 'y',150, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == 1946 then
        tweenActorProperty("dos", 'y',-400, stepCrochet*0.001*6, 'expoOut')
        tweenActorProperty("cuatro", 'y',150, stepCrochet*0.001*6, 'expoOut')
    elseif curStep == 1952 then
        tweenActorProperty("cuatro", 'y',750, stepCrochet*0.001*6, 'expoOut')
    end

    if curStep == 1952 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*6, 'quartOut')
    elseif curStep == 1968 then
        tweenShaderProperty('mirrorGame', 'zoom',0.9, stepCrochet*0.001*4, 'cubein')
        tweenShaderProperty('mirrorGame', 'angle',20, stepCrochet*0.001*4, 'cubein')
    elseif curStep == 1972 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*4, 'cubein')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*4, 'cubein')
    elseif curStep == 1976 then
        tweenShaderProperty('mirrorGame', 'zoom',0.9, stepCrochet*0.001*4, 'cubein')
        tweenShaderProperty('mirrorGame', 'angle',-20, stepCrochet*0.001*4, 'cubein')
    elseif curStep == 1980 then
        tweenShaderProperty('mirrorGame', 'zoom',2.5, stepCrochet*0.001*4, 'cubein')
        tweenShaderProperty('mirrorGame', 'angle',0, stepCrochet*0.001*4, 'cubein')
    elseif curStep == 1984 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubein')
    elseif curStep == 2000 then
        tweenShaderProperty('mirrorGame', 'zoom',5.5, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1200, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-370, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel',-2.5, crochet*0.001*6, 'cubeIn')
    elseif curStep == 2032 then
        tweenShaderProperty('mirrorGame', 'zoom',1, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel',-1, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1120, crochet*0.001*4, 'cubeIn')
        tweenActorProperty('topBar', 'y',-440, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2048 then
        bloomBurst(2.5,1,4)
        tweenShaderProperty('smoke', 'smokeStrength', 2, crochet*0.001*8, 'cubeIn')
        setShaderProperty('vignette', 'size', 2.5)
        tweenShaderProperty('mirrorGame', 'zoom',0.8, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',-0.225, stepCrochet*0.001*8, 'expoOut')
        setShaderProperty('barrel', 'barrel', -4)
		tweenShaderProperty('barrel', 'barrel', 0, crochet*0.001*4, 'cubeOut')
        triggerEvent('screen shake', (crochet*0.001*64)..',0.015', (crochet*0.001*64)..',0.0')
        setShaderProperty('glitchPeak', 'AMT',0.05)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
        for i = 0,7 do
            if (i >= 0 and i <= 7) then
                setActorProperty(i,"alpha",0)
            end
        end
    elseif curStep == 2160 then
        tweenShaderProperty('vignette', 'size',1, crochet*0.001*4, 'cubeOut')
        for i = 4,7 do
            if (i >= 4 and i <= 7) then
                tweenActorProperty(i,"alpha",1,0.5,"cubeOut")
            end
        end
    end
    if curStep == 2176 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*8, 'expoOut')
        tweenShaderProperty('mirrorGame', 'x',0, stepCrochet*0.001*8, 'expoOut')
    elseif curStep == 2288 then
        tweenShaderProperty('mirrorGame', 'zoom',2.3, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*4, 'cubeOut')
    elseif curStep == 2298 then
        tweenShaderProperty('mirrorGame', 'zoom',1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2304 then
        tweenShaderProperty('greyscale', 'strength',0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('zoomblur', 'focusPower', 10, crochet*0.001*14, 'cubeIn')
        tweenShaderProperty('color', 'red', 0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'green',0, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('color', 'blue', 0, crochet*0.001*16, 'cubeIn')
        tweenActorProperty('bottomBar', 'y',-1440, crochet*0.001*16, 'cubeIn')
        tweenActorProperty('topBar', 'y',-150, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', -4, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'angle', -70, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('mirrorGame', 'x', -0.4, crochet*0.001*16, 'cubeIn')
        tweenShaderProperty('smoke', 'smokeStrength', 0, crochet*0.001*16, 'cubeIn')
        for i = 4,7 do
            if (i >= 4 and i <= 7) then
                tweenActorProperty(i,"alpha",0,1,"cubeOut")
            end
        end
    end

    if curStep >= 1824 and curStep < 1856 or curStep >= 2016 and curStep < 2048 then
	    if curStep % 8 == 0 then
            setShaderProperty('mirrorGame', 'y', -4)
		    tweenShaderProperty('mirrorGame', 'y', 0, stepCrochet*0.001*8, 'expoOut')
            tweenShaderProperty('greyscale', 'strength',0.6, stepCrochet*0.001*2, 'cubeIn')
        elseif curStep % 8 == 4 then
            setShaderProperty('greyscale', 'strength',0)
            setShaderProperty('bloom', 'contrast',2)
            tweenShaderProperty('bloom', 'contrast', 1, stepCrochet*0.001*4, 'linear')
        end
    end

    nose(416)
    nose(928)
    saltosconcounts(480)
    saltosconcounts2(992)
    cagadaspriteparte(1024)
    cagadaspriteparte(1280)
    masbumps(1312)
    masbumps(1056)
end