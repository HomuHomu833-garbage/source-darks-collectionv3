function hud(s, step, c, ease)
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
local characters = {"dadCharacter0", "dadCharacter1","boyfriend"}
local yPositions = {80, 180, 40}  
local xPositions = {-10, -10, 20} --2,2,14
local originalPositions = {}

function posiciones(context, spacing)
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "hud" then        
            set(character .. ".x", xPositions[i] * spacing)
            set(character .. ".y", yPositions[i] or 0)
        elseif context == "game" then
            local originalPos = originalPositions[character]
            if originalPos then
                set(character .. ".x", originalPos.x)
                set(character .. ".y", originalPos.y)
            end
        end
        setCamera(character, context)
    end
end
function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters)
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if moverDadCharacters then
            if i <= 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 2 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end
local qlol = '#000000'
local lastColor = qlol
function createPost()
   for i = 0,7 do
        set(i..".alpha",0)
    end
    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
     hud(0, crochet, 1, 'cubeOut')
      local shaders = { 
      {"vcrchroma", "vcrchroma", {strength = 1,speed = 1.2}},
      {"pixel", "MosaicEffect", {strength = 50}},
      {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0,warp = 0, doChroma = true}},
      {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"bars", "bars", {effect = 0.55,effect2 = 0, angle1 = 0.3 , angle2 = 0}},
      {"greyscale", "GreyscaleEffect", {strength = 0.5}},
       {"color", "ColorOverrideEffect", {red = 1.35 ,blue = 1.2 , green = 1.2}},
      {"glitchChromatic", "glitchChromatic", {GLITCH = 0.003}},
     {"ca", "ChromAbEffect", {strength = 0.002}}
      
  }

      for _, shader in ipairs(shaders) do
          local name, effect, properties = shader[1], shader[2], shader[3]
          initShader(name, effect)
          setCameraShader('game', name)
  
          if name ~= "bump" and name ~= "fish" 
          and name ~= "mirror2" and name ~= "mirror"
          and name ~= "bars" and name ~= "particles"
          and name ~= "vcrchroma" and name ~= "glitchChromatic" then
              setCameraShader('hud', name)
          end 
          for prop, value in pairs(properties) do
              setShaderProperty(name, prop, value)
          end
      end
 
    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), qlol)
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
    set("dadCharacter0.alpha",0)
    set("dadCharacter1.alpha",0)
    set("dadCharacter0.x",getActorX("dadCharacter0")-300)
    set("dadCharacter1.x",getActorX("dadCharacter1")-300)
    initShader('colorfill', 'ColorFillEffect')
    setActorShader('dad', 'colorfill')
    setActorShader('boyfriend', 'colorfill')
    setActorShader('bfCharacter1', 'colorfill')
    setActorShader('dadCharacter1', 'colorfill')
    setActorShader('girlfriend', 'colorfill')
   

    setShaderProperty('colorfill', 'fade', 1)



  end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
time,a = 0,0
perroxd,speed,angle = false,2,3
cam = false
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
function update(elapsed)
    time = time + elapsed
    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.003)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end
    if qlol ~= lastColor then
        makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), qlol)
        lastColor = qlol
        actorScreenCenter('blackBG')
    end
    if qlol == '#FFFFFF' then
        setShaderProperty('colorfill', 'red', 0)
        setShaderProperty('colorfill', 'green', 0)
        setShaderProperty('colorfill', 'blue', 0)
    else
        setShaderProperty('colorfill', 'red', 255)
        setShaderProperty('colorfill', 'green', 255)
        setShaderProperty('colorfill', 'blue', 255)
    end
     setShaderProperty("vcrchroma","iTime",time)
    setShaderProperty("glitchChromatic","iTime",time)
     glitch = lerp(glitch, 0, elapsed * 4)
    setShaderProperty('glitchChromatic', 'GLITCH', glitch)
    zoom = lerp(zoom, 1, elapsed * 4)
    setShaderProperty('bump', 'zoom', zoom)
    if queso then
      x = lerp(x, 0, elapsed * 4)
    setShaderProperty('bump', 'x', x)
    end
      y = lerp(y, 0, elapsed * 4)
    setShaderProperty('bump', 'y', y)
      angle = lerp(angle, 0, elapsed * 4)
    setShaderProperty('bump', 'angle', angle)
    if cam then
        set("camFollow.x",600)
            set("camFollow.y",200)
    end
    if perroxd then
    a = a + (elapsed / (1 / 120))
    setShaderProperty('bump', 'angle', math.sin(a / 100 * speed) * 5 + angle)
    end
