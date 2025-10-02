function lascosasdelhud(s,step,c,ease)
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
function makespritesxd(nombre,elnombreotro,x,y,size,hudogameonose)
	makeSprite(elnombreotro, nombre, x, y, size)
	setObjectCamera(elnombreotro, hudogameonose)
end
local time = 0
function createPost()
    makespritesxd("Eruption/like hey man","like hey man",200,0,0.5,"hud")
    makespritesxd("Eruption/lets see what","lets see what",190,150,0.5,"hud")
    makespritesxd("Eruption/these powers","these powers",190,300,0.5,"hud")
    makespritesxd("Eruption/can do!","can do!",350,450,0.5,"hud")
    makespritesxd("Eruption/like man","like man",300,-1230,0.5,"hud")--230 y
    set("like man.angle",-45)
    makespritesxd("Eruption/lets do it!","lets do it!",2000,200,0.7,"hud")--100 defaultx
    set("like hey man.alpha",0) 
    set("lets see what.alpha",0)
    set("these powers.alpha",0)
    set("can do!.alpha",0)
    lascosasdelhud(0,crochet,1,"cubeOut")
    initShader('WiggleEffect', 'WiggleEffect')
    setCameraShader('game', 'WiggleEffect')
    setShaderProperty('WiggleEffect', 'uWaveAmplitude', 0.0057)
    setShaderProperty('WiggleEffect', 'uSpeed', 10)
    setShaderProperty('WiggleEffect', 'uFrequency', 7)

    initShader('speedlines', 'speedlines')--
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(1, 'chessnose')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessnose', lol)

    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)

    initShader('godrays', 'godrays')--
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.65)
    setShaderProperty('godrays', 'density',0.5)
    setShaderProperty('godrays', 'weigth', 0.68)

    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader('game', 'vcrchroma')

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('mirror3', 'BarrelBlurEffect')
	setCameraShader('game', 'mirror3')
	setShaderProperty('mirror3', 'zoom', 1)
	setShaderProperty('mirror3','x',0)
	setShaderProperty('mirror3','y',0)
    setShaderProperty('mirror3','angle',0)
	setShaderProperty('mirror3', 'barrel', 0)
	setShaderProperty('mirror3', 'doChroma', true)

    initShader('mirror2', 'BarrelBlurEffect')
	setCameraShader('game', 'mirror2')
	setShaderProperty('mirror2', 'zoom', 2)
	setShaderProperty('mirror2','x',0)
	setShaderProperty('mirror2','y',0)
    setShaderProperty('mirror2','angle',0)
	setShaderProperty('mirror2', 'barrel', 0)
	setShaderProperty('mirror2', 'doChroma', true)

    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)

    initShader('mirror', 'BarrelBlurEffect')
	setCameraShader('game', 'mirror')
	setShaderProperty('mirror', 'zoom', 1)
	setShaderProperty('mirror','x',0)
	setShaderProperty('mirror','y',0)
    setShaderProperty('mirror','angle',0)
	setShaderProperty('mirror', 'barrel', 0)
	setShaderProperty('mirror', 'doChroma', true)
    initShader('bars2', 'bars')--
    setCameraShader('game', 'bars2')
    setShaderProperty('bars2', 'effect', 0)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.3)
    

    initShader('vignette', 'vignette')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.1)

    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1)
    setShaderProperty('color', 'green', 1)
    setShaderProperty('color', 'blue', 1)

end
function bumpzoom(s,w)
    setShaderProperty('mirror3', 'zoom', w)
    tweenShaderProperty('mirror3', 'zoom', 1,stepCrochet*0.001*s,"cubeOut")
    setShaderProperty('ca', 'strength', 0.04)
    tweenShaderProperty('ca', 'strength', 0,stepCrochet*0.001*s,"cubeOut")
    triggerEvent('screen shake', (stepCrochet*0.001*3.5)..',0.01')
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror2',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror2',value2,valor2, speed*0.001*s,ease)
    end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
