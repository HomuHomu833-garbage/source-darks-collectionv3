a = 0
initialY = {}
function createPost()

    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), 'black')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0.5, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))

    initShader('ca', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.001)

    initShader('mirror', 'BarrelBlurEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 4)
    setShaderProperty('mirror', 'angle',90)
	setShaderProperty('mirror', 'x', -9)
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
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('pez', 'EyeFishEffect')
    setCameraShader('game', 'pez')
    setShaderProperty('pez', 'power', 0.5)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0.5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'red', 0)
    setShaderProperty('vignette', 'blue', 0)
    setShaderProperty('vignette', 'green', 0)
    setShaderProperty('vignette', 'size', 0.2)

    
    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)
    
    
    setActorPos(getActorX("dadCharacter0"), getActorY("dadCharacter0") + 1650, "dadCharacter0") 
    setActorPos(getActorX("dadCharacter1"), getActorY("dadCharacter1") + 1650, "dadCharacter1")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShader('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function startSong()
    tweenShader('bloom', 'contrast',1, crochet*0.001*32, 'linear')
    tweenShader('greyscale', 'strength',0, crochet*0.001*32, 'linear')
    tweenShader('pez', 'power',0, crochet*0.001*80, 'cubeOut')
    mirror(false,true,"","zoom",0,1,80,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,80,crochet,"cubeOut")
    mirror(false,true,"","x",0,0,80,crochet,"cubeOut")
end
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0
cam,perlinX,perlinY,perlinSpeed,perlinXRange,perlinYRange,time,speed,shaggy,shaggyred,perro = false,0,0,1,0.2,0.2,0,1,false,false,true
function update(elapsed)
    local section = math.floor(curStep/16)

    angle = lerp(angle, 0, elapsed * 8)

    x = lerp(x, 0, elapsed * 8)

    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    local perlinNoiseX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinNoiseY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    setShaderProperty('mirror2', 'x', perlinNoiseX+x)
    setShaderProperty('mirror2', 'y', perlinNoiseY)
    if section >= 16 then
        time = time + (elapsed / (1 / 120))
        setShaderProperty('mirror2', 'angle', math.sin(time / 100 * speed) * 5 + angle)
    else
        setShaderProperty('mirror2', 'angle', 0)
    end
    if shaggyred then
        set("camFollow.x", getActorX("dadCharacter1")+150)
        set("camFollow.y", getActorY("dadCharacter1")+300)
    end
    if shaggy then     
        set("camFollow.x", getActorX("dadCharacter0")+150)
        set("camFollow.y", getActorY("dadCharacter0")+250)
    end
    a = a + elapsed 
    if perro then
        if section >= 0 and section < 16 then
            set("camFollow.x", math.cos(a) * 1500)
        elseif section >= 16 and section < 24 or section >= 48 and section < 56 or section >= 80 and section < 88
        or section >= 116 and section < 124 or section >= 148 and section < 156 or section >= 164 and section < 172
        or section >= 196 and section < 204 or section >= 228 and section < 236 or section >= 260 and section < 268
        or section >= 296 and section < 304 or section >= 328 and section < 336 or section >= 344 and section < 352
        or section >= 440 and section < 448 or section >= 476 and section < 484 or section >= 508 and section < 516
        or section >= 524 and section < 532 or section >= 556 and section < 564 or section >= 588 and section < 596 then
            shaggyred = false
            shaggy = true 
        elseif section >= 24 and section < 32 or section >= 56 and section < 64 or section >= 88 and section < 96
        or section >= 132 and section < 140 or section >= 172 and section < 180 or section >= 204 and section < 212 
        or section >= 236 and section < 244 or section >= 268 and section < 276 or section >= 312 and section < 320
        or section >= 352 and section < 360 or section >= 448 and section < 456 or section >= 492 and section < 500
        or section >= 532 and section < 540 or section >= 564 and section < 572 or section >= 596 and section < 604 then
            shaggy = false
            shaggyred = true
        else
            shaggy = false
            shaggyred = false 
        end
    end

    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.001)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end
    
    if cam then
        set("camFollow.x",925)
        set("camFollow.y",450)
     end
  
    if curStep >= 260 then
        setActorPos(0 + (math.cos(a) * 700), initialY["dadCharacter0"] + (math.sin(2 * a) * -350), "dadCharacter0")
        setActorPos(0 + (math.cos(a) * -700), initialY["dadCharacter1"] + (math.sin(2 * a) * 350), "dadCharacter1")        
    end
end

