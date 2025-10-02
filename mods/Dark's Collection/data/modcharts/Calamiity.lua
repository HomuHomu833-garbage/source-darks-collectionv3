function hud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end

function createPost()
    set("dadCharacter1.alpha", 0)
   setActorLayer("dadCharacter1",getActorLayer("dadCharacter0"))
    set("dadCharacter1.x", getActorX("dadCharacter0") -450)
    set("dadCharacter0.x", getActorX("dadCharacter0") - 150 )
    set("dadCharacter1.y", getActorY("dadCharacter1")-10 )
     set("dadCharacter0.y", getActorY("dadCharacter1")+5 )
     hud(0, crochet, 1, 'cubeOut')
      local shaders = { 
         {"pixel", "MosaicEffect", {strength = 0}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0,warp= 0, doChroma = true}},
        {"mirror", "BarrelBlurEffect", {zoom = 3.5, angle = 0, x = 0, y = 1, barrel = 0,warp= 0, doChroma = true}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
         {"bars", "bars", {effect = 0.6,effect2 = 0, angle1 = 0 , angle2 = 0}},
         {"Glitchy", "Glitchy", {AMT = 0, SPEED = 0.3}},
        {"scanline", "ScanlineEffect", {strength = 0.5, pixelsBetweenEachLine = 5}},
        {"fish", "EyeFishEffect", {power = 0.5}},
        {"disco", "DiscoOverride", {brightness = 1 ,enableRainbow = 0}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},
        {"bloom", "BloomEffect", {contrast = 1 , brightness = 0,effect = 0, strength = 0.5}}
     }

      for _, shader in ipairs(shaders) do
          local name, effect, properties = shader[1], shader[2], shader[3]
          initShader(name, effect)
          setCameraShader('game', name)
      
          if name ~= "fish" and name ~= "Glitchy" 
          and name ~= "mirror2" and name ~= "mirror"
          and name ~= "bars" and name ~= "blur"
          and name ~= "bump" and name ~= "pixel" and name ~= "scanline" and name ~= "disco" then
              setCameraShader('hud', name)
          end 
       
          for prop, value in pairs(properties) do
              setShaderProperty(name, prop, value)
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

function songStart()
    mirror(false,true,"","zoom",0,1,28,crochet,"quadOut")
      mirror(false,true,"","y",0,0,28,crochet,"quadOut")
    tweenShader('bars','effect',0,crochet*0.032,'quadOut')
     tweenShader('greyscale','strength',0,crochet*0.032,'quadOut')
     tweenShader('fish','power',0,crochet*0.028,'quadOut')
end
time = 0
tommy,akiro,bf = false,false,false
a = 0
function update(elapsed)
    time = time + elapsed
    for _, shader in ipairs({"Glitchy","disco"}) do
        setCustomShaderFloat(shader, "iTime", time)
    end
       
        zoom = lerp(zoom, 1, elapsed * 8)
        setShaderProperty('bump', 'zoom', zoom)
        angle = lerp(angle, 0, elapsed * 8)
        setShaderProperty('bump', 'angle', angle)
        if curStep >= 1664 and curStep < 1792 then
         a = a + (elapsed / (1 / 120))
        setShaderProperty('bump', 'angle', math.sin(a / 100 * 3) * 5 + angle)
        end
        x = lerp(x, 0, elapsed * 8)
        setShaderProperty('bump', 'x', x)
    if tommy then
        set("camFollow.x", get("dad.x")+150)
        set("camFollow.y", get("dad.y")+350)
    end
    if akiro then
        set("camFollow.x", get("dadCharacter1.x")+250)
        set("camFollow.y", get("dadCharacter1.y")+250)
    end
    if bf then
        set("camFollow.x", get("boyfriend.x")+250)
        set("camFollow.y", get("boyfriend.y")+400)
    end

end
lol = 1
flipCount = 0 
bumpalto = {0,6,12,32,38,44,46,60,62,63,64,70,76,96,102,108,110,636,1148,1150}

