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
local time = 0
local downscroll = 1
function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
    set("ratingText.alpha",s)
end
function createPost()
    if downscrollBool then
        downscroll = -1
    end
    lascosasdelhud(0)
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
    makeCamera("nose")
    makeCamera("vignette")
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green', 1.5)
    setShaderProperty('color', 'blue', 1.5)
    initShader('colorHUD', 'ColorOverrideEffect')
    setCameraShader('hud', 'colorHUD')
    setShaderProperty('colorHUD', 'red', 1.5)
    setShaderProperty('colorHUD', 'green', 1.5)
    setShaderProperty('colorHUD', 'blue', 1.5)
    initShader('vcrchroma', 'vcrchroma')
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 1)
    setShaderProperty('vcrchroma', 'speed', 1.2)
    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)
    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setCameraShader('nose', 'mirror')
    setShaderProperty('mirror', 'zoom', 6)
    setShaderProperty('mirror', 'angle', -60)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)
    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setCameraShader('nose', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)
    initShader('glitchPeak', 'Glitchy')
    setCameraShader('game', 'glitchPeak')
	setCameraShader('nose', 'glitchPeak')
    setShaderProperty('glitchPeak', 'AMT', 0)
    setShaderProperty('glitchPeak', 'SPEED', 0.1)
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


    initShader('vignette', 'VignetteEffect')
    setCameraShader('vignette', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.3)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('nose', 'ca')
    setShaderProperty('ca', 'strength', 0)
    
    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-750,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(750,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 15, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'nose')
    setActorAlpha(0, 'speed')
    	
    makeSprite('HANK!!!', 'HANK!!!', 300,150,1)
	setObjectCamera('HANK!!!', 'nose')
    setActorAlpha(0, "HANK!!!")
	set("HANK!!!.angle",10)

    makeSprite('UpperBar', 'UpperBar', 0,-50,1)
    setActorLayer('UpperBar', layershit)
    setObjectCamera('UpperBar', 'nose')
    setActorAlpha(1, "UpperBar")

    makeSprite('LowerBar', 'LowerBar', 0,50,1)
    setActorLayer('LowerBar', layershit)
    setObjectCamera('LowerBar', 'nose')
    setActorAlpha(1, "LowerBar")


    makeSprite('Black Stains Up', 'Black Stains Up', -50,0,0.75)
    setActorLayer('Black Stains Up', layershit)
    setObjectCamera('Black Stains Up', 'nose')
    setActorAlpha(1, "Black Stains Up")

    makeSprite('Black Stains Down', 'Black Stains Down', -50,0,0.75)
    setActorLayer('Black Stains Down', layershit)
    setObjectCamera('Black Stains Down', 'nose')
    setActorAlpha(1, "Black Stains Down")

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
local lerpSpeedX = 3.5
local lerpSpeedY = 0.5
local lerpSpeedZ = 4
local lerpSpeedAngle = 3
local lerpSpeednoteRotX = 5

local drunkLerp = 0
local drunk = 0
local drunkSpeed = 0
local time = 0
local caWave = 0
local caWaveSpeed = 3
local caWaveRange = 0
local bf = false
local dad = false
local tricky = false
local shaggy = false
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat('vcrchroma', 'iTime', time)
    setCustomShaderFloat('glitchPeak', 'iTime', time)
    
    caWave = caWave + elapsed*math.random()*caWaveSpeed

    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    if dad == true then
        set("camFollow.x",805)
        set("camFollow.y",550)
        set("defaultCamZoom", 0.6)
    elseif dad == false then
        set("defaultCamZoom", 0.45)
    end
    if bf  == true then
		set("camFollow.x", get("boyfriend.x")+225)
        set("camFollow.y", get("boyfriend.y")+150)
    elseif bf == false then

    end
	if tricky then
        
        set("camFollow.y", getActorY("dadCharacter1")+300)
    end
    if shaggy then     
        set("camFollow.x", getActorX("dadCharacter0")+150)
        set("camFollow.y", getActorY("dadCharacter0")+250)
    end
    if curStep >= 1024 and curStep < 1088 or curStep >= 1280 and curStep < 1344 then
            shaggy = false
            tricky = true 
    elseif curStep >= 1152 and curStep < 1216 or curStep >= 1408 and curStep < 1472 then
            tricky = false
            shaggy = true
        else
            tricky = false
            shaggy = false 
        end
    
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function bumps(valor,speed,curStep)
	setShaderProperty("mirror2","zoom",valor)
	tweenShaderProperty("mirror2","zoom",1,speed*0.001*curStep,"cubeOut")