function stepHit()
    local section = math.floor(curStep/16)
    if curStep == 248 then
        tween("dadCharacter0", {y = getActorY("dadCharacter0") - 1450}, crochet * 0.001 * 1, "cubeOut")
    elseif curStep == 252 then
        tween("dadCharacter1", {y = getActorY("dadCharacter1") - 1450}, crochet * 0.001 * 1, "cubeOut")
    elseif curStep == 256 then
        set("defaultCamZoom", 0.5)
        tween("blackBG", {alpha = 0}, crochet*0.001*4,"cubeOut")
        cam = false
        flashCamera("hud","yellow",1)
    end
    if section >= 16  then
        if curStep % 128 == 0 then
            set("defaultCamZoom", 0.8)
        elseif curStep % 128 == 32 then
            set("defaultCamZoom", 0.7)
        elseif curStep % 128 == 64 then
            set("defaultCamZoom", 0.6)
        elseif curStep % 128 == 96 then
            set("defaultCamZoom", 0.5)
        end
    end
    if curStep == 260 then
        initialY["dadCharacter0"] = getActorY("dadCharacter0")
        initialY["dadCharacter1"] = getActorY("dadCharacter1")
    end
    if curStep == 752 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
    elseif curStep == 764 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 768 then
        flashCamera("hud","yellow",1)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-360,4,crochet,"cubeOut")
    elseif curStep == 1264 or curStep == 2096 or curStep == 4144 or curStep == 4976 or curStep == 7024 or curStep == 7856 
    or curStep == 8880 or curStep == 9904 then
        tweenShader('bloom', 'contrast',5, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1280 or curStep == 2112 or curStep == 4160 or curStep == 4992 or curStep == 7040 or curStep == 7872 
    or curStep == 8896 then
        tweenShader('bloom', 'contrast',1, crochet*0.001*3, 'cubeOut')
        flashCamera("hud","yellow",1)
        speed = 1.5
        perlinCaRange = 0.025
    end
    if curStep == 3136 or curStep == 3264 or curStep == 3392 or curStep == 3520 or curStep == 6656 or curStep == 6784 or curStep == 6912 
    or curStep == 8512 or curStep == 8640 or curStep == 8768 then
        bloom(4,1,crochet,4,"cubeOut")
    end
    if curStep == 1776 or curStep == 4656 or curStep == 7536 then
        tweenShader('mirror2', 'zoom',3, crochet*0.001*4, 'cubeIn')
    elseif curStep == 1792 or curStep == 4672 or curStep == 7552 then
        perro = false
        bloom(4,1,crochet,2,"cubeOut")
        setProperty('', 'cameraSpeed', 3)
        tweenShader('mirror2', 'zoom',1, crochet*0.001*2, 'cubeOut')
        tweenShader('bars', 'effect',0.2, crochet*0.001*2, 'cubeOut')
        shaggy = true
    elseif curStep == 1808 or curStep == 4688 or curStep == 7568 then
        shaggy = false
    elseif curStep == 1824 or curStep == 4704 or curStep == 7584 then
        shaggyred = true
    elseif curStep == 1840 or curStep == 4720 or curStep == 7600 then
        shaggyred = false
        perro = true
    elseif curStep == 1848 or curStep == 2616 or curStep == 3640 or curStep == 4728 or curStep == 5496 or curStep == 6776
    or curStep == 7608 then
        tweenShader('mirror2', 'barrel',-5, crochet*0.001*2, 'cubeIn')
        tweenShader('bars', 'effect',0.6, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1856 or curStep == 2624 or curStep == 3648 or curStep == 4736 or curStep == 5504 or curStep == 6784
    or curStep == 7616 then
        tweenShader('mirror2', 'barrel',0, crochet*0.001*4, 'cubeOut')
        tweenShader('bars', 'effect',0.1, crochet*0.001*4, 'cubeOut')
        flashCamera("hud","yellow",1)
        setProperty('', 'cameraSpeed', 1)
        speed = 1
        perlinCaRange = 0
    end

    if curStep == 6000 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","y",0,4,4,crochet,"cubeIn")
    elseif curStep == 6008 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShader('bars', 'effect',0.6, crochet*0.001*2, 'cubeIn')
        tweenShader('greyscale', 'strength',0.5, crochet*0.001*2, 'cubeIn')
    elseif curStep == 6016 then
        flashCamera("hud","",2)
    elseif curStep == 6080 or curStep == 6208 then
        mirror(true,true,"zoom","zoom",0.5,1,8,crochet,"cubeOut")
        mirror(true,true,"angle","angle",20,0,8,crochet,"cubeOut")
        tweenShader('bars', 'effect',0.1, crochet*0.001*8, 'cubeOut')
    elseif curStep == 6128 then
        mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,4,crochet,"cubeIn")
        tweenShader('bars', 'effect',0.6, crochet*0.001*4, 'cubeIn')
    elseif curStep == 6144 then
        mirror(true,true,"zoom","zoom",0.5,1,8,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-20,0,8,crochet,"cubeOut")
        tweenShader('bars', 'effect',0.1, crochet*0.001*8, 'cubeOut')
    elseif curStep == 6192 then
        mirror(false,true,"","zoom",0,0.5,4,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,4,crochet,"cubeIn")
        tweenShader('bars', 'effect',0.6, crochet*0.001*4, 'cubeIn')
    elseif curStep == 6256 then
        tweenShader('mirror2', 'barrel',2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 6272 then
        tweenShader('mirror2', 'barrel',0, crochet*0.001*4, 'cubeOut')
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 6528 then
        flashCamera("hud","",1)
        tweenShader('bars', 'effect',0.2, crochet*0.001*4, 'cubeOut')
        tween("blackBG", {alpha = 0.5}, crochet*0.001*4,"cubeOut")
    end
    if curStep == 7008 or curStep == 8864 then
        mirror(false,true,"","zoom",0,3,8,crochet,"cubeIn")
        tweenShader('mirror2', 'barrel',5, crochet*0.001*4, 'cubeOut')
    elseif curStep == 7024 or curStep == 8880 then
        tweenShader('mirror2', 'barrel',-5, crochet*0.001*4, 'cubeIn')
        tween("blackBG", {alpha = 0}, crochet*0.001*4,"cubeIn")
        tweenShader('greyscale', 'strength',0, crochet*0.001*4, 'cubeIn')
    elseif curStep == 7040  then
        tweenShader('mirror2', 'barrel',0, crochet*0.001*4, 'cubeOut')
    end
    if curStep == 8888 then
        tweenShader('bars', 'effect',0.6, crochet*0.001*2, 'cubeIn')
    elseif curStep == 8896 then
        tweenShader('bars', 'effect',0.15, crochet*0.001*2, 'cubeOut')
        triggerEvent('screen shake', (stepCrochet * 0.001 * 1024) .. ',0.01')
        tweenShader('mirror2', 'barrel',0.1, crochet*0.001*4, 'cubeOut')
        setShaderProperty('vignette', 'red', 255)
        setShaderProperty('vignette', 'size', 0.1)
        setShaderProperty('vignette', 'green', 255)
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 9008 or curStep == 9136 or curStep == 9392 or curStep == 9520 or curStep == 9648 or curStep == 9904 then
        tweenShader('mirror2', 'barrel',5, crochet*0.001*2, 'cubeOut')
        tween("blackBG", {alpha = 0}, crochet*0.001*4,"cubeIn")
    elseif curStep == 9016 or curStep == 9144 or curStep == 9400 or curStep == 9528 or curStep == 9656 or curStep == 9912 then
        tweenShader('mirror2', 'barrel',-5, crochet*0.001*2, 'cubeIn')
    elseif curStep == 9024 or curStep == 9152 or curStep == 9408 or curStep == 9536 or curStep == 9664  then
        tweenShader('mirror2', 'barrel',0.1, crochet*0.001*4, 'cubeOut')
        flashCamera("hud","",1)
    end
    if curStep == 9152 or curStep == 9664 then
        tween("blackBG", {alpha = 0.5}, crochet*0.001*32,"cubeOut")
    elseif curStep == 9920 then
        tweenShader('mirror2', 'barrel',0, crochet*0.001*4, 'cubeOut')
        flashCamera("hud","",3)
        tweenShader('bloom', 'contrast',1, crochet*0.001*3, 'cubeOut')
        tweenShader('bars', 'effect',0.6, crochet*0.001*16, 'linear')
        tweenShader('vignette', 'size',0, crochet*0.001*16, 'cubeOut')
        tweenShader('mirror2', 'zoom',3, crochet*0.001*16, 'cubeIn')
        tweenShader('mirror2', 'angle',20, crochet*0.001*16, 'cubeIn')
        setProperty('', 'cameraSpeed', 1)
        speed = 1
        perlinCaRange = 0
    end
    if section >= 80 and section <  112 or section >= 132 and section <  164 
    or section >= 260 and section < 292 or section >= 312 and section < 344
    or section >= 440 and section < 472 or section >= 492 and section < 524
    or section >= 556 and section < 620 then
        if curStep % 8 == 0 then
            
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
            mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        end
        if curStep % 64 == 0 or curStep % 64 == 16 then
            angle,x = 5,-0.05
        elseif curStep % 64 == 8 or curStep % 64 == 24 then
            angle,x = -5,0.05
        end
        if curStep % 64 == 32 or curStep % 64 == 48 then
            angle,x = -5,-0.05
        elseif curStep % 64 == 40 or curStep % 64 == 56 then
            angle,x = 5,0.05
        
        end
    
    end
end