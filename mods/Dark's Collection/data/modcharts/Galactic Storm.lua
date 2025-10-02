local textos = {
    {'texto1',"I've only used like 0.001% of my power so far",0, 350, 30,"hud","white"},
    {'texto2',"this is like",0, 350, 40,"hud","white"},
    {'texto3',"this can go two ways, punk.",0, 350, 30,"hud","white"},
    {'texto5',"one, you walk away.",0, 350, 30,"hud","white"},
    {'texto4',"two, I walk on your-",0, 350, 40,"hud","white"},
}
local noteXPos = {}
local targetnoteXPos = {}
local noteYPos = {}
local targetnoteYPos = {}
local noteZPos = {}
local noteZScale = {}
local targetnoteZPos = {}
local noteAngle = {}
local targetnoteAngle = {}
local startSpeed = 1
local modcharts = true
function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
    set("ratingText.alpha",s)
end
local downscroll = 1
local angle = true
local bloom = true

function createPost()
    makeCamera("concentrate")
    startSpeed = getProperty('', 'speed')
	for i = 0, (keyCount*2)-1 do 
		table.insert(noteXPos, 0) --setup default pos and whatever
		table.insert(noteYPos, 0)
		table.insert(noteZPos, 0)
		table.insert(noteZScale, 1)
		table.insert(noteAngle, 0)
		table.insert(targetnoteXPos, 0)
		table.insert(targetnoteYPos, 0)
		table.insert(targetnoteZPos, 0)
		table.insert(targetnoteAngle, 0) 
		noteXPos[i+1] = getActorX(i)
		targetnoteXPos[i+1] = getActorX(i)
		targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
		noteYPos[i+1] = _G['defaultStrum'..i..'Y']
	end

    lascosasdelhud(0)
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    if downscrollBool then
        downscroll = -1
    end

    makeCamera("counts")
    makeCamera("vignette")

    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setCameraShader('counts', 'godrays')
    setShaderProperty('godrays', 'decay', 0.7)
    setShaderProperty('godrays', 'density',0.15)
    setShaderProperty('godrays', 'weigth', 0.5)



    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.01, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)
    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)
    
    initShader('scanline', 'ScanlineEffect')
    setCameraShader('vignette', 'scanline')
    setCameraShader('counts', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)
   
    initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
	--setCameraShader('hud', 'barrel')
	setShaderProperty('barrel', 'zoom', 0.7)
	setShaderProperty('barrel','x',0)
	setShaderProperty('barrel','y',0)
	setShaderProperty('barrel','angle', 0)
	setShaderProperty('barrel', 'barrel', 0)
	setShaderProperty('barrel', 'doChroma', true)
    initShader('perlingame', 'BarrelBlurEffect')
	setCameraShader('game', 'perlingame')
	setShaderProperty('perlingame', 'zoom', 1)
	setShaderProperty('perlingame','x',0)
	setShaderProperty('perlingame','y',0)
	setShaderProperty('perlingame','angle', 0)
    setShaderProperty('perlingame','barrel', 0)
    setShaderProperty('perlingame', 'doChroma', true)

    initShader('angles', 'BarrelBlurEffect')
	setCameraShader('game', 'angles')
	setShaderProperty('angles', 'zoom', 1)
	setShaderProperty('angles','angle', 0)


    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
  --  setCameraShader('hud', 'zoomblur')
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'posX', 2)
    setShaderProperty('zoomblur', 'focusPower', 3)
    initShader('zoomblurGame', 'zoomblur')
    setCameraShader('game', 'zoomblurGame')
    setShaderProperty('zoomblurGame', 'posY', 0)
    setShaderProperty('zoomblurGame', 'posX', 2)
    setShaderProperty('zoomblurGame', 'focusPower', 0)


    initShader('vignette', 'VignetteEffect')
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.3)
    
    initShader('heat', 'HeatEffect')
	setCameraShader('game', 'heat')
    setCameraShader('hud', 'heat')
    setShaderProperty("heat","strength",1)
    initShader('smoke', 'PerlinSmokeEffect')
    setCameraShader('game', 'smoke')
    setShaderProperty('smoke', 'waveStrength', 0)
    setShaderProperty('smoke', 'smokeStrength', 0)
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('counts', 'color')
    setCameraShader('vignette', 'color')
    setShaderProperty('color', 'red', 1.75)
    setShaderProperty('color', 'green', 1.75)
    setShaderProperty('color', 'blue', 1.75)
    initShader('colorHUD', 'ColorOverrideEffect')
    setCameraShader('hud', 'colorHUD')
    setShaderProperty('colorHUD', 'red', 1.75)
    setShaderProperty('colorHUD', 'green', 1.75)
    setShaderProperty('colorHUD', 'blue', 1.75)
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setCameraShader('counts', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)
    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
   -- setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 0)
   

    initShader('colorfillgame', 'ColorFillEffect')
    setCameraShader('game', 'colorfillgame')
    setShaderProperty('colorfillgame', 'red', 255)
    setShaderProperty('colorfillgame', 'green', 255)
    setShaderProperty('colorfillgame', 'blue', 255)
    setShaderProperty('colorfillgame', 'fade', 1)

    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
    setCameraShader('concentrate', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)


    initShader('pincush', 'PincushNewEffect')
	setCameraShader('game', 'pincush')
   -- setCameraShader('hud', 'pincush')
    setShaderProperty('pincush', 'zoom', 1)
	setShaderProperty('pincush', 'barrel', 0)
    setShaderProperty('pincush', 'angle', 0)
    setShaderProperty('pincush', 'doChroma', true)

    initShader('pincushGame', 'PincushNewEffect')
    setCameraShader('game', 'pincushGame')
    setShaderProperty('pincushGame', 'zoom', 1)
    setShaderProperty('pincushGame', 'angle', 0)
    setShaderProperty('pincushGame', 'y', 0)
	setShaderProperty('pincushGame', 'barrel', 0)
    setShaderProperty('pincushGame', 'doChroma', true)

    initShader('perlin', 'PincushNewEffect')
    setCameraShader('game', 'perlin')
    setShaderProperty('perlin', 'zoom', 1)
    setShaderProperty('perlin', 'angle', 0)
    setShaderProperty('perlin', 'y', 0)
	setShaderProperty('perlin', 'barrel', 0)
    setShaderProperty('perlin', 'doChroma', true)
   
    initShader('EyeFishEffectGame', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)
    initShader('EyeFishEffect', 'EyeFishEffect')
    setCameraShader('game', 'EyeFishEffect')
   -- setCameraShader('hud', 'EyeFishEffect')
    setShaderProperty('EyeFishEffect', 'power', 0)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setCameraShader('counts', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)


    initShader('sobel', 'SobelEffect')
    setCameraShader('hud', 'sobel')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 2)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.003)

    makeSprite('concentrate', 'concentrate2', 0, 1000, 1)
    setActorProperty('concentrate','angle',-40)
	setObjectCamera('concentrate', 'concentrate')

    makeSprite('uno', 'uno', 3000, 100, 1.2)
	setObjectCamera('uno', 'counts')

	makeSprite('dos', 'dos', 3000, 100, 1.2)
	setObjectCamera('dos', 'counts')

	makeSprite('tres', 'tres', 3000, 100, 1.2)
	setObjectCamera('tres', 'counts')

	makeSprite('cuatro', 'cuatro', 3000, 100, 1.2)
	setObjectCamera('cuatro', 'counts')

    makeSprite('uno1', 'uno', 3000, 100, 1.2)
	setObjectCamera('uno1', 'counts')

	makeSprite('dos2', 'dos', 3000, 100, 1.2)
	setObjectCamera('dos2', 'counts')

	makeSprite('tres3', 'tres', 3000, 100, 1.2)
	setObjectCamera('tres3', 'counts')

	makeSprite('cuatro4', 'cuatro', 3000, 100, 1.2)
	setObjectCamera('cuatro4', 'counts')

    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-650,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(650,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    for _, text in ipairs(textos) do
        makeText(text[1], text[2], text[3], text[4], text[5])
        setCamera(text[1], text[6])
        setActorScroll(0, 0,text[1])
        center(text[1])
        setActorX(getActorX(text[1])+60, text[1])
        setActorFont(text[1], "Contb___.ttf")
        setActorTextColor(text[1], text[7])
        setActorAlpha(0, text[1])
    end

    for i = 0,(keyCount*2)-1 do
        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 150*downscroll
    end
end
    

local noteScale = 1

function lerp(a, b, ratio)
	return a + ratio * (b - a); --the funny lerp
end
local defaultNoteScale = -1
local lerpX = true
local lerpY = false
local lerpAngle = true
local lerpScale = true

local defaultWidth = -1
local defaultSusWidth = -1
local defaultSusHeight = -1
local defaultSusEndHeight = -1

local notesSeen = {}

local noteRotX = 0
local targetNoteRotX = 0

local lerpSpeedScale = 5
local lerpSpeedX = 3
local lerpSpeedY = 2
local lerpSpeedZ = 4
local lerpSpeedAngle = 3
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0
function bloom(contrast,value1,speed,curStep)
    if bloom then
       setShaderProperty("bloom","contrast",contrast)
       tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,"cubeOut")
    end
