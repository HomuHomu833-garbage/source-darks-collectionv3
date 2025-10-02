function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end


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
local downscroll = 1
local stepY = 2000 
local startYBottom = 5000 


function createPost()


    lascosasdelhud(0, crochet, 0.1, "cubeOut")
    startSpeed = getProperty('', 'speed')
    if downscrollBool then
        stepY = -stepY
        startYBottom = -startYBottom
    end
    for i = 0, (keyCount * 2) - 1 do 
        table.insert(noteXPos, getActorX(i)) 
        table.insert(noteYPos, 0)
        table.insert(noteZPos, 0)
        table.insert(noteZScale, 1)
        table.insert(noteAngle, 0)
        table.insert(targetnoteXPos, getActorX(i))
        table.insert(targetnoteYPos, 0)
        table.insert(targetnoteZPos, 1000)
        table.insert(targetnoteAngle, 0)
        
        makeSprite('note'..i, '', -11110, 0)
       
        if not middlescroll then
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + (i < 4 and 100 or -100)
        end
        noteYPos[i+1] = startYBottom + (i < 4 and i or (7 - i)) * stepY
        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
    end


    makeSprite('global', '', -1110, 0)
    makeSprite('player', '', -1110, 0)
    makeSprite('opponent', '', -1110, 0)

    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

   
    initShader('sobel', 'SobelEffect')
    setCameraShader('game', 'sobel')
    setShaderProperty('sobel', 'strength', 0)
    setShaderProperty('sobel', 'intensity', 5)



    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    --setCameraShader('hud', 'bump')
    setShaderProperty('bump', 'zoom', 1)
	setShaderProperty('bump', 'barrel', 0)
    setShaderProperty('bump', 'doChroma', true)
    
	initShader('mirror2', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

   --initShader('BloodBGEffect', 'BloodBGEffect')--
   --setCameraShader('game', 'BloodBGEffect')
   --setShaderProperty('BloodBGEffect', 'strength', 0)
    
    initShader('bars2', 'bars')--
    setCameraShader('game', 'bars2')
    setShaderProperty('bars2', 'effect', 0)

    initShader('glitchChromatic', 'glitchChromatic')
    setCameraShader('game', 'glitchChromatic')
    setCameraShader('hud', 'glitchChromatic')
    setShaderProperty('glitchChromatic', 'GLITCH',0)

    initShader("DistortionEffect","DistortionEffect")
    setCameraShader('game', 'DistortionEffect')
	setShaderProperty("DistortionEffect","size", 0)

	initShader('mirror', 'PincushNewEffect')--PincushNewEffect
    setCameraShader('game', 'mirror')
    setCameraShader('hud', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.7)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror3', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)



  

    initShader('raroglitch', 'GlitchWave')
    setCameraShader('game', 'raroglitch')
    setCameraShader('hud', 'raroglitch')
    setShaderProperty('raroglitch', 'greyscale', 1)
    setShaderProperty('raroglitch', 'glitch', 0.02)
    setShaderProperty('raroglitch', 'wave', 0.2)
    setShaderProperty('raroglitch', 'glitchLine', 0.2)


    initShader('mirror4', 'PincushNewEffect')--
    setCameraShader('game', 'mirror4')
    setCameraShader('hud', 'mirror4')
    setShaderProperty('mirror4', 'zoom', 1)
    setShaderProperty('mirror4', 'angle', 0)
	setShaderProperty('mirror4', 'x', 0)
    setShaderProperty('mirror4', 'y', 0)
	setShaderProperty('mirror4', 'barrel', 0)
    setShaderProperty('mirror4', 'doChroma', true)

    initShader("vcrchroma","vcrchroma")
    setCameraShader('game', 'vcrchroma')
   -- setCameraShader('hud', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 1)
    setShaderProperty('vcrchroma', 'speed', 1.2)
	
	
    initShader('glowBorder', 'glowBorder')--
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'money',0.95)
    setShaderProperty('glowBorder', 'transparency', 0.7)
    setShaderProperty('glowBorder', 'transparency2', 0.7)

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setCameraShader("hud","titleeffect")
    setShaderProperty('titleeffect', 'money',0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)

    initShader('glitchy', 'glitchy')--
    setCameraShader('game', 'glitchy')
    setCameraShader('hud', 'glitchy')
    setShaderProperty('glitchy', 'AMT', 0)
    setShaderProperty('glitchy', 'SPEED', 0.4)

    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setCameraShader('hud', 'pixel')
    setShaderProperty('pixel', 'strength', 0)
    

    initShader('fish', 'EyeFishEffect')--
    setCameraShader('game', 'fish')
    setCameraShader('hud', 'fish')
    setShaderProperty('fish', 'power', 0.1)

	
    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue',1.5)

    
    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


	initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)

	initShader('bloom', 'BloomEffect')--
    setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
	setShaderProperty('bloom', 'brightness', 0)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')

    setShaderProperty('zoomblur', 'posX', 2)
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'focusPower', 0)

	setProperty('', 'centerCamera', true)

    makeSprite('uno paper', 'uno paper', -3000, 150, 1)
	setObjectCamera('uno paper', 'hud')
	makeSprite('dos paper', 'dos paper', 3000, 150, 1)
	setObjectCamera('dos paper', 'hud')
	makeSprite('tres paper', 'tres paper', -3000, 150, 1)
	setObjectCamera('tres paper', 'hud')
	makeSprite('cuatro paper', 'cuatro paper', 3000, 150, 1)
	setObjectCamera('cuatro paper', 'hud')
    setCamZoom(0.8)

  --  addActorTrail("dad",25,12,0.2,0.02) 
   -- addActorTrail("boyfriend",25,12,0.2,0.02)

end

function getNoteAlpha(i)
    local pos = getActorAlpha('global') * getActorAlpha('note'..i)
    local playerxd = 'player'
    if i < keyCount then
        playerxd = 'opponent'
    end
    pos = pos * getActorAlpha(playerxd)
    return pos
end
local noteScale = 1

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

local lerpSpeedScale = 8
local lerpSpeedX = 1
local lerpSpeedY = 1
local lerpSpeedZ = 1
local lerpSpeedAngle = 4
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 5

