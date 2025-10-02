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
    lascosasdelhud(0)

    initShader('vignette', 'VignetteEffect')--
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size',0.5)

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
    setShaderProperty('mirror', 'zoom', 20)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror3', 'PincushNewEffect')--
    setCameraShader('game', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.005)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
    
    makeSprite('topBar', 'topBar', -1200, 700, 1)
    makeGraphic('topBar',4000,720,'0xFF000000')
    actorScreenCenter('topBar')
    setActorLayer('topBar', layershit)
    setActorY(-350,'topBar')
    setObjectCamera('topBar', 'hud')
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
    makeGraphic('bottomBar',4000,720,'0xFF000000')
    actorScreenCenter('bottombar')
    setActorLayer('bottomBar', layershit)
    setActorY(350,'bottomBar')
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green',1.5)
    setShaderProperty('color', 'blue',1.5)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')

    setShaderProperty('EyeFishEffectGame', 'power', 0.1)

    makeCamera("nose")
    makeAnimatedSprite('speed', 'speedlines', 427,242)
    addActorAnimation('speed', 'speed', 'speedlines speed', 24, true)
    playActorAnimation('speed', 'speed', true)
    setActorScale(3, 'speed')
    setObjectCamera("speed", 'nose')
    setActorAlpha(0, 'speed')

    for i = 0,16 do
        setActorAlpha(0,i)
        tweenActorProperty(i,"alpha",1,crochet*0.001*40,"cubeIn")
    end
end
function barras(value,speed,curStep,ease)
    tween("topBar",{y=-value},speed*0.001*curStep,ease)
    tween("bottomBar",{y=value},speed*0.001*curStep,ease)
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
    barras(650,crochet,40,"linear")
    mirror(false,true,"","zoom",0,1,66,crochet,"cubeOut")
end
local rotCam = false
local rotCamSpd = 2.65
local rotCamRange = 20
local rotCamInd = 0
local shaggys=false
local bf = false
function update(elapsed)
    if shaggys then
		set("camFollow.x",850)
        set("camFollow.y",1050)
        set("defaultCamZoom", 0.8)
	end
	if bf then
		set("camFollow.x", get("boyfriend.x")+225)
        set("camFollow.y", get("boyfriend.y")+150)
        set("defaultCamZoom", 0.8)
	end
    if rotCam then
        rotCamInd = rotCamInd + (elapsed / (1 / 50))
        setShaderProperty('mirror2', 'angle', math.sin(rotCamInd / 20 * rotCamSpd) * rotCamRange)
    else
        setShaderProperty('mirror2', 'angle', 0)
    end
end
local mirrorActive=true
function mirrorangles(s)
    if mirrorActive then 
        if curStep == s then
            mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
        elseif curStep == s+16 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            bloom(8,1,crochet,2,"cubeOut")
            rotCam=true
            rotCamSpd = 2.65
            rotCamRange = 20
            setActorAlpha(1, 'speed')
            triggerEvent('toggle checker bg','0.05',crochet*0.001*1)
        elseif curStep == s+128 then
            mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
            tweenShaderProperty("greyscale","strength",1,crochet*0.001*3,"cubeIn")
        elseif curStep == s+144 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            bloom(8,1,crochet,2,"cubeOut")
            setActorAlpha(0, 'speed')
            setShaderProperty('greyscale', 'strength', 0)
        end
    end
end
function drop(s)
    if curStep == s then
        rotCamSpd = 0.7
        triggerEvent('toggle checker bg','0.05',crochet*0.001*1)
    end
    if curStep >= s and curStep < s+96+96+32 then
        if curStep % 16 == 0 then
            setShaderProperty('mirror3', 'zoom', 0.8)
            tweenShaderProperty("mirror3","zoom",1,crochet*0.001*2,"cubeOut")
        end 
	end
    if curStep == s or curStep == s+96+32 then
        mirror(true,true,"y","y",0,-1,8,crochet,"cubeInOut")
        mirror(true,true,"x","x",0,-1,8,crochet,"cubeInOut")
    elseif curStep == s+32 or curStep == s+96+64 then
        mirror(true,true,"y","y",-1,-2,8,crochet,"cubeInOut")
        mirror(true,true,"x","x",-1,-2,8,crochet,"cubeInOut")
    elseif curStep == s+64 or curStep == s+96+96 then
        mirror(true,true,"y","y",0,1,8,crochet,"cubeInOut")
        mirror(true,true,"x","x",0,1,8,crochet,"cubeInOut")
    elseif curStep == s+96 or curStep == s+96+96+32 then
        mirror(true,true,"y","y",1,0,8,crochet,"cubeInOut")
        mirror(true,true,"x","x",1,2,8,crochet,"cubeInOut")
    end
    if curStep == s+96+96+48 then
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
    elseif curStep == s+96+96+64 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        rotCam=false
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
    end
