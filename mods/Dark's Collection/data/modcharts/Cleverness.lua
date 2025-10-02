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
   set("camHUD.alpha",0)
    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader("game","vcrchroma")
    setShaderProperty('vcrchroma', 'strength', 1)
    setShaderProperty('vcrchroma', 'speed', 1.2)

    
    

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle',0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)


    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    setShaderProperty('bars', 'effect2', 0.0)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.2)

    
    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 10)

    
    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',1)-- 0.45 es rojo 0.7 amarillo 0.95
    setShaderProperty('titleeffect', 'colorraro',0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 100)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
    setShaderProperty('bloom', 'brightness',-0.2)

end
local time = 0
local zoom = 1
local blur = 0
local chroma = 0
local cam = true
local matt = false
local bf = false
local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 3 
local perlinXRange = 0.07
local perlinYRange = 0.07
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat("vcrchroma","iTime",time)
    zoom, blur,chroma = lerp(zoom, 1, elapsed * 8), lerp(blur, 0, elapsed * 8), lerp(chroma, 0, elapsed * 8)
        setShaderProperty('bump', 'zoom', zoom)
        setShaderProperty('ca', 'strength', chroma)
        setShaderProperty('zoomblurgame', 'focusPower', blur)
        perlinX = perlinX + elapsed*math.random()*perlinSpeed
        perlinY = perlinY + elapsed*math.random()*perlinSpeed
       
        setShaderProperty('mirror', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
        setShaderProperty('mirror', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
     if cam then

	set("camFollow.x",400)
    set("camFollow.y",400)
    end
    if matt then
        set("camFollow.x", get("dad.x")+200)
        set("camFollow.y", get("dad.y")+200)
        set("defaultCamZoom", 0.9)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+200)
        set("camFollow.y", get("boyfriend.y")+200)
        set("defaultCamZoom", 0.9)
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
function songStart()
    tweenShaderProperty("pixel","strength",0,crochet*0.001*40,"cubeOut")
    tweenShaderProperty("bars","effect",0.1,crochet*0.001*56,"cubeOut")
    tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*64,"cubeOut")
    tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*128,"cubeOut")
end
local lol = true
function stepHit()
    if curStep == 768 or curStep == 2048 then
        setProperty('', 'cameraSpeed', 7)
    end
    if curStep > 760 and curStep <= 896 or curStep > 1024-8 and curStep <= 1152 or curStep > 2048-8 and curStep <= 2176
    or curStep > 2304-8 and curStep <= 2432 then
        if curStep % 128 == 0 or curStep % 128 == 16 or curStep % 128 == 32 or curStep % 128 == 72 or curStep % 128 == 88 then
            matt = true
            bf = false
        elseif curStep % 128 == 8 or curStep % 128 == 24 or curStep % 128 == 64 or curStep % 128 == 80 or curStep % 128 == 96 then
            matt = false
            bf = true
        end

    end

    if curStep == 896 or curStep == 2176 then
       matt = true
       bf = false
    elseif curStep == 960 or curStep == 1152 or curStep == 2240 or curStep == 2432 or curStep == 2496 then
        matt = false
        bf = true
    end
    if curStep == 112 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 128 or curStep == 2688 or curStep == 2928 then
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 240 then
        mirror(false,true,"","barrel",0,10,4,crochet,"cubeIn")
        tweenShaderProperty("bloom","brightness",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 256 then
        bloom(4,1,crochet,4,"cubeOut")
        mirror(true,true,"barrel","barrel",-10,0,8,crochet,"cubeOut")
        tween("camHUD",{alpha = 1},crochet*0.001*8,"cubeOut")

    end
    if curStep == 480 or curStep == 736 or curStep == 880 or curStep == 1008 
    or curStep == 1136 or curStep == 1776 or curStep == 2016 or curStep == 2160
    or curStep == 2288 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 504 or curStep == 1784 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
    elseif curStep == 508 or curStep == 1788 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 512 or curStep == 1024 or curStep == 1536 or curStep == 1792 or curStep == 2304 then
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*4,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("mirror2","barrel",-10)
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*8,"cubeOut")
    elseif curStep == 640 or curStep == 1920 or curStep == 2432 then
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 752 or curStep == 2032 then
        tweenShaderProperty("mirror2","barrel",10,crochet*0.001*4,"cubeIn")
    elseif curStep == 760 or curStep == 2040 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
    elseif curStep == 764 or curStep == 2044 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
    elseif curStep == 768 or curStep == 2048 then
        lascosasdelhud(0,stepCrochet,8,"cubeOut")
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("mirror2","barrel",-10)
        tweenShaderProperty("mirror2","barrel",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 896 or curStep == 1152 or curStep == 2176 then
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 1016 or curStep == 2296 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        
    elseif curStep == 1020 or curStep == 2300 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 1264 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,6,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.6,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("pixel","strength",100,crochet*0.001*4,"cubeIn")
    elseif curStep == 1272 or curStep == 2552 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
       
    elseif curStep == 1280 or curStep == 2560 then
         bf = false
         matt = false
         cam = true
        setProperty('', 'cameraSpeed', 1)
        set("defaultCamZoom", 0.55)
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*32,"linear")
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        
    end
    if curStep == 1280 then
        tween("camHUD",{alpha = 0},crochet*0.001*8,"cubeOut")
    end
    if curStep == 2544 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,6,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 2560 then
        tweenShaderProperty("titleeffect","money",0.95,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    end
    if curStep == 1360 then
        tweenShaderProperty("pixel","strength",0,crochet*0.001*16,"cubeOut")
    elseif curStep == 1408 then
        bloom(4,1,crochet,4,"cubeOut")
        tweenShaderProperty("titleeffect","money",0.85,crochet*0.001*36,"linear")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*36,"linear")
    elseif curStep == 1528 then
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        
    elseif curStep == 1532 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 1536 then
        tween("camHUD",{alpha = 1},crochet*0.001*8,"cubeOut")
        lascosasdelhud(1,stepCrochet,16,"cubeOut")
    elseif curStep == 2308 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeOut")
    elseif curStep == 2352 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*4,"cubeIn")
    elseif curStep == 2360 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"backIn")
    elseif curStep == 2364 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 2368  or curStep == 2816 then
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*4,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 2800 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,6,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 2808 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 3008 then
        tweenShaderProperty("pixel","strength",100,crochet*0.001*16,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*16,"cubeIn")
        tweenShaderProperty("bars","effect",0.6,crochet*0.001*16,"cubeIn")
    end
    if curStep == 2816 then
        tween("camHUD",{alpha = 0},crochet*0.001*8,"cubeOut")
    end
    if curStep > 256 and curStep <= 752 or curStep > 768 and curStep <= 1280 or curStep > 1536 and curStep <= 2032 
    or curStep > 2048 and curStep <= 2880 then
        if curStep % 128 == 0 or curStep % 128 == 24 or curStep % 128 == 36 
        or curStep % 128 == 40 or curStep % 128 == 56 or curStep % 128 == 64
        or curStep % 128 == 76 or curStep % 128 == 88 or curStep % 128 == 100 
        or curStep % 128 == 104 or curStep % 128 == 120 or curStep % 128 == 124 then
           zoom,blur,chroma = 0.8,15,0.05
        elseif curStep % 128 == 16 or curStep % 128 == 48 or curStep % 128 == 80
        or curStep % 128 == 112 then
            zoom,blur,chroma = 1.3,15,0.05
        end

    end
end