end
function colorlolxd(red,green,blue)
    setShaderProperty('color', 'red', red)
    setShaderProperty('color', 'green', green)
    setShaderProperty('color', 'blue', blue)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function songStart()
tweenShaderProperty("bloom","contrast",1,crochet*0.001*2,"cubeOut")
tweenShaderProperty("mirror","zoom",1,crochet*0.001*4,"cubeOut")
tweenShaderProperty("mirror","angle",0,crochet*0.001*4,"cubeOut")
end
local beatSwap = -1
angulomirror ={248,616,712,1080,1128,1208,1224,1304,1432,1544,1576,1800,1832,1928,1960}
angulomirrorotro={488,632,840,1016,1144,1272,1368,1464,1528,1560,1784,1816,1944,1992}--1544 empieza drop final

function stepHit()
    for i = 1, #angulomirror do
        if curStep == angulomirror [i] then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,30,1,crochet,"cubeOut")
            tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        elseif curStep == angulomirror [i]+6 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,-30,0.5,crochet,"cubeIn")
        elseif curStep == angulomirror [i]+8 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #angulomirrorotro do
        if curStep == angulomirrorotro [i] then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-30,1,crochet,"cubeOut")
            tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        elseif curStep == angulomirrorotro [i]+6 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,30,0.5,crochet,"cubeIn")
        elseif curStep == angulomirrorotro [i]+8 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end
    if curStep == 32 or curStep == 112 then

        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,30,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 48 or curStep == 96 then
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-30,4,crochet,"cubeOut")
    elseif curStep == 64 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 120 then
        mirror(false,true,"","angle",0,360,4,crochet,"cubeInOut")
    elseif curStep == 128 then
        setShaderProperty('greyscale', 'strength', 0)
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 0)
        lascosasdelhud(1)
    end
    if curStep == 184 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,0,1.5,crochet,"cubeIn")
    elseif curStep == 192 then
        mirror(true,true,"zoom","zoom",10,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 312 then
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
        mirror(false,true,"","zoom",0,4,1.5,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 320 then
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 376 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-30,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 382 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,0.5,crochet,"cubeIn")
    elseif curStep == 384 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,40,8,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 416 then
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,-40,4,crochet,"cubeOut")
    elseif curStep == 432 then
        mirror(false,true,"","angle",0,40,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeOut")
    elseif curStep == 448 or curStep == 576 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
    end
    if curStep == 472 or curStep == 584 or curStep == 728 or curStep == 776 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 476 or curStep == 588 or curStep == 732 or curStep == 780 or curStep == 788 or curStep == 852  then
        beatSwap = beatSwap* -1
        mirror(true,true,"angle","angle",-360*beatSwap,0,2,crochet,"cubeInOut")
    elseif curStep == 480 or curStep == 592 or curStep == 736 or curStep == 784 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 512 then
        mirror(false,true,"","angle",0,-40,4,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 544 then
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,4,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 560 then
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeOut")
    elseif curStep == 624 then
        setShaderProperty('greyscale', 'strength', 1)
       
    elseif curStep == 640 then
        lascosasdelhud(0)
        tweenActorProperty('bottomBar', 'y',670, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-670, crochet*0.001*2, 'cubeOut')
        caWaveRange = 0.07
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('toggle checker bg','0.1',crochet*0.001*1)
        setShaderProperty('vcrchroma', 'strength', 1)
        setActorAlpha(1, 'speed')
        triggerEvent('screen shake', (crochet*0.001*16)..',0.01', (crochet*0.001*64)..',0')
    end
    if curStep == 664 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 672 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 688 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 696 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,2,crochet,"cubeOut")
    elseif curStep == 704 or curStep == 768 or curStep == 832 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 720 or curStep == 784 then
        setShaderProperty('greyscale', 'strength', 0)
        triggerEvent('screen shake', (crochet*0.001*16)..',0.01', (crochet*0.001*64)..',0')
    end
    if curStep == 752 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeOut")
    end
    if curStep == 792 then
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 800 then
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,4,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 808 then
        mirror(false,true,"","angle",0,50,2,crochet,"cubeOut")
    elseif curStep == 816 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-60,2,crochet,"cubeOut")
    elseif curStep == 824 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,70,2,crochet,"cubeOut")
    elseif curStep == 848 then
        setShaderProperty('greyscale', 'strength', 0)
    end
    if curStep == 864 then
        mirror(false,true,"","angle",0,40,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 872 then
        mirror(false,true,"","angle",0,-50,2,crochet,"cubeOut")
    elseif curStep == 880 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,60,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 888 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-70,1,crochet,"cubeInOut")
    elseif curStep == 892 then
        mirror(false,true,"","angle",0,360,3,crochet,"cubeInOut")
    elseif curStep == 888+8 then
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
        setActorAlpha(0, 'speed')
        caWaveRange = 0
        lascosasdelhud(0)
        setShaderProperty('vcrchroma', 'strength', 0)
        dad = true
    end
    if curStep == 908 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 912 or curStep == 920 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeIn")
    elseif curStep == 916 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 924 then
        mirror(false,true,"","zoom",0,6,1,crochet,"cubeOut")
    elseif curStep == 928 then
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 944 then
        mirror(true,true,"angle","angle",0,180,1,crochet,"cubeIn")
    elseif curStep == 948 then
        bloom(8,1,crochet,1,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == 952 then
        bloom(8,1,crochet,1,"cubeOut")
    elseif curStep == 960 then
        mirror(false,true,"","zoom",0,0,2,crochet,"expoIn")
    elseif curStep == 968 then
        mirror(true,true,"zoom","zoom",5,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 976 then
        mirror(true,true,"angle","angle",1080,0,4,crochet,"cubeInOut")
    elseif curStep == 1008 then
        bloom(8,1,crochet,2,"cubeOut")
        caWaveSpeed = 3
        caWaveRange = 0.07
        triggerEvent('screen shake', (crochet*0.001*4)..',0.02', (crochet*0.001*4)..',0.02')
        setActorAlpha(1, "HANK!!!")
    elseif curStep == 1024 then
        setShaderProperty('greyscale', 'strength', 0)
        dad = false
        caWaveRange = 0
        setStageColorSwap("hue",0.17)
        setActorAlpha(0, "HANK!!!")
        lascosasdelhud(1)
        for i = 0,17 do
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
            targetnoteXPos[i+1] = _G['defaultStrum'..i..'X']
            noteAngle[i+1] = 360
        end
    elseif curStep == 1016 then
        tweenActorProperty('bottomBar', 'y',750, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-750, crochet*0.001*2, 'cubeOut')
    end

    --second pase 
    if curStep == 1048 or curStep == 1192 or curStep == 1240 or curStep == 1256 or curStep == 1352 or curStep == 1496 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    end
    if curStep == 1052-4 or curStep == 1244-4 or curStep == 1256 or curStep == 1496 or curStep == 1352 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
    elseif curStep == 1056 or curStep == 1200 or curStep == 1248 or curStep == 1264 or curStep == 1360 or curStep == 1504 then--default
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1196-4  then
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
    end
    if curStep == 1100 or curStep == 1108 or curStep == 1116 then
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeIn")--bf
    elseif curStep == 1396 or curStep == 1400 or curStep == 1404 then
        mirror(true,true,"angle","angle",360,0,3.5,stepCrochet,"cubeIn")
    end
    
    if curStep == 1108 or curStep == 1116 or curStep == 1124 then
        bloom(6,1,crochet,1,"cubeOut")
    elseif curStep == 1144 then
        bloom(6,1,crochet,2,"cubeOut")
        caWaveRange = 0.07
    end
    if curStep == 1152 or curStep == 1184 or curStep == 1216 
    or curStep == 1248 or curStep == 1328 or curStep == 1360 or curStep == 1392 then
        triggerEvent('screen shake', (crochet*0.001*4)..',0.01', (crochet*0.001*4)..',0')
        caWaveRange = 0.07
    elseif curStep == 1168 or curStep == 1200 or curStep == 1232
    or curStep == 1264 or curStep == 1344 or curStep == 1376 or curStep == 1408 then
        caWaveRange = 0
    end
    if curStep == 1164 or curStep == 1172 or curStep == 1180 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeIn")--shaggyx tricky
    elseif curStep == 1332 or curStep == 1336 or curStep == 1340 then
        mirror(true,true,"angle","angle",-360,0,3.5,stepCrochet,"cubeIn")
    end
    if curStep == 1172 or curStep == 1180 or curStep == 1184 or curStep == 1336 or curStep == 1340 
    or curStep == 1344 or curStep == 1400 or curStep == 1404 or curStep == 1408 then
        bloom(8,1,crochet,1,"cubeOut")
    end
    
    if curStep == 1528 then
        tweenActorProperty('bottomBar', 'y',670, crochet*0.001*2, 'cubeOut')
        tweenActorProperty('topBar', 'y',-670, crochet*0.001*2, 'cubeOut')
    elseif curStep == 1536 then
        lascosasdelhud(0)
        triggerEvent('toggle checker bg','0.1',crochet*0.001*1)
        setActorAlpha(1, 'speed')
        triggerEvent('screen shake', (crochet*0.001*128)..',0.01', (crochet*0.001*64)..',0')
        caWaveRange = 0.07
    end
    
    if curStep >= 640 and curStep < 704 or curStep >= 720 and curStep < 768 or curStep >= 784 and curStep < 832 
    or curStep >= 848 and curStep < 896 or curStep >= 1536 and curStep < 1856 or curStep >= 1872 and curStep < 2016 then
        if curStep % 4 == 0 then
            setShaderProperty('mirror2', 'zoom', 0.9)
		    tweenShaderProperty('mirror2',"zoom",1, crochet*0.001*1,"cubeOut")
        end 
	end
    if curStep == 896 then
        for i = 0,(keyCount*2)-1 do
            targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 320*downscroll
            noteAngle[i+1] = -360
        end
    elseif curStep == 912 then
        if difficulty == "VOIID" then
            for i = 0,(keyCount*2)-1 do
                if not middlescroll then
                    if (i >= 0 and i <= 8) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -740
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        else
            for i = 0,7 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -740
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] -320
                    end
                end
            end
        end
    elseif curStep == 936 then
        lerpSpeedY = 4.5
        if difficulty == "VOIID" then
            for i = 13,13 do
                targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
            end
        else
            for i = 4,7 do
                targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
            end
        end

    elseif curStep == 944 then
        bf = true
    elseif curStep == 960 then
        bf = false
        lerpSpeedY = 1.5
        if difficulty == "VOIID" then
            for i = 13,13 do
                targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 720*downscroll
            end
        end
        if difficulty == "4K" then
            for i = 4,7 do
                    targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] - 720*downscroll
                end
            
        end
        
    elseif curStep == 976 then
        if difficulty == "VOIID" then
            for i = 0,(keyCount*2)-1 do
                if not middlescroll then
                    if (i >= 0 and i <= 8) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
                    elseif (i >= 9 and i <= 17) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +740
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
                    end
                end
            end
        end
        if difficulty == "4K" then
            for i = 0,7 do
                if not middlescroll then
                    if (i >= 0 and i <= 3) then
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
                    elseif (i >= 4 and i <= 7) then
                        targetnoteXPos[i+1] = _G['defaultStrum'..i..'X'] +740
                        targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y'] 
                    end
                end
            end
        end
    end

    if curStep >= 1 and curStep < 112 or  curStep >= 128 and curStep < 704 or curStep >= 720 and curStep < 768
    or curStep >= 784 and curStep < 832 or curStep >= 848 and curStep < 880 or curStep >= 1032 and curStep < 1216
    or curStep >= 1232 and curStep < 1504 then
        if curStep % 32 == 8 then
            noteScale = noteScale + 0.4
			for i = 0, (keyCount*2)-1 do 
                noteZPos[i+1] = targetnoteZPos[i+1] - 120
                if i % 2 == 0 then
                    noteAngle[i+1] = -40-- -40
                else 
                    noteAngle[i+1] = 40-- 40
                end
            end
        
        elseif curStep % 32 == 24 then
            noteScale = noteScale + 0.4
            for i = 0, (keyCount*2)-1 do 
                noteZPos[i+1] = targetnoteZPos[i+1] + 120
                if i % 2 == 0 then
                    noteAngle[i+1] = 40-- -40
                else 
                    noteAngle[i+1] = -40-- 40
                end
            end
            
		end
	end
    if curStep >= 1536 and curStep < 1856 or curStep >= 1872 and curStep < 2016 then
        if curStep % 16 == 4 then
            noteScale = noteScale + 0.5
        elseif curStep % 16 == 12 then
            noteScale = noteScale + 0.5
        end 
	end
    if curStep >= 1536 and curStep < 1665 or curStep >= 1792 and curStep < 2016 then
        if curStep % 64 == 0 then
            colorlolxd(1.5,3.5,1)--verde
        elseif curStep % 64 == 16 then
            colorlolxd(2.8,2.2,1)--naranja
        elseif curStep % 64 == 32 then
            colorlolxd(1,2.5,3)--azul
        elseif curStep % 64 == 48 then
            colorlolxd(1.5,2,3)--morado
        end 
	end
    if curStep >= 0 and curStep < 128 then
        if curStep % 64 == 0 then
            bumps(0.85,stepCrochet,3.5)
        elseif curStep % 64 == 4 then
            bumps(0.85,stepCrochet,3.5)
        elseif curStep % 64 == 20 then
            bumps(0.85,stepCrochet,4)
        elseif curStep % 64 == 32 then
            bumps(0.85,stepCrochet,4)
        elseif curStep % 64 == 52 then
            bumps(0.85,stepCrochet,4)
        end 
	end

    if curStep >= 128 and curStep < 640 or curStep >= 1024 and curStep < 1504 then
        if curStep % 64 == 0 then
            bumps(0.9,stepCrochet,4)
        elseif curStep % 64 == 10 then
            bumps(0.9,stepCrochet,3.5)
        elseif curStep % 64 == 14 then
            bumps(0.9,stepCrochet,1.5)
        elseif curStep % 64 == 16 then
            bumps(0.9,stepCrochet,4)
        elseif curStep % 64 == 26 then
            bumps(0.9,stepCrochet,4)
        elseif curStep % 64 == 32 then
            bumps(0.9,stepCrochet,1.5)
        elseif curStep % 64 == 35 then
            bumps(0.9,stepCrochet,4)
        elseif curStep % 64 == 43 then
            bumps(0.9,stepCrochet,1.5)
        elseif curStep % 64 == 46 then
            bumps(0.9,stepCrochet,1.5)
        elseif curStep % 64 == 48 then
            bumps(0.9,stepCrochet,4)
        elseif curStep % 64 == 54 then
            bumps(0.9,stepCrochet,3.5)
        elseif curStep % 64 == 58 then
            bumps(0.9,stepCrochet,3.5)
        elseif curStep % 64 == 62 then
            bumps(0.9,stepCrochet,1.5)
        end 
	end

    if curStep == 1728 then
        colorlolxd(1.5,3.5,1)
    elseif curStep == 1848 or curStep == 1864 or curStep == 1880 or curStep == 1896 then
        beatSwap = beatSwap* -1
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",-360*beatSwap,0,4,crochet,"cubeInOut")
    elseif curStep == 1856 or curStep == 1872 or curStep == 1888 then--default
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1904 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1912 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-30,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == 1912+6 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,30,0.5,crochet,"cubeIn")
    elseif curStep == 1912+8 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 2008 then
        triggerEvent('toggle checker bg','0',crochet*0.001*2)
        mirror(false,true,"","zoom",0,5,10,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",2160,0,10,crochet,"cubeInOut")
    elseif curStep == 2016 then
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
        setActorAlpha(0, 'speed')
    elseif curStep == 2048 then
        mirror(false,true,"","zoom",0,1,2,crochet,"expoIn")
    elseif curStep == 2056 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        bloom(8,1,crochet,2,"cubeOut")
        colorlolxd(1.5,3.5,1)
        triggerEvent('screen shake', (crochet*0.001*24)..',0.015', (crochet*0.001*64)..',0')
        triggerEvent('toggle checker bg','0.1',crochet*0.001*1)
    elseif curStep == 2064 then
        mirror(false,true,"","zoom",0,10,18,crochet,"cubeIn")
        mirror(false,true,"","angle",0,90,18,crochet,"cubeIn")
        bloom(1,0,crochet,16,"cubeIn")
    end
    if curStep == 1504 then
        bf = true
    elseif curStep == 1520 then
        bf = false
    end
    if curStep == 1216 or curStep == 1504 or curStep == 1856 then
        setShaderProperty('greyscale', 'strength', 1)
    elseif curStep == 1232 or curStep == 1536 or curStep == 1872 then
        setShaderProperty('greyscale', 'strength', 0)
    end
    zoomyangles(1320,-360)
    zoomyangles(1384,360)
    --dropfinal
    otrozoomyangle(1592,-360)
    otrozoomyangle(1608,360)
    otrozoomyangle(1624,-360)
    otrozoomyangle(1640,360)
    otrozoomyangle(1656,-360)
    otrozoomyangle(1720,360)
    otrozoomyangle(1976,360)

    finaldevueltaslocas(1664)
    finaldevueltaslocasbf(1728)
end
function flechasxdddd(s,q,n)
	lerpSpeedY = 3
	lerpSpeedAngle = 5

	
		for i = s,q do
			noteYPos[i+1] = targetnoteYPos[i+1] -70*downscroll
			noteAngle[i+1] = n
		end
end
function finaldevueltaslocasbf(s)--1664
    if curStep == s+16 then
        colorlolxd(2.8,2.2,1)
    elseif curStep == s+28 then
        colorlolxd(1,2.5,3)--azul
    elseif curStep == s+38 or curStep == s+56 then
        colorlolxd(1.5,2,3)--morado
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+44 then--1708 verde
        colorlolxd(1.5,3.5,1)
        bloom(5,1,crochet,1,"cubeOut")
    elseif curStep == s+48 then-- naranja
        colorlolxd(2.8,2.2,1)
        bloom(6,1,crochet,1,"cubeOut")
    elseif curStep == s+52 then--azul
        colorlolxd(1,2.5,3)
        bloom(8,1,crochet,1,"cubeOut")
    end
    if curStep == s+8 then--1672
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
    elseif curStep == s+16 or curStep == s+28 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == s+20 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == s+24 then
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeInOut")
    elseif curStep == s+32 then--1696
        mirror(false,true,"","zoom",0,10,5.5,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",360,0,1.5,crochet,"cubeInOut")
    end
    if curStep == s+38 then
        mirror(true,true,"angle","angle",360,0,1.5,crochet,"cubeInOut")
    elseif curStep == s+44 or curStep == s+48 or curStep == s+52 then
        mirror(true,true,"angle","angle",360,0,1,crochet,"cubeInOut")
    end
end
function finaldevueltaslocas(s)--1664
    if curStep == s+16 then
        colorlolxd(2.8,2.2,1)
    elseif curStep == s+28 then
        colorlolxd(1,2.5,3)--azul
    elseif curStep == s+38 or curStep == s+56 then
        colorlolxd(1.5,2,3)--morado
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+44 then--1708 verde
        colorlolxd(1.5,3.5,1)
        bloom(5,1,crochet,1,"cubeOut")
    elseif curStep == s+48 then-- naranja
        colorlolxd(2.8,2.2,1)
        bloom(6,1,crochet,1,"cubeOut")
    elseif curStep == s+52 then--azul
        colorlolxd(1,2.5,3)
        bloom(8,1,crochet,1,"cubeOut")
    end
    if curStep == s+8 then--1672
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
    elseif curStep == s+16 or curStep == s+28 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == s+20 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == s+24 then
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeInOut")
    elseif curStep == s+32 then--1696
        mirror(false,true,"","zoom",0,10,6,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,1.5,crochet,"cubeInOut")
    end
    if curStep == s+38 then
        mirror(true,true,"angle","angle",-360,0,1.5,crochet,"cubeInOut")
    elseif curStep == s+44 or curStep == s+48 or curStep == s+52 then
        mirror(true,true,"angle","angle",-360,0,1,crochet,"cubeInOut")
    end
end
function zoomyangles(s,angle)
    if curStep == s then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
    elseif curStep == s+4 then
        mirror(true,true,"angle","angle",angle,0,2,crochet,"cubeInOut")
    elseif curStep == s+8 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
end
function otrozoomyangle(s,angle)
    if curStep == s then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",angle,0,4,crochet,"cubeInOut")
    elseif curStep == s+8 then--default
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
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