local loco = true
local time = 0
local matt = false
local bf = false
local mirror1 = false
local mirror2 = false
local qperroxd = false
local serpientelol = 0.6 -- altura
local serpientexd = 0.5 -- velocidad
function update(elapsed)
	time = time + elapsed
	setShaderProperty('raroglitch', 'iTime', time/2)
    setCustomShaderFloat('DistortionEffect', 'iTime', time)
	setShaderProperty('vcrchroma', 'iTime', time)
    setShaderProperty('titleeffect', 'uTime', time)
    setShaderProperty('glowBorder', 'iTime', time)
    setShaderProperty('glitchy', 'iTime', time)

    setShaderProperty('glitchChromatic', 'iTime', time)

    if mirror2 then
    x = lerp(x, 0, elapsed*8)
    setShaderProperty('mirror2', 'x', x)
    angle1 = lerp(angle1, 0, elapsed*8)
    setShaderProperty('mirror2', 'angle', angle1)
    end
    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
    if mirror1 then
    angle = lerp(angle, 0, elapsed*8)
    setShaderProperty('mirror', 'angle', angle)
    x1 = lerp(x1, 0, elapsed*8)
    setShaderProperty('mirror', 'x', x1)
    end
    if matt then
        set("camFollow.x", get("dad.x")+175)
        set("camFollow.y", get("dad.y")+250)
        set("defaultCamZoom", 0.9)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+175)
        set("camFollow.y", get("boyfriend.y")+200)
        set("defaultCamZoom", 0.9)
    end

    local currentBeat = (songPos / 1000) * (bpm / 60)
  
    if qperroxd then
		lerpSpeedY = 3
		for i = 0, (keyCount * 2) - 1 do
			local qxd = serpientelol * math.sin(currentBeat * serpientexd) * 100
			local rarete = serpientelol * math.cos(currentBeat * serpientexd + i) * 45
			local loco = serpientelol * math.sin(currentBeat * serpientexd + math.pi / 2) * 120
			local rarosxd = serpientelol * math.cos(currentBeat * serpientexd + i) * 70
	
			targetnoteYPos[i+1] = _G["defaultStrum"..i.."Y"] + (i <= 3 and qxd or -qxd)
			targetnoteZPos[i+1] = (i <= 3 and -loco or loco)
	
			if i > 3 then
				targetnoteXPos[i+1] = _G["defaultStrum"..i.."X"] - 320 + rarosxd
			end
	
			noteAngle[i + 1] = rarete
		end
		
	end
	

	if curStep >= 64 and curStep < 192 or curStep >= 320 and curStep < 384 or curStep >= 416 and curStep < 512 
    or curStep >= 544 and curStep < 656 or curStep >= 672 and curStep < 704 or curStep >= 720 and curStep < 768
    or curStep >= 832 and curStep < 1088 then
        set("camFollow.x", (math.cos(time * 2.5) * 200) + (-150))
        set("camFollow.y", (math.sin(time * 1.5) * 75) + 425)
        setProperty('', 'centerCamera', true)
    else
        setProperty('', 'centerCamera', false)
	end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end



function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function startSong()
  for i = 0,7 do
    targetnoteZPos[i + 1] = 0 
  end
	tweenShaderProperty("mirror","zoom",1,crochet*0.001*8,"linear")
    tweenShaderProperty("bloom","contrast",1,crochet*0.001*8,"linear")