local cam = true
local shaggy = false
local bf = false
function update(elapsed)
    time = time + elapsed
    setCustomShaderFloat("godrays","iTime",time*2)
    setCustomShaderFloat("WiggleEffect","uTime",time)
    setCustomShaderFloat("vcrchroma","iTime",time)
    setCustomShaderFloat("speedlines","iTime",time)
    setCustomShaderFloat("chess","iTime",time/2)
    if cam then
        set("camFollow.x",500)
        set("camFollow.y",300)
    end
    if shaggy then
        set("camFollow.x", get("dad.x")+250)
        set("camFollow.y", get("dad.y")+400)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+150)
        set("camFollow.y", get("boyfriend.y")+0)
    end
end
function songStart()
    tweenShaderProperty('mirror2', 'zoom', 1, crochet*0.001*4, 'cubeOut')
    tweenShaderProperty('bars', 'effect', 0, crochet*0.001*4, 'cubeOut')
    tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*4, 'cubeOut')
    bloom(4,1,crochet,4,"cubeOut")
end
function stepHit()
    if curStep == 56 then
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 15, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'quadOut')
    elseif curStep == 60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(true,true,"x","x",-2,0,2,crochet,"cubeInOut")
        tweenShaderProperty('mirror', 'angle', -15, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'expoIn')
    elseif curStep == 64 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == 120 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,4,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*2, 'cubeIn')
    elseif curStep == 124 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        --mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeInOut")
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 128 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        shaggy = true
        set("defaultCamZoom", 0.7)
    end
    if curStep == 136 then
        tweenShaderProperty('mirror3', 'angle', 20, crochet*0.001*14, 'cubeIn')
        --mirror(false,true,"","zoom",0,0.7,14,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.5,14,crochet,"cubeIn")
        tweenShaderProperty('greyscale', 'strength', 0.5, crochet*0.001*14, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*14, 'cubeIn')
    elseif curStep == 186 then
        tweenShaderProperty('mirror3', 'y', -4, crochet*0.001*4, 'cubeInOut')
    elseif curStep == 192 then
        bf = true
        tweenShaderProperty('mirror3', 'angle', 0, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*12, 'quadOut')
        mirror(false,true,"","zoom",0,2.5,12,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.3, crochet*0.001*12, 'quadOut')
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeOut')
    elseif curStep == 240 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*4, 'cubeIn')
        tweenShaderProperty('mirror', 'angle', 20, crochet*0.001*4, 'cubeIn')
        mirror(false,true,"","zoom",0,1,4,crochet,"cubeIn")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*4.2, 'cubeIn')
    elseif curStep == 252 then
        mirror(true,true,"x","x",2,0,2,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeIn')
        lascosasdelhud(1,crochet,1,"cubeIn")
    elseif curStep == 256 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
        bf = false
        shaggy = true
    end
    if curStep == 316 then
        mirror(false,true,"","zoom",0,0,1,crochet,"cubeIn")
    elseif curStep == 320 then
        mirror(true,true,"zoom","zoom",5,1,2,crochet,"cubeOut")
        bloom(6,1,crochet,2,"cubeOut")
        bf = true
    elseif curStep == 376 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,2,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*2, 'expoIn')
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty('mirror3', 'x', -2, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 384 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        bf = false
        shaggy = false
        set("defaultCamZoom", 0.6)
    end
    if curStep == 640 or curStep == 1600  then
        lascosasdelhud(0,crochet,2,"cubeOut")
        shaggy = true
        bf = false
        set("defaultCamZoom", 0.7)
    elseif curStep == 704 or curStep == 1728 then
        bf = true
        shaggy = false
    elseif curStep == 768 or curStep == 1664 or curStep == 1792 then
        bf = false
        shaggy = false
    end
    if curStep == 768 or curStep == 1600 then
        setShaderProperty('speedlines', 'transparency', 0)
    elseif curStep == 828 or curStep == 1788 then
        setShaderProperty("mirror3","x",0)
        tweenShaderProperty('mirror3', 'x', 4, crochet*0.001*2, 'quadInOut')
    elseif curStep == 832 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeOut')
    elseif curStep == 846 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'cubeIn')
    elseif curStep == 848 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 888 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*2, 'cubeIn')
        tweenShaderProperty('speedlines', 'transparency', 1, crochet*0.001*2, 'cubeIn')
    end
    if curStep == 1032 then
        tween("like man",{y = 230},crochet*0.001*2, 'quadOut')
        tween("like man",{angle = 0},crochet*0.001*3, 'quadOut')
    elseif curStep == 1048 then
        tween("like man",{y = 1250 , angle = 90},crochet*0.001*2, 'cubeIn')
    elseif curStep == 1052 then
        tween("lets do it!",{x = 100},crochet*0.001*1, 'quadOut') 
    elseif curStep == 1056 then
        tween("lets do it!",{x = -2000},crochet*0.001*2, 'cubeIn') 
    end
    if curStep == 926 then
        tween("like hey man",{alpha = 1},crochet*0.001*1, 'cubeOut')
    elseif curStep == 941 then
        tween("lets see what",{alpha = 1},crochet*0.001*1, 'cubeOut')
    elseif curStep == 949 then
        tween("these powers",{alpha = 1},crochet*0.001*1, 'cubeOut')
    elseif curStep == 955 then
        tween("can do!",{alpha = 1},crochet*0.001*1, 'cubeOut')
    elseif curStep == 960 then
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 968 then
        tweenFadeIn("like hey man",0,1)
        tweenFadeIn("lets see what",0,1)
        tweenFadeIn("these powers",0,1)
        tweenFadeIn("can do!",0,1)
    elseif curStep == 986 then
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeInOut")
    elseif curStep == 996 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'quadOut')
    elseif curStep == 1004 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'quadOut')
    elseif curStep == 1012 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'quadOut')
    elseif curStep == 1018 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, stepCrochet*0.001*4, 'cubeIn')
       tweenShaderProperty('bars', 'effect',0, stepCrochet*0.001*4, 'cubeIn')
    elseif curStep == 1020 then
        tweenShaderProperty('mirror', 'angle',360, crochet*0.001*5, 'quadOut')
        mirror(false,true,"","zoom",0,5,1,crochet,"cubeIn")
       tweenShaderProperty('bars2', 'effect', 0.4, crochet*0.001*1, 'expoIn')
       tweenShaderProperty('mirror3', 'zoom',2, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1024 then
        mirror(true,true,"zoom","zoom",0.2,1,2,crochet,"cubeOut")
        tweenShaderProperty('bars2', 'effect', 0, crochet*0.001*2, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1088 then
        setShaderProperty("mirror","angle",0)
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,8,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*8, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*8, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*8, 'quadOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*16, 'cubeIn')
    elseif curStep == 1120 then
        mirror(false,true,"","zoom",0,2,4,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*4, 'quadOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*4, 'quadOut')
    elseif curStep == 1136 then
        mirror(false,true,"","zoom",0,1,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'quadOut')
    elseif curStep == 1144 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-30,2,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'quadOut')
    elseif curStep == 1148 then
        setShaderProperty("mirror3","x",-2)
        tweenShaderProperty('mirror3', 'x', 0, crochet*0.001*3, 'cubeInOut')
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*1, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 1152 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        lascosasdelhud(1,crochet,2,"cubeOut")
        shaggy = true
    end
    if curStep == 1208 then
        tweenShaderProperty('bars2', 'effect', 0.4, crochet*0.001*2, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'cubeOut')
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        setShaderProperty("mirror","y",2)
        tweenShaderProperty('mirror', 'y', 0, crochet*0.001*3, 'quadInOut')
    elseif curStep == 1212 then
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == 1216 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('bars2', 'effect', 0, crochet*0.001*2, 'cubeOut')
        shaggy = false
        bf = true
    elseif curStep == 1272 then
        tweenShaderProperty('bars', 'effect', 0.3, crochet*0.001*2, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'expoIn')
        mirror(false,true,"","zoom",0,2.5,2,crochet,"expoIn")
        lascosasdelhud(0,crochet,2,"cubeIn")
    elseif curStep == 1276 then
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*1, 'cubeIn')
    elseif curStep == 1280 then
        bf = false
        bloom(8,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*4, 'quadOut')
        bumpzoom(8,0.8)
    elseif curStep == 1296 then
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*4, 'quadOut')
        bumpzoom(8,0.8)
    elseif curStep == 1312 then
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*4, 'quadOut')
        bumpzoom(8,0.8)
    elseif curStep == 1328 then
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'quadOut')
        bumpzoom(8,0.8)
    end
    if curStep == 1308 then
        bumpzoom(4,0.8)
    end
    if curStep == 1296 then
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*10, 'cubeIn')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*12, 'cubeIn')
        mirror(false,true,"","zoom",0,1,10,crochet,"cubeIn")
    elseif curStep == 1336 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,40,2,crochet,"cubeIn")
        lascosasdelhud(1,crochet,2,"cubeOut")
    elseif curStep == 1340 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*1, 'expoIn')
        setShaderProperty("mirror3","x",-2)
        tweenShaderProperty('mirror3', 'x', 0, crochet*0.001*2, 'quadInOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeOut")
    elseif curStep == 1344 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
    end
    if curStep == 1728 then
        setShaderProperty("greyscale","strength",1)
        setShaderProperty("speedlines","transparency",1)
    elseif curStep == 1752 then
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == 1760 then
        bloom(8,1,crochet,2,"cubeOut")
        setShaderProperty("speedlines","transparency",0)
    elseif curStep == 1856 then
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("speedlines","transparency",1)
        tweenShaderProperty('greyscale', 'strength', 1, crochet*0.001*8, 'cubeIn')
        set("defaultCamZoom", 0.6)
    elseif curStep == 1888 then
        mirror(false,true,"","zoom",0,1.5,8,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-30,8,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.35, crochet*0.001*8, 'cubeIn')
        bloom(1,0,crochet,8,"cubeIn")
    elseif curStep == 1904 then
        setShaderProperty("mirror3","x",0)
        tweenShaderProperty('mirror3', 'x', -2, crochet*0.001*5, 'cubeIn')
        tweenShaderProperty('bars', 'effect', 0.6, crochet*0.001*4, 'cubeIn')
    end
        
    if curStep >= 256 and curStep < 896 or curStep >= 1152 and curStep < 1280
    or  curStep >= 1344 and curStep < 1728 or curStep >= 1744 and curStep < 1888 then
        if curStep % 8 == 0 then
            bumpzoom(8,0.8)
        end
    end
    if curStep >= 0 and curStep < 128 or curStep >= 896 and curStep < 1152 then
        if curStep % 32 == 0 then
            bumpzoom(8,0.8)
        elseif curStep % 32 == 8 then
        --    flechas
        elseif curStep % 32 == 18 then
        --    flechas
        elseif curStep % 32 == 20 then
            bumpzoom(8,0.8)
        elseif curStep % 32 == 24 then
        --    flechas
        end
    end
    parte1(430)
    parte1(1390)
    parte2(552)
    parte2(1512)

    drop(644)
    drop(772)
    drop(1604)
    drop(1732)
    dropbf(708)
    dropbf(836)
    dropbf(1668)
    dropbf(1796)
end
function parte1(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,1.5,4,crochet,"linear")
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*4, 'linear')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*4, 'linear')
    elseif curStep == s+18 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+26 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+34 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'quadOut')
    elseif curStep == s+42 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.35, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+46 then
        setShaderProperty("mirror","x",4)
        tweenShaderProperty('mirror', 'x', 0, crochet*0.001*2.5, 'cubeInOut')
    elseif curStep == s+50 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+66 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.3, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+74 then
        mirror(false,true,"","zoom",0,1,2,crochet,"expoIn")
        tweenShaderProperty('mirror', 'angle', -20, crochet*0.001*2, 'expoIn')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'expoIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'expoIn')
    elseif curStep == s+82 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeOut")
    end
