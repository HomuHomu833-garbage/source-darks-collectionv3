function createPost()
    set("camHUD.alpha",0)
    set("boyfriend.y",getActorY("boyfriend")-60)

    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('vcrchroma', 'vcrchroma')--
    setCameraShader('game', 'vcrchroma')
    setShaderProperty('vcrchroma', 'strength', 1)
    setShaderProperty('vcrchroma', 'speed', 1.2)
  
    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)

    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 3)
    setShaderProperty('mirror', 'angle',-25)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

   
    initShader('bump', 'BarrelBlurEffect')--
    setCameraShader('game', 'bump')
    setCameraShader('hud', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'angle',0)
	setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)
	setShaderProperty('bump', 'barrel', -0.1)
    setShaderProperty('bump', 'doChroma', true)

        initShader('titleeffect', 'coloreffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money',0)-- 1.1 es disco
    setShaderProperty('titleeffect', 'colorraro',0)
    initShader('speedlines', 'speedlines')--
    setCameraShader('game', 'speedlines')
    setShaderProperty('speedlines', 'transparency', 1)

    


    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.001)

    initShader('bloom', 'BloomEffect')--
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)
    
    initShader('color2', 'ColorOverrideEffect')
    setCameraShader('hud', 'color2')
    setCameraShader('game', 'color2')
    setShaderProperty('color2', 'red',1.25)
    setShaderProperty('color2', 'green', 1.25)
    setShaderProperty('color2', 'blue', 1.25)
    
    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.2)

   
end
local time = 0
local cam = true
function update(elapsed)
    if cam then
        set("camFollow.x",900)
        set("camFollow.y",600)
    end
    time = time + elapsed
    setCustomShaderFloat("vcrchroma","iTime",time)
    setCustomShaderFloat("speedlines","iTime",time)
    setShaderProperty('titleeffect', 'uTime',time)
    zoom = lerp(zoom, 1, elapsed*8)
    setShaderProperty('bump', 'zoom', zoom)
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
    tweenShaderProperty("greyscale","strength",0.5,crochet*0.001*32,"cubeIn")
    mirror(false,true,"","zoom",0,1,31,crochet,"cubeIn")
    mirror(false,true,"","angle",0,0,16,crochet,"cubeOut")
    bloom(0,1,crochet,12,"linear")
end
function stepHit()
    if curStep == 124 or curStep == 254 then
        zoom = 0.8
    elseif curStep == 128 then
        bloom(2,1,crochet,2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*32,"cubeIn")
    elseif curStep == 240 or curStep == 496 or curStep == 1008 or curStep == 1520 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
    elseif curStep == 248 or curStep == 760 or curStep == 1016 then
        mirror(true,true,"angle","angle",360,0,4,crochet,"cubeInOut")
        tween("camHUD",{alpha = 1},crochet*0.001*4)
    elseif curStep == 252 or curStep == 508 or curStep == 1020 or curStep == 1532 then
        mirror(false,true,"","zoom",0,1,1,crochet,"expoIn")
    elseif curStep == 256 or curStep == 1024 then
        setShaderProperty('vcrchroma', 'strength', 0)
        bloom(2,1,crochet,2,"cubeOut")
    elseif curStep == 512 or curStep == 1280 then
        bloom(2,1,crochet,2,"cubeOut")
        setShaderProperty('speedlines', 'transparency', 0)
    elseif curStep == 768 then
        bloom(2,1,crochet,2,"cubeOut")
        setShaderProperty('vcrchroma', 'strength', 1)
        setShaderProperty('speedlines', 'transparency', 1)
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 896 then
        bloom(2,1,crochet,2,"cubeOut") 
    elseif curStep == 960 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*16,"cubeIn")
    elseif curStep == 1536 then
        setShaderProperty('speedlines', 'transparency', 1)
        flashCamera("hud","white",crochet*0.002)
        bloom(1,0,crochet,2,"cubeOut") 
    elseif curStep == 1544 then
        flashCamera("game","white",crochet*0.002)
        bloom(0,1,crochet,2,"cubeOut")
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeInOut")
        setShaderProperty('speedlines', 'transparency', 0)
            setShaderProperty('titleeffect', 'money',1.1)
    elseif curStep == 1664 then
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
    elseif curStep == 1670 then
         bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
    elseif curStep == 1800 then
                setShaderProperty('speedlines', 'transparency', 1)
            setShaderProperty('titleeffect', 'money',0)
        flashCamera("hud","",crochet*0.002)
        setShaderProperty("bars","effect",0.55)
    end
    if curStep == 1664 or curStep == 1667 or curStep == 1670 or curStep == 1540 or curStep == 1544 or curStep == 1564 or curStep == 1576 or curStep == 1596
    or curStep == 1608 or curStep == 1628 or curStep == 1640 or curStep == 1660 or curStep == 1692 or curStep == 1704  or curStep == 1724  or curStep == 1736 
     or curStep == 1756 or curStep == 1768  or curStep == 1788 or curStep == 1796 or curStep == 1800 then
        zoom = 0.8
    elseif curStep == 1552 or curStep == 1568 or curStep == 1584 or curStep == 1600 or curStep == 1616 or curStep == 1632 or curStep == 1648 or curStep == 1680
    or curStep == 1696 or curStep == 1712  or curStep == 1728  or curStep == 1744 or curStep == 1760 or curStep == 1776 or curStep == 1792 then
        zoom = 1.2
    end
    if curStep >= 128 and curStep < 256  then
        if curStep % 64 == 0 or curStep % 64 == 8 or curStep % 64 == 16 or curStep % 64 == 24
        or curStep % 64 == 32 or curStep % 64 == 40 or curStep % 64 == 48 or curStep % 64 == 56 
        or curStep % 64 == 60 then
            zoom = 0.8
        end
    end
    if curStep >= 896 and curStep < 1008 then
        if curStep >= 992 then
            if curStep % 2 == 0 then zoom = 0.8 end
        elseif curStep >= 960 then
            if curStep % 4 == 0 then zoom = 0.8 end
        else
            if curStep % 8 == 0 then zoom = 0.8 end
        end
    end
    
    if curStep >= 256 and curStep < 768 or curStep >= 1024 and curStep < 1536 then
        if curStep % 64 == 0 or curStep % 64 == 20 or curStep % 64 == 32 or curStep % 64 == 52
        or curStep % 64 == 60 then
            zoom = 0.8
        end
        if curStep % 64 == 8 or curStep % 64 == 24 or curStep % 64 == 40 or curStep % 64 == 56 then
            zoom = 1.2
        end
    end
    
end