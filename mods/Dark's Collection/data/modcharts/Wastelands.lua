
function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end

function createPost()
   
    makeText('HANK!!!', 'HANK!!!', 350,250,600)
    setActorFont("HANK!!!", "tricky.ttf")
    setActorScroll(0,0,'HANK!!!')
	actorScreenCenter("HANK!!!")
	setObjectCamera('HANK!!!', 'game')
    setActorAlpha(0, "HANK!!!")
	set("HANK!!!.angle",-10)
    lascosasdelhud(0,stepCrochet,1,"cubeOut")
    initShader('particles', 'particlesnew')
    setCameraShader('game', 'particles')  
    setShaderProperty('particles', 'transparency', 0.84)
    setShaderProperty('particles', 'red', 0)
    setShaderProperty('particles', 'blue', 1.5)
    setShaderProperty('particles', 'green', 0.5)

    initShader("rayos","godrays")
    setCameraShader('game', 'rayos')
    setShaderProperty('rayos', 'decay', 0.8)
    setShaderProperty('rayos', 'density',0.15)
    setShaderProperty('rayos', 'weigth', 0.6)

  
    initShader('bump', 'BarrelBlurEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'angle',0)
	setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)
	setShaderProperty('bump', 'barrel', 0)
    setShaderProperty('bump', 'doChroma', false)

    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 0)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 4)
    setShaderProperty('mirror', 'angle',180)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', false)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)

    
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.3)


    initShader('bars2', 'bars')--
    setCameraShader('game', 'bars2')
    setShaderProperty('bars2', 'effect', 0)
    
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red',1)
    setShaderProperty('color', 'green', 1.2)
    setShaderProperty('color', 'blue', 1.6)

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)
    
    --setShaderProperty('titleeffect', 'colorraro',0.4)-- 1.1 es disco

    initShader('color2', 'ColorOverrideEffect')
    setCameraShader('hud', 'color2')
    setCameraShader('game', 'color2')
    setShaderProperty('color2', 'red',1.25)
    setShaderProperty('color2', 'green', 1.25)
    setShaderProperty('color2', 'blue', 1.25)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('caBlue', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'caBlue')
    setCameraShader('hud', 'caBlue')
    setShaderProperty('caBlue', 'strength', 0.001)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)

    initShader('bloom2', 'BloomEffect')--
    setCameraShader('game', 'bloom2')
    setShaderProperty('bloom2', 'contrast', 1)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.7)
    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 0)
    setShaderProperty('vcrchroma', 'speed', 1.2)

    
   -- set("camHUD.alpha", 0.0)

    
    set("dad.alpha", 0.0)
    set("dad.x", getActorX("dad")-200)
end
local time = 0
local zoom = 1
local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 1.15 
local perlinXRange = 0.07
local perlinYRange = 0.07
local cam = true
local tricky = false
local bf = false

local rotCam = false
local rotCamSpd = 3
local rotCamRange = 5
local rotCamInd = 0