end
function parte2(s)
    if curStep == s then
        mirror(true,true,"angle","angle",1080,0,6,crochet,"cubeInOut")
    elseif curStep == s+8 then
        mirror(false,true,"","zoom",0,1.5,4,crochet,"linear")
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*4, 'linear')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*4, 'linear')
    elseif curStep == s+16 then
       -- mirror(true,true,"y","y",-2,0,2,crochet,"expoInOut")
    elseif curStep == s+24 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == s+32 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*4, 'cubeOut')
    elseif curStep == s+40 then
        mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'cubeOut')
    elseif curStep == s+52 then
        setShaderProperty("mirror","x",0)
        tweenShaderProperty('mirror', 'x', 2, crochet*0.001*2, 'cubeInOut')
    elseif curStep == s+56 then --608
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.3, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*2, 'quadOut')
    elseif curStep == s+64 then
        mirror(false,true,"","zoom",0,3,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.35, crochet*0.001*2, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*2, 'quadOut')
    elseif curStep == s+72 then
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("greyscale","strength",1)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+80 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-40,2,crochet,"cubeIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'cubeOut')
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*2, 'expoIn')
    elseif curStep == s+84 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        setShaderProperty("mirror3","x",0)
        tweenShaderProperty('mirror3', 'x', 2, crochet*0.001*2, 'cubeInOut')
        tweenShaderProperty('greyscale', 'strength', 0, crochet*0.001*1, 'cubeIn')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeIn')
    elseif curStep == s+88 then
        bloom(4,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeOut")
    end
end
function drop(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+4  then
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1.5, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*1.5, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1.5, 'quadOut')
    elseif curStep == s+10 then
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*1, 'quadOut')
    elseif curStep == s+14 or curStep == s+46 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'quadOut')
    elseif curStep == s+18 then--662
        mirror(false,true,"","zoom",0,2.5,1.5,crochet,"quadOut")
        mirror(true,true,"angle","angle",720,0,2,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1.5, 'quadOut')
    elseif curStep == s+24 then--668
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+34 then--678
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.35, crochet*0.001*1, 'quadOut')
    elseif curStep == s+38 then--682
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.05, crochet*0.001*1, 'quadOut')
    elseif curStep == s+42 then--686
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'quadOut')
    elseif curStep == s+52 then--696
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,20,1,crochet,"quadOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.35, crochet*0.001*1, 'quadOut')
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"expoIn")
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*1, 'expoIn')
    elseif curStep == s+60 then
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
end
function dropbf(s)
    if curStep == s then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1, 'cubeOut')
    elseif curStep == s+4  then
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*1.5, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*1.5, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1.5, 'quadOut')
    elseif curStep == s+10 then
        mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1, 'quadOut')
    elseif curStep == s+14 or curStep == s+46 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 0, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'quadOut')
    elseif curStep == s+18 then--662
        mirror(false,true,"","zoom",0,2.5,1.5,crochet,"quadOut")
        mirror(true,true,"angle","angle",-720,0,2,crochet,"cubeInOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1.5, 'quadOut')
    elseif curStep == s+24 then--668
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*1, 'expoIn')
    elseif curStep == s+34 then--678
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle',-10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.17, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.35, crochet*0.001*1, 'quadOut')
    elseif curStep == s+38 then--682
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', 10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.05, crochet*0.001*1, 'quadOut')
    elseif curStep == s+42 then--686
        mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
        tweenShaderProperty('mirror', 'angle', -10, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('bars', 'effect', 0.25, crochet*0.001*1, 'quadOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.2, crochet*0.001*1, 'quadOut')
    elseif curStep == s+52 then--696
        mirror(false,true,"","zoom",0,3,1,crochet,"quadOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"quadOut")
        tweenShaderProperty('EyeFishEffectGame', 'power', 0.35, crochet*0.001*1, 'quadOut')
    elseif curStep == s+56 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
        mirror(false,true,"","angle",0,20,1,crochet,"expoIn")
        tweenShaderProperty('bars', 'effect', 0.4, crochet*0.001*1, 'expoIn')
    elseif curStep == s+60 then
        tweenShaderProperty('bars', 'effect', 0, crochet*0.001*2, 'cubeOut')
        tweenShaderProperty('EyeFishEffectGame', 'power', 0, crochet*0.001*2, 'cubeOut')
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    end
end