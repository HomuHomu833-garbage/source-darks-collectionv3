function lascosasdelhud(s,step,c,ease)
       local hbAlpha = s
    if s == 1 then
        hbAlpha = 0.8
    end

    tween("healthBar", {alpha = hbAlpha}, step * 0.001 * c, ease)
    tween("healthBarBG", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP1", {alpha = s}, step * 0.001 * c, ease)
    tween("iconP2", {alpha = s}, step * 0.001 * c, ease)
    tween("scoreTxt", {alpha = s}, step * 0.001 * c, ease)
    tween("timeBar", {alpha = s}, step * 0.001 * c, ease)
    tween("ratingText", {alpha = s}, step * 0.001 * c, ease)
end
local sprites = {
    {'ga', 'Priimunus/GAH', 200, -450,1.25,"hud"},---100
    {'damn', 'Priimunus/DAMN', 120, 550,1.25,"hud"},--150
    {'uno', 'corrupt/1', -500, 650,1,"hud"},--250
    {'dos', 'corrupt/2', 0, 650,1,"hud"},
    {'tres', 'corrupt/3', 500, 650,1,"hud"},
    {'go', 'corrupt/Lets Go', 0, 650,1,"hud"},-- -250
}

function createPost()
     setActorLayer("dadCharacter1",getActorLayer("dadCharacter0"))
    set("dadCharacter1.x", getActorX("dadCharacter0") +50)
    set("dadCharacter0.x", getActorX("dadCharacter0") - 150 )
    set("dadCharacter1.y", getActorY("dadCharacter1")-10 )
     set("dadCharacter0.y", getActorY("dadCharacter1")+5 )
    for _, sprite in ipairs(sprites) do
        makeSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorLayer(sprite[1], layershit)
        if sprite[1] == "finish" then 
            setActorAlpha(0,sprite[1])
        end
       
    end
    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '#ffffff')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.001, 'chessnose')
    setActorLayer('chessnose', getActorLayer('girlfriend'))

    initShader('chess', 'chess') 
    setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0)
    setShaderProperty('chess', 'direction', -1.0)
     local shaders = {
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}}, 
        {"smoke", "PerlinSmokeEffect", {smokeStrength = 1}},
        {"bars", "bars", {effect = 0,effect2 = 0.55, angle1 = 0 , angle2 = 0}},
        {"mirror", "BarrelBlurEffect", {zoom = 2.5, angle = 0, x = 0, y = 0, barrel = 0,warp = -0.2, doChroma = true}},
         {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0,warp = 0, doChroma = true}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},   
        {"glitch", "glitchyPeak", {strength = 0,angle = 5}}, 
        {"disco", "DiscoOverride", {brightness = 1.5 ,enableRainbow = 0}},  
        {"ca", "ChromAbBlueSwapEffect", {strength = 0.001}},
        {"bloom", "BloomEffect", {contrast = 0 , brightness = 0,effect = 0, strength = 0}}
     }
    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
        if name ~= "smoke" and name ~= "mirror"
        and name ~= "bars" and name ~= "fish" and name ~= "mirror2"
         and name ~= "pixel"  and name ~= "mandela" and name ~= "ca"
        and name ~= "disco"  then
            setCameraShader('hud', name)
        end 
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
    
    initShader('rayMarch', 'rayMarch')--
    setCameraShader('hud', 'rayMarch')
    setShaderProperty('rayMarch', 'direction360', 0)
    setShaderProperty('rayMarch', 'Ydirection360', 0)

end
function startSong()
    bloom(0,1,crochet,16,"")
    tweenShader("bars", "effect2", 0, crochet * 0.016, "quadOut")
    tweenShader("greyscale", "strength", 1, crochet * 0.016, "cubeIn")
    mirror(false,true,"","zoom",0,1,16,crochet,"quadOut")
    mirror(false,true,"","warp",0,0,16,crochet,"quadOut")
