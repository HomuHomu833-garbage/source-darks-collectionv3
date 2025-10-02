function createPost()
      setStageColorSwap('hue', 0.2)
    local shaders = { 
    {"Sunrays", "Sunrays", {strength = 5}},
    {"ca2", "ChromAbEffect", {strength = 0}},
    {"blur", "AnotherBlur", {amt = 10}},
    {"greyscale", "greyscale", {strength = 1}},
    {"mirror", "BarrelBlurEffect", {zoom = 2, angle = 110, x = 0, y = 0, dist = 0}},
    {"ca", "goodchrom", {amount = 0.7}},
    {"zoomblur", "zoomblur", {focusPower = 0, posY = -5}},
    {"bloom", "BloomEffect", {contrast = 0, brightness = 0}},
    {"scanline", "ScanlineEffect", {strength = 0.35, pixelsBetweenEachLine = 5}}
    }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
end
time = 0
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
function update(elapsed)
    time = time + elapsed
      for _, shader in ipairs({"Sunrays"}) do
        setCustomShaderFloat(shader, "iTime", time)
    end
     if perlinCaRange == 0 then
        setShaderProperty('ca2', 'strength', 0.002)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca2', 'strength', strength)
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
function startSong()
    tweenShader('ca','amount',0,crochet*0.032) 
    tweenShader('blur','amt',0,crochet*0.032) 
    tweenShader('bloom','contrast',1,crochet*0.032) 
    mirror(false,true,"","zoom",0,1,26,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,26,crochet,"cubeOut")
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShader("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function stepHit()
    if curStep == 128 then
          bloom(4,1,crochet,2,"cubeOut")
          setShaderProperty("greyscale","strength",0)
          setShaderProperty("ca2","strength",0.002)
          setShaderProperty("ca","amount",1)
          tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
    elseif curStep == 256 or curStep == 448 or curStep == 512 
    or curStep == 576 or curStep == 704 or curStep == 832 or curStep == 896
    or curStep == 960 or curStep == 1216 or curStep == 1344 or curStep == 1600
    or curStep == 1792 then
         bloom(2,1,crochet,2,"")
    elseif curStep == 368 then
         tweenShader('ca','amount',1,crochet*0.004,"cubeIn") 
    elseif curStep == 384 then
          bloom(4,1,crochet,2,"cubeOut")  tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
    elseif curStep == 632 or curStep == 1400 then
        tweenShader('ca','amount',1,crochet*0.002,"cubeIn") 
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 638 or curStep == 766 or curStep == 1150 or curStep == 1278
    or curStep == 1406 or curStep == 1534 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 640 or curStep == 1664 then
         tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("greyscale","strength",1)
        set("defaultCamZoom", 0.7) 
    elseif curStep == 736 or curStep == 1888 then
         tweenShader('ca','amount',1,crochet*0.008,"cubeIn") 
    elseif curStep == 760 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 768 then
        set("defaultCamZoom", 0.5) 
        mirror(true,true,"angle","angle",-15,0,2,crochet,"cubeOut")
         tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("greyscale","strength",0)
    elseif curStep == 1024 then
        set("defaultCamZoom", 0.7) 
         setShaderProperty("greyscale","strength",1)
         tweenShader('greyscale','strength',0,crochet*0.028) 
         bloom(2,1,crochet,2,"cubeOut")  setShaderProperty("ca","amount",1)
          tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
    elseif curStep == 1136 then
         tweenShader('ca','amount',1,crochet*0.004,"cubeIn") 
         tweenShader('greyscale','strength',1,crochet*0.001,"cubeOut") 
    elseif curStep == 1144 then
          mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 1148 then
          mirror(false,true,"","angle",0,-180,1,crochet,"cubeIn")
    elseif curStep == 1152 then
        mirror(true,true,"angle","angle",180,0,1,crochet,"cubeOut")
        tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,2,"cubeOut")
        setShaderProperty("greyscale","strength",0)
    elseif curStep == 1264 or curStep == 1520 then
        perlinCaRange = 0.025
        set("defaultCamZoom", 0.7) 
        triggerEvent('screen shake', (stepCrochet * 0.012) .. ',0.007')
    elseif curStep == 1276 or curStep == 1532 then
        perlinCaRange = 0
         mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
          mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 1280 or curStep == 1536 then
        set("defaultCamZoom", 0.8) 
        bloom(4,1,crochet,2,"cubeOut")
          setStageColorSwap('hue', 0.95)
         mirror(true,true,"angle","angle",-15,0,1,crochet,"cubeOut")
    elseif curStep == 1408 then
         tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,2,"cubeOut")
    elseif curStep == 1656 then
        tweenShader('ca','amount',1,crochet*0.002,"cubeIn") 

    elseif curStep == 1904 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
         tweenShader('blur','amt',10,crochet*0.002,"cubeOut") 
    elseif curStep == 1912 then
          tweenShader('blur','amt',0,crochet*0.002,"cubeIn") 
          mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
            mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
    elseif curStep == 1920 then
         perlinCaRange = 0.025
        triggerEvent('screen shake', (stepCrochet * 0.256) .. ',0.007')
        set("defaultCamZoom", 0.5) 
         setStageColorSwap('hue', 0.3)
         tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
        bloom(4,1,crochet,2,"cubeOut")
         mirror(true,true,"angle","angle",-180,0,1.5,crochet,"cubeOut")
    end
    if curStep == 512 or curStep == 1280 or curStep == 1536 then
        
         setShaderProperty("ca","amount",1)
          tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
    elseif curStep == 1344 or curStep == 1600 then
        tweenStageColorSwap('hue', 1.15,crochet*0.016,"cubeIn")
    elseif curStep == 1792 then
        tweenShader('greyscale','strength',0,crochet*0.032,"cubeIn") 
    end
    if curStep >= 1162 and curStep < 1276 or curStep >= 1408 and curStep < 1532 then
        if curStep % 64 == 0 or curStep % 64 == 10 or curStep % 64 == 16 or curStep % 64 == 22 or curStep % 64 == 26 or curStep % 64 == 34 or curStep % 64 == 44 or curStep % 64 == 48 or curStep % 64 == 54 or curStep % 64 == 60 then
            mirror(false,true,"","zoom",0,0.83,1,stepCrochet,"cubeIn")
        elseif curStep % 64 == 1 or  curStep % 64 == 11 or curStep % 64 == 17 or curStep % 64 == 23 or curStep % 64 == 27 or curStep % 64 == 35 or curStep % 64 == 45 or curStep % 64 == 49 or curStep % 64 == 55 or curStep % 64 == 61 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"")
        elseif curStep % 64 == 30 or curStep % 64 == 32 then
             mirror(false,true,"","zoom",0,0.83,1,stepCrochet,"cubeIn")
        elseif curStep % 64 == 31 or curStep % 64 == 33 then
             mirror(false,true,"","zoom",0,1,1,stepCrochet,"")
        end
    end
    if curStep >= 1280 and curStep < 1376 or curStep >= 1536 and curStep < 1632 then
        if curStep % 32 == 10 or curStep % 32 == 16 or curStep % 32 == 26 or curStep % 32 == 30 then
            mirror(false,true,"","zoom",0,0.83,1,stepCrochet,"cubeIn")
        elseif curStep % 32 == 11 or  curStep % 32 == 17 or curStep % 32 == 27 or curStep % 32 == 31  then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"")
        end
    end
    if curStep == 1216 then
        mirror(false,true,"","zoom",0,0.83,0.5,crochet,"cubeIn")
    elseif curStep == 1218 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"")
    end
    if curStep >= 1376 and curStep < 1392 or curStep >= 1632 and curStep < 1648  then
        if curStep % 8 == 0 then
            mirror(true, true, "zoom", "zoom", 0.87, 1, 0.5, crochet, "")
        end
    elseif curStep >= 1392 and curStep < 1400 or curStep >= 1648 and curStep < 1664  then
        if curStep % 4 == 0 then
            mirror(true, true, "zoom", "zoom", 0.87, 1, 0.5, crochet, "")
        end
    end

    if curStep >= 128 and curStep < 1136  or curStep >= 1664 and curStep < 1904 or curStep >= 1912  then
        -- 🔹 Rango 1024 y mayores (hasta 1136)
        if curStep >= 1024 and curStep < 1136 then
            if curStep < 1088 then
                if curStep % 8 == 0 then
                    mirror(true,true,"zoom","zoom",0.87,1,0.5,crochet,"")
                end
            elseif curStep < 1120 then
                if curStep % 4 == 0 then
                    mirror(true,true,"zoom","zoom",0.87,1,0.5,crochet,"")
                end
            else -- 1120 - 1135
                if curStep % 2 == 0 then
                    mirror(true,true,"zoom","zoom",0.87,1,0.5,crochet,"")
                end
            end
        else
            -- 🔹 Rango 128 - 1023
            if curStep % 32 == 0 or curStep % 32 == 20 then
                if curStep >= 1912 then
                     setShaderProperty("ca","amount",1)
                       tweenShader('ca','amount',0,crochet*0.004,"cubeOut") 
                    setShaderProperty("zoomblur","focusPower",3)
                       tweenShader('zoomblur','focusPower',0,crochet*0.002,"cubeOut") 
                end

                mirror(true,true,"zoom","zoom",0.87,1,0.5,crochet,"")
            end
        end
    end


end