function stepHit()
    for i = 1, #bumpalto do
        if curStep == bumpalto [i] then
            zoom = 0.7
        end
    end
    if curStep == 112 then
          tweenShader('pixel','strength',50,crochet*0.004,'cubeIn')
           mirror(false,true,"","zoom",0,4,4,crochet,"cubeIn")
    elseif curStep == 128 then
            tweenShader('bars','effect',0.07,crochet*0.004,'quadOut')
        flashCamera("hud","",crochet*0.002)
         hud(1, crochet, 4, 'cubeOut')
        mirror(true,true,"zoom","zoom",0.5,1,2,crochet,"cubeOut")
          tweenShader('pixel','strength',0,crochet*0.002,'cubeOut')
    end
    if curStep == 264 or curStep == 296 or curStep == 904 or curStep == 936 then
         mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
    elseif curStep == 280 or curStep == 312 or curStep == 920 or curStep == 952 then
         mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
    elseif curStep == 288 then
          mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
         tweenShader('greyscale','strength',1,crochet*0.001,'cubeOut') 
    elseif curStep == 294 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut') 
    elseif curStep == 368 or curStep == 1656-8 then
        tweenShader('bars','effect',0.55,crochet*0.004,'cubeIn') 
         tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn') 
    elseif curStep == 384 or curStep == 1664 then
         hud(0, crochet, 4, 'cubeOut')
         tommy = true
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut') 
        flashCamera("hud","",crochet*0.004)
         tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
    elseif curStep == 496 then
        tweenShader('pixel','strength',15,crochet*0.004,'cubeIn')
    elseif curStep == 512 then
         tweenShader('greyscale','strength',0.5,crochet*0.002,'cubeOut')
        bf = false
    elseif curStep == 524 or curStep == 1420 then
         mirror(true,true,"y","y",0,1,2,crochet,"cubeInOut")
    elseif curStep == 536 or curStep == 1432 then
         mirror(false,true,"","y",0,0.65,0.5,crochet,"cubeOut")
     elseif curStep == 539 or curStep == 1435 then
         mirror(false,true,"","y",0,0.35,0.5,crochet,"cubeOut")
     elseif curStep == 542 or curStep == 1438 then
         mirror(false,true,"","y",0,0,0.5,crochet,"cubeOut")
    elseif curStep == 556 or curStep == 1452 then
         mirror(true,true,"y","y",0,-1,2,crochet,"cubeInOut")
    elseif curStep == 568 or curStep == 1464 then
        tweenShader('pixel','strength',0,crochet*0.002,'cubeIn')
         mirror(false,true,"","y",0,-0.65,0.5,crochet,"cubeOut")
           tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
     elseif curStep == 571 or curStep == 1467 then
         mirror(false,true,"","y",0,-0.35,0.5,crochet,"cubeOut")
     elseif curStep == 574 or curStep == 1470 then
         mirror(false,true,"","y",0,0,0.5,crochet,"cubeOut")
     elseif curStep == 576 or curStep == 1472 then
          tweenShader('bars','effect',0.1,crochet*0.002,'cubeOut') 
     elseif curStep == 752 then
         mirror(false,true,"","zoom",0,2,1,crochet,"backIn")
          mirror(true,true,"angle","angle",0,-90,4,crochet,"cubeIn")
            tweenShader('pixel','strength',15,crochet*0.004,'cubeIn')
           tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn')
     elseif curStep == 756 then
         mirror(false,true,"","zoom",0,3,1,crochet,"backIn")
     elseif curStep == 760 then
         mirror(false,true,"","zoom",0,4,1,crochet,"backIn")
         weenShader('bars','effect',0.55,crochet*0.002,'cubeIn') 
     elseif curStep == 764 then
         mirror(false,true,"","zoom",0,5,1,crochet,"backIn")
     elseif curStep == 768 then
        flashCamera("hud","black",crochet*0.002)
         mirror(true,true,"zoom","zoom",0.5,1,1,crochet,"cubeOut")
          mirror(true,true,"angle","angle",60,0,3,crochet,"cubeOut")
         tweenShader('bars','effect',0.07,crochet*0.002,'cubeOut')
     elseif curStep == 960 then
          tweenShader('pixel','strength',0,crochet*0.008,'cubeIn')
           tweenShader('greyscale','strength',0,crochet*0.008,'cubeIn') 
     elseif curStep == 1008 then
         akiro = true 
         tween("dadCharacter1",{alpha = 1,x = getActorX("dadCharacter1")+300},crochet*0.002,'quadOut')
        tween("dadCharacter0",{alpha = 0,x = getActorX("dadCharacter0")-300},crochet*0.002,'cubeInOut')
     elseif curStep == 1024 then
        flashCamera("hud","",crochet*0.002)
         hud(1, crochet, 4, 'cubeOut')
          set("defaultCamZoom",0.45)
     elseif curStep == 1032 or curStep == 1064 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
     elseif curStep == 1036 or curStep == 1068 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1044 or curStep == 1052 or curStep == 1076 or curStep == 1084 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
     elseif curStep == 1048 or curStep == 1080 then
        lol = -lol
         mirror(true,true,"x","x",0,2*lol,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
     elseif curStep == 1056 or curStep == 1088 or curStep == 1128 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    end
    if curStep == 1056 then
        akiro,bf = false,true
    elseif curStep == 1088 then
        akiro,bf = false,false
    elseif curStep == 1096 then
         mirror(false,true,"","y",0,1,2,crochet,"cubeOut")
     elseif curStep == 1112 then
         mirror(false,true,"","y",0,2,2,crochet,"cubeOut")
     elseif curStep == 1120 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeIn")
     elseif curStep == 1136 then
         mirror(true,true,"y","y",0,4,4,crochet,"cubeIn")
          mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
     elseif curStep == 1144 then
         tweenShader('pixel','strength',10,crochet*0.002,'cubeIn')
           tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn') 
         mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")  
     elseif curStep == 1152 then
        flashCamera("game","black",1)
           mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
     elseif curStep == 1208 then
        tweenShader('pixel','strength',0,crochet*0.002,'cubeIn')
           tweenShader('greyscale','strength',0,crochet*0.002,'cubeIn') 
     elseif curStep == 1216 or curStep == 1280 then
         flashCamera("hud","",1)
     elseif curStep == 1264 then
        tommy = true
         tweenShader('pixel','strength',5,crochet*0.004,'cubeIn')
           tweenShader('greyscale','strength',1,crochet*0.004,'cubeIn') 
         tween("dadCharacter1",{alpha = 0,x = getActorX("dadCharacter1")-300},crochet*0.002,'cubeInOut')
        tween("dadCharacter0",{alpha = 1,x = getActorX("dadCharacter0")+300},crochet*0.002,'quadOut')
    end
    if curStep == 1656 then
                 tween("dadCharacter1",{alpha = 1,x = getActorX("dadCharacter1")+500},crochet*0.002,'quadOut')
    end
    if curStep == 1408 or curStep == 1536 then
          bf = false
           mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    end
    if curStep == 1520 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
    elseif curStep == 1528 then
          mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        tweenShader('pixel','strength',0,crochet*0.002,'cubeIn')
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeIn') 
    elseif curStep == 1664 then
        triggerEvent('screen shake', (stepCrochet * 0.001 * 80) .. ',0.01')
        setShaderProperty('disco', 'brightness', 2)
        setShaderProperty('disco', 'enableRainbow', 0.7)
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        tweenShader('Glitchy','AMT',0.05,crochet*0.002,'cubeOut')
    elseif curStep == 1744 then
        mirror(false,true,"","zoom",0,3,4,crochet,"cubeIn")
    elseif curStep == 1760 then
        bf,tommy = true,false
         mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
    elseif curStep == 1764 then
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 1768 then
         mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
    elseif curStep == 1772 then
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
    elseif curStep == 1792 then
        flashCamera("hud","",2)
        bf = false
        tween("camHUD",{alpha = 0},crochet*0.032)
    elseif curStep == 1916 then
        tweenShader('bars','effect',0.55,crochet*0.001,'cubeIn') 
    elseif curStep == 1920 then
         flashCamera("game","",2)
    end

    if curStep >= 128 and curStep < 384 or curStep >= 1024 and curStep < 1136 then
        if curStep % 8 == 0 then
            set("defaultCamZoom", math.random() * 0.2 + 0.45)
        end
        if curStep % 32 == 0 or curStep % 32 == 6 or curStep % 32 == 12 or curStep % 32 == 20  then
            zoom = 0.8
        end
        
        local flip = ((math.floor((curStep - 128) / 32) % 2) == 0) and 1 or -1
        if curStep % 32 == 24 then
            angle = 15 * flip
            x = -0.1
            triggerEvent("add Camera Zoom", "", "-0.07")
        elseif curStep % 32 == 8 then
            triggerEvent("add Camera Zoom", "", "-0.07")
            angle = -15 * flip
            x = 0.1
        end
    end

    if curStep >= 384 and curStep < 504 or curStep >= 1536 and curStep < 1792 then
      
        if curStep % 16 == 0 or curStep % 16 == 6 or curStep % 16 == 12 or curStep % 16 == 14  then
            zoom = 0.8
        end
    end
    if curStep >= 512 and curStep < 752 then
        local flip = ((math.floor((curStep - 128) / 32) % 2) == 0) and 1 or -1
        if curStep % 16 == 0 then
            angle = 15 * flip
            x = -0.1
            triggerEvent("add Camera Zoom", "", "-0.07")
        elseif curStep % 16 == 8 then
            triggerEvent("add Camera Zoom", "", "-0.07")
            angle = -15 * flip
            x = 0.1
        end
    end
    if curStep >= 1216 and curStep < 1264 then
      
        if curStep % 16 == 0 then
            mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        elseif curStep % 16 == 8 then
             mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        end
    end
    if curStep >= 1664 and curStep < 1744 then
      
        if curStep % 8 == 0 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
             mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
        end
    end
    if curStep >= 1280 and curStep < 1536 or curStep >= 1792 then
        if curStep % 8 == 0 then
            zoom = 0.8
        end
    end
    lol1(128)
    lol1(192)
    lol1(768)
    lol1(832)
    lol2(320)
    lol2(352)
     lol2(960)
    lol2(992)
      lol2(1600)
    lol2(1632)
    lol3(384,true)
     lol3(448,false)
      lol3(1280,true)
     lol3(1344,false)
end
function lol1(s)
    if curStep == s+8 then
         mirror(false,true,"angle","angle",25,0,2,crochet,"cubeOut")
         mirror(false,true,"","x",0,1,2,crochet,"cubeOut")
          mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,2,4,crochet,"cubeIn")
         tweenShader('fish','power',0.3,crochet*0.004,'cubeIn')
        tweenShader('Glitchy','AMT',0.1,crochet*0.002,'cubeOut')
    elseif curStep == s+24 then
         mirror(false,true,"","x",0,0,2,crochet,"cubeIn")
    elseif curStep == s+32 then
        tweenShader('Glitchy','AMT',0,crochet*0.002,'cubeOut')
           tweenShader('fish','power',0,crochet*0.002,'cubeOut')
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == s+40 then
        mirror(true,true,"y","y",-2,0,3,crochet,"cubeInOut")

    elseif curStep == s+48 then
        
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShader('Glitchy','AMT',0.1,crochet*0.001,'cubeOut')
    elseif curStep == s+52 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+56 then
        tweenShader('Glitchy','AMT',0,crochet*0.002,'cubeOut')
         mirror(true,true,"x","x",2,0,2,crochet,"cubeOut")
         mirror(false,true,"angle","angle",-25,0,2,crochet,"cubeOut")

    end
