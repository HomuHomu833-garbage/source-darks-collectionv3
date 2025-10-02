
function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
local time = 0
local downscroll = 1
local noteAngle = {}  
local noteXPos = {} 

local defaultXPos = 0
local defaultAngle = 0  
local defaultAngle = 0  
local lerpSpeed = 5 -- speed
local originalNoteXPos = {}
local originalNoteYPos = {}
function createPost()
    set("dad.x",-250)
    set("dad.y",250)
    for i = 0, (keyCount * 2) - 1 do
        table.insert(noteAngle, defaultAngle)
        originalNoteXPos[i + 1] = _G['defaultStrum'..i..'X']
        noteXPos[i + 1] = originalNoteXPos[i + 1]


        set(i..".angle", noteAngle[i + 1])
        set(i..".x", noteXPos[i + 1])
  
    end
  
    lascosasdelhud(0,crochet,1,"cubeOut")
    
    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.5)
    setShaderProperty('godrays', 'density',0.5)
    setShaderProperty('godrays', 'weigth', 0.68)
    initShader("particles","particlesnew")
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.9)
    setShaderProperty('particles', 'red', 5)
    setShaderProperty('particles', 'blue', 1)
    setShaderProperty('particles', 'green', 3)
    startSpeed = getProperty('', 'speed')
    makeSprite('blackBG', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('blackBG', 1920/defaultZoom, 1080/defaultZoom, '#000000')
	actorScreenCenter('blackBG')
	setActorScroll(0,0, 'blackBG')
	setActorAlpha(0, 'blackBG')
    local lol = getActorLayer('girlfriend')
	setActorLayer('blackBG', lol)

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.0001, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',1)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)





    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)



    initShader('pixel', 'MosaicEffect')
    setCameraShader('game', 'pixel')
    setShaderProperty('pixel', 'strength', 0)

    initShader('glitch3', 'glitchChromatic3')
    setCameraShader('game', 'glitch3')
    setShaderProperty('glitch3', 'GLITCH', 0)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'zoom', 1)


    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.75)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 1)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('EyeFishEffectGame2', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame2')
    setShaderProperty('EyeFishEffectGame2', 'power', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)

       
    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('mirror3', 'PincushNewEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)

    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.35)
    setShaderProperty('color', 'green',1.35)
    setShaderProperty('color', 'blue',1.35)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)


    initShader('heat', 'HeatEffect')
    setCameraShader('hud', 'heat')
    setCameraShader('game', 'heat')
    setShaderProperty('heat', 'strength', 1)

        
    initShader('saturation', 'saturation')
    setCameraShader('game', 'saturation')
    setShaderProperty('saturation', 'AAA', 5)
    setShaderProperty('saturation', 'BBB', 5)

    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 4)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.002)

    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.1)

    initShader('bloom', 'BloomEffect')--
   -- setCameraShader('hud', 'bloom')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)

    initShader('bloom2', 'BloomEffect')--
   -- setCameraShader('hud', 'bloom2')
    setCameraShader('game', 'bloom2')
    setShaderProperty('bloom2', 'strength',10)
    setShaderProperty('bloom2', 'brightness',0)
    setShaderProperty('bloom2', 'contrast', 1)
    if downscrollBool then
        downscroll = -1
    end
    for i = 0, 7 do
        local yPos
        if i < 4 then
            yPos = 720 + (i * 200)
        else
            yPos = 720 + ((i - 4) * 200)
        end
        set(i..".y",yPos*downscroll)
    end

end
function flechas(lol, angulo, lolx, valorx)
    for i = 0, (keyCount * 2) - 1 do
        if lol then
            noteAngle[i + 1] = angulo
        end
        if lolx then
            noteXPos[i + 1] = originalNoteXPos[i + 1] + valorx  
        end
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