end
local nosexd=true
function grey(s)
    if curStep == s then
        lascosasdelhud(0)
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == s+16 then
        mirror(true,true,"y","y",0,-1,8,crochet,"cubeInOut")
        mirror(true,true,"x","x",2,0,8,crochet,"cubeInOut")
    elseif curStep == s+32 or curStep == s+64 or curStep == s+96 then--1312 es 32 1344 es  64
        setShaderProperty('mirror3', 'zoom', 0.8)
        tweenShaderProperty("mirror3","zoom",1,crochet*0.001*2,"cubeOut")
    elseif curStep == s+80 then
        mirror(true,true,"y","y",-1,-2,6,crochet,"cubeInOut")
        mirror(true,true,"x","x",-2,-1,6,crochet,"cubeInOut")
    
    elseif curStep == s+120 then--1392
        if nosexd then
          mirror(true,true,"y","y",-2,0,2.5,crochet,"cubeInOut")
          mirror(true,true,"x","x",-1,0,2.5,crochet,"cubeInOut") 
          mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        end
    elseif curStep == s+124 then
        if nosexd then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        end
    elseif curStep == s+128 then
        bloom(8,1,crochet,2,"cubeOut")
    end
end
function stepHit()
    grey(1280)
    grey(1408)
    drop(768)
    drop(2048)
    mirrorangles(368)
    mirrorangles(624)
    mirrorangles(1040)
    mirrorangles(1168)
    mirrorangles(1648)
    mirrorangles(1904)
    mirrorangles(2320)
    mirrorangles(2448)
    if curStep == 1392 then
        nosexd=false
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
        mirror(true,true,"y","y",-2,0,4.5,crochet,"cubeInOut")
        mirror(true,true,"x","x",-1,0,4.5,crochet,"cubeInOut") 
    elseif curStep == 1408 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        nosexd=true
    end
    if curStep == 1264 or curStep == 2544 then
        mirrorActive=false
        mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
    elseif curStep == 1280 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        setActorAlpha(0, 'speed')
        setShaderProperty('greyscale', 'strength', 1)
        rotCamRange = 0
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
    end
    if curStep == 2560 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        rotCamRange = 0
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
    elseif curStep == 2688 then
        bloom(8,1,crochet,2,"cubeOut")
        setActorAlpha(0, 'speed')
        triggerEvent('toggle checker bg','0',crochet*0.001*16)
        mirror(false,true,"","zoom",0,2,40,crochet,"cubeIn")
        barras(350,crochet,36,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*40,"cubeIn")
        lascosasdelhud(0)
        for i = 0,16 do
            setActorAlpha(1,i)
            tweenActorProperty(i,"alpha",0,crochet*0.001*36,"cubeIn")
        end
    end
    if curStep == 368+144 or curStep == 1152 or curStep == 1792 or curStep == 2432 then
        rotCamRange = 0
        triggerEvent('toggle checker bg','0',crochet*0.001*1)
        setActorAlpha(0, 'speed')
    end
    if curStep == 640 or curStep == 768 or curStep == 960 
    or curStep == 1056 or curStep == 1280 or curStep == 1920
    or curStep == 2048 or curStep == 2240 or curStep == 2336 then
        shaggys = true
        bf = false
    elseif curStep == 704 or curStep == 832 or curStep == 1194
    or curStep == 1408 or curStep == 1984 or curStep == 2112 
    or curStep == 2464 then
        bf = true
    elseif curStep == 1024 or curStep == 1152 or curStep == 1280-16
    or curStep == 1536 or curStep == 2304 or curStep == 2432 or curStep == 2560 then
        shaggys = false
        bf = false
        set("defaultCamZoom", 0.5)
    end
    if curStep == 248 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 252 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 256 then
        setShaderProperty('greyscale', 'strength', 0)
        bloom(4,1,crochet,2,"cubeOut")
        lascosasdelhud(1)
    elseif curStep == 832 or curStep == 896 or curStep == 960
    or curStep == 2240 or curStep == 2112 or curStep == 2176 then
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 1536 then
        setShaderProperty('greyscale', 'strength', 0)
        lascosasdelhud(1)
        mirrorActive=true
    end
    if curStep >= 2560 and curStep < 2688 then
       if curStep % 8 == 0 then
           setShaderProperty('mirror3', 'zoom', 0.8)
           tweenShaderProperty("mirror3","zoom",1,stepCrochet*0.001*7.5,"cubeOut")
       end 
   end
    if curStep >= 256 and curStep < 768 or curStep >= 1040 and curStep < 1152 or curStep >= 1168 and curStep < 1280
     or curStep >= 1536 and curStep < 2304 or curStep >= 2320 and curStep < 2432 or curStep >= 2448 and curStep < 2560  then
        if curStep % 16 == 0 then
            setShaderProperty('mirror3', 'zoom', 0.85)
            tweenShaderProperty("mirror3","zoom",1,crochet*0.001*2,"cubeOut")
        elseif curStep % 16 == 8 then
            setShaderProperty('mirror3', 'zoom', 0.8)
            tweenShaderProperty("mirror3","zoom",1,crochet*0.001*2,"cubeOut")
        end 
	end
end