local barrel = 0
local bloomx = 1
function update(elapsed)
    if cam then
        set("camFollow.x",-50)
        set("camFollow.y",-600)
    end
    if tricky then
        set("camFollow.x", get("dad.x")+500)
        set("camFollow.y", get("dad.y")+450)
        set("defaultCamZoom", 0.6)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+150)
        set("defaultCamZoom", 0.7)
    end
    time = time + elapsed
    setCustomShaderFloat("rayos","iTime",time*1.2)
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("vcrchroma","iTime",time)
    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
   
    barrel = lerp(barrel, 0, elapsed*8)
    setShaderProperty('bump', 'barrel', barrel)
    bloomx = lerp(bloomx, 1, elapsed*8)
    setShaderProperty('bloom2', 'contrast', bloomx)
   
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
   
    setShaderProperty('mirror2', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('mirror2', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 120))
        setShaderProperty('mirror2', 'angle', math.sin(rotCamInd / 100 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('mirror2', 'angle', 0)
    end
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

function songStart()
    mirror(false,true,"","zoom",0,1,128,stepCrochet,"cubeOut")
    bloom(0,1,crochet,32,"cubeOut")
    mirror(false,true,"","angle",0,0,128,stepCrochet,"cubeOut")
end

locura = {336,368,1232,1264}
function stepHit()
    if curStep >= 128 and curStep < 480 or curStep >= 1024 and curStep < 1376  then
        if curStep % 32 == 0 or curStep % 32 == 3 or curStep % 32 == 6 or curStep % 32 == 16
        or curStep % 32 == 19 or curStep % 32 == 22 or curStep % 32 == 30 then
            zoom = 0.85
        end
    elseif (curStep >= 480 and curStep < 496 or curStep >= 1376 and curStep < 1392) and curStep % 4 == 0 then
        zoom = 0.85
    elseif (curStep >= 496 and curStep < 505 or curStep >= 1392 and curStep < 1400) and curStep % 2 == 0 then
        zoom = 0.85
    elseif curStep == 505 or curStep == 506 or curStep == 510
    or curStep == 1401 or curStep == 1404 or curStep == 1406 then
        zoom = 0.85
    elseif curStep >= 512 and curStep < 640 or curStep >= 1408 and curStep < 1536  then 
        if curStep % 32 == 0 then
            bloom(4, 1, crochet, 2, "cubeOut")
        end
        if curStep % 32 == 0 or curStep % 32 == 6 or curStep % 32 == 10 or curStep % 32 == 13
        or curStep % 32 == 16 or curStep % 32 == 22 or curStep % 32 == 26 or curStep % 32 == 29
        or curStep % 32 == 30 then
            zoom = 0.85
        end
    end
    
    if curStep == 64 then
    
        tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*12,"linear")
    elseif curStep == 118 then
       tween("dad", {x = getActorX("dad") + 200, alpha = 1}, crochet * 0.001 * 1.5,"cubeInOut")
    elseif curStep == 120 or curStep == 128 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale',"strength",0, crochet*0.001*1,"cubeOut")
    elseif curStep == 124 then
        tweenShaderProperty('greyscale',"strength",1, crochet*0.001*1,"cubeIn")
    end
    if curStep == 128 or curStep == 1024 then
        lascosasdelhud(1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror2',"barrel",0, crochet*0.001*2,"cubeOut")
    elseif curStep == 240 or curStep == 1136 then
        tweenShaderProperty('greyscale',"strength",1, crochet*0.001*2,"cubeOut")
    elseif curStep == 248 or curStep == 1144 then
        tricky = true
        setProperty('', 'cameraSpeed', 5)
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty('greyscale',"strength",0, crochet*0.001*2,"cubeIn")
        tweenShaderProperty('ca',"strength",0.007, crochet*0.001*1,"cubeOut")
        tweenShaderProperty('EyeFishEffectGame',"power",0.2, crochet*0.001*1,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*2)..',0.05')
       -- triggerEvent('screen shake', (crochet*0.001*2)..',0.05', (crochet*0.001*2)..',0.05')
        setActorAlpha(1, "HANK!!!")
    elseif curStep == 252 or curStep == 1148 then
        tweenShaderProperty('ca',"strength",0, crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,0,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*1,"expoIn")
    elseif curStep == 256 or curStep == 1152 then
        tricky = false
        setActorAlpha(0, "HANK!!!")
        setProperty('', 'cameraSpeed', 1)
        bloom(8,1,crochet,2,"cubeOut")
        set("defaultCamZoom", 0.35)
       -- lascosasdelhud(1,crochet,2,"cubeOut")
        tweenShaderProperty('bars2',"effect",0.1, crochet*0.001*4,"cubeOut")
    end
    if curStep == 192 or curStep == 320 or curStep == 416 or curStep == 448
    or curStep == 1016 or curStep == 1024 or curStep == 1088 or curStep == 1216 
    or curStep == 1312 or curStep == 1344  then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 384 or curStep == 1280 then
        setShaderProperty('vcrchroma', 'strength', 1)
        set("defaultCamZoom", 0.5)
        rotCam = true
    elseif curStep == 480 or curStep == 1376 then
        
        tweenShaderProperty('bars2',"effect",0, crochet*0.001*8,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,3,8,crochet,"expoIn")
        tweenShaderProperty('bars',"effect",0.35, crochet*0.001*8,"expoIn")
        tweenShaderProperty('EyeFishEffectGame',"power",0.2, crochet*0.001*8,"expoIn")
    elseif curStep == 504 or curStep == 1400 then
        tweenShaderProperty('pixel',"strength",50, crochet*0.001*2,"cubeIn")
        tweenShaderProperty('greyscale',"strength",0.5, crochet*0.001*2,"cubeIn")
        tweenShaderProperty('mirror2',"barrel",-1, crochet*0.001*2,"cubeIn")
    elseif curStep == 512 or curStep == 1408 then
        perlinXRange = 0
        perlinYRange = 0
        set("defaultCamZoom", 0.35)
        rotCam = false
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('pixel',"strength",0, crochet*0.001*2,"cubeOut")
        setShaderProperty('color', 'red',1)
        setShaderProperty('color', 'green', 1)
        setShaderProperty('color', 'blue', 1)
        setShaderProperty('vcrchroma', 'strength', 0)
        lascosasdelhud(0,crochet,2,"cubeOut")
    elseif curStep == 624 or curStep == 1520 then
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeIn")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('vignette',"strength",0, crochet*0.001*3.5,"cubeIn")
        tweenShaderProperty('mirror2',"barrel",-5, crochet*0.001*4,"cubeIn")
        tweenShaderProperty('greyscale',"strength",0, crochet*0.001*4,"cubeIn")
    elseif curStep == 632 or curStep == 1528 then
        tweenShaderProperty('bars',"effect",0, crochet*0.001*2,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame',"power",0.2, crochet*0.001*2,"cubeIn")
    elseif curStep == 640 or curStep == 1536 then
        
        tweenShaderProperty('bars2',"effect",0.1, crochet*0.001*2,"cubeOut")
        bloom(10,1,crochet,2,"cubeOut")
        perlinXRange = 0.07
        perlinYRange = 0.07
        tweenShaderProperty('vignette',"size",0.1, crochet*0.001*1,"cubeOut")
        tweenShaderProperty('vignette',"strength",15, crochet*0.001*1,"cubeOut")
        tweenShaderProperty('mirror2',"barrel",0, crochet*0.001*2,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.8)
        cam = false
        setProperty('', 'cameraSpeed', 8)
    elseif curStep == 760 or curStep == 1656 then
        setShaderProperty('pixel', 'strength',50)
        tweenShaderProperty('pixel',"strength",0, crochet*0.001*2,"cubeOut")
        tricky = true
        bf = false
    elseif curStep == 768 or curStep == 1664 then
        bloom(10,1,crochet,2,"cubeOut")
    elseif curStep == 880 or curStep == 1776 then
        tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*4,"cubeIn")
        tweenShaderProperty('pixel',"strength",50, crochet*0.001*4,"cubeIn")
        tweenShaderProperty('greyscale',"strength",1, crochet*0.001*4,"cubeIn")
        tweenShaderProperty('titleeffect',"money",1, crochet*0.001*4,"cubeIn")
        tweenShaderProperty('vignette',"size",0.7, crochet*0.001*4,"cubeIn")
    elseif curStep == 888 or curStep == 892 or curStep == 1784 or curStep == 1788 then
        setShaderProperty("bloom","contrast",0)
    elseif curStep == 890 or curStep == 894 or curStep == 1786 or curStep == 1790 then
        setShaderProperty("bloom","contrast",1)
    elseif curStep == 896 or curStep == 1792 then
      
        cam = true
        tricky = false
        bf = false
        setProperty('', 'cameraSpeed', 0.5)
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('bars2',"effect",0, crochet*0.001*8,"cubeOut")
        tweenShaderProperty('pixel',"strength",0, crochet*0.001*2,"cubeOut")
        mirror(true,true,"zoom","zoom",0.3,1,32,crochet,"linear")
        set("defaultCamZoom", 0.35)
     --   tween("camHUD",{alpha = 0},crochet*0.001*2)
    
    end
    if curStep == 896 then
       -- flashCamera("hud","white",1)
        tweenShaderProperty('color',"green",1.2, crochet*0.001*32,"cubeIn")
        tweenShaderProperty('color',"blue",1.6, crochet*0.001*32,"cubeIn")
        tweenShaderProperty('greyscale',"strength",0, crochet*0.001*32,"cubeIn") 
        
    elseif curStep == 992 then
        tweenShaderProperty('mirror2',"barrel",-2, crochet*0.001*8,"cubeIn")
    elseif curStep == 1872+16 then
        bloom(1,0,crochet,8,"cubeIn")
        tweenShaderProperty('mirror',"zoom",3, crochet*0.001*8,"cubeIn")
        tweenShaderProperty('pixel',"strength",50, crochet*0.001*8,"cubeIn")
    elseif curStep == 624 or curStep == 1520 then
        cam = true
        bf = false
        setProperty('', 'cameraSpeed', 1)
        tricky = false

    end
    if curStep >= 608 and curStep < 624 or curStep >= 1504 and curStep < 1520 then
        if curStep % 8 == 0 then
            setProperty('', 'cameraSpeed', 5)
            tricky = false
            bf = true
        elseif curStep % 8 == 4 then
            tricky = true
            bf = false
        end
    end
    if curStep >= 640 and curStep < 888 or curStep >= 1536 and curStep < 1784 then
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 8 or curStep % 16 == 11
        or curStep % 16 == 14  then
            zoom = 0.85
            barrel = -2
            bloomx = 4
        end
        if curStep % 64 == 0 then
            tricky = true
            bf = false
        elseif curStep % 64 == 32 then
            tricky = false
            bf = true
        end
    end
    
    for i = 1, #locura do
        if curStep == locura [i]-4 then
            
            mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
            mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeOut")
        elseif curStep == locura [i]-2 then
            mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,20,0.5,crochet,"cubeIn")
            tweenShaderProperty('EyeFishEffectGame',"power",0.2, crochet*0.001*0.5,"cubeIn")
        elseif curStep == locura [i] then
            tweenShaderProperty('greyscale', 'strength',1, crochet*0.001*1, 'cubeOut')
            mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
            bloom(4,1,crochet,2,"cubeOut")
        elseif curStep == locura [i]+2 then
            mirror(false,true,"","angle",0,-20,0.5,crochet,"cubeIn")
        elseif curStep == locura [i]+4 then
            mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
        elseif curStep == locura [i]+6 then
            mirror(false,true,"","angle",0,20,0.5,crochet,"cubeIn")
        elseif curStep == locura [i]+8 then
            mirror(false,true,"","zoom",0,1.1,1,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,0.5,crochet,"cubeOut")
        elseif curStep == locura [i]+10 then
            mirror(true,true,"angle","angle",360,0,1,crochet,"cubeInOut")
        elseif curStep == locura [i]+12 then
            mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
            tweenShaderProperty('EyeFishEffectGame',"power",0, crochet*0.001*1,"cubeIn")
            tweenShaderProperty('greyscale',"strength",0, crochet*0.001*1,"cubeIn")
        elseif curStep == locura [i]+14 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        elseif curStep == locura [i]+16 then
            bloom(4,1,crochet,2,"cubeOut")
        end
    end
end
function playerTwoSingHeld()
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.001)
    end
    
end