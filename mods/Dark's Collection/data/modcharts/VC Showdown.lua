
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
function createPost()
    
    initShader("vcrchroma","vcrchroma")
    setShaderProperty('vcrchroma', 'speed', 1.2)
    lascosasdelhud(0,stepCrochet,1,"cubeOut")

    initShader('heat', 'HeatEffect')
    setCameraShader('hud', 'heat')
    setCameraShader('game', 'heat')
    setShaderProperty('heat', 'strength', 1)

    makeSprite('chessxd', '', 0, 0, 1)
	defaultZoom = getCamZoom()
    makeGraphic('chessxd', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessxd')
	setActorScroll(0,0, 'chessxd')
    setActorAlpha(1, 'chessxd')
    local lol = getActorLayer('girlfriend')
	setActorLayer('chessxd', lol)

    initShader('chess', 'chess') 
    setActorShader('chessxd', 'chess') 
    setShaderProperty('chess', 'transparency', 0.0)
    setShaderProperty('chess', 'direction', -1.0)

    initShader("speedlines","speedlines")
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)


    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.8)
    setShaderProperty('godrays', 'density',0.25)
    setShaderProperty('godrays', 'weigth', 0.5)

    initShader("particles","particlesnew")
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.87)
    setShaderProperty('particles', 'red', 2)
    setShaderProperty('particles', 'blue', 1.5)
    setShaderProperty('particles', 'green', 1)

    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setShaderProperty('bump', 'y', 0)

   
    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 2)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('mirror3', 'PincushNewEffect')--
   -- setCameraShader('game', 'mirror3')
    setCameraShader('hud', 'mirror3')
    setShaderProperty('mirror3', 'zoom', 1)
    setShaderProperty('mirror3', 'angle', 0)
	setShaderProperty('mirror3', 'x', 0)
    setShaderProperty('mirror3', 'y', 0)
	setShaderProperty('mirror3', 'barrel', 0)
    setShaderProperty('mirror3', 'doChroma', true)


    initShader('scanline', 'ScanlineEffect')--
    setCameraShader('game', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0.2)

    initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)

    initShader('ca2', 'ChromAbEffect')
    setCameraShader('game', 'ca2')
    setCameraShader('hud', 'ca2')
    setShaderProperty('ca2', 'strength', 0.001)


    

    initShader('zoomblurgame', 'zoomblur')
    setCameraShader('game', 'zoomblurgame')
    setShaderProperty('zoomblurgame', 'posX', 2)
    setShaderProperty('zoomblurgame', 'posY', 0)
    setShaderProperty('zoomblurgame', 'focusPower', 3)
    

    initShader('bloom', 'BloomEffect')--
    -- setCameraShader('hud', 'bloom')
     setCameraShader('game', 'bloom')
     setShaderProperty('bloom', 'contrast', 0)

     initShader('vignette', 'VignetteEffect')
     setCameraShader('hud', 'vignette')
     setShaderProperty('vignette', 'strength', 15)
     setShaderProperty('vignette', 'size', 0.1)

     


     initShader('bars', 'bars')--
     setCameraShader('game', 'bars')
     setShaderProperty('bars', 'effect', 0.1)
 
     makeSprite('white', '', 0, 0, 1)
     setObjectCamera('white', 'hud')
     makeGraphic('white', 4000, 2000, '#FFFFFF')
     actorScreenCenter('white')
     setActorAlpha(0, 'white')

     makeSprite('blackBG', '', 0, 0, 1)
     makeGraphic('blackBG', 1920/getCamZoom(), 1080/getCamZoom(), '#000000')
     actorScreenCenter('blackBG')
     setActorScroll(0, 0, 'blackBG')
     setActorAlpha(0.15, 'blackBG')
     setActorLayer('blackBG', getActorLayer('girlfriend'))