end
function startSong()
        mirror(false,true,"","zoom",0,3,4,crochet,"cubeIn")
    mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
    tweenShader('bars','effect',0.1,crochet*0.004,'cubeOut')
    tweenShader('pixel','strength',0,crochet*0.004,'linear')
    
end
function flechasbump(s,q,prop,qxdddddd,e,b,ease)
    for i = s,q do
       setActorProperty(i, prop, qxdddddd)
       tweenActorProperty(i, prop, 0, e * 0.001*b,ease)
    end
end

lol,perro = 1,0
bumpalto = {28,29,30,60,61,62,72,118,124,134,140,164,188,189,190,200,246,252,262,268}
bumpotro = {
     784,796, 804, 810, 816, 828, 836, 842, 848,
    860, 868,874,880,892,900,906,912,924,932,938,944
    ,956,964,970,976,988,996,1002,1008,1020,1028,1034,1040,
    1352,1398
    ,1404,1414,1420,1444,1480,1526,1532
}
qperroxd = 1
function stepHit()
    if curStep >= 16 and curStep < 272 or curStep >= 1040 and curStep < 1536
    or curStep >= 1808 and curStep < 2320 then
       if curStep % 16 == 0 then
        qperroxd = -qperroxd
           zoom,x,y,glitch = 0.7,-0.05,-0.01,0.25
           flechasbump(0,7,"angle",25*qperroxd,crochet,2,"cubeOut")
       end

    end

    for i = 1, #bumpalto do
        if curStep == bumpalto [i] then
            zoom,x,y,glitch = 0.7,0.05,-0.01,0.25
        end
    end
     for i = 1, #bumpotro do
        if curStep == bumpotro [i]-2 then
            tweenShader('mirror2','zoom',0.6,crochet*0.0005,'cubeIn')
             tweenShader("mirror2","x",0.07,stepCrochet*0.001*1.5,"cubeIn")
            tweenShader("mirror2","y",-0.03,stepCrochet*0.001*1.5,"cubeIn")
        elseif curStep == bumpotro [i] then
            glitch = 0.25
             tweenShader("mirror2","zoom",1,crochet*0.001*1,"cubeOut")
            tweenShader("mirror2","x",0,crochet*0.001*1,"backOut")
            tweenShader("mirror2","y",0,crochet*0.001*1,"backInOut")
        end
    end
    if curStep < 1296 or curStep >= 1808 then
        if curStep % 8 == 0 then
            set("defaultCamZoom", math.random() * 0.2 + 0.5)
        end
    end
    if curStep == 16 then
        for i = 0,3 do
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.004, 'cubeOut')
            setActorProperty(i, 'angle', -360)
            tweenActorProperty(i, 'angle', 0, crochet * 0.004, 'cubeOut')
        end
        tween("dadCharacter0",{x = getActorX("dadCharacter0")+300 , alpha = 1},crochet*0.004,"cubeOut")
    elseif curStep == 80 then
        tween("dadCharacter1",{x = getActorX("dadCharacter1")+300 , alpha = 1},crochet*0.004,"cubeOut")
    elseif curStep == 136 then
      for i = 4,7 do
            tween("defaultStrum"..i, {alpha = 1}, crochet * 0.004, 'cubeOut')
            setActorProperty(i, 'angle', 360)
            tweenActorProperty(i, 'angle', 0, crochet * 0.004, 'cubeOut')
        end  
    end
    if curStep == 16 or curStep == 784 then
        flashCamera("hud","",crochet*0.002)
         tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
        mirror(true,true,"zoom","zoom",0.5,1,4,crochet,"cubeOut")
        mirror(true,true,"barrel","barrel",20,0,4,crochet,"cubeOut")
    elseif curStep == 64 or curStep == 188 or curStep == 1856 or curStep == 1984 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
    elseif curStep == 72 or curStep == 196 or curStep == 1864 or curStep == 1992 then
         mirror(false,true,"","zoom",0,0.6,1,crochet,"cubeOut")
         mirror(true,true,"x","x",0,2,2,crochet,"cubeIn")
     elseif curStep == 80 or curStep == 204 or curStep == 1872 or curStep == 2000 then
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 128 or curStep == 256 or curStep == 576 or curStep == 640
    or curStep == 1920 or curStep == 2048 then
        angle,x = 10,0.1
         mirror(false,true,"","zoom",0,1.5,1.5,crochet,"cubeOut")
         flechasbump(0,7,"angle",-25,crochet,1.5,"cubeOut")
    elseif curStep == 134 or curStep == 262 or curStep == 582 or curStep == 646
    or curStep == 1926 or curStep == 2054 then
        angle,x = -10,-0.1
        flechasbump(0,7,"angle",25,crochet,1.5,"cubeOut")
         mirror(false,true,"","zoom",0,2.5,1.5,crochet,"cubeOut")
    elseif curStep == 140 or curStep == 268 or curStep == 588 or curStep == 652
    or curStep == 1932 or curStep == 2060 then
       angle,x = 10,0.1
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 144 or curStep == 272 or curStep == 1936 or curStep == 2062 then
        flashCamera("hud","",crochet*0.002)
        flechasbump(0,7,"angle",-25,crochet,1,"cubeOut")
         mirror(true,true,"barrel","barrel",20,0,4,crochet,"cubeOut")
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    end
    if curStep == 272 then
         tweenShader('bars','angle1',0,crochet*0.002,'cubeOut')
        perroxd = true
        hud(1, crochet, 4, 'cubeOut')
    elseif curStep == 328 or curStep == 456 or curStep == 2120 or curStep == 2248 then
        mirror(false,true,"","angle",0,15,2,crochet,"backIn")
        mirror(true,true,"y","y",0,1,2,crochet,"backIn")
    elseif curStep == 392 or curStep == 2184 then
        mirror(false,true,"","angle",0,-15,2,crochet,"backIn")
        mirror(false,true,"","y",0,2,2,crochet,"backIn")
    elseif curStep == 336 or curStep == 400 or curStep == 464 or curStep == 2128 or curStep == 2192 or curStep == 2256 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 512 or curStep == 2304 then
        tweenShader("mirror2","y",1,crochet*0.004,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
    elseif curStep == 520 or curStep == 2312 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
    elseif curStep == 528 or curStep == 592 or curStep == 656 or curStep == 2320 then
         flashCamera("hud","",crochet*0.002)
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        perroxd = false
    elseif curStep == 560 or curStep == 624 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
    end


    if curStep == 664 or curStep == 728 then
        tween("blackBG",{alpha = 1},crochet*0.002,"cubeIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeIn")
        tweenShader('greyscale','strength',1,crochet*0.002,'cubeIn')
        tweenShader('bars','effect',0,crochet*0.002,'cubeIn')
    elseif curStep == 672 or curStep == 720 or curStep == 736 then
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut") 
          tween("blackBG",{alpha = 0},crochet*0.002,"cubeOut")
        tweenShader('greyscale','strength',0,crochet*0.002,'cubeOut')
        tweenShader('bars','effect',0.1,crochet*0.002,'cubeOut')
    elseif curStep == 680 or curStep == 744 then
        mirror(true,true,"x","x",0,2,4,crochet,"cubeInOut")
    elseif curStep == 704 or curStep == 768 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut") 
         angle,x = 10,-0.1
    elseif curStep == 708 or curStep == 772 then
         angle,x = -10,0.1
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn") 
    elseif curStep == 716 or curStep == 780 then
                tween("blackBG",{alpha = 1},crochet*0.001,"cubeIn")
          tweenShader('bars','effect',0,crochet*0.001,'cubeIn')
        tweenShader('greyscale','strength',1,crochet*0.001,'cubeIn')
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeIn")
    
    end
    if curStep == 784 then
         tween("blackBG",{alpha = 0},crochet*0.001,"cubeOut")
          hud(0, crochet, 4, 'cubeOut')   mirror(false,true,"","y",0,4,3,crochet,"cubeOut")
          perroxd = true
    elseif curStep == 796 or curStep == 860 or curStep == 924 or curStep == 988 then
         mirror(false,true,"","zoom",0,2.5,0.8,crochet,"cubeOut")
    elseif curStep == 800 or curStep == 864 or curStep == 928 or curStep == 992 or curStep == 972 or curStep == 1036 then
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 804 or curStep == 868 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
         mirror(true,true,"x","x",0,1,1.5,crochet,"cubeOut")
         angle = 10
    elseif curStep == 810 or curStep == 874 then
        angle = -10
         mirror(false,true,"","x",0,2,1.5,crochet,"cubeOut")
    elseif curStep == 816 or curStep == 880  then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeOut")
    elseif curStep == 836 or curStep == 900 then
          mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
         mirror(true,true,"y","y",0,1,1.5,crochet,"cubeOut")
         angle = 10
    elseif curStep == 842 or curStep == 906 then
        angle = -10
         mirror(false,true,"","y",0,2,1.5,crochet,"cubeOut")
    elseif curStep == 932 or curStep == 996 then
         mirror(true,true,"x","x",0,-1,1.5,crochet,"cubeOut")
         angle = 10
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 938 or curStep == 1002 then
        angle = -10
         mirror(false,true,"","x",0,-2,1.5,crochet,"cubeOut")
    elseif curStep == 944 or curStep == 1008 then
         angle,x = 10,0.1
         mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == 948 or curStep == 1012 then
         angle,x = -10,-0.1
         mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 952 or curStep == 1016 then
         mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
         mirror(true,true,"y","y",0,2,2,crochet,"cubeOut")
    elseif curStep == 968 or curStep == 1032 then
         mirror(false,true,"","zoom",0,4,1,crochet,"cubeOut")
             mirror(false,true,"","angle",0,-90,2,crochet,"cubeIn")
    elseif curStep == 976 or curStep == 1040 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
           flashCamera("hud","",crochet*0.002)
         mirror(true,true,"barrel","barrel",20,0,4,crochet,"cubeOut")
             mirror(true,true,"angle","angle",60,0,3,crochet,"cubeOut")
    end
    if curStep == 904 or curStep == 1032 then
         tweenShader('bars','effect',0.55,crochet*0.002,'cubeIn')
    elseif curStep == 912 then
        tweenShader('bars','effect',0,crochet*0.002,'cubeOut')
    end
    if curStep == 1040 then
            setActorAlpha(0.5, 'blackBG')
          tweenShader('bars','effect',0.15,crochet*0.004,'cubeOut')
             tweenShader('pixel','strength',2,crochet*0.004,'cubeOut')
    elseif curStep == 1072 then
              mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeOut")
    elseif curStep == 1088 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        setShaderProperty('mirror2','x',-2)
        tweenShader('mirror2','x',0,crochet*0.005,'cubeInOut')
        mirror(false,true,"","warp",0,0.5,2,crochet,"cubeOut")
      elseif curStep == 1096 or curStep == 1160 or curStep == 1224 or curStep == 1288 then
        mirror(false,true,"","zoom",0,0.8,2,crochet,"cubeIn")
        mirror(false,true,"","warp",0,0,2,crochet,"cubeIn")
      elseif curStep == 1104 then
         mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1152 or curStep == 1216 then
         tweenShader('pixel','strength',50,crochet*0.004,'cubeIn')
         mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")  
         mirror(false,true,"","warp",0,0.5,2,crochet,"cubeOut")
    elseif curStep == 1168 or curStep == 1232 then
          mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
          tweenShader('pixel','strength',5,crochet*0.004,'cubeOut')
            mirror(false,true,"","warp",0,0,2,crochet,"cubeIn")
    elseif curStep == 1280 then
           tweenShader('bars','effect',0.55,crochet*0.004,'cubeIn')
        mirror(false,true,"","zoom",0,4,2,crochet,"cubeOut")  
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
                mirror(false,true,"","warp",0,0.5,2,crochet,"cubeOut")
    elseif curStep == 1296 then
        perroxd = false
        triggerEvent('screen shake', (stepCrochet * 0.064) .. ',0.01')
         tweenShader('pixel','strength',0,crochet*0.004,'cubeOut')
        set("defaultCamZoom",0.7)
        set("boyfriend.alpha",0)
        set("girlfriend.alpha",0)
        set("dadCharacter1.alpha",0)
        perlinCaRange = 0.025
        cam,lol2 = true,true
        setProperty('', 'centerCamera', true)
         tweenShader('bars','effect',0.1,crochet*0.004,'cubeOut')
         mirror(false,true,"","zoom",0,1,8,crochet,"cubeOut")
        setActorAlpha(1, 'blackBG')
        flashCamera("hud","",crochet*0.004)
         mirror(true,true,"barrel","barrel",20,0,8,crochet,"cubeOut")
         setShaderProperty('colorfill', 'fade',0)
         tween("dadCharacter0",{x = getActorX("dadCharacter0")+300},crochet*0.004,"cubeOut")
    elseif curStep == 1308 or curStep == 1340 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeIn")
    elseif curStep == 1312 or curStep == 1344 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
    elseif curStep == 1360 or curStep == 1488 then
        qlol = '#FFFFFF'
        flashCamera("hud","",crochet*0.002)
    elseif curStep == 1408 then
         mirror(false,true,"","barrel",0,2,2,crochet,"cubeOut")
    elseif curStep == 1416 then
         mirror(false,true,"","barrel",0,-4,2,crochet,"cubeIn")
    elseif curStep == 1424 then
         qlol = '#000000'
        flashCamera("hud","",crochet*0.002)
           mirror(true,true,"barrel","barrel",20,0,8,crochet,"cubeOut")
        tween("boyfriend",{alpha = 1},crochet*0.004,"cubeOut")
         tween("dadCharacter1",{ alpha = 1},crochet*0.004,"cubeOut")
         tween("dadCharacter0",{x = getActorX("dadCharacter0")-300 , alpha = 0},crochet*0.004,"cubeOut")
    elseif curStep == 1536 then
          tween("dadCharacter1",{x = getActorX("dadCharacter1")-1500},crochet*0.004,"cubeIn")
            tween("boyfriend",{x = getActorX("boyfriend")+1500},crochet*0.004,"cubeIn")
          flashCamera("hud","",crochet*0.002)
         mirror(true,true,"barrel","barrel",20,0,8,crochet,"cubeOut")
        tweenShader('colorfill','fade',1,crochet*0.004)
         tween("girlfriend",{alpha = 1},crochet*0.004)
         tween("blackBG",{alpha = 0},crochet*0.004)
    elseif curStep == 1552 then
        queso,speed,angle = false,5,10
            posiciones("hud", 50)
         flashCamera("hud","",crochet*0.002)
          set("dadCharacter0.alpha",1)
           movimiento({2,-15,14}, 3, "cubeOut", false)
              movimiento({2,-15,14}, 3, "cubeOut", true)
               tweenShader('bump','x',-0.15,crochet*0.002,"cubeInOut")
             tweenShader('mirror2','angle',15,crochet*0.002,"cubeInOut")
              tweenShader('bars','angle1',-0.3,crochet*0.004,'cubeOut')
    elseif curStep == 1616 or curStep == 1744 then
        tweenShader('bars','angle1',0.3,crochet*0.004,'cubeOut')
    elseif curStep == 1680 then
        tweenShader('bars','angle1',-0.3,crochet*0.004,'cubeOut')
        flashCamera("hud","",crochet*0.002)
        mirror(true,true,"barrel","barrel",20,0,8,crochet,"cubeOut")
    elseif curStep == 1808 then
        tweenShader('bars','angle1',0,crochet*0.004,'cubeOut')
        flashCamera("hud","",crochet*0.004)
        tweenShader('mirror2','angle',0,crochet*0.002,"cubeOut")
            tweenShader('bump','x',0,crochet*0.002,"cubeOut")
        posiciones("game")
        perlinCaRange = 0
        lol2,cam = false,false
        hud(1, crochet, 4, 'cubeOut')
         mirror(true,true,"y","y",-2,0,4,crochet,"cubeOut") 
        mirror(true,true,"barrel","barrel",20,0,8,crochet,"cubeOut") 
        tweenShader('greyscale','strength',0.5,crochet*0.002,"cubeOut")
    end
    if curStep == 1608 or curStep == 1672 or curStep == 1736 then
         movimiento({-15,-15,14}, 2, "cubeIn", true)
    elseif curStep == 1616 or curStep == 1744 then
         movimiento({-15,2,14}, 3, "cubeOut", true)
    elseif curStep == 1680 then
        movimiento({2,-15,14}, 3, "cubeOut", true)
    end
    if curStep >= 1552 and curStep < 1808 then
        if curStep % 4 == 0 then
           zoom = 0.7
           triggerEvent("add camera zoom", "", "-0.02")
        end
        if curStep % 32 == 12 then
             tweenShader('mirror2','angle',15,crochet*0.002,"cubeInOut")
              tweenShader('bump','x',-0.15,crochet*0.002,"cubeInOut")
        elseif curStep % 32 == 28 then
            tweenShader('bump','x',0.15,crochet*0.002,"cubeInOut")
             tweenShader('mirror2','angle',-15,crochet*0.002,"cubeInOut")
        end
    end
    if curStep == 1160 then
         mirror(true,true,"y","y",0,1,2,crochet,"expoIn")
    elseif curStep == 2560 then
         tweenShader('bars','effect',0.55,crochet*0.014,"cubeIn")
         mirror(false,true,"","zoom",0,10,16,crochet,"cubeIn")
    elseif curStep == 2320 then
        tween("camHUD",{alpha = 0},crochet*0.032,"linear")
    end
   if curStep >= 1168 and curStep < 1280 then
        if curStep % 32 == 8 or curStep % 32 == 24 then
            perro = perro + 0.1*2
            if perro > 1 then
                perro = 0.3
            end
            tweenStageColorSwap("hue", perro, crochet * 0.0017, "cubeIn")
            if curStep % 32 == 8 then
                mirror(false, true, "", "angle", 0, 15, 2, crochet, "backIn")
                mirror(true, true, "y", "y", 0, 1, 2, crochet, "backIn")
            else
                mirror(false, true, "", "angle", 0, -15, 2, crochet, "backIn")
                mirror(true, true, "y", "y", 1, 2, 2, crochet, "backIn")
            end

        elseif curStep % 32 == 0 or curStep % 32 == 16 then
            mirror(false, true, "", "angle", 0, 0, 2, crochet, "cubeOut")
            tweenStageColorSwap("hue", 0, crochet * 0.002, "cubeOut")
            zoom = 0.6
        end

    elseif curStep == 1280 then
        setStageColorSwap("hue", 0)
    end

    if curStep >= 664 and curStep < 672 or curStep >= 716 and curStep < 720
    or curStep >= 728 and curStep < 736 or curStep >= 780 and curStep < 784
    or curStep >= 1308 and curStep < 1312 or curStep >= 1340 and curStep < 1344
    or curStep >= 1468 and curStep < 1472 then
        zoom,glitch = 0.5,0.25
    end
    if curStep >= 272 and curStep < 520 then    
        if curStep % 128 == 0 or curStep % 128 == 10 or curStep % 128 == 11
        or curStep % 128 == 16 or curStep % 128 == 26 or curStep % 128 == 32
        or curStep % 128 == 38 or curStep % 128 == 42 or curStep % 128 == 43
        or curStep % 128 == 48 or curStep % 128 == 56 or curStep % 128 == 64
        or curStep % 128 == 74 or curStep % 128 == 80 or curStep % 128 == 90
        or curStep % 128 == 96 or curStep % 128 == 102 or curStep % 128 == 106
        or curStep % 128 == 107 or curStep % 128 == 112 or curStep % 128 == 120 then
              zoom,glitch = 0.8,0.25
        end
    end
    if curStep >= 528 and curStep < 752 then
        if curStep % 16 == 0 or curStep % 16 == 6 or curStep % 16 == 12 then
              zoom,glitch = 0.7,0.25
        end
    end
    if curStep >= 2320 and curStep < 2560 then
        if curStep % 16 == 0 then
            local zoomVal = 1 + (math.random(0, 4) * 0.5)
            setShaderProperty('mirror', 'zoom', zoomVal)
            tweenShader('mirror2', 'zoom', 1, crochet * 0.001, "cubeOut")
            
        elseif curStep % 16 == 12 then
            tweenShader('mirror2', 'zoom', 0.8, crochet * 0.001, "cubeIn")
        end
    end
    if curStep == 784 or curStep == 912 or curStep == 1296 then
            for i = 0, 7 do
                if i <= 3 then
                    if not middlescroll then
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + 320, crochet * 0.001 * 2, 'cubeOut')
                    end
                    tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 2, 'cubeOut')
                    tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
                else
                    tween("defaultStrum"..i, {alpha = 0}, crochet * 0.001 * 2, 'linear')
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
                    tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + 100*downscroll,crochet*0.001*2, 'cubeOut')
                end
            end
        elseif curStep == 840  or curStep == 968 or curStep == 1416 then
            if not middlescroll then
                set("ratingsGroup.x",-280)
            end
            for i = 0, 7 do
                
                if i >= 4 then
                    if not middlescroll then
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'] - 320, crochet * 0.001 * 2, 'cubeOut')
                    end
                    tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 2, 'cubeOut')
                    tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
                else
                    tween("defaultStrum"..i, {alpha = 0}, crochet * 0.001 * 2, 'linear')
                    tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
                    tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'] + 100*downscroll,crochet*0.001*2, 'cubeOut')
                end
            end
        elseif curStep == 1040 or curStep == 1808 then
            set("ratingsGroup.x",0)
            for i = 0, 7 do
                tween("defaultStrum"..i, {alpha = 1}, crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 2, 'cubeOut')
                tweenActorProperty(i, 'y', _G['defaultStrum'..i..'Y'],crochet*0.001*2, 'cubeOut')
            end
        end
      
end
lol2 = false
function playerTwoSing(data, time, type)
    if lol2 then
		trailfd("dadCharacter1",data)
        trailfd("boyfriend",data)
        trailfd("dadCharacter0",data)
    end
end
local trailCount = 0
local trailLimit = 150
function trailfd(baseSprite, data)
    destroySprite('trail'..trailCount)
    makeSpriteCopy('trail'..trailCount, baseSprite)
    local duration = stepCrochet * 0.001 * 16
    tweenFadeOut('trail'..trailCount, 0, duration, 'trailFinish')
    tweenScaleX('trail'..trailCount, 2, duration, 'cubeInOut', 'trailFinish')
    tweenScaleY('trail'..trailCount, 2, duration, 'cubeInOut')
    local angle = data * (math.pi / 2)
    tweenActorProperty('trail'..trailCount, 'x', 150 * math.sin(angle), duration, 'cubeIn')
    tweenActorProperty('trail'..trailCount, 'y', 150 * math.cos(angle), duration, 'cubeIn')
    setActorLayer('trail'..trailCount, getActorLayer(baseSprite) - 1)

    trailCount = trailCount + 1
    if trailCount >= trailLimit then 
        trailCount = 0
    end
end