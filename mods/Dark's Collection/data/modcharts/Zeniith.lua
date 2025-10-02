function createPost()
     local shaders = {
        {"pixel", "MosaicEffect", {strength = 0}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}}, 
        {"mirror", "BarrelBlurEffect", {zoom = 3, angle = 0, x = 0, y = 0, barrel = 0,warp = 0.4, doChroma = true}},
        {"bars", "bars", {effect = 0.55,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"greyscale", "GreyscaleEffect", {strength = 0}},   
        {"bloom", "BloomEffect", {contrast = 0 , brightness = 0,effect = 0, strength = 0}},
        
        
     }
 
    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        if name ~= "bump" and name ~= "mirror2" and name ~= "mirror"
        and name ~= "bars" and name ~= "fish" and name ~= "Sunrays"
         and name ~= "pixel"  and name ~= "mandela" and name ~= "ca"
        and name ~= "distorcion"  then
            setCameraShader('hud', name)
        end 
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
end
function startSong()
    bloom(0,1,crochet,32,"")
    tweenShader("bars", "effect", 0, crochet * 0.032, "quadOut")
    mirror(false,true,"","zoom",0,1,32,crochet,"quadOut")
end
function update(elapsed)
    zoom = lerp(zoom, 1, elapsed * 6)
    setShaderProperty('bump', 'zoom', zoom)
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
function stepHit()
    if curStep == 124 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "quadOut")
        mirror(false,true,"","warp",0,0,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    elseif curStep == 160 or curStep == 960 or curStep == 1344 then
        set("defaultCamZoom", 0.7)
    elseif curStep == 192 or curStep == 992 or curStep == 1376 then
        bloom(2,1,crochet,2,"")
        set("defaultCamZoom", 0.45)
    elseif curStep == 256 or curStep == 320 or curStep == 1056 or curStep == 1120 or curStep == 1440 or curStep == 1504 then
        setProperty('', 'cameraSpeed', 3)
        tweenShader("bars", "effect", 0.25, crochet * 0.001, "cubeOut")
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeOut")
    elseif curStep == 260 or curStep == 324 or curStep == 1060 or curStep == 1124 or curStep == 1444 or curStep == 1508 then
        setProperty('', 'cameraSpeed', 1)
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 384 or curStep == 1176 or curStep == 1240 or curStep == 1560 then
         mirror(false,true,"","barrel",0,2,1,crochet,"cubeOut")
    elseif curStep == 388 or curStep == 1180 or curStep == 1244 or curStep == 1564 then
         mirror(false,true,"","barrel",0,-2,1,crochet,"cubeIn")
    elseif curStep == 392 or curStep == 1568 then
       set("defaultCamZoom", 0.7)
         tweenShader("greyscale", "strength",1, crochet * 0.001, "cubeOut")
        mirror(false,true,"","barrel",0,0,2,crochet,"cubeOut")
        flashCamera("hud","",2)
    elseif curStep == 496 then
         tweenShader("greyscale", "strength",0, crochet * 0.006, "cubeOut")
    elseif curStep == 556 then
         mirror(false,true,"","angle",0,-25,0.5,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,0.5,crochet,"cubeOut")
    elseif curStep == 558 then
          mirror(false,true,"","angle",0,25,0.5,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
    elseif curStep == 560 then
            bloom(2,1,crochet,2,"")
            set("defaultCamZoom", 0.45)
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 588 then
        mirror(false,true,"","x",0,1,2,crochet,"cubeInOut")
     elseif curStep == 620 then
        mirror(false,true,"","x",0,2,2,crochet,"cubeInOut")
     elseif curStep == 640 then
        tweenShader("greyscale", "strength",1, crochet * 0.004, "cubeIn")
     elseif curStep == 656 then
        tweenShader("greyscale", "strength",0, crochet * 0.002, "cubeOut")
        bloom(2,1,crochet,2,"")
     elseif curStep == 768 then
        mirror(false,true,"","angle",0,180,4,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
      elseif curStep == 776 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
      elseif curStep == 784 then
        flashCamera("hud","",2)
        tweenShader("greyscale", "strength",1, crochet * 0.001, "cubeOut")
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
      elseif curStep == 844 then
         tweenShader("greyscale", "strength",0, crochet * 0.001, "cubeIn")
         tweenShader("pixel", "strength",5, crochet * 0.001, "cubeIn")
      elseif curStep == 908 then
        tweenShader("bars", "effect",0.55, crochet * 0.001, "cubeIn")
         tweenShader("pixel", "strength",0, crochet * 0.001, "cubeIn")
      elseif curStep == 912 then
         tweenShader("bars", "effect",0.1, crochet * 0.004, "cubeIn")
      elseif curStep == 928 then
       bloom(2,1,crochet,2,"")
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
      elseif curStep == 1184 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","barrel",0,0,2,crochet,"cubeOut")
     elseif curStep == 1248 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","barrel",0,0,2,crochet,"cubeOut")
          mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")
     elseif curStep == 1256 then
          mirror(false,true,"","angle",0,-15,2,crochet,"cubeIn")
     elseif curStep == 1264 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
     elseif curStep == 1272 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
     elseif curStep == 1276 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
     elseif curStep == 1280 then
        mirror(true,true,"angle","angle",15,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
         bloom(2,1,crochet,2,"")
     elseif curStep == 1286 then
        mirror(true,true,"angle","angle",-15,0,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
     elseif curStep == 1292 then
        mirror(true,true,"angle","angle",15,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
     elseif curStep == 1296 then
             mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
     elseif curStep == 1300 then
        bloom(2,1,crochet,2,"")
        mirror(true,true,"zoom","zoom",2,1,2,crochet,"cubeOut")
     elseif curStep == 1308 then
         tweenShader("bars", "effect",0.55, crochet * 0.001, "cubeIn")
     elseif curStep == 1312 then
        bloom(2,1,crochet,2,"")
         tweenShader("bars", "effect",0.1, crochet * 0.002, "cubeOut")
     elseif curStep == 1588 then
        bloom(1,0,crochet,36,"")
    end
    if curStep == 1248 or curStep == 1256 or curStep == 1260 or curStep == 1264 or curStep == 1272 or curStep == 1276
    or curStep == 1280 or curStep == 1286 or curStep == 1282 or curStep == 1300 or curStep == 1306 or curStep == 1307 or curStep == 1308  then
        zoom = 0.7
    end
    if curStep >= 128 and curStep < 392 or curStep >= 928 and curStep < 1184 or curStep >= 1312 and curStep < 1588 then
        if curStep % 32 == 0 or curStep % 32 == 12 or curStep % 32 == 20 or curStep % 32 == 26 or curStep % 32 == 30 then
            zoom = 0.8
        end
    end 
    if curStep >= 560 and curStep < 784 then
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 8 or curStep % 16 == 11 or curStep % 16 == 13 then
            zoom = 0.7
        end
    end
     if curStep >= 656 and curStep < 720 then
        if curStep % 16 == 0 then
            mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
            mirror(true,true,"angle","angle",-15,0,2,crochet,"cubeOut")
        elseif curStep % 16 == 8 then
            mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
            mirror(true,true,"angle","angle",15,0,2,crochet,"cubeOut")
        end
    end
     if curStep >= 720 and curStep < 768 then
        if curStep % 4 == 0 then
           mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
        elseif curStep % 4 == 2 then
           mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
        end
    end
      if curStep >= 848 and curStep < 912 then
        if curStep % 4 == 0 then
            zoom = 0.78
        end
    end
    if curStep >= 1184 and curStep < 1248 then
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 7 or curStep % 16 == 10 or curStep % 16 == 12 then
            zoom = 0.7
        end
        if curStep % 16 == 12 then
             mirror(true,true,"y","y",0,2,2,crochet,"cubeInOut")
        end
    end
end