end
time = 0
a,angle,speed,perroxd = 0,3,5,false
function update(elapsed)
    zoom = lerp(zoom, 1, elapsed * 6)
    setShaderProperty('bump', 'zoom', zoom)
     angle = lerp(angle, 0, elapsed * 6)
    setShaderProperty('bump', 'angle', angle)
      x = lerp(x, 0, elapsed * 6)
    setShaderProperty('bump', 'x', x)
    time = time + elapsed
    setShaderProperty("smoke","iTime",time)
    setShaderProperty("chess","iTime",time/2)
    setShaderProperty("glitch","iTime",time)
    setShaderProperty("disco","iTime",time/2)
     if perroxd then
    a = a + (elapsed / (1 / 120))
    setShaderProperty('mirror2', 'angle', math.sin(a / 100 * speed) * angle)
    end
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
lol,flipY,flipX = 1,false,false
function stepHit()
    if curStep == 64 or curStep == 256 then
        bloom(2,1,crochet,2,"")
    elseif curStep == 160 then
        tweenShader("greyscale", "strength", 0, crochet * 0.008, "quadOut")
        mirror(false,true,"","zoom",0,3,8,crochet,"cubeIn")
        mirror(false,true,"","warp",0,-0.1,8,crochet,"cubeIn")
    elseif curStep == 184 then
        mirror(false,true,"","warp",0,0.1,1,crochet,"cubeOut")
    elseif curStep == 188 then
        mirror(false,true,"","warp",0,-0.1,1,crochet,"cubeIn")
    elseif curStep == 192 then
        flashCamera("hud","",crochet*0.002)
        setShaderProperty("smoke","smokeStrength",0)
        mirror(true,true,"zoom","zoom",0.5,1,4,crochet,"cubeOut")
        mirror(false,true,"","warp",0,0,2,crochet,"cubeOut")
    end
    if curStep == 204 or curStep == 348 or curStep == 456 or curStep == 628 or curStep == 652 or curStep == 684 
    or curStep == 1068 or curStep == 1136 or curStep == 1176 then
        setShaderProperty("glitch","strength",0.05)
    elseif curStep == 208 or curStep == 352 or curStep == 460 or curStep == 632 or curStep == 656 or curStep == 688 
    or curStep == 1072 or curStep == 1140 or curStep == 1184 then
        setShaderProperty("glitch","strength",0)
        bloom(2,1,crochet,2,"")
    elseif curStep == 264 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeOut")
    elseif curStep == 272 then
        bloom(2,1,crochet,2,"")
        setShaderProperty("glitch","strength",0)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 304 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-15,0,2,crochet,"cubeOut")
    elseif curStep == 312 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",360,0,2,crochet,"cubeOut")
        bloom(1,2,crochet,2,"cubeIn")
        tweenShader("bars", "effect", 0.5, crochet * 0.002, "cubeIn")
    elseif curStep == 316 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 320 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"")
    end
    if curStep == 264 or curStep == 266 or curStep == 268 then
        setShaderProperty("bloom","contrast",0)
        setShaderProperty("glitch","strength",0.02)
    elseif curStep == 265 or curStep == 267 or curStep == 269 then
        setShaderProperty("bloom","contrast",1) 
    end
    if curStep == 332 or curStep == 476 then
        mirror(true,true,"x","x",0,1,2,crochet,"cubeInOut")
    elseif curStep == 348 then
        mirror(false,true,"","zoom",0,0.6,1,crochet,"cubeIn")
        mirror(false,true,"","x",0,2,2,crochet,"cubeInOut")
    elseif curStep == 352 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 368 then
         mirror(true,true,"angle","angle",15,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
     elseif curStep == 376 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeOut")
        bloom(1,2,crochet,2,"cubeIn")
        tweenShader("bars", "effect", 0.5, crochet * 0.002, "cubeIn")
    elseif curStep == 380 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 384 then
        tweenShader("bars", "effect", 0.1, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"")
    elseif curStep == 448 or curStep == 1248 then
        tweenShader("bars", "effect", 0, crochet * 0.001, "cubeOut")
         bloom(4,1,crochet,2,"")
         tweenShader("greyscale", "strength", 1, crochet * 0.001, "cubeOut")
        tween("ga",{y = -100},crochet*0.001,"cubeOut")
        --mirror(true,true,"y","y",1,2,2,crochet,"cubeIn")
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 452 or curStep == 1252 then
          removeCameraShader('game', 'bars')
        setCameraShader('hud', 'bars')
        mirror(false,true,"","warp",0,-0.2,2,crochet,"cubeIn")
    elseif curStep == 456 or curStep == 1256 then
         tweenShader("bars", "effect2", 0.55, crochet * 0.001, "cubeIn")
        tween("damn",{y = 150},crochet*0.001,"cubeOut")
        tweenShader("greyscale", "strength", 0, crochet * 0.001, "cubeIn")  
    elseif curStep == 464 or curStep == 1264 then
        bloom(4,1,crochet,2,"")
        set("ga.y",-450)
        set("damn.y",550)
         setProperty('', 'cameraSpeed', 1)
        set("defaultCamZoom", 0.7) 
        tweenShader("bars", "effect2", 0.1, crochet * 0.002, "cubeOut")
        setShaderProperty("mirror2","x", 0)
        setShaderProperty("mirror2","angle", 0)
        tweenShader("mirror2", "x", -0.2, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", 10, crochet * 0.002, "cubeOut")
        mirror(false,true,"","warp",0,0,2,crochet,"cubeOut")
    elseif curStep == 492 or curStep == 1292 then
         mirror(true,true,"x","x",0,2,2,crochet,"cubeInOut")
    elseif curStep == 496 or curStep == 1296  then
        tweenShader("mirror2", "x", 0.2, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", -10, crochet * 0.002, "cubeOut")
    elseif curStep == 520 or curStep == 1320 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeOut")
    elseif curStep == 528 or curStep == 1328 then
        set("defaultCamZoom", 0.4) 
        tweenShader("mirror2", "x", 0, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect2", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","barrel",0,2,14,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"")
    elseif curStep == 576 or curStep == 1376 then
         bloom(4,1,crochet,2,"")
        tweenShader("greyscale", "strength", 1, crochet * 0.001, "cubeOut")  
    elseif curStep == 584 or curStep == 1384 then
          setCameraShader('game', 'bars')
        removeCameraShader('hud', 'bars')
         mirror(false,true,"","barrel",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeIn")
        tweenShader("greyscale", "strength", 0, crochet * 0.002, "cubeIn")
         lascosasdelhud(0,crochet,2,"cubeIn")
    elseif curStep == 588 or curStep == 1384 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 592 or curStep == 1392 then
        mirror(false,true,"","warp",0,-0.1,2,crochet,"cubeOut")
        mirror(true,true,"angle","angle",-180,0,2,crochet,"cubeOut")
    end

    --peak part
   if curStep == 592 or curStep == 1392 then
    perroxd = true
    tweenShader("rayMarch", "direction360", 360, crochet * 0.002, "cubeOut")
    tweenShader("bars", "effect", 0.15, crochet * 0.002, "cubeOut")
    setShaderProperty('chess', 'transparency', 0.1)
    bloom(4,1,crochet,2,"")
    mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 596 or curStep == 1396 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","x",0,1,1,crochet,"cubeOut")
    elseif curStep == 600 or curStep == 1400 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,2,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    elseif curStep == 603 or curStep == 1403 then
        mirror(false,true,"","y",0,1,4,stepCrochet,"cubeOut")
    elseif curStep == 604 or curStep == 620 or curStep == 1404 or curStep == 1420 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 608 or curStep == 1408 then
        setShaderProperty("rayMarch","direction360",90)
        tweenShader("rayMarch", "direction360", 0, crochet * 0.001, "cubeOut")
        mirror(false,true,"","x",0,3,1,crochet,"cubeOut")
    elseif curStep == 612 or curStep == 1412 then
        setShaderProperty("rayMarch","direction360",-90)
        tweenShader("rayMarch", "direction360", 0, crochet * 0.001, "cubeOut")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
    elseif curStep == 616 or curStep == 1416 then
        setShaderProperty("rayMarch","direction360",180)
        tweenShader("rayMarch", "direction360", 0, crochet * 0.002, "cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","x",0,4,1,crochet,"cubeOut")
    elseif curStep == 624 or curStep == 1424 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,2,4,stepCrochet,"cubeOut")
    elseif curStep == 628 or curStep == 1428 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 640 or curStep == 1440 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,3,1,crochet,"cubeIn")
    elseif curStep == 644 or curStep == 1444 then
        mirror(false,true,"","x",0,5,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,180,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 648 or curStep == 1448 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","y",0,4,1,crochet,"cubeOut")
    elseif curStep == 652 or curStep == 1452 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","x",0,6,1,crochet,"cubeOut")
    elseif curStep == 656 or curStep == 1456 then
        mirror(false,true,"","angle",0,360,2,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,0.6,2,crochet,"cubeOut")
    elseif curStep == 664 or curStep == 1464 then
        mirror(true,true,"y","y",0,2,2,crochet,"cubeIn")
    elseif curStep == 672 or curStep == 676 or curStep == 680 or curStep == 1472 or curStep == 1476 or curStep == 1480 then
        mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        lol = -lol
        setShaderProperty("rayMarch","direction360",90*lol)
        tweenShader("rayMarch", "direction360", 0, crochet * 0.001, "cubeOut")
        if flipX then
            mirror(true, true, "x", "x", 0, 1, 1, crochet, "cubeOut")
        else
            mirror(true, true, "x", "x", 1, 2, 1, crochet, "cubeOut")
        end
        flipX = not flipX
    elseif curStep == 674 or curStep == 678 or curStep == 682 or curStep == 1474 or curStep == 1478 or curStep == 1482 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
    elseif curStep == 688 or curStep == 1488 then
        mirror(false,true,"","zoom",0,0.6,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"")
    elseif curStep == 712 or curStep == 1512 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
    elseif curStep == 716 or curStep == 1516 then
        mirror(false,true,"","zoom",0,0.5,1,crochet,"cubeIn")
    elseif curStep == 720  then
        tweenShader("rayMarch", "direction360", 360, crochet * 0.002, "cubeOut")
        tweenShader("bars", "effect", 0.55, crochet * 0.001, "quadOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeIn")
    elseif curStep == 1520 then
       setShaderProperty('chess', 'transparency', 0)
              setShaderProperty('greyscale', 'strength', 1)
        bloom(4,1,crochet,2,"")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 736 then
        perroxd = false
        setShaderProperty("disco","enableRainbow",0.8)
        flashCamera("game","",crochet*0.002)
          tweenShader("bars", "effect", 0.1, crochet * 0.002, "quadOut")
        mirror(true,true,"zoom","zoom",0.5,1,2,crochet,"quadOut")
    elseif curStep == 780 then
         mirror(true,true,"x","x",0,20,6,crochet,"cubeInOut")
    elseif curStep == 752 then
         set("defaultCamZoom", 0.6) 
    elseif curStep == 784 then
         mirror(false,true,"","zoom",0,2,2,crochet,"quadOut")
          mirror(false,true,"","angle",0,45,4,crochet,"cubeIn")
     elseif curStep == 792 then
         mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
     elseif curStep == 800 then
        mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
        flashCamera("hud","",crochet*0.002)
         set("defaultCamZoom", 0.4) 
     elseif curStep == 816 then
         set("defaultCamZoom", 0.6) 
     elseif curStep == 848 then
         mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
          mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
     elseif curStep == 850 or curStep == 854 then
         mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
      elseif curStep == 852 then
         mirror(false,true,"","zoom",0,2.5,0.5,crochet,"cubeOut")
          mirror(false,true,"","angle",0,-25,1,crochet,"cubeOut")
        elseif curStep == 856 then
         mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
          mirror(false,true,"","angle",0,-180,2,crochet,"cubeIn")
           tweenShader("mirror2", "x", 1, crochet * 0.002, "cubeIn")
     elseif curStep == 860 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
     elseif curStep == 864 then
        flashCamera("hud","",crochet*0.002)
        tweenShader("mirror2", "y", 1, crochet * 0.001, "cubeIn")
          mirror(true,true,"angle","angle",180,0,2,crochet,"quadOut")
     elseif curStep == 868 then
         tweenShader("mirror2", "x", 2, crochet * 0.001, "cubeIn")
      elseif curStep == 872 then
        mirror(false,true,"","angle",0,-180,2,crochet,"cubeOut")
         tweenShader("mirror2", "y", 2, crochet * 0.001, "cubeIn")
      elseif curStep == 876 then
        tweenShader("mirror2", "zoom", 0.5, crochet * 0.001, "cubeIn")
         elseif curStep == 880 then
              mirror(true,true,"angle","angle",180,0,2,crochet,"quadOut")
        tweenShader("mirror2", "zoom", 1.5, crochet * 0.003, "cubeOut")
        tweenShader("mirror2", "angle", 20, crochet * 0.003, "cubeOut")
    elseif curStep == 892 then
        tweenShader("mirror2", "zoom", 0.8, crochet * 0.001, "cubeIn")
        tweenShader("mirror2", "angle", 0, crochet * 0.001, "cubeIn")
    elseif curStep == 896 then
        tweenShader("mirror2", "zoom", 1.5, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", -20, crochet * 0.002, "cubeOut")
    elseif curStep == 900 then
          tweenShader("mirror2", "x", 3, crochet * 0.001, "cubeIn")
    elseif curStep == 904 then
        tweenShader("mirror2", "zoom", 1, crochet * 0.002, "cubeOut")
        tweenShader("mirror2", "angle", 0, crochet * 0.002, "cubeOut")
    elseif curStep == 912 then
        tween("uno",{y = 0},crochet*0.001,"cubeOut")
        tweenShader("mirror2", "angle", 360, crochet * 0.005, "cubeInOut")
        tweenShader("mirror2", "zoom", 2, crochet * 0.002, "cubeOut")
    elseif curStep == 916 then
         tween("uno",{y = 650},crochet*0.001,"cubeIn")
         tween("dos",{y = 0},crochet*0.001,"cubeOut")
        tweenShader("mirror2", "x", 4, crochet * 0.002, "cubeIn")
          tweenShader("mirror2", "zoom", 1, crochet * 0.002, "cubeIn")
    elseif curStep == 920 then
        tween("dos",{y = 650},crochet*0.001,"cubeIn")
        tween("tres",{y = 0},crochet*0.001,"cubeOut")
    elseif curStep == 924 then
        tween("go",{y = 0},crochet*0.001,"cubeOut")
         tween("tres",{y = 650},crochet*0.001,"cubeIn")
    elseif curStep == 928 then
        tween("go",{y = 650},crochet*0.001,"cubeIn")
        setProperty('', 'cameraSpeed', 3)
         set("defaultCamZoom", 0.75) 
        flashCamera("hud","",crochet*0.002)
    elseif curStep == 992 then
       set("defaultCamZoom", 0.4) 
       setProperty('', 'cameraSpeed', 1)
       setShaderProperty('chess', 'transparency', 0)
       setShaderProperty('disco', 'enableRainbow', 0)
        flashCamera("hud","",crochet*0.002)
            lascosasdelhud(1,crochet,4,"cubeOut")
    end
    if curStep == 1104 then
        setShaderProperty('greyscale', 'strength', 1)
         tweenShader("greyscale", "strength", 0, crochet * 0.002)
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,2,crochet,"cubeOut")
         bloom(4,1,crochet,2,"")zoom = 0.8
    elseif curStep == 1112 then
         bloom(4,1,crochet,2,"")zoom = 0.8
        setShaderProperty('greyscale', 'strength', 1)tweenShader("greyscale", "strength", 0, crochet * 0.002)
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
     elseif curStep == 1116 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
     elseif curStep == 1120 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        bloom(4,1,crochet,2,"")
    elseif curStep == 1168 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
    elseif curStep == 1176 then
        mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,15,2,crochet,"cubeIn")
    elseif curStep == 1184 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    end
    if curStep == 1526 then
         mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-15,1,crochet,"cubeOut")
    elseif curStep == 1528 then
        tweenShader("bars", "effect", 0.55, crochet * 0.002,"cubeIn")
          mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
    elseif curStep == 1530 then
    mirror(false,true,"","zoom",0,2,0.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 1532 then
      mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 1536 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        mirror(true,true,"angle","angle",180,0,4,crochet,"cubeOut")
          tweenShader("bars", "effect", 0.1, crochet * 0.002,"cubeOut")
        bloom(4,1,crochet,2,"")
        mirror(true,true,"x","x",0,2,4,crochet,"cubeOut")
    elseif curStep == 1584 then
        mirror(false,true,"","zoom",0,3,32,crochet,"cubeIn")
        bloom(1,0,crochet,20,"cubeIn")
    end
    if curStep >= 928 and curStep < 992 then
        if curStep % 16 == 0 or curStep % 16 == 4 or curStep % 16 == 12  then
             tweenShader("mirror2", "zoom", 1.5, crochet * 0.0005, "cubeOut")
           
        elseif curStep % 16 == 2 or curStep % 16 == 6 or curStep % 16 == 14 then
             tweenShader("mirror2", "zoom", 1, crochet * 0.0005, "cubeIn")
        end
        if curStep % 16 == 0 or curStep % 16 == 8 or curStep % 16 == 12 then
            x = 0.07
        elseif curStep % 16 == 4 or curStep % 16 == 10 or curStep % 16 == 14 then
            x = -0.07
        end
        if curStep % 32 == 12 then
            mirror(true,true,"x","x",0,1,2,crochet,"cubeInOut")
        elseif curStep % 32 == 28 then
            mirror(true,true,"x","x",1,2,2,crochet,"cubeInOut")
        end

    end
        
    if curStep >= 384 and curStep < 449 then
        if curStep % 16 == 0 then
            zoom = 0.87
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        elseif curStep % 16 == 8 then
            lol = -lol
            if flipY then
                mirror(true,true,"y","y",1,2,2,crochet,"cubeIn")
            else
                mirror(true,true,"y","y",0,1,2,crochet,"cubeIn")
            end
            flipY = not flipY 
            mirror(false,true,"","zoom",0,0.5,2,crochet,"cubeIn")
            mirror(false,true,"","angle",0,15*lol,2,crochet,"cubeIn")
        end
    end
    if curStep >= 192 and curStep < 448 or curStep >= 464 and curStep < 592 or curStep >= 992 and curStep < 1104
    or curStep >= 1120 and curStep < 1248  or curStep >= 1264 and curStep < 1392 then
        if curStep % 16 == 0 or curStep % 16 == 10 then
            zoom = 0.87
        elseif curStep % 16 == 4 or curStep % 16 == 12 then
            zoom = 0.8
        end
    end
    if curStep >= 592 and curStep < 720 or curStep >= 1392 and curStep < 1520 then
        if curStep % 16 == 0 or curStep % 16 == 8 or curStep % 16 == 14 then
            zoom = 0.87
        elseif curStep % 16 == 4 or curStep % 16 == 11 then
            zoom = 0.8
        end
    end
     if curStep >= 736 and curStep < 784 or curStep >= 800 and curStep < 848
     or curStep >= 864 and curStep < 992  then
        if curStep % 4 == 0 then
             mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
             lol = -lol
             angle = 5*lol
        elseif curStep % 4 == 2 then
            mirror(false,true,"","zoom",0,0.8,0.5,crochet,"cubeIn")
        end
    end
    if curStep >= 736 and curStep < 976 then
        if curStep % 4 == 0  then
            zoom = 0.8
        end
    end
end