local cam = true
local lol = true
local matt = false
local bf = false
local zoom = 1
local Y = false
local bloomlol = true
local y = 0
local blooms = 1
local previousZoom = zoom
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat("godrays","iTime",time)
    setCustomShaderFloat("chess","iTime",time/2)
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("heat","iTime",time)


    setCustomShaderFloat("glitch3","iTime",time/4)
    for i = 0, (keyCount * 2) - 1 do
        noteAngle[i + 1] = lerp(noteAngle[i + 1], defaultAngle, elapsed * lerpSpeed)
        noteXPos[i + 1] = lerp(noteXPos[i + 1], originalNoteXPos[i + 1], elapsed * lerpSpeed)
        set(i..".angle", noteAngle[i + 1])
        set(i..".x", noteXPos[i + 1])
    end


    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
    if math.abs(zoom - previousZoom) > 0.01 then
        triggerEvent('screen shake', (stepCrochet*0.001*2)..',0.005')
    end
    previousZoom = zoom

    
    if Y then
    y = lerp(y, 0, elapsed*8)
    setShaderProperty('mirror', 'y', y)
    end
    if bloomlol then
        blooms = lerp(blooms, 1, elapsed*8)
        setShaderProperty('bloom2', 'contrast', blooms)
    end
    if matt then
        set("camFollow.x", get("dad.x")+450)
        set("camFollow.y", get("dad.y")+450)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+250)
        set("camFollow.y", get("boyfriend.y")+200)
    end
    if cam then
        set("camFollow.x",600)
        set("camFollow.y",700)
    end
end
function startSong()
    bloom(0,1,crochet,32,"linear")
    mirror(false,true,"","zoom",0,1,28,crochet,"cubeOut")
    tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*28,"cubeOut")
    for i = 0, 7 do
        tween("defaultStrum"..i, {y = defaultStrum0Y}, crochet * 0.001 * 28, 'cubeOut')
    end