end
local time = 0
local zoom = 1
local perlinX = 0
local perlinY = 0
local perlinSpeed = 0.9
local perlinXRange = 0.05
local perlinYRange = 0.05
local caWave = 0
local caWaveSpeed = 3
local caWaveRange = 0
local y = 0
local nose = true
local cam = true
function update(elapsed)

        perlinX = perlinX + elapsed*math.random()*perlinSpeed
        perlinY = perlinY + elapsed*math.random()*perlinSpeed
        setShaderProperty('mirror3', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
        setShaderProperty('mirror3', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
    
    caWave = caWave + elapsed*math.random()*caWaveSpeed
    setShaderProperty('ca', 'strength', ((-0.5 + perlin(0, caWave, 0))*caWaveRange))
    zoom = lerp(zoom, 1, elapsed*12)
    setShaderProperty('bump', 'zoom', zoom)
    y = lerp(y, 0, elapsed*12)
    setShaderProperty('mirror3', 'y', y)
    time = time + elapsed
    setCustomShaderFloat("godrays","iTime",time)
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("heat","iTime",time)
    setCustomShaderFloat("vcrchroma","iTime",time)
    setCustomShaderFloat("speedlines","iTime",time)
    setCustomShaderFloat("chess","iTime",time)

    if cam then
        set("camFollow.x",2000)
        set("camFollow.y",900)
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
    bloom(0,1,crochet,12,"linear")
    mirror(false,true,"","zoom",0,1,16,crochet,"expoIn")
    tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*12,"linear")
    tweenShaderProperty("greyscale","strength",0,crochet*0.001*16,"cubeIn")
end

function stepHit()

    if curStep == 56 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 64 or curStep == 192 then
        bloom(4,1,crochet,4,"cubeOut")
    elseif curStep == 96 then
        tweenShaderProperty("zoomblurgame","focusPower",2,crochet*0.001*6,"cubeIn")
        tweenShaderProperty("greyscale","strength",0.5,crochet*0.001*6,"cubeIn")
    elseif curStep == 112 then
        mirror(false,true,"","zoom",0,1.15,2,crochet,"cubeOut")
    elseif curStep == 120 then
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.1,crochet*0.001*1,"cubeOut")
    elseif curStep == 124 then
        mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-10,0.5,crochet,"cubeOut")
    elseif curStep == 126 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,0.5,crochet,"cubeIn")
    elseif curStep == 128 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,4,"cubeOut")
        lascosasdelhud(1,stepCrochet,8,"cubeOut")
    end
    if curStep == 176 then
        mirror(false,true,"","zoom",0,2,2,crochet,"quadIn")
        mirror(false,true,"","angle",0,20,2,crochet,"quadIn")
        tweenFadeIn("blackBG",1,crochet*0.001*2,"quadIn")
    elseif curStep == 184 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(8,1,crochet,2,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 238 then

        mirror(true,true,"x","x",-0.2,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1.5,"cubeOut")
    elseif curStep == 242 then
        tweenFadeIn("blackBG",0.8,crochet*0.001*2.5,"linear")
        tweenShaderProperty("mirror2","y",3,crochet*0.001*2.5,"cubeInOut")
        tweenShaderProperty("zoomblurgame","focusPower",4,crochet*0.001*2.5,"linear")
        mirror(true,true,"x","x",0.2,0,1,crochet,"cubeOut" )
    elseif curStep == 248 then
        mirror(false,true,"","angle",0,220,2,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        tweenShaderProperty("zoomblurgame","focusPower",0,crochet*0.001*2,"cubeOut")
    elseif curStep == 256 then
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
       -- mirror(false,true,"","x",0,-1,2,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",1,crochet*0.001*2,"cubeIn")
    end
    if curStep == 272 or curStep == 336 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
        mirror(false,true,"","angle",0,200,2,crochet,"cubeIn")
    elseif curStep == 280 or curStep == 344 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 284 or curStep == 348 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 288 or curStep == 352 then
        mirror(true,true,"y","y",-0.2,0,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",160,180,1,crochet,"cubeOut")
    elseif curStep == 292 or curStep == 356 then
        mirror(true,true,"y","y",0.2,0,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",160,180,1,crochet,"cubeOut")
    elseif curStep == 296 or curStep == 360 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        caWaveRange = 0.05
        triggerEvent('screen shake', (stepCrochet*0.001*8)..',0.009')
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
    elseif curStep == 300 or curStep == 364 then
        mirror(true,true,"angle","angle",200,180,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 304 or curStep == 368 then
        caWaveRange = 0
    elseif curStep == 308 or curStep == 324 or curStep == 372 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
    elseif curStep == 312 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,200,1,crochet,"cubeOut")
    elseif curStep == 316 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,160,1,crochet,"cubeIn")
    elseif curStep == 320 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 328 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    end
    if curStep == 372 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 376 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,200,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeOut")
        lascosasdelhud(0,stepCrochet,8,"cubeOut")
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 496 then
        tweenFadeIn("white",1,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror2","barrel",5,crochet*0.001*4,"cubeIn")
    elseif curStep == 512 then
        tweenFadeIn("white",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        nose = false
    elseif curStep == 624 then
        tweenShaderProperty("titleeffect","money",0.3,crochet*0.001*4,"cubeOut")
        mirror(false,true,"","y",0,-0.25,4,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,4,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("mirror2","barrel",-5,crochet*0.001*4,"cubeIn")
    elseif curStep == 640 then
        nose = true
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*2,"cubeOut")
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        mirror(true,true,"y","y",0,0,1,crochet,"")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        setCameraShader('game', 'vcrchroma')
        setShaderProperty('speedlines', 'transparency', 0)
        caWaveRange = 0.02
       -- setShaderProperty('particles', 'transparency', 0)
    end

    if curStep == 664 then
        mirror(false,true,"","angle",0,160,2,crochet,"cubeIn")
        mirror(false,true,"","x",0,2,2,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 672 then
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
        --mirror(false,true,"","x",0,0,2,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")    
    elseif curStep == 696 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeOut")    
        tweenShaderProperty("mirror2","y",4,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeOut")
    elseif curStep == 700 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.15,crochet*0.001*1,"cubeIn")    
    elseif curStep == 704 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 708 then
        tweenFadeIn("blackBG",0.7,crochet*0.001*1,"linear")
        tweenShaderProperty("speedlines","transparency",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 712 then
        tweenShaderProperty("mirror2","x",2,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",40,0,1,crochet,"cubeOut")
    elseif curStep == 716 then
        tweenShaderProperty("speedlines","transparency",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","x",3,crochet*0.001*1,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")    
    elseif curStep == 720 then
        tweenShaderProperty("mirror2","y",3,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 724 then
        tweenShaderProperty("mirror2","x",2,crochet*0.001*1.5,"quadIn")
        tweenShaderProperty("speedlines","transparency",1,crochet*0.001*1.5,"cubeIn")
        tweenFadeIn("blackBG",0.8,crochet*0.001*1.5,"cubeIn")
    elseif curStep == 728 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 730 then
  --      mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,2.5,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*0.5,"cubeOut")    
    elseif curStep == 732 then
        tweenShaderProperty("mirror2","x",3,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeIn") 
        tweenShaderProperty("speedlines","transparency",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 736 then
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")  
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut") 
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 744 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
    elseif curStep == 748 then
        mirror(false,true,"","angle",0,200,1,crochet,"cubeIn")
        tweenFadeIn("blackBG",0.8,crochet*0.001*1,"linear") 
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"linear")
        tweenShaderProperty("speedlines","transparency",1,crochet*0.001*1,"linear")
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 752 then
        mirror(false,true,"","angle",0,180,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        tweenFadeIn("blackBG",0,crochet*0.001*1,"cubeOut") 
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*2,"linear")
        tweenShaderProperty("speedlines","transparency",0,crochet*0.001*2,"linear")
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 756 then
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeIn")
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,1.2,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")  
        mirror(false,true,"","angle",0,-180,3,crochet,"cubeInOut")
    elseif curStep == 764 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 768 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")  
        bloom(8,1,crochet,2,"cubeOut")
    elseif curStep == 772 then
        tweenShaderProperty("mirror2","x",2.5,crochet*0.001*1,"quadIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"quadIn")  
        mirror(false,true,"","zoom",0,0.7,1,crochet,"quadIn")
        mirror(false,true,"","angle",0,-200,1,crochet,"quadIn")
        tweenShaderProperty("chess","transparency",0,crochet*0.001*1,"linear")
    elseif curStep == 776 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",3,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeIn") 
    elseif curStep == 784 then
        zoom = 0.8
        tweenShaderProperty("chess","transparency",0.1,crochet*0.001*1,"linear")
        bloom(8,1,crochet,2,"cubeOut")
    end
    if curStep > 384-4 and curStep <= 484 or curStep > 512-4 and curStep <= 624 or curStep > 640-4 and curStep <= 696 
    or curStep > 700-4 and curStep <= 730  then
        if nose then
            if curStep % 16 == 0 then
                bloom(8,1,crochet,2,"cubeOut")
            end
        end
        if curStep % 8 == 0 then
            tweenShaderProperty("mirror","zoom",1,crochet*0.001*1,"cubeOut")
        elseif curStep % 8 == 4 then
            tweenShaderProperty("mirror","zoom",0.7,crochet*0.001*1,"cubeIn")
        end
    end
    if curStep > 0 and curStep <= 128 then
        if curStep % 32 == 1 or curStep % 32 == 6 or curStep % 32 == 12 
        or curStep % 32 == 18 or curStep % 32 == 24 then
           zoom = 0.85
        end
    end
      if curStep > 128 and curStep <= 176 or curStep > 192 and curStep <= 384  then
        if curStep % 32 == 0 or curStep % 32 == 12 or curStep % 32 == 18 
        or curStep % 32 == 26 or curStep % 32 == 30 then
           zoom = 0.8
        end
    end

    if curStep > 384 and curStep <= 640 and 
       (curStep % 32 == 0 or curStep % 32 == 4 or curStep % 32 == 8 or 
        curStep % 32 == 12 or curStep % 32 == 14 or curStep % 32 == 16 or 
        curStep % 32 == 20 or curStep % 32 == 24 or curStep % 32 == 28 or 
        curStep % 32 >= 29) then
        zoom = 0.8
        --if curStep % 4 == 0 then
       --     y = 0.1 * yDirection
       --     yDirection = -yDirection
       -- else
       --     y = -0.05
       -- end
    end
    
 
end

