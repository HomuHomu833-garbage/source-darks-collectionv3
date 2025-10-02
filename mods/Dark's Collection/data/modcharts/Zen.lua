function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("infoTxt",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("timeBarBG",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
function createPost()
    hud(0,stepCrochet,1,"cubeOut")
    
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.5)
    setShaderProperty('mirror', 'angle',-20)
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
    
    initShader('blur', 'blur')
    setCameraShader('game', 'blur')
    setShaderProperty('blur', 'strengthX', 0)


    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)


    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness',0)

end

local time = 0
local shaggy = true
local bf = false

local perlinX, perlinY, perlinZ = 0, 0, 0
local perlinSpeed = 1.1 
local perlinXRange = 0.07
local perlinYRange = 0.07

local zoom = 1
function update(elapsed)
    if shaggy then
        set("camFollow.x", get("dad.x")+200)
        set("camFollow.y", get("dad.y")+420)
        set("defaultCamZoom", 0.8)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+100)
        set("defaultCamZoom", 0.8)
    end
    perlinX = perlinX + elapsed*math.random()*perlinSpeed
    perlinY = perlinY + elapsed*math.random()*perlinSpeed
   
    setShaderProperty('mirror2', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
    setShaderProperty('mirror2', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
  

    zoom, blur = lerp(zoom, 1, elapsed * 12), lerp(blur, 0, elapsed * 12)
        setShaderProperty('mirror2', 'zoom', zoom)
        setShaderProperty('blur', 'strengthX', blur)
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
    mirror(false,true,"","zoom",0,1,16,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,16,crochet,"cubeOut")
    tweenShaderProperty('bars', 'effect',0, crochet*0.001*16, 'cubeOut')
    bloom(0,1,crochet,16,"cubeOut")
end


local q = true
function stepHit()
    if curStep == 32 or curStep == 96 then
        shaggy = false
        bf = true
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 60 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
        bloom(4,1,crochet,1,"cubeOut")
    elseif curStep == 64 then
        shaggy = true
        bf = false
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 112 then
        set("defaultCamZoom", 0.6)
        shaggy = false
        bf = false
        zoom,blur = 0.87,5
    elseif curStep == 116 or curStep == 122 then
        zoom,blur = 0.87,5
    elseif curStep == 120 or curStep == 504 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeInOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*1, 'cubeOut')
    elseif curStep == 124 or curStep == 508 then
        zoom,blur = 0.87,5
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 128 then
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        hud(1,crochet,2,"cubeOut")
    elseif curStep == 512 then
        
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        hud(0,crochet,2,"cubeOut")
        setProperty('', 'cameraSpeed', 5)
    end
    if curStep == 152 or curStep == 184 then
        set("defaultCamZoom", 0.85)
    elseif curStep == 160 or curStep == 192 then
        set("defaultCamZoom", 0.6)
        bloom(4,1,crochet,2,"cubeOut")
    end 
   
      
    if curStep == 216 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
    elseif curStep == 224 or curStep == 416 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 208 or curStep == 240 then
        mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeOut")
    elseif curStep == 248 then
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 252 then
        mirror(false,true,"","barrel",0,-10,1,crochet,"cubeIn")
    elseif curStep == 256 then
        mirror(false,true,"","barrel",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        shaggy = true
        setProperty('', 'cameraSpeed', 3)
    --elseif curStep == 272 or curStep == 304 then
    --    mirror(false,true,"","zoom",0,1.2,1,crochet,"cubeOut")
    elseif curStep == 282 or curStep == 314 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == 284 or curStep == 316 then
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeOut")
    elseif curStep == 286 or curStep == 318 then
        mirror(false,true,"","zoom",0,0.7,0.5,crochet,"cubeOut")
    elseif curStep == 288 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        shaggy = false
        bf = true
    elseif curStep == 320 then
        bloom(4,1,crochet,2,"cubeOut")
        bf = false
        setProperty('', 'cameraSpeed', 1)
        set("defaultCamZoom", 0.6)
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
    elseif curStep == 384 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 448 then
        bloom(4,1,crochet,2,"cubeOut")
        shaggy = true
    elseif curStep == 480 then
        shaggy = false
        bf = true
    elseif curStep == 488 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 496 then
        bf = false
        set("defaultCamZoom", 0.6)
    end
    if curStep == 520 or curStep == 552 or curStep == 648 or curStep == 680 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
    elseif curStep == 576 then
        mirror(true,true,"x","x",-2,0,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        bf = false
        shaggy = false
        set("defaultCamZoom", 0.6)
    elseif curStep == 568 or curStep == 696 then
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == 572 or curStep == 700 then
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
    end
    if curStep == 592 or curStep == 624 then
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.006')
        mirror(false,true,"","zoom",0,0.8,8,stepCrochet,"cubeIn")
    end
    if curStep == 592 then
        mirror(true,true,"x","x",2,0,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 602 then
        mirror(false,true,"","zoom",0,1.2,3,stepCrochet,"cubeOut")
        mirror(false,true,"","angle",0,20,3,stepCrochet,"cubeOut")
    elseif curStep == 605 then
        mirror(false,true,"","zoom",0,0.8,3,stepCrochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,3,stepCrochet,"cubeIn")
    elseif curStep == 608 then
        set("defaultCamZoom", 0.6)
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1,4,stepCrochet,"cubeOut")
        mirror(false,true,"","angle",0,0,4,stepCrochet,"cubeOut")
    elseif curStep == 704 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,0,4,stepCrochet,"cubeOut")
        bf = false
        shaggy = true
        set("defaultCamZoom", 0.7)
    elseif curStep == 708 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeIn")
    end

    if curStep == 528 or curStep == 560 or curStep == 656 or curStep == 688 then
        mirror(false,true,"","zoom",0,0.65,4,crochet,"cubeIn")
        triggerEvent('screen shake', (stepCrochet*0.001*16)..',0.01')
    elseif curStep == 544 or curStep == 576 or curStep == 672 or curStep == 704 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 632 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","barrel",5,crochet*0.001*2,"cubeIn")
    elseif curStep == 636 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")

    elseif curStep == 640 then

        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty("mirror2","barrel",-10)
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 720 or curStep == 736 or curStep == 752  then
        set("defaultCamZoom", 0.6)
    elseif curStep == 714 or curStep == 728 or curStep == 746 then
        set("defaultCamZoom", 0.8)
    end
    if curStep == 714 or curStep == 728  then
        bf = true
        shaggy = false
        setProperty('', 'cameraSpeed', 3.5)
    elseif curStep == 720 then
        bf = false
        shaggy = true
    elseif curStep == 736 then
        mirror(false,true,"","zoom",0,0.5,8,crochet,"cubeIn")
    end
    if curStep == 760 then
        tweenShaderProperty("mirror2","barrel",5,crochet*0.001*2,"cubeIn")
       -- mirror(false,true,"","zoom",0,0.7,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,2,crochet,"cubeIn")
        set("defaultCamZoom", 0.8)
    elseif curStep == 768 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty("mirror2","barrel",-10)
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        bf = false
        shaggy = false
        set("defaultCamZoom", 0.6)
        hud(1,crochet,2,"cubeOut")
        setProperty('', 'cameraSpeed', 1)
        bloom(4,1,crochet,2,"cubeOut")
    end
    if curStep == 864 then
        set("defaultCamZoom", 0.7)
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 888 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeInOut")
        tweenShaderProperty("bars","effect",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0.3, crochet*0.001*1, 'cubeOut')
    elseif curStep == 892 then
      
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power',0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 896 then
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 904 then
        tween("camHUD",{alpha = 0},crochet*0.001*4)
        bloom(1,0,crochet,6,"cubeIn")
        tweenShaderProperty('mirror2',"barrel",5, crochet*0.001*6, 'cubeIn')
    end
    if curStep == 542 or curStep == 670 then
        q = false
    elseif curStep == 576 or curStep == 688 then
        q = true
    end
  
    if curStep >= 512 and curStep < 576 or  curStep >= 640 and curStep < 704 then
        if curStep % 64 == 0 then
            shaggy = true
            if q then
            bloom(4,1,crochet,2,"cubeOut")
            end
            bf = false
        elseif curStep % 64 == 32 then
            bf = true
            if q then
                bloom(4,1,crochet,2,"cubeOut")
            end
            shaggy = false
        end
    end

    if curStep >= 64 and curStep < 112 and curStep % 16 == 8 then
        zoom,blur = 0.87,5
    end
    if curStep >= 512 and curStep < 768  then
        if curStep % 4 == 0 then
        zoom,blur = 0.85,5
        end
    end
    if curStep >= 128 and curStep < 480 or curStep >= 768 and curStep < 864 then
        if curStep % 64 == 0 or curStep % 64 == 12 or curStep % 64 == 16 or curStep % 64 == 22
        or curStep % 64 == 26 or curStep % 64 == 32 or curStep % 64 == 39 or curStep % 64 == 40
        or curStep % 64 == 44 or curStep % 64 == 48 or curStep % 64 == 54 or curStep % 64 == 60
        or curStep % 64 == 61 then
            zoom,blur = 0.9,5
      
        end
    end
end