end
local time = 0
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 2 
local perlinXRange = 0.1
local perlinYRange = 0.1
local perlinZRange = 0
local rotCam = true
local rotCamSpd = 0
local rotCamRange = 0
local rotCamInd = 0
local gamerot = true
local gamerotSpd = 0
local gamerotRange = 0
local gamerotInd = 0
local perlinWave = 0


local perlinWaveSpeed = 0

local perlinWaveRange = 0
local sxm = false
local bfs = false
function update(elapsed)
    if sxm then
        set("camFollow.x",1155)
        set("camFollow.y",600)
        set("defaultCamZoom", 0.65)
    end
    if bfs then
        set("camFollow.x", get("boyfriend.x") + 100)
        set("camFollow.y", get("boyfriend.y") + 150)
        set("defaultCamZoom", 0.7)
    end
    time = time + elapsed
    setCustomShaderFloat('godrays', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    setCustomShaderFloat('heat', 'iTime', time)
    setCustomShaderFloat('smoke', 'iTime', time)

    setCustomShaderFloat('chess', 'iTime', time)
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
   
    setShaderProperty('pincush', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('pincush', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    setShaderProperty('perlin', 'angle', ((-0.5 + perlin(0, perlinZ, 0))*perlinZRange))

    perlinWave = perlinWave + elapsed*math.random()*perlinWaveSpeed

    setShaderProperty('smoke', 'waveStrength', ((-0.5 + perlin(0, perlinWave, 0))*perlinWaveRange))
	
    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('pincush', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('pincush', 'angle', 0)
    end

    if gamerot then
        gamerotInd = gamerotInd + (elapsed / (1 / 120))
        setShaderProperty('pincushGame', 'angle', math.sin(gamerotInd / 100 * gamerotSpd) * gamerotRange)
    else
        setShaderProperty('pincushGame', 'angle', 0)
    end
    
    angulo = lerp(angulo, 0, elapsed*8)
    setShaderProperty('angles', 'angle', angulo)
end

function songStart()
    tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*32, 'linear')
    tweenShaderProperty('bloom', 'contrast', 1, crochet*0.001*24, 'linear')
    tweenShaderProperty('zoomblur', 'focusPower', 0, crochet*0.001*24, 'linear')
end
function angulos(w,step)
    setShaderProperty('barrel', 'angle', w, stepCrochet*0.001, 'cubeIn')
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*step, 'cubeOut')
end
function saltoscolorido(s)
    if curStep == s then
        setShaderProperty('glitchPeak', 'AMT', 0)
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffect', 'power', 0.2, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+8 then
        setShaderProperty('chess', 'transparency', 0.1)
        tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*1, 'cubeOut')
        setShaderProperty('color', 'red', 2.5)
        setShaderProperty('color', 'green', 1.5)
        setShaderProperty('color', 'blue', 2)
        setShaderProperty('perlingame', 'y', -0.2)
        tweenShaderProperty('perlingame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+12 then
        setShaderProperty('chess', 'transparency', 0)
        setShaderProperty('perlingame', 'y',0.2)
        tweenShaderProperty('perlingame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('EyeFishEffect', 'power', 0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*1, 'cubeIn')
    elseif curStep == s+16 then
        bloom(6,1,crochet,2)
        setShaderProperty('color', 'red', 1.75)
        setShaderProperty('color', 'green', 1.75)
        setShaderProperty('color', 'blue', 1.75)
    end
end
function flechasxd(xd,s)
    for i = 0,(keyCount*2)-1 do
        if i % 2 == 0 then
            noteAngle[i+1] = xd-- -40
        else 
            noteAngle[i+1] = s-- 40
        end
    end
end
local swap = 1
local beatSwap = 1
local shift = 1
local beat = 1
anglespunch = {796,860,892,912,928,1000,1020}
anglespunchotro = {792,824,888,920,984,1016}

bloomzoom = {2060,2076,2092,2104,2108,2110,2112,2118,2124,2134,2150,2156,2162,2168,2170}

notasygrey = {1812,1824,1832,1844,1852,1884,1892,1904,1920}
notasygreyotro = {1820,1828,1840,1848,1876,1888,1896,1908,1916}

movimiento1 = {2304,2308,2312}
movimiento2 = {2384,2388,2392,2426}
movimiento3 = {2400,2404,2416,2420}
function stepHit()
    if curStep == 128 then
         setActorAlpha(1, "texto1")
    elseif curStep == 184 then
         setActorAlpha(0, "texto1")
         setActorAlpha(1, "texto2")
    elseif curStep == 192 then
         setActorAlpha(0, "texto2")
         setActorAlpha(1, "texto3")
    elseif curStep == 224 then
            setActorAlpha(0, "texto3")
            setActorAlpha(1, "texto5")
    elseif curStep == 240 then
         setActorAlpha(0, "texto5")
         setActorAlpha(1, "texto4")
    elseif curStep == 256 then
        destroy("texto1")
        destroy("texto2")
        destroy("texto3")
        destroy("texto4")
        destroy("texto5")
    end 
    if curStep == 704 or curStep == 896 or curStep == 1152 or curStep == 1232 or curStep == 1240 or curStep == 1408 or curStep == 1536 or curStep == 1568 
    or curStep == 2592 or curStep == 2672 or curStep == 2680 or curStep == 2720 then
        sxm = true
        bfs = false
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 736 or curStep == 928 or curStep == 1184  or curStep == 1236  or curStep == 1244 or curStep == 1472 or curStep == 1552 or curStep == 1600
    or curStep == 2624 or curStep == 2676 or curStep == 2684 or curStep == 2852 then
        bfs = true
        sxm = false
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 768 or curStep == 960 or curStep == 1216  or curStep == 1248 or curStep == 1520 or curStep == 1648 or curStep == 2656 or curStep == 2688 then
        bfs = false
        sxm = false
        set("defaultCamZoom", 0.5)
        setProperty('', 'cameraSpeed', 1)
    end
    if curStep == 512 or curStep == 1536 or curStep == 2704 then
        tweenActorProperty("topBar","y",-650, crochet*0.001*2, 'linear')
        tweenActorProperty("bottomBar","y",650, crochet*0.001*2, 'linear')
    elseif curStep == 1024 or curStep == 2288 then
        tweenActorProperty("topBar","y",-750, crochet*0.001*2, 'linear')
        tweenActorProperty("bottomBar","y",750, crochet*0.001*2, 'linear')
    end
    if curStep >= 2720 and curStep < 2976 then--896
        if curStep % 32 == 0 then
           flechasxd(-40,40)
        elseif curStep % 32 == 8 then
            flechasxd(360,360)
        elseif curStep % 32 == 14 then
            flechasxd(40,-40)
        elseif curStep % 32 == 20 then
            flechasxd(-40,40)
        elseif curStep % 32 == 24 then
            flechasxd(-360,-360)
        elseif curStep % 32 == 28 then
            flechasxd(40,-40)
        end
    end
    if curStep == 2704 then
        playCharacterAnimation('dadCharacter1', 'trans', true)
    end
    if curStep == 2720 then
       
        setShaderProperty('smoke', 'smokeStrength', 2)
        setShaderProperty('smoke', 'speed', 2.5)
        setShaderProperty('perlingame', 'zoom',0.4)
        tweenShaderProperty('perlingame', 'zoom', 1, crochet*0.001*16, 'linear')
        drunkSpeed = 10
        drunkLerp = 1
        if difficulty == "4K" then
            for i = 0,7 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 320
                        setActorProperty(i,"alpha",1)
    
                    elseif (i >= 4 and i <= 7) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                    end
                end
            end
        end
        if difficulty == "9K" then
            for i = 0,17 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 200
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 5 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 440
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 4 and i <= 4) then
                        setActorProperty(i,"alpha",0)
                    elseif (i >= 9 and i <= 17) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                    end
                end
            end
        end
        if difficulty == "12K" then
            for i = 0,23 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 200
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 4 and i <= 11) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 440
                        setActorProperty(i,"alpha",1)
                    
                    elseif (i >= 12 and i <= 23) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                    end
                end
            end
        end
    elseif curStep == 2840 then
        drunkLerp = 0
        if difficulty == "4K" then
            for i = 0,7 do
                if not middlescroll then
                    if (i >= 0 and i <= 3)then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 4 and i <= 7) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
                    end
                end
            end
        end
        if difficulty == "9K" then
            for i = 0,17 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) or (i >= 5 and i <= 8) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 4 and i <= 4) then
                        setActorProperty(i,"alpha",0)
                    elseif (i >= 9 and i <= 17) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
                    end
                end
            end
        end
        if difficulty == "12K" then
            for i = 0,23 do
                if not middlescroll then
                    if (i >= 0 and i <= 11) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 250*downscroll
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 12 and i <= 23) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
                    end
                end
            end
        end
    elseif curStep == 2848 then
     
        lerpSpeedX = 20
        if difficulty == "4K" then
            for i = 0,7 do
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1260
               end
           end
        end
        if difficulty == "9K" then
            for i = 0,17 do
                if (i >= 0 and i <= 3) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 1260
                elseif (i >= 5 and i <= 8) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 8260
               end
           end
        end
        if difficulty == "12K" then
            for i = 0,23 do
                if (i >= 0 and i <= 5) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + 1260
                elseif (i >= 6 and i <= 11) then
                    targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 8260
               end
           end
        end
    end
    if curStep >= 2076 and curStep < 2080 or curStep >= 2140 and curStep < 2144 or curStep >= 2172 and curStep < 2176 then
        if curStep % 1 == 0 then
            bloom(2,1,stepCrochet,1)
            noteScale = noteScale + 0.2
        end
    end
    if curStep >= 2428 and curStep < 2432 then
        if curStep % 1 == 0 then
            noteScale = noteScale + 0.2
        end
    end
    if curStep == 2376 then
        noteRotX = 360
    end
    saltoscolorido(720)
    saltoscolorido(752)
    dropsraro(1024,1088)
    dropsraro(2464,2528)
    for i = 1, #anglespunch do
        if curStep == anglespunch [i] then
            --angulos(-15,4)
            angulo = -25
        end
    end
    for i = 1, #anglespunchotro do
        if curStep == anglespunchotro [i] then
            angulo = 25
        end
    end
    for i = 1, #notasygrey do
        if curStep == notasygrey [i] then
            greyscalelol(0.0,1,3,'cubeIn')
            noteRotX = -25
        end
    end
    for i = 1, #notasygreyotro do
        if curStep == notasygreyotro [i] then
            greyscalelol(0.0,1,3,'cubeIn')
            noteRotX = 25
        end
    end
    for i = 1, #bloomzoom do
        if curStep == bloomzoom [i] then
            bloom(2,1,stepCrochet,4)
            noteScale = noteScale + 0.6
        end
    end

    for i = 1, #movimiento1 do
        if curStep == movimiento1 [i] then
            swap = swap* -1
            movimientoraroxd(0.1*swap,0,4)
        end
    end
    for i = 1, #movimiento2 do
        if curStep == movimiento2 [i] then
            swap = swap* -1
            movimientoraroxd(0.1*swap,0,4)
        end
    end
    for i = 1, #movimiento3 do
        if curStep == movimiento3 [i] then
            swap = swap* -1
            movimientoraroxd(0.1*swap,0,4)
        end
    end
    
    if curStep == 268 or curStep == 300 or curStep == 332 or curStep == 364 or curStep == 396 or curStep == 428 or curStep == 448 or curStep == 460 or curStep == 488 then
        angulos(15,4)
    elseif curStep == 288 or curStep == 320 or curStep == 352 or curStep == 384 or curStep == 416 or curStep == 454 or curStep == 480 or curStep == 492 then
        angulos(-15,4)
    end
    if curStep == 440 then
        angulos(-15,4)
        setShaderProperty("greyscale","strength",0)
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'linear')
        setShaderProperty("zoomblur","focusPower",5)
        tweenShaderProperty('zoomblur', 'focusPower', 0, crochet*0.001*1, 'linear')
    elseif curStep == 444 or curStep == 470 then
        angulos(15,4)
        setShaderProperty("zoomblur","focusPower",5)
        tweenShaderProperty('zoomblur', 'focusPower', 0, crochet*0.001*1, 'linear')
        setShaderProperty("greyscale","strength",0)
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'linear')
    end
   
    if curStep == 128 then
        bloom(6,1,crochet,2)
        setShaderProperty("greyscale","strength",0)
        for i = 0,23 do
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
           tweenActorProperty(i,"angle",360,crochet*0.001*6, 'cubeOut')
        end
    elseif curStep == 192 then
        bloom(8,1,crochet,2)
        lascosasdelhud(1)
    end
    if curStep == 246 then
        tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*1.5, 'cubeOut')
    elseif curStep == 252 then
        setShaderProperty("barrel","angle",360)
        tweenShaderProperty('barrel', 'angle', 0, crochet*0.001*2.7, 'cubeInOut')
        tweenShaderProperty('zoomblur', 'focusPower', 3, crochet*0.001*0.8, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2.7, 'cubeInOut')
    elseif curStep == 256 then
        bloom(6,1,crochet,2)
        setShaderProperty('chess', 'transparency', 0.1)
     
        setShaderProperty('zoomblur', 'focusPower', 0)
       
        perlinSpeed = 0
        perlinXRange = 0
        perlinYRange = 0
    end
    if curStep >= 256 and curStep < 512 then
        if curStep % 32 == 16 then
            setShaderProperty('chess', 'transparency', 0)
            tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*1, 'cubeOut')
            tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeOut')
            tweenShaderProperty('pincush', 'barrel', 2, crochet*0.001*1, 'cubeOut')
            setShaderProperty("glitchPeak","AMT",0)
        elseif curStep % 32 == 24 then
            tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*2, 'expoIn')
            tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*2, 'expoIn')
        end
    end
    if curStep >= 284 and curStep < 288 or curStep >= 348 and curStep < 352 or curStep >= 412 and curStep < 416 or curStep >= 476 and curStep < 480 then
        if curStep % 1 == 0 then
            triggerEvent('add Camera Zoom','0.06','0.06')
            setShaderProperty("greyscale","strength",0)
        end
    end
    if curStep >= 288 and curStep < 512 then
        if curStep % 32 == 0 then
            triggerEvent('screen shake', (crochet*0.001*4)..',0.01')
            setShaderProperty('chess', 'transparency', 0.1)
            setShaderProperty("greyscale","strength",0)
            setShaderProperty("glitchPeak","AMT",0.015)
            bloom(6,1,crochet,3)
        end
    end
    if curStep == 496 then
        tweenShaderProperty('bloom', 'contrast', 5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 512 then
        flashCamera("hud","white",0.6)
        tweenShaderProperty('bloom', 'contrast', 1, crochet*0.001*1, 'cubeIn')
        rotCam = true
        rotCamSpd = 3
        rotCamRange = 5
    elseif curStep == 688 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*3.5, 'cubeIn')
    elseif curStep == 696 then
        tweenShaderProperty('perlingame', 'angle', 70, crochet*0.001*2, 'cubeIn')
    elseif curStep == 704 then
        setShaderProperty("greyscale","strength",0)
        tweenShaderProperty('perlingame', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bloom(6,1,crochet,3)
        setShaderProperty('glitchPeak', 'AMT', 0.1)
    elseif curStep == 736 then
        setShaderProperty('glitchPeak', 'AMT', 0.1)
    elseif curStep == 768 then
        setShaderProperty('glitchPeak', 'AMT', 0)
        angle = false
        rotCam = false
        rotCamSpd = 0
        setShaderProperty('chess', 'transparency', 0.1)
        rotCamRange = 0
    end
    
    if curStep >= 496 and curStep < 512 then
        if curStep % 16 == 2 then
            angulos(-15,4)
            tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeOut')
        elseif curStep % 16 == 8 then
            angulos(15,2)
            setShaderProperty("greyscale","strength",0)
        elseif curStep % 16 == 10 then
            angulos(-15,4)    
        end 
    end
    if curStep >= 508 and curStep < 512 then
        if curStep % 4 == 0 then
            angulos(15,0.5)
        elseif curStep % 4 == 1 then
            angulos(-15,0.5)
        elseif curStep % 4 == 2 then
            angulos(20,0.5)
        elseif curStep % 4 == 3 then
            angulos(-20,0.5)
        end
    end
  
    if curStep >= 512 and curStep < 768 then
        if curStep % 4 == 0 then
            tweenShaderProperty('pincush', 'zoom', 0.94, stepCrochet*0.001*1.5, 'cubeIn')
        elseif curStep % 4 == 2 then
            tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*1.5, 'cubeIn')
        end
    end

    if curStep == 568 or curStep == 632 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 570 then
        setShaderProperty("perlingame","x",-2)
        tweenShaderProperty('perlingame', 'x', 0, crochet*0.001*1.5, 'cubeIn')
        tweenShaderProperty('zoomblurGame', 'focusPower', 4, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
    elseif curStep == 634 then
        setShaderProperty("perlingame","x",2)
        tweenShaderProperty('perlingame', 'x', 0, crochet*0.001*1.5, 'cubeIn')
        tweenShaderProperty('zoomblurGame', 'focusPower', 4, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
    elseif curStep == 572 or curStep == 636 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*6, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 576 or curStep == 640 then
        setShaderProperty("greyscale","strength",0)
        tweenShaderProperty('zoomblurGame', 'focusPower', 0, stepCrochet*0.001*2, 'cubeOut')
        bloom(6,1,crochet,3)
    end
    if curStep == 824 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 828 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 832 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*1, 'cubeIn')
    elseif curStep == 864 then
        setShaderProperty('color', 'red', 2.8)
        setShaderProperty('color', 'green',2.2)
        setShaderProperty('color', 'blue', 1)
    elseif curStep == 880 then
        setShaderProperty('color', 'red', 1.75)
        setShaderProperty('color', 'green',1.75)
        setShaderProperty('color', 'blue', 1.75)
    elseif curStep == 896 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('pincushGame', 'barrel', 4)
        tweenShaderProperty('pincushGame', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT', 0.5)
    elseif curStep == 900 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('pincushGame', 'barrel', 10)
        tweenShaderProperty('pincushGame', 'barrel', 0, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT', 0)
        bloom(6,1,crochet,3)
    elseif curStep == 956 then
        tweenShaderProperty('perlingame', 'angle', 30, crochet*0.001*1, 'cubeIn')
    elseif curStep == 960 then
        tweenShaderProperty('perlingame', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1008 then
        setShaderProperty('greyscale', 'strength', 0)
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('barrel', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('bloom', 'contrast', 4, crochet*0.001*4, 'cubeIn')
        setShaderProperty('glitchPeak', 'AMT', 0.15)
    elseif curStep == 1020 then
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*1, 'expoIn')
    elseif curStep == 1024 then
        flashCamera("hud","white",0.3)
        tweenShaderProperty('bloom', 'contrast', 1, crochet*0.001*1, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 0)
        setShaderProperty('glitchPeak', 'AMT', 0)
        angle = true
    
    end
    --repetido drop
    if curStep == 1072 or curStep == 1200 then
        tweenShaderProperty('color', 'red',2.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1136 or curStep == 1264 then
        tweenShaderProperty('color', 'red',1.75, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 1.75, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1.75, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1272 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 1280 then
        set("defaultCamZoom", 0.6)
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*56, 'cubeIn')
        if difficulty == "4K" then
            for i = 0,7 do
                tweenActorProperty(i,"angle",360,stepCrochet*0.001*16, 'cubeOut')
                lascosasdelhud(1)
                if not middlescroll then
                    setActorX(0,"ratingsGroup")
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                    end
                end
            end
        end
        if difficulty == "9K" then
            for i = 0,17 do
                tweenActorProperty(i,"angle",360,stepCrochet*0.001*16, 'cubeOut')
                lascosasdelhud(1)
                if not middlescroll then
                    setActorX(0,"ratingsGroup")
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                    end
                end
            end
        end
        if difficulty == "12K" then
            for i = 0,23 do
                tweenActorProperty(i,"angle",360,stepCrochet*0.001*16, 'cubeOut')
                lascosasdelhud(1)
                if not middlescroll then
                    setActorX(0,"ratingsGroup")
                    if (i >= 0 and i <= 11) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                        setActorProperty(i,"alpha",1)
                    elseif (i >= 12 and i <= 23) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
                    end
                end
            end
        end
    elseif curStep == 1392 then
        tweenShaderProperty('barrel', 'zoom', 0.8, crochet*0.001*4, 'cubeOut')
    elseif curStep == 1408 or curStep == 1600 then
        bloom(4,1,crochet,2)
    elseif curStep == 1520 then
        tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('pincush', 'barrel', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('bloom', 'contrast', 0, crochet*0.001*3.5, 'cubeIn')
        tweenShaderProperty('pixel', 'strength', 30, crochet*0.001*3.5, 'cubeIn')
    elseif curStep == 1528 then
        tweenShaderProperty('barrel', 'zoom',1, stepCrochet*0.001*8, 'expoIn')
        tweenShaderProperty('pincush', 'barrel', 0, stepCrochet*0.001*8, 'expoIn')
        angles = false
    elseif curStep == 1536 then
        tweenShaderProperty('pixel', 'strength', 0, stepCrochet*0.001*1, 'cubeIn')
        bloom(10,1,crochet,2)
        setShaderProperty('greyscale', 'strength', 0.5)
        setShaderProperty('glitchPeak', 'AMT', 0.02)
        hud = true
        perlinWaveRange = 0.35
        perlinWaveSpeed = 13.5
    end
    if curStep == 1648 then
        tweenShaderProperty('barrel', 'angle', -10, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1652 then
        tweenShaderProperty('barrel', 'angle', 10, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1656 then
        tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
    elseif curStep == 1664 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('perlingame', 'y', 2, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
        tweenFadeIn("blackBG",0.9,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == 1668 then
        flashCamera("hud","white",0.3)
        setShaderProperty('chess', 'transparency', 0.15)
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('color', 'red', 2.8)
        setShaderProperty('color', 'green',2.2)
        setShaderProperty('color', 'blue', 1)
        tweenFadeIn("blackBG",0,crochet*0.001*18,"cubeIn")
        perlinWaveRange = 0.55
    elseif curStep == 1728 then
        flashCamera("hud","white",0.3)
       -- setShaderProperty('colorfillgame', 'fade', 0.2)
            setActorColor("dadCharacter0",0,0,0)
        setActorColor("dadCharacter1",0,0,0)
        setActorColor("bfCharacter0",0,0,0)
        setActorColor("bfCharacter1",0,0,0)
        setActorColor("girlfriend",0,0,0)
        setShaderProperty('color', 'red', 3)
        setShaderProperty('color', 'green',1)
        setShaderProperty('color', 'blue', 1)
       
        
    end
    if curStep == 1732 or curStep == 1740 or curStep == 1764 or curStep == 1772 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('perlingame', 'angle', -10, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeIn') 
    elseif curStep == 1736 or curStep == 1768 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('perlingame', 'angle', 5, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.1, stepCrochet*0.001*2, 'cubeIn') 
    elseif curStep == 1744 or curStep == 1760 or curStep == 1776 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*4, 'cubeOut') 
    elseif curStep == 1754 then
        tweenShaderProperty('perlingame', 'zoom', 1.5, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('perlingame', 'angle', -10, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.1, stepCrochet*0.001*2, 'cubeIn') 
    elseif curStep == 1756 then
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('perlingame', 'angle', 0, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeIn') 
    elseif curStep == 1758 or curStep == 1786 then
        tweenShaderProperty('perlingame', 'zoom', 1.5, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.1, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 1788 then
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*2, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 1792 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('colorfillgame', 'fade', 1, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*1, 'cubeOut')
                setActorColor("dadCharacter0",255,255,255)
        setActorColor("dadCharacter1",255,255,255)
        setActorColor("bfCharacter0",255,255,255)
        setActorColor("bfCharacter1",255,255,255)
        setActorColor("girlfriend",255,255,255)
        bloom(10,1,crochet,2)
        setShaderProperty('chess', 'transparency', 0.1)
        setShaderProperty('glitchPeak', 'AMT', 0)
        perlinWaveRange = 0
    end
    if curStep == 1776 then
        tweenShaderProperty('colorfillgame', 'fade', 0, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1856 then
        bloom(6,1,crochet,2)
        setShaderProperty('color', 'red', 1.75)
        setShaderProperty('color', 'green',1.75)
        setShaderProperty('color', 'blue', 1.75)
    end
    if curStep == 1904 then
        tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty("perlingame","y",0)
        tweenShaderProperty('perlingame', 'y', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('pincushGame', 'barrel', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenFadeIn("blackBG",0.9,stepCrochet*0.001*12,"cubeIn")
        tweenShaderProperty('chess', 'transparency', 0.1, stepCrochet*0.001*12, 'cubeOut')

    elseif curStep == 1908 then
        tweenShaderProperty('perlingame', 'y',2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1912 then
        tweenShaderProperty('perlingame', 'y',3, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == 1916 then
        tweenShaderProperty('perlingame', 'y',4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('pincushGame', 'barrel', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1920 then
        tweenShaderProperty('perlingame', 'angle', 20, stepCrochet*0.001*4, 'cubeIn')
        hud = false
    elseif curStep == 1924 then
       
        tweenShaderProperty('perlingame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
        tweenFadeIn("blackBG",0,stepCrochet*0.001*1,"cubeOut")
        setShaderProperty('chess', 'transparency', 0)
        setShaderProperty('greyscale', 'strength', 0)
        bloom(10,1,crochet,2)
    elseif curStep == 1932 then
        angle = true
    elseif curStep == 1984 then
        setShaderProperty('color', 'red', 1)
        setShaderProperty('color', 'green',3.5)
        setShaderProperty('color', 'blue', 1)
    elseif curStep == 2000 then
        setShaderProperty('color', 'red', 2.8)
        setShaderProperty('color', 'green',2.2)
        setShaderProperty('color', 'blue', 1)
    elseif curStep == 2016 then
        setShaderProperty('color', 'red', 3)
        setShaderProperty('color', 'green',1)
        setShaderProperty('color', 'blue', 1)
    elseif curStep == 2032 then
        tweenShaderProperty('colorfillgame', 'fade', 0, crochet*0.001*4, 'cubeIn')
        setShaderProperty('color', 'red', 1)
        setShaderProperty('color', 'green',2)
        setShaderProperty('color', 'blue', 3)
        tweenShaderProperty('perlingame', 'zoom', 2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 0)
        bloom(6,1,crochet,2)
        setShaderProperty('chess', 'transparency', 0.1)
    elseif curStep == 2044 then
        tweenShaderProperty('perlingame', 'zoom', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == 2048 then
        tweenShaderProperty('colorfillgame', 'fade', 1, stepCrochet*0.001*1, 'cubeOut')
        setShaderProperty('color', 'red', 2.8)
        setShaderProperty('color', 'green',2.2)
        setShaderProperty('color', 'blue', 1)
        bloom(10,1,crochet,2)
    end
    if curStep == 2176 then
        perlinSpeed = 2 
        perlinXRange = 0.1
        perlinYRange = 0.1
        bloom(4,1,crochet,2)
        setShaderProperty('greyscale', 'strength', 1)
        lascosasdelhud(0)
        if difficulty == "4K" then
            for i = 0,7 do
                tweenActorProperty(i,"angle",360,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        tweenFadeIn(i,0,crochet*0.001*1,"cubeIn")
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
        if difficulty == "9K" then
            for i = 0,17 do
                tweenActorProperty(i,"angle",360,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        tweenFadeIn(i,0,crochet*0.001*1,"cubeIn")
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
        if difficulty == "12K" then
            for i = 0,23 do
                tweenActorProperty(i,"angle",360,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 11) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        tweenFadeIn(i,0,crochet*0.001*1,"cubeIn")
                    elseif (i >= 12 and i <= 23) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
    end
    if curStep >= 1536 and curStep < 1792 or curStep >= 2720 and curStep < 2976 then--896
        if curStep % 32 == 0 then
            noteScale = noteScale + 0.4
        elseif curStep % 32 == 8 then
            noteRotX = 25
        elseif curStep % 32 == 14 then
            noteScale = noteScale + 0.4
        elseif curStep % 32 == 20 then
            noteScale = noteScale + 0.4
        elseif curStep % 32 == 24 then
            noteRotX = -25
        elseif curStep % 32 == 28 then
            noteScale = noteScale + 0.4
        end
    end
    if curStep >= 1408 and curStep < 1520 or curStep >= 1792 and curStep < 1904 or curStep >= 1920 and curStep < 1984 then--1168 1184
        if curStep % 16 == 0 then
            tweenShaderProperty('barrel', 'zoom', 1, stepCrochet*0.001*8, 'cubeOut')
        elseif curStep % 16 == 8 then
            tweenShaderProperty('barrel', 'zoom', 0.87, stepCrochet*0.001*8, 'cubeIn')
        end
    end
    if curStep >= 1792 and curStep < 1920 then--1168 1184
        if curStep % 16 == 0 then
            tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, "cubeOut")
        elseif curStep % 16 == 8 then
            tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*8, "cubeOut")
        end
    end
    if curStep >= 640 and curStep < 689 then
        if curStep % 16 == 0 then
            bloom(6,1,crochet,2)
            tweenShaderProperty('EyeFishEffect', 'power', 0, stepCrochet*0.001*1, 'cubeIn')
        end
        if curStep % 16 == 8 then
            setShaderProperty('chess', 'transparency', 0.1)
            tweenShaderProperty('barrel', 'zoom', 2, crochet*0.001*1, 'cubeOut')
            tweenShaderProperty('pincush', 'barrel', 2, crochet*0.001*1, 'cubeOut')
            tweenShaderProperty('EyeFishEffect', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
            setShaderProperty('color', 'red', 2.5)
            setShaderProperty('color', 'green', 1.5)
            setShaderProperty('color', 'blue', 2)
            setShaderProperty('barrel', 'x', -0.15)
            tweenShaderProperty('barrel', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 12 then
            setShaderProperty('barrel', 'x', 0.15)
            tweenShaderProperty('barrel', 'x', 0, stepCrochet*0.001*4, 'cubeOut')
            setShaderProperty('chess', 'transparency', 0)
            tweenShaderProperty('barrel', 'zoom', 1, crochet*0.001*1, 'expoIn')
            tweenShaderProperty('pincush', 'barrel', 0, crochet*0.001*1, 'expoIn')
            tweenShaderProperty('color', 'red', 1.75, stepCrochet*0.001*4, 'cubeIn')
            tweenShaderProperty('color', 'green', 1.75, stepCrochet*0.001*4, 'cubeIn')
            tweenShaderProperty('color', 'blue', 1.75, stepCrochet*0.001*4, 'cubeIn')
        end
    end
    if curStep >= 768 and curStep < 1008 or curStep >= 1984 and curStep < 2032 then--896
        if curStep % 16 == 0 then
            bloom(6,1,crochet,2)
            tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*8, 'cubeOut')
            tweenShaderProperty('barrel', 'zoom', 1.0, stepCrochet*0.001*8, 'cubeOut')
        end
        if curStep % 16 == 8 then
            tweenShaderProperty('barrel', 'zoom', 0.85, stepCrochet*0.001*8, 'cubeIn')
            tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*6, 'cubeIn')
        end
    end
    if curStep == 496 then
        tweenActorProperty('uno', 'x', 200.0,stepCrochet *0.001*4, 'cubeOut')
    elseif curStep == 500 then
        tweenActorProperty('dos', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
		tweenActorProperty('uno', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 504 then
        tweenActorProperty('tres', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
		tweenActorProperty('dos', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 508 then
        tweenActorProperty('cuatro', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('tres', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 512 then
        tweenActorProperty('cuatro', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    end

    if curStep == 2288 then
        perlinSpeed = 0 
        perlinXRange = 0
        perlinYRange = 0
        tweenShaderProperty('bloom', 'contrast', 5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, stepCrochet*0.001*6, 'cubeIn')
        tweenActorProperty('uno1', 'x', 200.0,stepCrochet *0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 2.5, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('perlingame', 'angle', 20, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == 2292 then
        tweenActorProperty('dos2', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
		tweenActorProperty('uno1', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2296 then
        tweenActorProperty('tres3', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
		tweenActorProperty('dos2', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
    elseif curStep == 2300 then
        tweenActorProperty('cuatro4', 'x', 200.0, stepCrochet*0.001*4, 'cubeOut')
        tweenActorProperty('tres3', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('perlingame', 'zoom', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('perlingame', 'angle', 0, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.25, stepCrochet*0.001*2, 'cubeOut')
        angle = false
    elseif curStep == 2304 then
        setShaderProperty('color', 'red', 2)
        setShaderProperty('color', 'green',1)
        setShaderProperty('color', 'blue', 2)
        tweenActorProperty('cuatro4', 'x', -1500.0, stepCrochet*0.001*4, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.15, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('chess', 'transparency', 0.1)
        setProperty('', 'centerCamera', true)
        gamerot = true
        gamerotSpd = 4
        gamerotRange = 5

        lerpSpeedY = 16
        lerpSpeedZ = 16
        lerpSpeednoteRotX = 12
    end

    --hola parte discololxdddx

    if curStep >= 2304 and curStep < 2376 or curStep >= 2384 and curStep < 2411 or curStep >= 2416 and curStep < 2432 then
        if curStep % 4 == 0 then
            beatSwap = beatSwap* -1
            for i = 0,(keyCount*2)-1 do
                noteRotX = 25*beatSwap
                noteZPos[i+1] = targetnoteZPos[i+1] + 100
                if i % 2 == 0 then
					noteAngle[i+1] = -15*beatSwap
				else
					noteAngle[i+1] = 15*beatSwap
				end
            end
        end
    end

    if curStep >= 2320 and curStep < 2348 then
        swap = swap* -1
        if curStep % 4 == 0 then
            movimientoraroxd(0.1*swap,0,4)
        end
    end
    if curStep == 2316 or curStep == 2318 or curStep == 2348 or curStep == 2356 or curStep == 2360 or curStep == 2362 or curStep == 2396 or curStep == 2398 then
        movimientoraroxd(0.1,0.025,2)
    end
    if curStep == 2358 or curStep == 2364 or curStep == 2366 or curStep == 2424 then
        movimientoraroxd(-0.1,-0.025,2)
    end
    if curStep == 2350 or curStep == 2351 then
        swap = swap* -1
        movimientoraroxd(0.1*swap,0.025*swap,1)
    end

    --bloom bruh

    if curStep == 2304 or curStep == 2308 or curStep == 2312 or curStep == 2352 then
        bloom(3,1,stepCrochet,4)
    end
    if curStep >= 2320 and curStep < 2348 or curStep >= 2368 and curStep < 2396 or curStep >= 2400 and curStep < 2424 then
        if curStep % 4 == 0 then
            bloom(3,1,stepCrochet,4)
        end
    end
    if curStep == 2316 or curStep == 2318 or curStep == 2348 or curStep == 2356 or curStep == 2396 or curStep == 2398 or curStep == 2424 or curStep == 2426 then
        bloom(2,1.0,stepCrochet,2)
    end
    if curStep >= 2360 and curStep < 2368 then
        if curStep % 2 == 0 then
            bloom(2,1.0,stepCrochet,1)
        end
    end
    if curStep == 2350 or curStep == 2358 or curStep == 2428 then
        setShaderProperty('bloom', 'contrast', 2)
    end
    if curStep == 2348 then
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        setShaderProperty('glitchPeak', 'SPEED', 0.4)
        tweenShaderProperty('sobel', 'strength', 0.25, stepCrochet*0.001*3, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.75, stepCrochet*0.001*3, 'cubeIn')
        triggerEvent('screen shake', (stepCrochet*0.001*4)..',0.005', (stepCrochet*0.001*4)..',0.005')
    elseif curStep == 2352 then
        setShaderProperty('glitchPeak', 'AMT', 0.0)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
        setShaderProperty('perlingame', 'zoom', 6.0)
        tweenShaderProperty('sobel', 'strength', 0.0, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1.0, stepCrochet*0.001*1.5, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.0, stepCrochet*0.001*1.5, 'cubeOut')
    end

    if curStep == 2376 then
        noteRotX = 720
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.005', (stepCrochet*0.001*8)..',0.005')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'angle', 360, stepCrochet*0.001*8, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('sobel', 'strength', 0.1, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        setShaderProperty('glitchPeak', 'SPEED', 0.4)
    elseif curStep == 2380 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.15, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('sobel', 'strength', 0.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2384 or curStep == 2416 then
        setShaderProperty('glitchPeak', 'AMT', 0.0)
        setShaderProperty('glitchPeak', 'SPEED', 0.1)
    end
    if curStep == 2411 then
        setShaderProperty('glitchPeak', 'AMT', 0.1)
        setShaderProperty('glitchPeak', 'SPEED', 0.4)
        tweenShaderProperty('perlingame', 'y', -4.0, stepCrochet*0.001*8, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 3, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('sobel', 'strength', 0.25, stepCrochet*0.001*4, 'cubeOut')
        for i = 0,(keyCount*2)-1 do 
			targetnoteZPos[i+1] = -400
		end
    elseif curStep == 2416 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.15, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('sobel', 'strength', 0.0, stepCrochet*0.001*4, 'cubeOut')
        for i = 0,(keyCount*2)-1 do 
			targetnoteZPos[i+1] = 0
		end
    end
    if curStep == 2428 then
        tweenShaderProperty('sobel', 'strength', 0.25, stepCrochet*0.001*3, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 1.0, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 2432 then
        angle = true
        gamerot = false
        setShaderProperty('bloom', 'contrast', 0)
        colorlol(true,false,0,0,0)
        for i = 0,(keyCount*2)-1 do
            setActorProperty(i,"alpha",0.0)
        end
        tweenShaderProperty('sobel', 'strength', 0.0, stepCrochet*0.001*1, 'cubeOut')
        setProperty('', 'centerCamera', false)
    elseif curStep == 2436 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*1, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power',0, stepCrochet*0.001*1, 'cubeOut')
        for i = 0,(keyCount*2)-1 do
            tweenActorProperty(i,"alpha",1.0, stepCrochet*0.001*16, 'cubeInOut')
        end
        lerpSpeedY = 2
        lerpSpeedZ = 4
        lerpSpeednoteRotX = 5
    end
    if curStep == 2448 or curStep == 2576 then
        tweenShaderProperty('color', 'red',1, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 3.5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2512 or curStep == 2640 then
        tweenShaderProperty('color', 'red',1, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'green', 2.7, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('color', 'blue', 3, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2704 then
        tweenActorProperty('concentrate', 'y', 0, stepCrochet*0.001*6, 'cubeOut')
        tweenActorProperty('concentrate', 'angle',0, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty('glitchPeak', 'AMT', 0.2)
        setShaderProperty('zoomblurGame', 'focusPower', 4)
    elseif curStep == 2712 then
        tweenActorProperty('concentrate', 'y', 1000, stepCrochet*0.001*8, 'cubeIn')
        tweenActorProperty('concentrate', 'angle',60, stepCrochet*0.001*8, 'cubeIn')
    elseif curStep == 2720 then
        setShaderProperty('greyscale', 'strength', 0)
        bloom(10,1,crochet,2)
        setShaderProperty('glitchPeak', 'AMT', 0.05)
        setShaderProperty('zoomblurGame', 'focusPower', 0)
        setShaderProperty('color', 'red', 1.75)
        setShaderProperty('color', 'green',1.75)
        setShaderProperty('color', 'blue', 1.75)
        angle = false
        perlinZRange = 40
        perlinSpeed = 3 
    elseif curStep == 2852 then
        bloom(4,1,crochet,2)
    end
    if curStep == 2784 or curStep == 2864 or curStep == 2928 then
        tweenShaderProperty('perlingame', 'zoom', 0.6, crochet*0.001*8, 'linear')
    elseif curStep == 2816 or curStep == 2896 then
        tweenShaderProperty('perlingame', 'zoom', 1, crochet*0.001*8, 'linear')
    end
    if curStep == 2848 then
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*2, 'cubeOut')
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 2850 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*2, 'cubeIn')
        setShaderProperty('greyscale', 'strength', 0)
    elseif curStep == 2960 then
        tweenShaderProperty('perlingame', 'zoom', 6, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('bloom', 'contrast', 5, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power',0.2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 2976 then
        flashCamera("hud","white",1)
        bloom(10,0,crochet,1.5)
        
      
    end

    if curStep >= 2736 and curStep < 2848 or curStep >= 2864 and curStep < 2960 then--1024 1280
        if curStep % 16 == 0 then
            bloom(4,1,crochet,3)
        end
    end
    
    --purple
    if curStep == 2324 or curStep == 2352 or curStep == 2360 or curStep == 2364 or curStep == 2396 or curStep == 2416 or curStep == 2428 then
        colorlol(true,false,2,1,2)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --orange
    if curStep == 2308 or curStep == 2328 or curStep == 2344 or curStep == 2350 or curStep == 2359 or curStep == 2384 or curStep == 2398 or curStep == 2429 then
        colorlol(true,false,2.8,2.2,1)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --blue
    if curStep == 2312 or curStep == 2336 or curStep == 2363 or curStep == 2388 or curStep == 2426 or curStep == 2431 then
        colorlol(true,false,1,2,3)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --green
    if curStep == 2316 or curStep == 2332 or curStep == 2351 or curStep == 2358 or curStep == 2366 or curStep == 2392 or curStep == 2404 or curStep == 2424 or curStep == 2430 or curStep == 2376 or curStep == 2411 then
        colorlol(true,false,1,3.5,1)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --red
    if curStep == 2318 or curStep == 2340 or curStep == 2372 or curStep == 2408 or curStep == 2420 then
        colorlol(true,false,3,1,1)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --cyan?
    if curStep == 2320 or curStep == 2356 or curStep == 2400 then
        colorlol(true,false,1,2.7,3)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --normal
    if curStep == 2348 or curStpe == 2368 then
        colorlol(true,false,1,1,1)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --color pisxddx
    if curStep == 2362 then
        colorlol(true,false,3,2,1)
        triggerEvent('Add Camera Zoom','0.04','0.04')
        noteScale = noteScale + 0.2
    end
    --unico greyscalelol
    if curStep == 2410 then
        tweenShaderProperty('greyscale', 'strength', 1, stepCrochet*0.001*5, 'cubeIn')
    elseif curStep == 2416 then
        setShaderProperty('greyscale', 'strength', 0)
    end

    
end
function dropsraro(s,s2)--1088
    if curStep == s then
        setProperty('', 'cameraSpeed', 3)
        noteRotX = 35
        lerpSpeednoteRotX = 3.5
        greyscalelol(0.0,0.75,7,'cubeIn')
        tweenFadeIn("blackBG",0.2,crochet*0.001*1,"cubeIn")
       
        lascosasdelhud(0)
        if difficulty == "4K" then
            for i = 0,(keyCount*2)-1 do
                tweenActorProperty(i,"angle",720,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        setActorProperty(i,"alpha",0)
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
        if difficulty == "9K" then
            for i = 0,(keyCount*2)-1 do
                tweenActorProperty(i,"angle",720,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        setActorProperty(i,"alpha",0)
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
        if difficulty == "12K" then
            for i = 0,(keyCount*2)-1 do
                tweenActorProperty(i,"angle",720,crochet*0.001*2, 'cubeOut')
                if not middlescroll then
                    setActorX(-280,"ratingsGroup")
                    if (i >= 0 and i <= 11) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 1420
                        setActorProperty(i,"alpha",0)
                    elseif (i >= 12 and i <= 23) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] - 320
                    end
                end
            end
        end
    elseif curStep == s+8 then
        bloom(3,1,crochet,1)
        greyscalelol(0.0,0.75,7,'cubeIn')
        noteRotX = -35
        lerpSpeednoteRotX = 3.5
    elseif curStep == s+16 then
       
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
        bloom(6,1,crochet,2)
        setShaderProperty("greyscale","strength",1)
    elseif curStep == s+24 then
        tweenShaderProperty('perlingame', 'zoom', 3, stepCrochet*0.001*8, 'cubeOut')
        bloom(6,1,crochet,2)
        setShaderProperty("greyscale","strength",0)
    elseif curStep == s+32 then
        bloom(6,1,crochet,2)
        greyscalelol(0.0,0.75,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == s+40 then
        greyscalelol(0.0,0.75,3,'cubeIn')
        noteRotX = -35
        lerpSpeednoteRotX = 5
    elseif curStep == s+44 then--1068
        greyscalelol(0.0,0.75,3,'cubeIn')
        noteRotX = 35
        lerpSpeednoteRotX = 5
        angles = false
        tweenShaderProperty('perlingame', 'angle', -360, crochet*0.001*2, 'cubeInOut')
    elseif curStep == s+48 then
        bloom(6,1,crochet,2)
        greyscalelol(0.0,1.0,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+56 then
        angles = true
        greyscalelol(0.0,0.75,3,'cubeIn')
        setShaderProperty("perlingame","y",-2)
        tweenShaderProperty('perlingame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+60 then
        greyscalelol(0.0,0.75,3,'cubeIn')
        setShaderProperty("perlingame","y",-2)
        tweenShaderProperty('perlingame', 'y', 0, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+64 or curStep == s+80 or curStep == s+96 or curStep == s+112 or curStep == s+128 or curStep == s+128+32 then
        greyscalelol(0.0,1.0,14,'cubeIn')
    elseif curStep == s+120 then
        tweenShaderProperty('perlingame', 'y', -1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+124 then
        tweenShaderProperty('perlingame', 'y', -2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+16 or curStep == s+128+24 then
        greyscalelol(0.0,1.0,7,'cubeIn')
    end
    if curStep == s+128 or curStep == s+128+16 or curStep == s+128+32 or curStep == s then --1152 y 1184 es 160
        bloom(6,1,crochet,2)
    elseif curStep == s+128+48 or curStep == s+128+96 or curStep == s+128+112 then--1200 y 1248 y 1264
        bloom(6,1,crochet,2)
        greyscalelol(0.0,1.0,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+52 or curStep == s+128+100 or curStep == s+128+116 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+56 then
        greyscalelol(0.0,0.75,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
        setShaderProperty("perlingame","angle",0)
        tweenShaderProperty('perlingame', 'angle', 90, stepCrochet*0.001*8, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+60 then
        tweenShaderProperty('perlingame', 'zoom', 10, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+128+64 then--1216
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
        tweenShaderProperty('perlingame', 'angle', 0, stepCrochet*0.001*2, 'cubeOut')
        bloom(8,1,crochet,2)
        greyscalelol(0.0,0.75,15,'cubeIn')
    elseif curStep == s+128+76 then
        tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
    elseif curStep == s+128+80 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        bloom(4,1,crochet,2)
    elseif curStep == s+128+96 then
        greyscalelol(0.0,0.75,7,'cubeIn')
    elseif curStep == s+128+104 then
        greyscalelol(0.0,0.75,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('perlingame', 'x', -1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+108 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlingame', 'x', -2, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeIn')
    elseif curStep == s+128+112 then
        greyscalelol(0.0,0.75,7,'cubeIn')
    elseif curStep == s+128+120 then--1264
        greyscalelol(0.0,0.75,7,'cubeIn')
        tweenShaderProperty('perlingame', 'zoom', 2.5, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
    elseif curStep == s+128+124 then
        tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty('perlingame', 'x', 0, crochet*0.001*2.5, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == s+128+128 then
        flashCamera("hud","white",0.3)
        setShaderProperty('chess', 'transparency', 0)
    end
    if curStep >= s+128+80 and curStep < s+128+96 then--1168 1184
        if curStep % 16 == 0 then
            greyscalelol(0.0,0.75,3,'cubeIn')
            tweenShaderProperty('barrel', 'angle', 10, stepCrochet*0.001*3.5, 'cubeIn')
        elseif curStep % 16 == 4 then
            greyscalelol(0.0,0.75,3,'cubeIn')
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.5, 'cubeIn')
        elseif curStep % 16 == 8 then
            greyscalelol(0.0,0.75,3,'cubeIn')
            tweenShaderProperty('barrel', 'angle', -10, stepCrochet*0.001*3.5, 'cubeIn')
        elseif curStep % 16 == 12 then
            greyscalelol(0.0,0.75,3,'cubeIn')
            tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*3.5, 'cubeIn')
        end
    end
     if curStep >= s+128+16 and curStep < s+128+32 then--1168 1184
        if curStep % 8 == 0 then
            tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('EyeFishEffectGame', 'power', 0.4, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 8 == 4 then
            tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*2, 'cubeOut')
        end
    end
    if curStep >= s and curStep < s+256 then--1024 1280
        if curStep % 4 == 0 then
            tween("camHUD",{zoom = 1.05},stepCrochet*0.001*1.5,"cubeIn")
            tweenShaderProperty('pincush', 'zoom', 0.94, stepCrochet*0.001*1.5, 'cubeIn')
        elseif curStep % 4 == 2 then
            tween("camHUD",{zoom = 1},stepCrochet*0.001*1.5,"cubeIn")
            tweenShaderProperty('pincush', 'zoom', 1, stepCrochet*0.001*1.5, 'cubeIn')
        end
    end

    if curStep >= s2 and curStep < s2+49 then--1024 1280
        if curStep % 16 == 0 then
            bloom(3,1,crochet,2)
        end
        if curStep % 16 == 8 then
            tweenShaderProperty('perlingame', 'zoom', 2, stepCrochet*0.001*4, 'cubeOut')
            tweenShaderProperty('EyeFishEffectGame', 'power', 0.3, stepCrochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 12 then
            tweenShaderProperty('perlingame', 'zoom', 1, stepCrochet*0.001*4, 'expoIn')
            tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*4, 'cubeIn')    
        end
    end
end
function playerOneSing(a,b,c,d)
    if c == "Wiik3Punch" or c == "BoxingMatchPunch" then
     
        if angle then
            beatSwap = beatSwap * -1
           angulo = -25*beatSwap
        end
        if hud then
            beat = beat * -1
            angulo = 25*beatSwap
        end
        if speed then
            beat = beat * -1
            angulo = 25*beatSwap
        end
    end
end

function greyscalelol(strength,strength2,s,ease)
    setShaderProperty('greyscale', 'strength', strength)
    tweenShaderProperty('greyscale', 'strength', strength2, stepCrochet*0.001*s, ease)
end

function colorlol(set,tween,red,green,blue,s)

    if set then
        setShaderProperty('color', 'red', red)
        setShaderProperty('color', 'green', green)
        setShaderProperty('color', 'blue', blue)
    end
    if tween then
        tweenShaderProperty('color', 'red', red, stepCrochet*0.001*s, 'cubeIn')
        tweenShaderProperty('color', 'green', green, stepCrochet*0.001*s, 'cubeIn')
        tweenShaderProperty('color', 'blue', blue, stepCrochet*0.001*s, 'cubeIn')
    end
end

function movimientoraroxd(value1,value2,s)
    setShaderProperty('perlingame', 'y', value1)
    tweenShaderProperty('perlingame', 'y', value2, stepCrochet*0.001*s, 'cubeOut')
end

function updatePost(elapsed)
	if not modcharts then 
		return
	end
	if lerpScale then 
		noteScale = lerp(noteScale, 1, elapsed*lerpSpeedScale)
	end
	noteRotX = lerp(noteRotX, targetNoteRotX, elapsed*lerpSpeednoteRotX)

	drunk = lerp(drunk, drunkLerp, elapsed*5)

	local currentBeat = (songPos / 1000)*(bpm/60)

	for i = 0,(keyCount*2)-1 do 
		noteXPos[i+1] = lerp(noteXPos[i+1], targetnoteXPos[i+1], elapsed*lerpSpeedX)
		noteYPos[i+1] = lerp(noteYPos[i+1], targetnoteYPos[i+1], elapsed*lerpSpeedY)
		noteZPos[i+1] = lerp(noteZPos[i+1], targetnoteZPos[i+1], elapsed*lerpSpeedZ)

		local thisnotePosX = noteXPos[i+1] + getXOffset(i, 0)
		local thisnotePosY = noteYPos[i+1]
		local noteRotPos = getNoteRot(thisnotePosX, thisnotePosY,noteRotX)

		thisnotePosX = noteRotPos[1]
		thisnotePosY = noteRotPos[2]
		local thisnotePosZ = noteRotPos[3]+(noteZPos[i+1]/1000)
		--local thisnotePosX = noteXPos[i+1]
		--local thisnotePosY = noteYPos[i+1]
		--local thisnotePosZ = (noteZPos[i+1]/1000)-1

		noteAngle[i+1] = lerp(noteAngle[i+1], targetnoteAngle[i+1], elapsed*lerpSpeedAngle)
		setActorModAngle(noteAngle[i+1], i)

		local totalNotePos = calculatePerspective(thisnotePosX, thisnotePosY, thisnotePosZ)
		
		--setActorX(noteXPos[i+1], i)
		--setActorY(noteYPos[i+1], i)
		setActorX(totalNotePos[1], i)
		setActorY(totalNotePos[2], i)
		
		noteZScale[i+1] = totalNotePos[3]
		setActorScaleXY(noteScale * (1/-noteZScale[i+1]), noteScale * (1/-noteZScale[i+1]), i)
		if getPlayingActorAnimation(i) == 'confirm' then 
			setActorScaleXY(noteScale*1.45 * (1/-noteZScale[i+1]), noteScale*1.45 * (1/-noteZScale[i+1]), i) --confirm is weird ig
		end
		
	end
    local songSpeed = getProperty('', 'speed')
	local noteCount = getRenderedNotes()
	if noteCount>0 then 
		for i = 0, noteCount-1 do 
			local data = getRenderedNoteType(i)
			if getRenderedNoteHit(i) then 
				data = data + keyCount --player notes
			end
			if defaultWidth == -1 then 
				defaultWidth = getRenderedNoteWidth(i)
			end
			if defaultNoteScale == -1 then 
				defaultNoteScale = getRenderedNoteScaleX(i)
			end
			local offsetX = getRenderedNoteOffsetX(i)
			local strumTime = getRenderedNoteStrumtime(i)
			if downscrollBool then 
				if isRenderedNoteSustainEnd(i) then 
					strumTime = getRenderedNotePrevNoteStrumtime(i)
				end
			end
			
			local curPos = ((songPos-strumTime)*songSpeed)
			offsetX = offsetX + getXOffset(data, curPos)
			local thisnoteYPos = noteYPos[data+1]
			if downscrollBool then 
				thisnoteYPos = thisnoteYPos + (0.45*curPos) - (getRenderedNoteOffsetY(i))
				if isRenderedNoteSustainEnd(i) then 
					thisnoteYPos = thisnoteYPos - (getRenderedNoteHeight(i))+2
				end
			else 
				thisnoteYPos = thisnoteYPos - (0.45*curPos) - (getRenderedNoteOffsetY(i))
			end
			local thisnoteXPos = noteXPos[data+1]+offsetX
			
			local noteRotPos = getNoteRot(thisnoteXPos, thisnoteYPos, noteRotX)
	
			thisnoteXPos = noteRotPos[1]
			thisnoteYPos = noteRotPos[2]
			local thisnotePosZ = noteRotPos[3]+(noteZPos[data+1]/1000)
			local totalNotePos = calculatePerspective(thisnoteXPos, thisnoteYPos, thisnotePosZ)

			if not isSustain(i) then 
				--setRenderedNoteScale(getRenderedNoteWidth(i)*,getRenderedNoteHeight(i)*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleX(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleY(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteAlpha(1,i)
				setRenderedNoteAngle(noteAngle[data+1],i)
			else
				--offsetX = 37 * (1/-totalNotePos[3]) * (defaultWidth/112)
				setRenderedNoteAlpha(0.6,i)
				if defaultSusWidth == -1 then 
					defaultSusWidth = getRenderedNoteWidth(i)
				end

				if isRenderedNoteSustainEnd(i) then --sustain ends
					if defaultSusEndHeight == -1 then 
						defaultSusEndHeight = getRenderedNoteScaleY(i)
					end
					
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusEndHeight* (1/-totalNotePos[3]), i)
				else 
                    if defaultSusHeight == -1 then 
                        defaultSusHeight = getRenderedNoteScaleY(i)
                    end
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusHeight* (1/-totalNotePos[3])* (songSpeed/startSpeed), i)
				end

				setRenderedNoteAngle(0,i)

				
				--susOffset = 37*noteScale
			end
			
			setRenderedNotePos(totalNotePos[1],totalNotePos[2], i)
		end
	end

end

function getXOffset(data, curPos)

	local xOffset = 0
	if drunk ~= 0 then 
		xOffset = xOffset + drunk * (math.cos( ((songPos*0.001) + ((data%keyCount)*0.2) ) * (drunkSpeed*0.2)) * 112*0.5);
	end

	return xOffset
end

function getSustainAngle(i)

	local data = getRenderedNoteType(i)
	local mustPress = getRenderedNoteHit(i)
	if mustPress then 
		data = data + keyCount --player notes
	end

	local noteYPos = ((songPos-getRenderedNoteStrumtime(i))*songSpeed)
	local nextYPos = noteYPos + stepCrochet

	local noteOffsetX = getXOffset(data, noteYPos)
	local nextOffsetX = getXOffset(data, nextYPos)

	local thisNoteX = getRenderedNoteCalcX(i)+noteOffsetX
	local nextNoteX = getRenderedNoteCalcX(i)+nextOffsetX

	local thisNoteY = getRenderedNoteY(i)
	

	local ang = 0
	if downscrollBool then 
		local nextNoteY = getRenderedNoteY(i) + (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) - (math.pi/2))
		--debugPrint(ang)
	else 
		local nextNoteY = getRenderedNoteY(i) - (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) + (math.pi/2))
	end
	return ang
end

--the funny perspective math

local zNear = 0
local zFar = 1000
local zRange = zNear - zFar 
local tanHalfFOV = math.tan(math.pi/4) -- math.pi/2 = 90 deg, then half again

function calculatePerspective(x,y,z)

	if (z >= 1) then
		z = 1 --stop weird shit
	end

	x = x - (1280/2) + (defaultWidth/2)
	y = y - (720/2) + (defaultWidth/2)

	local zPerspectiveOffset = (z+(2 * zFar * zNear / zRange));

	local xPerspective = x*(1/tanHalfFOV);
	local yPerspective = y/(1/tanHalfFOV);
	xPerspective = xPerspective/-zPerspectiveOffset;
	yPerspective = yPerspective/-zPerspectiveOffset;

	xPerspective = xPerspective + (1280/2) - (defaultWidth/2)
	yPerspective = yPerspective + (720/2) - (defaultWidth/2)

	return {xPerspective,yPerspective,zPerspectiveOffset}
end
local rad = math.pi/180;
function getNoteRot(XPos, YPos, rotX)
	local x = 0
	local y = 0
	local z = -1

	--fucking math
	local strumRotX = getCartesianCoords3D(rotX,90, XPos-(1280/2))
	x = strumRotX[1]+(1280/2)
	local strumRotY = getCartesianCoords3D(90,0, YPos-(720/2))
	y = strumRotY[2]+(720/2)
	--notePosY = _G['default'..strum..'Y'..i%keyCount]+strumRot[2]
	z = z + strumRotX[3] + strumRotY[3]
	return {x,y,z}
end
--the funny spherical to cartesian for 3d angles
function getCartesianCoords3D(theta, phi, radius)

	local x = 0
	local y = 0
	local z = 0

	x = math.cos(theta*rad)*math.sin(phi*rad);
	y = math.cos(phi*rad);
	z = math.sin(theta*rad)*math.sin(phi*rad);
	x = x*radius;
	y = y*radius;
	z = z*radius;

	return {x,y,z/1000}
end

--https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end

local modchartState = 0

local flipShit = 1
local flipShit2 = 1