end
local swap = 1
function stepHit()
    if curStep == 768 or curStep == 1536 then
        for i = 0, 7 do
            flechas(true,360)
            local yPos
            if i < 4 then
                yPos = 720 + (i * 200)
            else
                yPos = 720 + ((i - 4) * 200)
            end
            tween("defaultStrum"..i, {y = yPos, alpha = 0 }, crochet * 0.001 * 4, 'cubeOut')
        end
    
    end
    if curStep == 112 or curStep == 880 then
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeIn")
        tweenShaderProperty("mirror3","angle",-20,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("bars","effect",0.45,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",5,crochet*0.001*4,"cubeIn")

       -- removeCameraShader("game","saturation",crochet*0.001*4,"cubeIn")
    elseif curStep == 128 or curStep == 896 then
        lascosasdelhud(1,crochet,4,"cubeOut")
        setShaderProperty("greyscale","strength",0)
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*2,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("mirror3","angle",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        set("defaultCamZoom", 0.5)
    elseif curStep == 160 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 312 or curStep == 1080 then
       lol = false
    elseif curStep == 327 or curStep == 344 or curStep == 350 then
        zoom = 0.8
        swap = swap*-1
        flechas(true,25*swap,true,-50*swap)
    end
    if curStep  == 784 then
        for i = 0, 7 do
            tween("defaultStrum"..i, {y = defaultStrum0Y , alpha = 1 }, crochet * 0.001 * 24, 'linear')
        end
        lol = true
        bloomlol = false
        tweenShaderProperty("EyeFishEffectGame","power",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*4,"cubeOut")
        mirror(true,true,"zoom","zoom",0.5,1,24,crochet,"linear")
        tweenShaderProperty("bars","effect",0,crochet*0.001*24,"linear")
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*24,"linear")
        bloom(0,1,crochet,24,"linear")
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 928 then
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 1094 or curStep == 1112 or curStep == 1214 or curStep == 1216 then
        zoom = 0.8
    end
    if (curStep >= 128 and curStep <= 224) or (curStep >= 896 and curStep <= 992) then
        if curStep % 64 == 0 or curStep % 64 == 6 or curStep % 64 == 24 or
        curStep % 64 == 32 or curStep % 64 == 54 then
            zoom = 0.8
          
           swap = swap*-1
        flechas(true,-25*swap,true,50*swap)
        elseif curStep % 64 == 30 or curStep % 32 == 62 then
            zoom = 0.85
            flechas(true,25*swap,true,-50*swap)
        end
    end
    parte1(184)
    parte1(952)
    parte1(352-40)
    parte1(1080)
    parte2(256)
    parte2(1024)
    parte3(384)
    parte3(1152)
    drop(512)
    drop(640)
    drop(1280)
    drop(1408)
end
function parte1(s)
    if lol then
        if curStep == s then
            tweenShaderProperty("titleeffect","money",0.9,crochet*0.001*2,"cubeOut")
            mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
            tweenShaderProperty("mirror3","angle",10,crochet*0.001*1,"quadOut")
            tweenShaderProperty("bars","effect",0.25,crochet*0.001*1,"quadOut")
            tweenShaderProperty("barrel","y",-2,crochet*0.001*4,"cubeInOut")
        elseif curStep == s+4 then
            tweenShaderProperty("mirror3","angle",0,crochet*0.001*1,"cubeIn")
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
            tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
        elseif curStep == s+6 then
            bloom(4,1,crochet,0.5,"cubeOut")
            tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeIn")
        elseif curStep == s+8 then--192
            tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
            bloom(10,1,crochet,2,"cubeOut")
            tweenShaderProperty("titleeffect","money",1,crochet*0.001*1,"cubeOut")
        end
    end
    if curStep == s+32 then
        setShaderProperty('titleeffect', 'money',0)
        tweenShaderProperty("titleeffect","money",0.5,crochet*0.001*2,"cubeIn")
    elseif curStep == s+40 then--224
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,4,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*4,"quadOut")
    --elseif curStep == 232 then
        tweenShaderProperty("zoomblurgame","focusPower",5,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror3","angle",-10,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*4,"cubeIn")
    elseif curStep == s+56 then--240
        zoom = 0.8
        flechas(true,-25)
      
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*2,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.9)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*2,"quadOut")
        tweenShaderProperty("mirror3","angle",10,crochet*0.001*2,"quadOut")
    elseif curStep == s+60 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
    elseif curStep == s+64 then
        zoom = 0.8
        flechas(true,25)
      
        setShaderProperty('titleeffect', 'money',0.7)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeOut")
        tweenShaderProperty("mirror3","angle",-10,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+66 or curStep == s+70 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeIn")
    elseif curStep == s+68 then
        tweenShaderProperty("mirror3","angle",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,1,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.5)
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeOut")
    elseif curStep == s+72 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        bloom(10,1,crochet,1,"cubeOut")
    end
end
function parte2(s)
    if curStep == s or curStep == s+16 then
        --set("defaultCamZoom", 0.9)
        triggerEvent('Change Camera Speed', '4')
        setShaderProperty('titleeffect', 'money',0.9)
        mirror(false,true,"","zoom",0,0.75,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0.07,crochet*0.001*1,"quadOut")
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == s+4 or curStep == s+12 or curStep == s+20 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"quadOut")
    elseif curStep == s+8 then
        mirror(false,true,"","zoom",0,0.75,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0.07,crochet*0.001*1,"quadOut")
        bloom(4,1,crochet,1,"cubeOut")
    end
    if curStep == s+24 then
        triggerEvent('Change Camera Speed', '1')
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,3,crochet,"cubeInOut")
        bloom(4,1,crochet,1,"cubeOut")
        zoom = 0.8
        flechas(true,-25)
        setShaderProperty('titleeffect', 'money',0)
    elseif curStep == s+28 then
        mirror(false,true,"","zoom",0,3,0.5,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",5,crochet*0.001*1,"cubeOut")
        zoom = 0.8
        flechas(true,25)
        bloom(4,1,crochet,0.5,"cubeOut")
    elseif curStep == s+30 then
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
        zoom = 0.8
        bloom(4,1,crochet,0.5,"cubeOut")
            flechas(true,-25)
        
      
    elseif curStep == s+32 then
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == s+40 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
        tweenShaderProperty("titleeffect","money",0.1,crochet*0.001*2,"quadOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*1,"quadOut")
        tweenShaderProperty("saturation","AAA",10,crochet*0.001*2,"cubeOut")
    elseif curStep == s+48 then
        mirror(false,true,"","angle",0,0,1.5,crochet,"cubeOut")
    elseif curStep == s+54 then
        bloom(4,1,crochet,1,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,1,crochet,"cubeOut")
        tweenShaderProperty("saturation","AAA",5,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("titleeffect","money",0,crochet*0.001*1,"cubeOut")
        zoom = 0.8
        flechas(true,-25)
      
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*0.5,"cubeIn")
    elseif curStep == s+62 then
        bloom(4,1,crochet,0.5,"cubeOut")
        mirror(true,true,"angle","angle",20,0,0.5,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeOut")
        zoom = 0.8
        flechas(true,25)
      
    elseif curStep == s+64 then
        bloom(8,1,crochet,2,"cubeOut")
        zoom = 0.8
        flechas(true,-25)
      
    end 
end
function parte3(s)
    if curStep == s then
        setShaderProperty('godrays', 'decay', 0.8)
        matt = true
        cam = false
        triggerEvent('Change Camera Speed', '4')
        set("defaultCamZoom", 0.9)
        lascosasdelhud(0,crochet,4,"cubeOut")
        tweenShaderProperty("chess","transparency",0.07,crochet*0.001*1,"quadOut")
        setShaderProperty('titleeffect', 'money',0)
        tweenFadeIn("blackBG",0.7,crochet*0.001*1,"cubeOut")
    elseif curStep == s+32 or curStep == s+96 then
        matt = false
        bf = true
    elseif curStep == s+64 then
        matt = true
        bf = false
    end

    if curStep == s+62 or curStep == s+64 or curStep == s+96 then
        zoom = 0.8
    elseif curStep == s+112 then
        set("defaultCamZoom", 0.5)
        setShaderProperty('godrays', 'decay', 0.85)
        cam = true
        matt = false
        bf = false
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*2,"cubeIn")
    elseif curStep == s+120 then
        bloom(4,1,crochet,1,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(true,true,"x","x",-0.15,0,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("barrel","barrel",1,crochet*0.001*1,"cubeOut")
        zoom = 0.8
        flechas(true,-25,true,-50)
      
    elseif curStep == s+124 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.3,crochet*0.001*0.5,"cubeOut")
        zoom = 0.8
        flechas(true,25,true,50)
      
        bloom(4,1,crochet,1,"cubeOut")
        mirror(true,true,"x","x",0.15,0,1,crochet,"cubeOut")
    elseif curStep == s+126 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*0.5,"cubeIn")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*0.5,"cubeIn")
    elseif curStep == s+128 then--512
        tweenShaderProperty("godrays","decay",0.5,crochet*0.001*2,"cubeOut")
        zoom = 0.8
        flechas(true,-25,true,-50)
      
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",-1,stepCrochet*0.001*1,"cubeOut")
    end
    if curStep > s and curStep <= s+111 then
        if curStep % 16 == 0 then
            bloom(4,1,crochet,2,"cubeOut")
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        elseif curStep % 16 == 8 then
            mirror(false,true,"","zoom",0,0.75,2,crochet,"cubeIn")
            tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        end
    end
end

function drop(s)
    if curStep == s or curStep == s+32 then
        set("defaultCamZoom", 0.6)
        tweenShaderProperty("zoomblurgame","focusPower",0,stepCrochet*0.001*4,"cubeOut")
        Y = true
        bloomlol = true
        tweenFadeIn("blackBG",0.4,crochet*0.001*1,"cubeOut")
        setShaderProperty("bars","effect",0)
        tweenShaderProperty("bars","effect",0.6,stepCrochet*0.001*8,"cubeIn")
        tweenShaderProperty('glitch3', 'GLITCH', 0.37, stepCrochet*0.001*4, 'cubeIn')
        tweenShaderProperty("EyeFishEffectGame2","power",0.3,stepCrochet*0.001*4,"cubeOut")

    end
    if curStep == s+3 or curStep == s+35 then
        bloom(2,1,crochet,1,"cubeOut")
        setShaderProperty('greyscale', 'strength', 0)
        mirror(false,true,"","angle",0,90,3,stepCrochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,3,stepCrochet,"cubeOut")
    elseif curStep == s+6 or curStep == s+38 then
        setShaderProperty('barrel', 'y', 0)
        tweenShaderProperty("barrel","y",2,crochet*0.001*1,"cubeInOut")
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeInOut")
        mirror(false,true,"","angle",0,0,0.5,crochet,"cubeIn")
        
    elseif curStep == s+8 or curStep == s+40 then
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty('glitch3', 'GLITCH', 0, stepCrochet*0.001*4, 'cubeOut')
        blooms = 4
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeOut")
        --mirror(false,true,"","zoom",0,0.6,0.5,crochet,"quadOut")
        setShaderProperty('titleeffect', 'money',0)
    elseif curStep == s+10 or curStep == s+42 then
        mirror(false,true,"","zoom",0,1,3,stepCrochet,"cubeIn")
    elseif curStep == s+12 or curStep == s+44 then
        tweenShaderProperty("mirror3","angle",10,stepCrochet*0.001*3.5,"cubeOut")
    elseif curStep == s+16 or curStep == s+48 then
        tweenShaderProperty("mirror3","angle",-10,stepCrochet*0.001*4,"quadOut")
        mirror(false,true,"","zoom",0,1.5,4,stepCrochet,"quadOut")
        tweenShaderProperty("bars","effect",0.17,crochet*0.001*1,"quadOut")
        tweenShaderProperty("titleeffect","money",1,crochet*0.001*1,"quadOut")
        zoom = 0.9
    elseif curStep == s+20 or curStep == s+52 then
        zoom = 0.9
        blooms = 4
  
        tweenShaderProperty("mirror3","angle",10,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,2,2,stepCrochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*0.5,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.8)
        tweenShaderProperty("titleeffect","money",1,crochet*0.001*1,"quadOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0.2,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == s+22 or curStep == s+54 then
        blooms = 4
        tweenShaderProperty("mirror3","angle",0,stepCrochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,stepCrochet,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.5)
        tweenShaderProperty("titleeffect","money",0,crochet*0.001*0.5,"quadOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*2,"cubeOut")
    elseif curStep == s+24 or curStep == s+56 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0.25,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("barrel","barrel",0,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        y = -0.15
        blooms = 4
    elseif curStep == s+28 or curStep == s+60 then
        y = 0.15
        tweenShaderProperty("EyeFishEffectGame2","power",0,crochet*0.001*1,"expoIn")
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeIn")
    elseif curStep == s+30 or curStep == s+62 then
        y = -0.15
        zoom = 0.8
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*0.5,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeIn")
        blooms = 8
    end
    if curStep == s+32 then
        zoom = 0.85
        mirror(false,true,"","zoom",0,1.1,0.5,crochet,"cubeOut")
        bloom(1,8,stepCrochet,3,"cubeOut")
        setShaderProperty('titleeffect', 'money',0.7)
    end
    if curStep == s+64 then --576
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
        zoom = 0.9
        blooms = 4
        setShaderProperty('titleeffect', 'money',0.8)
        tweenShaderProperty("titleeffect","money",1,crochet*0.001*1,"quadOut")
    elseif curStep == s+66 then
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeIn")
        
    elseif curStep == s+68 then
        tweenShaderProperty("EyeFishEffectGame2","power",0.2,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("bars","effect",0.3,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"cubeOut")
        zoom = 0.8
        blooms = 8
    elseif curStep == s+70 then
        zoom = 0.8
        blooms = 8
        tweenShaderProperty("EyeFishEffectGame2","power",0.3,stepCrochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,stepCrochet*0.001*4,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
    elseif curStep == s+72 then--584
        tweenShaderProperty("mirror3","angle",10,stepCrochet*0.001*3,"cubeOut")
        setShaderProperty("barrel","x",0)
        tweenShaderProperty("barrel","x",1,stepCrochet*0.001*3,"cubeOut")
    elseif curStep == s+74  or curStep == s+80 then
        zoom = 0.8
        blooms = 8
    elseif curStep == s+75 then--584
        tweenShaderProperty("mirror3","angle",-10,stepCrochet*0.001*3,"cubeOut")
        setShaderProperty("barrel","x",1)
        tweenShaderProperty("barrel","x",2,stepCrochet*0.001*3,"cubeOut")
    elseif curStep == s+78 then
        tweenShaderProperty("mirror3","angle",0,stepCrochet*0.001*4,"cubeOut")
        setShaderProperty("barrel","x",-2)
        tweenShaderProperty("barrel","x",0,stepCrochet*0.001*4,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,stepCrochet*0.001*2,"cubeIn")
        zoom = 0.8
        blooms = 4
    end
    if curStep == s+80 then--592
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"quadOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
    elseif curStep == s+84 then
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,0.5,crochet,"cubeOut")
    elseif curStep == s+86 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,0.5,crochet,"cubeIn")
    elseif curStep > s+88 and curStep <= s+97 and curStep % 2 == 0 then
        zoom = 0.8
        blooms = 8
        swap = swap*-1
        flechas(true,25*swap,true,50*swap)
    end
    if curStep == s+88 then
        tweenShaderProperty("pixel","strength",50,stepCrochet*0.001*8,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0.3,stepCrochet*0.001*8,"cubeOut")
    elseif curStep == s+96 then--608
        setShaderProperty('titleeffect', 'money',0.5)
        tweenShaderProperty("pixel","strength",0,stepCrochet*0.001*4,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*3,"quadOut")
        mirror(false,true,"","zoom",0,1,3,stepCrochet,"quadOut")
        mirror(false,true,"","angle",0,10,4,stepCrochet,"cubeIn")
     --   mirror(false,true,"","zoom",0,1,1,stepCrochet,"quadOut")
    elseif curStep == s+99 then
        mirror(false,true,"","zoom",0,1.5,2,stepCrochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame2","power",0.25,stepCrochet*0.001*2,"cubeIn")
    end
    if curStep > s+100 and curStep <= s+102 and curStep % 1 == 0 then
        zoom = 0.75
        blooms = 8
        flechas(true,25)
    end
    if curStep == s+100 then
        setShaderProperty('titleeffect', 'money',0.9)
    elseif curStep == s+101 then
        setShaderProperty('titleeffect', 'money',0.7)
    end
    if curStep == s+102 then
        zoom = 0.8
        blooms = 8
        flechas(true,-25,true,-50)
        setShaderProperty('titleeffect', 'money',1)
        mirror(false,true,"","zoom",0,1,4,stepCrochet,"quadOut")
        mirror(false,true,"","angle",0,0,1,crochet,"quadOut")
        tweenShaderProperty("EyeFishEffectGame2","power",0,stepCrochet*0.001*4,"quadOut")
    elseif curStep == s+108 then
        tweenShaderProperty("titleeffect","money",0.8,stepCrochet*0.001*4,"cubeIn")
    elseif curStep == s+112 then
        blooms = 6
        zoom = 0.8
        flechas(true,25,true,50)
        mirror(false,true,"","zoom",0,2.5,8,stepCrochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.6,stepCrochet*0.001*16,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",8,stepCrochet*0.001*16,"cubeIn")
    elseif curStep == s+118 then
        tweenShaderProperty("EyeFishEffectGame2","power",0.2,stepCrochet*0.001*2,"cubeIn")
    elseif curStep == s+120 or curStep == s+124 then
        zoom = 0.8
        blooms = 6
        swap = swap*-1
        flechas(true,25*swap,true,50*swap)
    elseif curStep == s+122 then
        tweenShaderProperty("EyeFishEffectGame2","power",0.3,stepCrochet*0.001*2,"cubeIn")
    end
    if curStep == s+120 then
        setShaderProperty('titleeffect', 'money',0.9)
        tweenShaderProperty("titleeffect","money",1,stepCrochet*0.001*4,"cubeIn")
    end
    if curStep == s+124 then
        mirror(false,true,"","zoom",0,1,4,stepCrochet,"cubeIn")
        setShaderProperty('greyscale', 'strength',1)
    elseif curStep == s+128 then
        bloom(1,8,stepCrochet,3,"cubeOut")
    end
    if curStep > s+12 and curStep <= s+16 or curStep > s+44 and curStep <= s+48 and curStep % 1 == 0 then
        blooms = 8
        zoom = 0.8
        triggerEvent('screen shake', (stepCrochet*0.001*1)..',0.005')
        if curStep % 4 == 0 then
            setShaderProperty('titleeffect', 'money',0.7)
            flechas(true,-25,true,-50)
        elseif curStep % 4 == 1 then
            setShaderProperty('titleeffect', 'money',0.5)
            flechas(true,25,true,50)
        elseif curStep % 4 == 2 then
            setShaderProperty('titleeffect', 'money',0.2)
            flechas(true,-25,true,-50)
        elseif curStep % 4 == 3 then
            setShaderProperty('titleeffect', 'money',0.8)
            flechas(true,25,true,50)
        end
    end
end