end
function lol2(s)
    if curStep == s then
         mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeInOut")
    elseif curStep == s+8 then
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+12 or curStep == s+28 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == s+16 then
         mirror(false,true,"","zoom",0,4,3,crochet,"cubeIn")
    end
    if curStep == s+16 then
     --    mirror(false,true,"","x",0,2,1,crochet,"quadOut")
         angle,x = 15,0.1
    elseif curStep == s+20 then
         angle,x = -15,-0.1
     elseif curStep == s+24 then
         angle,x = 15,-0.1
     elseif curStep == s+28 then
         angle,x = -15,0.1
    end
end
function lol3(s,f)
    if curStep == s then
             if f then
                tommy = true
                bf = false
             else
                tommy = false
                bf = true
             end

             mirror(false,true,"","warp",0,0.2,8,crochet,"cubeIn")
         mirror(false,true,"","zoom",0,4,8,crochet,"cubeIn")
    elseif curStep == s+32 then
        mirror(false,true,"","warp",0,0,6,crochet,"cubeIn")
         mirror(false,true,"","zoom",0,0.5,6,crochet,"cubeIn")
         angle,x = 15,0.1
    elseif curStep == s+36 then
        angle,x = -15,-0.1
    elseif curStep == s+40 then
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeOut")
    elseif curStep == s+44 then
        mirror(true,true,"x","x",-4,0,2,crochet,"cubeOut")
    elseif curStep == s+48 then
        angle,x = 15,-0.1
    elseif curStep == s+52 then
        angle,x = -15,0.1
    elseif curStep == s+56 then
            tweenShader('fish','power',0.3,crochet*0.001,'cubeOut')
         mirror(false,true,"","angle",0,360,4,crochet,"cubeInOut")
         mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
         if f then
          tweenShader('Glitchy','AMT',0.2,crochet*0.001,'cubeOut')
        end
    elseif curStep == s+60 then
        tweenShader('fish','power',0,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        tweenShader('Glitchy','AMT',0,crochet*0.002)
    end
end