end
function stepHit()
   
    if curStep == 1680 or curStep == 1712 then
        matt = true
        bf = false
    end
    if curStep == 1696 or curStep == 1728 or curStep == 2116 or curStep == 2272 
    or curStep == 2304 then
        matt = false
        bf = true
    end
    if curStep == 1744 or curStep == 1992 or curStep == 2148 or curStep == 2288 or curStep == 2320 then
        matt = false
        bf = false
        set("defaultCamZoom", 0.75)
    end
    if curStep >= 128 and curStep <= 176 and (curStep - 128) % 16 == 0 then
        lerpSpeedZ = 3
        lerpSpeedX = 2.5
        lerpSpeedAngle = 2
        local i = (curStep - 128) / 16 
        local opposite = 7 - i 
        for _, xd in ipairs({i, opposite}) do
            targetnoteXPos[xd + 1] = _G['defaultStrum'..xd..'X']
          --  tween("note"..xd, {alpha = 1}, crochet * 0.001 * 4, "linear")
            targetnoteZPos[xd + 1] = 0
            noteAngle[xd + 1] = (xd % 2 == 0) and -360 or 360
        end
    end
    
    
    
	if curStep == 32 then
        for i = 0,7 do
            targetnoteZPos[i+1] = 1000 
            if not middlescroll then
                targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] + (i < 4 and -640 or 640)
            end
           -- tween("note"..i,{alpha = 0},crochet*0.001*4,"cubeIn")
            noteAngle[i+1] = (i < 4 and -360 or 360)
        end
        tweenShader("bars","effect",0.6,crochet*0.001*4,"cubeIn")
		tweenShaderProperty("pixel","strength",50,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror2","zoom",3,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror2","angle",-90,crochet*0.001*4,"cubeIn")
	elseif curStep == 64 then
        setShaderProperty('bars2', 'effect', 0.1)
		setShaderProperty('raroglitch', 'glitch', 0)
		setShaderProperty('raroglitch', 'wave', 0)
		setShaderProperty('raroglitch', 'glitchLine', 0)
		tweenShaderProperty("greyscale","strength",0,crochet*0.001*32,"cubeIn")
		tweenShaderProperty("bars","effect",0,crochet*0.001*28,"linear")
		tweenShaderProperty("pixel","strength",0,crochet*0.001*8,"cubeOut")
        setShaderProperty("mirror2","zoom",0)
        tweenShaderProperty("mirror2","zoom",1,crochet*0.001*32,"linear")
        tweenShaderProperty("mirror2","angle",0,crochet*0.001*32,"linear")
    elseif curStep == 192 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",-10,0,2,crochet,"linear")
    elseif curStep == 304 then
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 304 or curStep == 2144  then
        setProperty('', 'cameraSpeed', 4)
        tween("uno paper",{x=300},crochet*0.001*1,"cubeOut")
        matt = true
	elseif curStep == 308 or curStep == 2148 then
        bf = true
        matt = false
		tween("uno paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("dos paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 312 or curStep == 2152 then
        bf = false
        matt = true
		tween("dos paper",{x=3000},crochet*0.001*1,"cubeInOut")
		tween("tres paper",{x=300},crochet*0.001*1,"cubeOut")
    end
    if curStep == 312 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeInOut")
	elseif curStep == 316 then
        bf = true
        matt = false
		tween("tres paper",{x=-3000},crochet*0.001*1,"cubeInOut")
		tween("cuatro paper",{x=300},crochet*0.001*1,"cubeOut")
	elseif curStep == 320 then
        lascosasdelhud(1,crochet,4,"cubeOut")
         set("defaultCamZoom", 0.7)
        bf = false
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
		tween("cuatro paper",{x=3000},crochet*0.001*1,"cubeInOut")
        setProperty('', 'cameraSpeed', 4)
    elseif curStep == 324 then
        
        mirror(true,true,"x","x",-2,0,2,crochet,"expoInOut")
	end
    if curStep == 336 then
        mirror2 = true
        x = 0.1
    elseif curStep == 338 then
       x = -0.1
    elseif curStep == 348 or curStep == 364 or
    curStep == 420 or curStep == 432 or curStep == 804 then
        setShaderProperty('mirror2', 'y', -2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*2,"expoInOut")
    
    elseif curStep == 440 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
    elseif curStep == 444 then
        mirror(false,true,"","zoom",0,1.35,1,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 448 then
        bf = false
        for i = 0,7 do
            noteAngle[i+1] = 360
        end
        set("defaultCamZoom", 0.7)
        flashCamera("hud","white",crochet*0.001*2)
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 512 then
        loco = false
    elseif curStep == 568 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == 576 then
        flashCamera("hud","white",crochet*0.001*2)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        setProperty('', 'cameraSpeed', 3)
        bf = false
        set("defaultCamZoom", 0.7)
    elseif curStep == 656 then
        flechas(0,false)
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
        tweenShaderProperty("fish","power",0.2,crochet*0.001*0.5,"cubeOut")
    elseif curStep == 658 or curStep == 662 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,0.5,crochet,"quadOut")
    elseif curStep == 660 then
        flechas(0,false)
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,0.5,crochet,"cubeOut")
    elseif curStep == 664 then
        flechas(0,false)
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*1.5,"cubeOut")
    elseif curStep == 665 then
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
    elseif curStep == 666 then
        mirror2 = false
        setShaderProperty('mirror2', 'x', 2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 667 then
        mirror(false,true,"","angle",0,10,1,stepCrochet,"cubeIn")
    elseif curStep == 668 then
        for i = 0,7 do
            noteAngle[i+1] = -360
        end
        mirror(false,true,"","angle",0,-10,1,stepCrochet,"cubeOut")
    elseif curStep == 670 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,10,2,stepCrochet,"cubeIn")
        tweenShaderProperty("bars2","effect",0.1,crochet*0.001*0.5,"cubeIn")
        tweenShaderProperty("fish","power",0.1,crochet*0.001*0.5,"cubeIn")
    elseif curStep == 672 then
        mirror(false,true,"","angle",0,0,4,stepCrochet,"cubeOut")
    elseif curStep == 702 then
        mirror(false,true,"","zoom",0,1.1,0.5,crochet,"cubeIn")
    elseif curStep == 704 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,180,8,stepCrochet,"quadOut")
    elseif curStep == 712 then
        tweenShaderProperty("bars2","effect",0,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","angle",0,-10,8,stepCrochet,"cubeIn")
    elseif curStep == 716 then
        mirror(false,true,"","zoom",0,1,4,stepCrochet,"cubeIn")
    elseif curStep == 720 then
        set("defaultCamZoom", 0.6)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        flashCamera("hud","white",crochet*0.001*2)
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 768 then
        loco = true
    end
    if curStep == 812 then
        tweenShaderProperty("bars2","effect",0.1,stepCrochet*0.001*4,"cubeOut")
    elseif curStep == 814 or curStep == 822 then
        mirror(false,true,"","zoom",0,1.2,2,stepCrochet,"cubeIn")
    elseif curStep == 816 or curStep == 820 or curStep == 824 or curStep == 828 then
        triggerEvent('screen shake',(stepCrochet*0.001*4)..',0.01')
        zoom = 0.8
        bloom(20,1,crochet,1,"cubeOut")
        flechas(0,true)
        setProperty('', 'cameraSpeed', 5)
    elseif curStep == 818 then
        mirror(false,true,"","zoom",0,1.5,2,stepCrochet,"cubeIn")
    end

    if curStep >= 816 and curStep <= 828 and (curStep % 4 == 0) then
        local offset = ((curStep - 816) / 4 + 1) * 80
        for i = 0, 3 do
            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + offset
            tween("note"..i, {alpha = 0.15}, crochet * 0.001 * 4, "linear")
        end
        for i = 4, 7 do
            targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - offset
        end
    end
    
    
    if curStep == 824 then
        mirror1 = false
        mirror(false,true,"","barrel",0,-5,8,stepCrochet,"cubeIn")
        tweenShaderProperty("glitchy","AMT",0.1,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("zoomblur","focusPower",3,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","angle",0,-360,12,stepCrochet,"cubeInOut")
        lascosasdelhud(0,crochet,2,"cubeOut")
    elseif curStep == 826 then
        mirror(false,true,"","zoom",0,1,2,stepCrochet,"expoIn")
    end
    if ( curStep >= 448 and curStep < 496 or curStep >= 1088 and curStep < 1200 ) and curStep % 16 == 12 then
        setShaderProperty('mirror2', 'y', -2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*2,"expoInOut")
    elseif (curStep >= 576 and curStep < 656 or curStep >= 676 and curStep < 696
    or curStep >= 740 and curStep < 768) and curStep % 16 == 4 then
        setShaderProperty('mirror2', 'y', -2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*2,"expoInOut")
    end
    if curStep >= 816 and curStep < 832 then
        if curStep % 8 == 0 then
            matt = true
            bf = false
        elseif curStep % 8 == 4 then
            matt = false
            bf = true
        end
    end
    if curStep >= 320 and curStep < 704 or curStep >= 720 and curStep < 816 or curStep >= 1088 and curStep < 1216
    or curStep >= 1872 and curStep < 2118 then
        if curStep % 64 == 0 or curStep % 64 == 6 or curStep % 64 == 10 or curStep % 64 == 16 or curStep % 64 == 18 or curStep % 64 == 22
        or curStep % 64 == 26 or curStep % 64 == 30 or curStep % 64 == 32 or curStep % 64 == 38 or curStep % 64 == 42 or curStep % 64 == 48
        or curStep % 64 == 50 or curStep % 64 == 54 or curStep % 64 == 58 or curStep % 64 == 59 or curStep % 64 == 60 or curStep % 64 == 62 then
            zoom = 0.85
            noteScale = noteScale + 0.3
        end
    end

	if curStep >= 1744 and curStep < 1872 or curStep >= 2160 and curStep < 2416 then
        if curStep % 64 == 0 or curStep % 64 == 6 or curStep % 64 == 14 or curStep % 64 == 20 or curStep % 64 == 28 or curStep % 64 == 32
        or curStep % 64 == 46 or curStep % 64 == 52 or curStep % 64 == 60 or curStep % 64 == 64 or curStep % 64 == 68 or curStep % 64 == 78
        or curStep % 64 == 84 or curStep % 64 == 92 or curStep % 64 == 96 or curStep % 64 == 110 or curStep % 64 == 116 or curStep % 64 == 124 then
            zoom = 0.85
			noteScale = noteScale + 0.25
        end
    end

    if curStep >= 832 and curStep < 1072 or curStep >= 1360 and curStep < 1600  then
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 8 or curStep % 16 == 12 or curStep % 16 == 14 then
            zoom = 0.8
            noteScale = noteScale + 0.3
        end
    end
    if curStep >= 1616 and curStep < 1732  then
        if curStep % 32 == 0 or curStep % 32 == 14 or curStep % 32 == 20 or curStep % 32 == 28  then
            zoom = 0.8
            noteScale = noteScale + 0.3
        end
    end
    if curStep == 910 or curStep == 942 or curStep == 1038 or curStep == 1070 or curStep == 1438 or curStep == 1470
    or curStep == 1566 or curStep == 1598 then
        tweenShaderProperty("fish","power",0.2,crochet*0.001*0.5,"cubeIn")
		mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeIn")
    elseif curStep == 832 then
        triggerEvent('screen shake',(crochet*0.001*64)..',0.02')

    elseif curStep >= 912 and curStep < 928 or curStep >= 944 and curStep < 960 
    or curStep >= 1040 and curStep < 1056 or curStep >= 1072 and curStep < 1088 
    or curStep >= 1440 and curStep < 1456 or curStep >= 1472 and curStep < 1488 
    or curStep >= 1568 and curStep < 1584 or curStep >= 1600 and curStep < 1616 then
        if curStep % 4 == 0 then
            mirror(true,true,"x","x",0.1,0,0.5,crochet,"cubeOut")
        elseif curStep % 4 == 2 then
            mirror(true,true,"x","x",-0.1,0,0.5,crochet,"cubeOut")
        end
    end
    if curStep == 926 or curStep == 958 or curStep == 1054 or curStep == 1456 or curStep == 1486 or curStep == 1582 then
        tweenShaderProperty("fish","power",0.1,crochet*0.001*0.5,"cubeIn")
		mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 952 or curStep == 1480 then
       -- tweenShaderProperty("fish","power",0.1,crochet*0.001*0.5,"cubeIn")
		mirror(false,true,"","angle",0,360,3,crochet,"cubeInOut")
    end
    if curStep == 952 then
        tweenShaderProperty("mirror2","x",-2,crochet*0.001*2,"cubeInOut")
    elseif curStep == 1038 or curStep == 1070 then
        tweenShaderProperty("titleeffect","money",0.4,crochet*0.001*0.5,"linear")
    elseif curStep == 1566 or curStep == 1598 then
        tweenShaderProperty("color","red",2.5,crochet*0.001*0.5,"linear")
        tweenShaderProperty("color","blue",1.5,crochet*0.001*0.5,"linear")
    end
    if curStep == 1054 or curStep == 1086 then
        tweenShaderProperty("titleeffect","money",0,crochet*0.001*0.5,"linear")
        mirror(false,true,"","barrel",0,0,0.5,crochet,"linear")
    elseif curStep == 1582 or curStep == 1614 then
        tweenShaderProperty("color","red",1.5,crochet*0.001*0.5,"linear")
        tweenShaderProperty("color","blue",2.25,crochet*0.001*0.5,"linear")
        mirror(false,true,"","barrel",0,0,0.5,crochet,"linear")
    elseif curStep == 1080 or curStep == 1608 then
         mirror(false,true,"","angle",0,360,3,crochet,"cubeInOut")
         mirror(false,true,"","barrel",0,-5,1.5,crochet,"cubeIn")
         tweenShaderProperty("fish","power",0.1,crochet*0.001*2,"cubeIn")
		mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    end
    if curStep == 1088 then
        for i = 0,3 do
            targetnoteZPos[i + 1] = 0
        end
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty("titleeffect","money",1)
        tweenShaderProperty("titleeffect","money",0.82,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("glitchy","AMT",0,crochet*0.001*1,"cubeOut")
        setProperty('', 'cameraSpeed', 3)
        lascosasdelhud(1,crochet,4,"cubeOut")
    elseif curStep == 1144 then
        mirror2 = true
        x = 0.15
        angle1 = 15
    elseif curStep == 1148 then
        x = -0.15
        angle1 = -15
    elseif curStep == 1212 then
        mirror2 = false
        tweenShaderProperty("bars2","effect",0.23,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("fish","power",0.2,crochet*0.001*1,"cubeOut")
		mirror(false,true,"","zoom",0,1.75,1,crochet,"cubeOut")
    elseif curStep == 1216 then
        mirror(false,true,"","zoom",0,1,32,crochet,"cubeIn")
        lascosasdelhud(0,crochet,2,"cubeOut")
        flashCamera("hud","white",crochet*0.001*2)
        tweenShaderProperty("greyscale","strength",0.7,crochet*0.001*1,"cubeOut")
        setShaderProperty('raroglitch', 'greyscale', 1)
        setShaderProperty('raroglitch', 'glitch', 0.02)
        setShaderProperty('raroglitch', 'wave', 0.2)
        setShaderProperty('raroglitch', 'glitchLine', 0.3)
        setShaderProperty('sobel', 'strength', 0.5)
        setActorColor("dad",0,0,0,1)
        setActorColor("boyfriend",0,0,0,1)
    elseif curStep == 1328 then
        tweenShaderProperty("bars2","effect",0,crochet*0.001*4,"linear")
        tweenShaderProperty("fish","power",0.1,crochet*0.001*4,"linear")
    elseif curStep == 1352 then
        mirror1 = false
        mirror(true,true,"angle","angle",0,360,3,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
    elseif curStep == 1358 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 1360 then
        setShaderProperty('sobel', 'strength', 0)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        setShaderProperty('raroglitch', 'greyscale', 1)
        setShaderProperty('raroglitch', 'glitchLine', 0)
        tweenShaderProperty("glitchy","AMT",0.1,crochet*0.001*1,"cubeOut")
        setShaderProperty('raroglitch', 'glitch', 0)
        setShaderProperty('raroglitch', 'wave', 0)
        setActorColor("dad",255,255,255,0)
        setActorColor("boyfriend",255,255,255,0)
        triggerEvent('screen shake',(crochet*0.001*64)..',0.02')
        setShaderProperty('color', 'red', 1.5)
        setShaderProperty('color', 'green',1.5)
        setShaderProperty('color', 'blue',2.25)
        --setShaderProperty('BloodBGEffect', 'strength', 0.5)
      setShaderProperty('glitchChromatic', 'GLITCH',0.1)
    elseif curStep == 1616 then
        for i = 0,3 do
            targetnoteZPos[i + 1] = 0
        end
        tweenShaderProperty("color","red",1.5,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("color","green",1.5,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("color","blue",1.5,crochet*0.001*1,"cubeOut")
        lascosasdelhud(0.5,crochet,2,"cubeOut")
        tweenShaderProperty("titleeffect","money",0.423,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("glitchy","AMT",0,crochet*0.001*1,"cubeOut")
        flashCamera("hud","white",crochet*0.001*2)

    end

    if curStep == 1656 then
        tweenShaderProperty("mirror2","y",2,crochet*0.001*3,"expoInOut")
    elseif curStep == 1664 then
        tweenShaderProperty("mirror2","zoom",2,crochet*0.001*1,"expoOut")
        tweenShaderProperty("mirror2","angle",15,crochet*0.001*1,"expoOut")
    elseif curStep == 1668 then
        tweenShaderProperty("mirror2","zoom",1.5,crochet*0.001*1,"expoIn")
        tweenShaderProperty("mirror2","angle",-15,crochet*0.001*1,"expoIn")
    elseif curStep == 1672 then
        tweenShaderProperty("mirror2","zoom",2,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("mirror2","angle",45,crochet*0.001*1,"cubeIn")
    elseif curStep == 1676 then
        tweenShaderProperty("mirror2","zoom",1,crochet*0.001*2,"expoInOut")
        tweenShaderProperty("mirror2","angle",-360,crochet*0.001*2,"expoInOut")
    elseif curStep == 1680 then
        flashCamera("hud","white",crochet*0.001*1)
    elseif curStep == 1728 then
        tweenShader("bars2","effect",0.6,crochet*0.001*4,"expoIn")
        tweenShader("pixel","strength",20,crochet*0.001*4,"cubeIn")
        tweenShader("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("mirror3","zoom",3.0,crochet*0.001*3.5,"expoIn")
        tweenShaderProperty("mirror3","angle",-90,crochet*0.001*3.5,"expoIn")
        lascosasdelhud(0,crochet,4,"cubeOut")
        tweenShaderProperty("titleeffect","money",0.0,crochet*0.001*4,"cubeIn")
        bloom(1,0,crochet,4,"cubeIn")
    elseif curStep == 1736 then
        for i = 0,7 do
            noteAngle[i + 1] = 360
			
        end
    elseif curStep == 1744 then
        tweenShader("bars2","effect",0.1,crochet*0.001*2,"cubeOut")
        tweenShader("pixel","strength",0,crochet*0.001*1,"cubeOut")
        tweenShader("greyscale","strength",0.3,crochet*0.001*2,"cubeOut")

        tweenShaderProperty("mirror3","zoom",1.0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror3","angle",0,crochet*0.001*2,"cubeOut")

        bloom(8,1,crochet,2,"cubeOut")
        --flashCamera("hud","white",crochet*0.001*1)

        setShaderProperty('raroglitch', 'greyscale', 1)
        setShaderProperty('raroglitch', 'glitch', 0.02)
        setShaderProperty('raroglitch', 'wave', 0.17)
        setShaderProperty('raroglitch', 'glitchLine', 0.28)
        tweenShaderProperty("glitchy","AMT",0.08,crochet*0.001*1,"cubeOut")

        setShaderProperty("DistortionEffect","size", 0.08)

    end
   if curStep == 1744 then
    qperroxd = true
   end
    if curStep == 1756 then
        mirror(true,true,"angle","angle",0,15,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1.35,1,crochet,"cubeIn")
    elseif curStep == 1772 then
        mirror(false,true,"","angle",0,-15,1,crochet,"expoIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == 1776 then
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
        tweenShader("mirror2","x",-12,crochet*0.001*4,"linear")
    elseif curStep == 1792 then
        mirror(false,true,"","angle",0,-360,2,crochet,"cubeOut")
    elseif curStep == 1800 then
        mirror(false,true,"","angle",0,0,3,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"cubeIn")
    elseif curStep == 1808 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 1816 then
        tweenShader("mirror2","y",-2,crochet*0.001*3,"expoInOut")
    elseif curStep == 1832 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
    elseif curStep == 1840 then
        tweenShader("mirror2","x",-24,crochet*0.001*4,"linear")
    elseif curStep == 1848 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 1872 then
        bf = true
        
      
        bloom(20,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",-15,15,8,crochet,"linear")
    elseif curStep == 1904 then
        mirror(false,true,"","angle",0,-15,8,crochet,"linear")
    elseif curStep == 1936 then
        mirror(false,true,"","angle",0,15,8,crochet,"linear")
    elseif curStep == 1968 then
        mirror(false,true,"","angle",0,0,4,crochet,"linear")
    elseif curStep == 1984 then
        bloom(1,3,crochet,4,"cubeIn")
        mirror(false,true,"","angle",0,180,4,crochet,"cubeIn")
        tweenShaderProperty("mirror4","barrel",-8,crochet*0.001*4,"cubeIn")
    end
    if curStep == 2000 then
		qperroxd = false
	
		for i = 0, 7 do
			noteAngle[i+1] = 360
            if i == 0 or i == 1 then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 20
                targetnoteZPos[i + 1] = -500
            elseif i == 2 or i == 3 then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 620
                targetnoteZPos[i + 1] = -500
            else
				targetnoteZPos[i + 1] = 0
				targetnoteYPos[i + 1] = _G['defaultStrum'..i..'Y']
                if not middlescroll then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 320
                end
            end
        end
    end
    

    if curStep == 2000 or curStep == 2006 or curStep == 2012 or curStep == 2018 
    or curStep == 2032 or curStep == 2038 or curStep == 2044 or curStep == 2050
    or curStep == 2064 or curStep == 2070 or curStep == 2076 or curStep == 2082 
    or curStep == 2096 or curStep == 2102 or curStep == 2108 or curStep == 2114 then
		toggle = not toggle
		lerpSpeedAngle = 8
		for i = 0, 7 do
			if i <= 3 then
				noteAngle[i + 1] = toggle and -360 or 360
			else
				targetnoteZPos[i + 1] = 0
				noteAngle[i + 1] = toggle and 360 or -360
			end
		end
        bloom(20,1,crochet,1,"cubeOut")
        setShaderProperty("mirror4","barrel",-8)
	    tweenShaderProperty("mirror4","barrel",0,crochet*0.001*1.5,"cubeOut")
    end

    if curStep == 2000 or curStep == 2032 or curStep == 2064 or curStep == 2096 then
        mirror(true,true,"angle","angle",180,360,1.5,crochet,"cubeOut")
        tweenShader("pixel","strength",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"cubeOut")
    elseif curStep == 2006 or curStep == 2038 or curStep == 2070 or curStep == 2102 then 
        mirror(true,true,"angle","angle",-10,10,4,stepCrochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("bars2","effect",0,crochet*0.001*1,"linear")
    elseif curStep == 2010 or curStep == 2042 or curStep == 2074 or curStep == 2106 then
        mirror(false,true,"","angle",0,360,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.15,1,crochet,"cubeOut")
    elseif curSp == 2012 or curSp == 2044 or curStep == 2076 or curStep == 2108 then
        setShaderProperty("mirror2","x",0)
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeOut")

    elseif curStep == 2016 or curStep == 2048 or curStep == 2080 or curStep == 2112 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeIn")
    elseif curStep == 2018 or curStep == 2050 or curStep == 2082 then
        tweenShaderProperty("mirror2","x",2,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,1,crochet,"cubeOut")
    elseif curStep == 2114 then
        mirror(true,true,"angle","angle",-360,0,1,crochet,"cubeOut")
    elseif curStep == 2022 or curStep == 2054 or curStep == 2086 or curStep == 2118 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"expoIn")
    elseif curStep == 2024 or curStep == 2088 or curStep == 2120 then
        bloom(20,1,crochet,1,"cubeOut")
        setShaderProperty("mirror2","y",0)
        tweenShader("mirror2","y",2,crochet*0.001*1,"cubeOut")
        tweenShader("pixel","strength",5,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    end

    if curStep == 2024 or curStep == 2088 then
        tweenShader("mirror4","barrel",-8,crochet*0.001*0.1,"cubeOut")
        setShaderProperty("mirror4","barrel",-8)
        tweenShader("bars2","effect",0.2,crochet*0.001*2,"cubeOut")
    elseif curStep == 2028 or curStep == 2092 or curStep == 2124 then
        tweenShader("pixel","strength",0,crochet*0.001*1,"cubeIn")
        setShaderProperty("mirror2","y",0)
        tweenShader("mirror2","y",2,crochet*0.001*1,"cubeOut")
    elseif curStep == 2056 then
        tweenShader("bars2","effect",0.2,crochet*0.001*2,"cubeOut")
        bloom(20,1,crochet,1,"cubeOut")
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",-12,crochet*0.001*2,"linear")
        tweenShader("pixel","strength",5,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    end


    if curStep == 2128 then
		tweenShader("bloom","brightness",-1,crochet*0.001*4,"cubeIn")
        bloom(4,1,crochet,1,"cubeOut")
       -- fadeCamera("hud","black",crochet*0.001*4,"cubeIn",true)
        flashCamera("hud","white",crochet*0.001*1)
        mirror(false,true,"","angle",0,-20,4,crochet,"linear")
        mirror(true,true,"zoom","zoom",0.8,1,4,crochet,"linear")
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShader("mirror2","x",2,crochet*0.001*4,"linear")
    elseif curStep == 2132 or curStep == 2136 or curStep == 2140 then
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == 2144 then
      --  fadeCamera("hud","black",0.5,true)
	  tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        mirror(true,true,"zoom","zoom",0.5,1,2,crochet,"cubeOut")
    elseif curStep == 2152 then
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    elseif curStep == 2156 then
        tweenShader("bars2","effect",0.1,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        bloom(1,2,crochet,1,"cubeIn")
        tween("tres paper",{x=-3000},crochet*0.001*1,"cubeInOut")
    end


--2160

    if curStep == 2160 then
		for i = 0,7 do
			targetnoteYPos[i + 1] = _G['defaultStrum'..i..'Y']
			if i == 0 or i == 1 then
                targetnoteZPos[i + 1] = 0
            elseif i == 2 or i == 3 then
                targetnoteZPos[i + 1] = 0
            else
				targetnoteZPos[i + 1] = 0
				if not middlescroll then
				targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X']  - 320
				end
			end
		end
        matt = false
        bf = false
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('titleeffect', 'money',1.1)
        tweenShader("greyscale","strength",0.2,crochet*0.001*1,"cubeOut")
    end
    if curStep >= 2160 and curStep < 2224 then
        if curStep % 16 == 0 then
            setShaderProperty("mirror2","x",0)
            tweenShader("mirror2","x",2,crochet*0.001*3,"cubeInOut")
        elseif curStep % 16 == 4 then
            tweenShader("mirror4","barrel",-4,crochet*0.001*1,"cubeIn")
        elseif curStep % 16 == 8 then
            tweenShader("mirror4","barrel",0,crochet*0.001*1,"cubeOut")
        end
    end

    if curStep == 2180 or curStep == 2196 then
        mirror(false,true,"","angle",0,-45,1,crochet,"cubeIn")
    end
    if curStep == 2184 or curStep == 2200 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    end

    if curStep == 2228 or curStep == 2244 or curStep == 2260 or curStep == 2276 or curStep == 2324 then
        tweenShader("mirror4","barrel",-6,crochet*0.001*1,"cubeIn")
    elseif curStep == 2232 or curStep == 2248 or curStep == 2264 or curStep == 2280 or curStep == 2328 then
        tweenShader("mirror4","barrel",0,crochet*0.001*1,"cubeOut")
    end
    if curStep == 2216 then
        mirror(false,true,"","zoom",0,1.85,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,8,stepCrochet,"cubeIn")
        tweenShader("mirror4","barrel",0,crochet*0.001*1,"cubeOut")
        tweenShader("bars2","effect",0.27,crochet*0.001*2,"cubeOut")
    elseif curStep == 2224 then
        bloom(20,1,crochet,1,"cubeOut")
        mirror(true,true,"angle","angle",25,0,2,crochet,"cubeOut")


    elseif curStep == 2228 then
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",2,crochet*0.001*1.5,"cubeInOut")
    elseif curStep == 2236 then
        setShaderProperty("mirror2","y",0)
        tweenShader("mirror2","y",1,crochet*0.001*2,"cubeOut")
    elseif curStep == 2244 then
        tweenShader("mirror2","x",4,crochet*0.001*1.5,"cubeInOut")
        tweenShader("mirror2","y",2,crochet*0.001*2,"cubeOut")
    elseif curStep == 2240 then
        mirror(true,true,"angle","angle",-360,-180,16,stepCrochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,16,stepCrochet,"cubeIn")
        tweenShader("bars2","effect",0.1,stepCrochet*0.001*16,"cubeIn")
    end
    if curStep == 2256 or curStep == 2288 then
        bloom(20,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,6,stepCrochet,"cubeOut")
    elseif curStep == 2260 then
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",2,crochet*0.001*3,"cubeInOut")
    elseif curStep == 2264 then
        tweenShader("bars2","effect",0.27,stepCrochet*0.001*8,"cubeIn")
        mirror(false,true,"","zoom",0,1.85,8,stepCrochet,"cubeIn")
    elseif curStep == 2272 then
        bloom(20,1,crochet,2,"cubeOut")
        tweenShader("bars2","effect",0.1,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,1,16,stepCrochet,"cubeIn")
        mirror(true,true,"angle","angle",-360,-180,16,stepCrochet,"cubeIn")
    elseif curStep == 2276 then
        setShaderProperty("mirror2","x",0)
        tweenShader("mirror2","x",2,crochet*0.001*2,"cubeInOut")


    elseif curStep == 2288 or curStep == 2336 or curStep == 2340 or curStep == 2344 or curStep == 2348 
    or curStep == 2352 or curStep == 2368 or curStep == 2372 or curStep == 2376 or curStep == 2380 or curStep == 2384 
    or curStep == 2400 or curStep == 2404 or curStep == 2408 or curStep == 2412 then
        bloom(10,1,crochet,1,"cubeOut") 
    elseif curStep == 2304 then
        bloom(20,1,crochet,1,"cubeOut") 
        mirror(false,true,"","zoom",0,1.15,4,stepCrochet,"cubeOut")
    elseif curStep == 2308 then
        bloom(20,1,crochet,1,"cubeOut") 
        mirror(false,true,"","zoom",0,1.5,4,stepCrochet,"cubeOut")
    elseif curStep == 2312 then
        bloom(20,1,crochet,1,"cubeOut") 
        mirror(false,true,"","zoom",0,2.5,4,stepCrochet,"cubeOut")
        mirror(false,true,"","angle",0,-25,8,stepCrochet,"cubeIn")
    elseif curStep == 2316 then
        bloom(20,1,crochet,1,"cubeOut") 
        mirror(false,true,"","zoom",0,3,4,stepCrochet,"cubeOut")
        setShaderProperty("mirror2","y",0)
        tweenShader("mirror2","y",1,crochet*0.001*2,"cubeOut")
    elseif curStep == 2320 then
        bloom(20,1,crochet,1,"cubeOut") 
        mirror(false,true,"","zoom",0,1.85,4,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",25,0,8,stepCrochet,"cubeOut")
    elseif curStep == 2324 then
        mirror(false,true,"","zoom",0,1,12,stepCrochet,"cubeIn")
        tweenShader("mirror2","y",2,crochet*0.001*2,"cubeInOut")
    end
    if curStep == 2384 then
    	tweenShader("bloom","brightness",0.5,crochet*0.001*8,"expoIn")
        tweenShader("mirror4","barrel",-10,crochet*0.001*8,"cubeIn")
    elseif curStep == 2400 then
        mirror(false,true,"","zoom",0,2.5,16,stepCrochet,"cubeIn")
	
    end
    if curStep == 2336 then
        mirror(true,true,"angle","angle",-360,0,20,stepCrochet,"cubeInOut")


    elseif curStep == 2416 then
		tweenShader("bloom","brightness",0,crochet*0.001*2,"cubeOut")
        flashCamera("hud","white",0.5)
        tweenShader("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,40,crochet,"cubeOut")
        tweenShader("mirror4","barrel",0,crochet*0.001*2,"cubeOut")
    end
    if curStep == 2544 then
        flashCamera("hud","white",1)
        fadeCamera("hud","black",crochet*0.001*4,"linear",true)
    end


--2246
    if curStep >= 1216 and curStep < 1344 or  curStep >= 1744 and curStep < 2001 then
        if curStep % 32 == 12 then
            tween("camHUD",{zoom = 1.2},crochet*0.001*1,"cubeIn")
        elseif curStep % 32 == 0 then
            tween("camHUD",{zoom = 1},crochet*0.001*2,"cubeOut")
        end
    end

    if curStep >= 1344 and curStep < 1356 then
        if curStep % 4 == 0 then
            mirror2 = true
            x = 0.25
        elseif curStep % 4 == 2 then
            x = -0.25
        end
    end

    



    if curStep >= 1616 and curStep < 1744 then
        if curStep % 16 == 0 then
            setShaderProperty('mirror2', 'barrel', -1.5)
            tweenShader("mirror2","barrel",0,crochet*0.001*1,"cubeOut")
            setShaderProperty('mirror2', 'doChroma', false)
        end
        
    end
    parte1(384)
    parte1(512)
    parte1(768)
    drop(832)
    drop(960)
    drop(1360)
    drop(1488)

    if curStep >= 832 and curStep < 1088 then
        if curStep % 32 == 0 or curStep % 32 == 8 then
            flechas(0,true)
            for i = 0,7 do
                noteAngle[i+1] = -25
               -- noteXPos[i + 1] = targetnoteXPos[i + 1] - 50
            end
        elseif curStep % 32 == 4 or curStep % 32 == 12 then
            flechas(0,true)
            for i = 0,7 do
                noteAngle[i+1] = 25
              --  noteXPos[i + 1] = targetnoteXPos[i + 1] + 50
            end
        end
    end

	if curStep == 1360 or curStep == 1364 or curStep == 1368 or curStep == 1372 or
	curStep == 1392 or curStep == 1396 or curStep == 1400 or curStep == 1404 or
	curStep == 1424 or curStep == 1428 or curStep == 1432 or curStep == 1436 or
	curStep == 1456 or curStep == 1460 or curStep == 1464 or curStep == 1468 or 
	
	curStep == 1488 or curStep == 1492 or curStep == 1496 or curStep == 1500 or
	curStep == 1520 or curStep == 1524 or curStep == 1528 or curStep == 1532 or
	curStep == 1552 or curStep == 1556 or curStep == 1560 or curStep == 1564 or
	curStep == 1584 or curStep == 1588 or curStep == 1592 or curStep == 1596 then
 
		if qqq == nil then
			qqq = false
		 end
		 qqq = not qqq
		 flechas(0, true)
		 for i = 0, 7 do
			 if qqq then
				 noteAngle[i + 1] = -25
			 else
				 noteAngle[i + 1] = 25
			 end
		 end
    end
end
function parte1(s)
    if curStep == s then--384
        matt = true
        tweenShaderProperty("fish","power",0.2,crochet*0.001*0.5,"cubeOut")
		mirror(false,true,"","zoom",0,1.15,0.5,crochet,"cubeOut")
    elseif curStep == s+2 then
        tweenShaderProperty("fish","power",0.3,crochet*0.001*0.5,"cubeOut")
    elseif curStep == s+3 then
		mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
    elseif curStep == s+4 then--388
        tweenShaderProperty("fish","power",0.1,crochet*0.001*0.5,"cubeOut")
    elseif curStep == s+6 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == s+8 then--392
        if loco then
            mirror1 = true
            mirror2 = true
            angle = -15
        else 
            mirror1 = true
            mirror2 = true
            angle = 15
        end
    elseif curStep == s+9 then--393
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
        if loco then
            angle = -15
        else 
            angle = 15
        end
    elseif curStep == s+10 then--394
        setShaderProperty('mirror2', 'y', -2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*2,"expoInOut")
    elseif curStep == s+14 then--398
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == s+16 or curStep == s+20 then
        flechas(0,true)
        if loco then
            angle = 15
            x = -0.1
        else
            angle = -15
            x = 0.1
        end
    elseif curStep == s+18 then
        if loco then
            angle = -15
            x = 0.1
        else
            angle = 15
            x = -0.1
        end
        flechas(0,true)
    elseif curStep == s+22 then
        mirror1 = false
        tween("blackBG",{alpha = 0.65},crochet*0.001*1,"cubeOut")
        tweenShaderProperty("fish","power",0.3,crochet*0.001*1,"cubeOut")
		mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        triggerEvent('screen shake',(stepCrochet*0.001*8)..',0.01')
        if loco then
            mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
        else
            mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
        end
    elseif curStep == s+28 then
        tween("blackBG",{alpha = 0},crochet*0.001*1,"expoIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        if loco then
            mirror(false,true,"","angle",0,-10,1,crochet,"expoIn")
        else 
            mirror(false,true,"","angle",0,10,1,crochet,"expoIn")
        end
        tweenShaderProperty("fish","power",0.1,crochet*0.001*1,"expoIn")
    elseif curStep == s+32 then--416
        matt = false
        bf = true
        for i = 0,7 do
            noteAngle[i+1] = 360
        end
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    end
end
function drop(s)
    if curStep == s then
        for i = 0, 7 do
            if i == 0 or i == 1 then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 20
                targetnoteZPos[i + 1] = -500
            elseif i == 2 or i == 3 then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] + 620
                targetnoteZPos[i + 1] = -500
            else
                if not middlescroll then
                targetnoteXPos[i + 1] = _G['defaultStrum'..i..'X'] - 320
                end
            end
        end
        
        bf = false
        matt = false
        mirror1 = false
        mirror2 = false
        set("defaultCamZoom", 0.7)
        flashCamera("hud","white",crochet*0.001*1)
        mirror(false,true,"","barrel",0,0,4,stepCrochet,"cubeOut")
    elseif curStep == s+12 then
        mirror(false,true,"","zoom",0,1.35,4,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",0,10,4,stepCrochet,"cubeOut")
        tweenShaderProperty("fish","power",0.2,crochet*0.001*0.5,"cubeOut")
    elseif curStep == s+16 or curStep == s+22 or curStep == s+28   then
        setShaderProperty('mirror2', 'x', 2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1.5,"cubeOut")
    elseif curStep == s+18 or curStep == s+24 or curStep == s+30 then --850
        mirror(false,true,"","angle",0,-15,1,stepCrochet,"cubeIn")
        for i = 0,7 do
            noteAngle[i+1] = 45
        end
        flechas(0,false)
    elseif curStep == s+19 or curStep == s+25  then
        mirror(false,true,"","angle",0,15,2,stepCrochet,"quadOut")
    elseif curStep == s+31 then
        mirror(false,true,"","angle",0,0,2,stepCrochet,"quadOut")
    end
    if curStep == s+16  or curStep == s+48 then
        tweenShaderProperty("bars2","effect",0.13,crochet*0.001*1,"linear")
    end
    if curStep == s+24 or curStep == s+56 then
        tweenShaderProperty("fish","power",0.1,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1,8,stepCrochet,"cubeIn")
        tweenShaderProperty("bars2","effect",0.1,crochet*0.001*2,"cubeIn")

    elseif curStep == s+44 then
        mirror(false,true,"","zoom",0,1.35,4,stepCrochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-10,4,stepCrochet,"cubeOut")
        tweenShaderProperty("fish","power",0.2,crochet*0.001*0.5,"cubeOut")

    elseif curStep == s+48 or curStep == s+54 or curStep == s+60  then
        setShaderProperty('mirror2', 'x', -2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1.5,"cubeOut")
        for i = 0,7 do
            noteAngle[i+1] = -45
        end
        flechas(0,false)
    end
    if curStep == s+48 or curStep == s+54  then --850
        mirror(false,true,"","angle",0,15,1,stepCrochet,"cubeIn")
    elseif curStep == s+50 or curStep == s+55  then
        mirror(false,true,"","angle",0,-15,2,stepCrochet,"quadOut")
    elseif curStep == s+60 then
        mirror(false,true,"","angle",0,15,2,stepCrochet,"cubeIn")
    elseif curStep == s+62 then
        mirror(false,true,"","angle",0,0,2,stepCrochet,"quadOut")
    end
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
		local noteRotPos = getNoteRot(thisnotePosX, thisnotePosY, noteRotX)

		thisnotePosX = noteRotPos[1]
		thisnotePosY = noteRotPos[2]
		local thisnotePosZ = noteRotPos[3]+(noteZPos[i+1]/1000)
	
		noteAngle[i+1] = lerp(noteAngle[i+1], targetnoteAngle[i+1], elapsed*lerpSpeedAngle)
		setActorModAngle(noteAngle[i+1], i)

		local totalNotePos = calculatePerspective(thisnotePosX, thisnotePosY, thisnotePosZ)
		
        setActorAlpha(getNoteAlpha(i), i)
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

			local alpha = getNoteAlpha(data)

			if not isSustain(i) then 
				--setRenderedNoteScale(getRenderedNoteWidth(i)*,getRenderedNoteHeight(i)*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleX(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleY(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteAlpha(alpha,i)
				setRenderedNoteAngle(noteAngle[data+1],i)
			else
				setRenderedNoteAlpha(alpha*0.6,i)
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
		xOffset = xOffset + drunk * (math.sin( ((songPos*0.001) + ((data%keyCount)*0.2) ) * (drunkSpeed*0.2)) * 112*0.5);
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

function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end
local flipShit = 1
function flechas(state, modifyY)
    flipShit = flipShit * -1
    lerpSpeedAngle = 5
    lerpSpeedX = 8
    lerpSpeedY = 8
    lerpSpeedZ = 8
    if state == 0 then 
        local offsets = {3,1,2,4,3,1,2,4} 
        for i = 0, 7 do
            local factor = offsets[i + 1] 
            local direction = ((i >= 2 and i <= 3) or (i >= 6 and i <= 7)) and -1 or 1
            
            if modifyY then
                noteYPos[i + 1] = noteYPos[i + 1] + (25 * factor * direction) * flipShit
            else
                noteZPos[i + 1] = noteZPos[i + 1] - (70 * factor * direction) * flipShit
            end
        end
        noteScale = noteScale + 0.2
    end
end
