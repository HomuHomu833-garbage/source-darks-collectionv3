local sprites = {
   
    {'uno', 'corrupt/1', 0, 0,1,"hud"},--250
    {'dos', 'corrupt/2', 0, 0,1,"hud"},
    {'tres', 'corrupt/3', 0, 0,1,"hud"},
    {'jump', 'corrupt/Jump', 200, 100,0.7,"hud"},-- -250
}
function createPost()
     setCamZoom(1)
     for _, sprite in ipairs(sprites) do
        makePerspectiveSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorLayer(sprite[1], layershit)
        set(sprite[1]..".angleX",90)
    end
    makeSprite('blackBG', '', 0, 0, 3)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), "#000000")
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0.1, 'blackBG')
    setActorLayer('blackBG', getActorLayer('gfCharacter0')-2)

    initShader("ruleta","SpiralNoiseMania")
    setActorShader("blackBG","ruleta") 
    setShaderProperty("ruleta","strength",0)
    setShaderProperty("ruleta","color",0.98)
    setShaderProperty("ruleta","rotationDir",1)
    local shaders = { 
        {"color", "SwapManiaColor", {hueShift = 0,saturationBoost = 0.8,strength = 0.8,brightnessBoost= 1 , blendOverlay = true}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},
        {"vcrchroma", "vcrchroma", {strength = 1,speed = 1.2}},
        {"mirror3", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
        {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, warp = 0 ,doChroma = true}},
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}},
        {"bars", "bars", {effect = 0.55,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"mirror2", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = -2, doChroma = true}},
        {"blur", "zoomblur", {focusPower = 5, posY = 0}},
        {"bloom", "BloomEffect", {contrast = 1 , brightness = 0,effect = 0, strength = 0.5}},
        {"glitch2", "glitchyPeak", {strength = 0,angle = 5}}, 
        {"glitch", "glitchChromatic", {GLITCH = 1}},
        {"ca", "ChromAbEffect", {strength = 0.0035}},
        {"fish", "EyeFishEffect", {power = 0.15}}
     }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        
                setCameraShader('game', name)    -- Aplica los demás shaders a la cámara
            
       
        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
    setCameraShader('hud', "greyscale")
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShader('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
time = 0
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
bf,matt = false,false
otracamara = false
local perlinX,perlinY,perlinZ ,time = 0, 0, 0,0
local perlinSpeed,perlinXRange,perlinYRange,perlinZRange = 2, 0.075, 0.075,5
function update(elapsed)
      x = lerp(x, 0, elapsed * 8)
    y = lerp(y, 0, elapsed * 8)
    angle = lerp(angle,0,elapsed*8)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    perlinZ = perlinZ + elapsed * math.random() * perlinSpeed
    local perlinOffsetX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinOffsetY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    local perlinOffsetZ = (-0.5 + perlin(0, 0, perlinZ)) * perlinZRange
    setShaderProperty('bump', 'x', x + perlinOffsetX)
    setShaderProperty('bump', 'y', y + perlinOffsetY)
    setShaderProperty('bump', 'angle', angle + perlinOffsetZ)
    if otracamara then
        set("camFollow.x",750)
        set("camFollow.y",350)
        set("defaultCamZoom", 0.525)
    end
    if bf then
		set("camFollow.x", get("boyfriend.x")+285)
        set("camFollow.y", get("boyfriend.y")+450)
         set("defaultCamZoom", 0.85)
    end
    if matt then
		set("camFollow.x", get("dad.x")+490)
        set("camFollow.y", get("dad.y")+300)
        set("defaultCamZoom", 0.85)
    end
     time = time + elapsed
    setShaderProperty("glitch","iTime",time)
    setShaderProperty("ruleta","iTime",time*4)
    setShaderProperty("vcrchroma","iTime",time*2)
     setShaderProperty("color","iTime",time/4)
end
function songStart()
     tweenShader('mirror2','barrel',0,crochet*0.004) 
     tweenShader('glitch','GLITCH',0,crochet*0.004,"quadIn") 
    tweenShader('greyscale','strength',0.45,crochet*0.004,"quadIn") 
    mirror(false,true,"","zoom",0,4,2,crochet,"quadOut")
    tweenShader('blur','focusPower',0,crochet*0.004,"quadIn") 
    tweenShader('bars','effect',0.25,crochet*0.002,"quadOut") 
end

function st(set,tween,shader,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty(shader,value,valor)
    end
    if tween then
        tweenShader(shader,value2,valor2, speed*0.001*s,ease)
    end
end
function bumps()
    st(true,true,'bump','zoom','zoom',0.5,1,1.5,crochet,"quadOut")
                    st(true,true,'ca','strength','strength',0.03,0.0035,1.5,crochet,"quadOut")
                    st(true,true,'glitch2','strength','strength',0.06,0,1.5,crochet,"quadOut")
                    bloom(2,1,crochet,1.5,"quadOut")
                    triggerEvent('screen shake', (stepCrochet * 0.004) .. ',0.015')
end
local bumpPatterns = {
    {
        range = {144, 384},--distancia
        steps = {0,6,10,22,28,30,32,44,54,60,62},--pasos
        mod = 64,--duracion
        delay = true
    },
    {
        range = {2144, 2384},--distancia
        steps = {0,6,10,22,28,30,32,44,54,60,62},--pasos
        mod = 64,--duracion
    },
    {
        range = {400, 656},
        steps = {0,6,12,20,24,28,30,32,38,44,52,60,62},
        mod = 64,
        delay = true
    },
     {
        range = {2400, 2656},
        steps = {0,6,12,20,24,28,30,32,38,44,52,60,62},
        mod = 64,
    },
    {
        range = {656, 784},
        steps = {0,8},
        mod = 16,
        alternate = true,
        delay = true
    },
    {
        range = {784, 896},
        steps = {0,8,16,22,28},
        mod = 32,
        alternate = true, 
        delay = true
    },
    {
        range = {896, 912},
        steps = {0},
        mod = 4,
        delay = true
    },
     {
        range = {928, 1168},
        steps = {0,20},
        mod = 32
    },
    {
        range = {1168, 1168+16},
        steps = {0},
        mod = 4,
    },
    {
        range = {1312, 1440},
        steps = {0,20,24},
        mod = 32
    },
     {
        range = {1296, 1296+16},
        steps = {0},
        mod = 4,
    },
    {
        range = {1184, 1296},
        steps = {0,8,16,22,28},
        mod = 32,
    },
    {
        range = {1568, 1681},
        steps = {0,8,16,22,28},
        mod = 32,
    },
}
lol = 1
bfomatt = {{272,"bf"},{288,"matt"},{304,"bf"},{320,"matt"},{336,"nada"},{384,"bf"},{400,"matt"},{464,"bf"},{528,"nada"},{656,"matt"},{720,"bf"},{784,"matt"},{848,"bf"},{928,"nada"},{1184,"matt"},{1312,"bf"},{1424,"nada"}}
glitch = {{50,1},{52,0},{176,1},{180,0},{194,1},{198,0},{242,1},{245,0},{258,1},{261,0},{322,1},{326,0},{386,1},{390,0},{432,1},{436,0},{450,1},{454,0},{560,1},{564,0},{592,1},{596,0}}
function stepHit()
    for i = 1, #glitch do
        local step = glitch[i][1]-4     
        local value = glitch[i][2]     
        if curStep == step then
            tweenShader('glitch', 'GLITCH', value,crochet*0.001,"quadIn")
            tweenShader('mirror2', 'zoom', 0.6,crochet*0.001,"quadIn")
            tweenShader('mirror2', 'y', -0.015,crochet*0.001,"quadIn")
            if value == 0 then
                tweenShader('mirror2', 'y', 0,crochet*0.001,"quadOut")
                 tweenShader('mirror2', 'zoom',1,crochet*0.001,"quadOut")
                 bloom(2,1,crochet,2,"quadOut")
            end
        end
    end
    for i = 1, #bfomatt do
        local step = bfomatt[i][1]
        local value = bfomatt[i][2] 
        
        if curStep == step then
            if value == "bf" then
                bf = true
                matt = false
            elseif value == "matt" then
                bf = false
                matt = true
            elseif value == "nada" then
                bf = false
                matt = false
                set("defaultCamZoom", 0.6)
            end
        end
    end

    if curStep >= 16 and curStep < 144 or  curStep >= 1440 and curStep < 1552 then
        if curStep % 8 == 0 then
            tweenShader('bump','zoom',1,crochet*0.001,"quadOut") 
        elseif curStep % 8 == 6 then
            tweenShader('bump','zoom',0.9,crochet*0.0005,"quadIn") 
        end
    end
    for _, pattern in ipairs(bumpPatterns) do
        local minStep, maxStep = pattern.range[1], pattern.range[2]

        if curStep >= minStep and curStep < maxStep then
            local relativeStep = curStep
            if pattern.delay then
                relativeStep = curStep - 16
            end

            for _, s in ipairs(pattern.steps) do
                if relativeStep % pattern.mod == s then
                    bumps()
                    if pattern.alternate then
                        lol = -lol
                        st(true,true,'mirror3','x','x',0.4*lol,0,1.5,crochet,"quadOut")
                    end
                end
            end
        end
    end

    if curStep == 4 then
        tweenShader('mirror2','y',1,crochet*0.004,"quadInOut") 
    elseif curStep == 8 then
        tweenShader('fish', 'power', 0, crochet * 0.002, 'quadIn')
        mirror(false,true,"","zoom",0,1,2,crochet,"quadIn")
        mirror(false,true,"","angle",0,45,2,crochet,"quadIn")
        tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
    elseif curStep == 16 then
        tweenShader('mirror2','y',0,crochet*0.00001,"quadInOut") 
        tweenShader('bars','effect',0.1,crochet*0.003,"quadOut") 
        mirror(true,true,"zoom","zoom",0.5,1,4,crochet,"quadOut")
        mirror(false,true,"","angle",0,0,4,crochet,"quadOut")
        flashCamera("hud","",crochet*0.002)
        set("defaultCamZoom", 0.55) 
    elseif curStep == 44 then
        mirror(false,true,"","zoom",0,1.25,1,crochet,"quadIn")
     elseif curStep == 48 then
        set("defaultCamZoom", 0.67) 
        mirror(false,true,"","zoom",0,1,1,crochet,"quadOut")
     elseif curStep == 80 then
        tweenShader('greyscale','strength',0,crochet*0.016,"quadIn") 
         bloom(4,1,crochet,2,"quadOut")
     elseif curStep == 128 then
        tweenShader('fish', 'power', 0.5, crochet * 0.004, 'quadIn')
         tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
          tweenShader('bars','angle1',-90,crochet*0.004,"quadIn") 
          mirror(false,true,"","zoom",0,5,4,crochet,"quadIn")
            mirror(false,true,"","angle",0,90,4,crochet,"quadIn")
     elseif curStep == 132 then
        tweenShader('mirror2','x',1,crochet*0.004,"quadInOut") 
     elseif curStep == 144 then
        setProperty('', 'cameraSpeed', 3)
        set("defaultCamZoom", 0.55) 
         tweenShader('mirror2','x',0,crochet*0.003,"quadOut") 
         tweenShader('fish', 'power', 0, crochet * 0.002, 'quadOut')
         tweenShader('bars','effect',0,crochet*0.003,"quadOut") 
         mirror(true,true,"zoom","zoom",0.25,1,4,crochet,"quadOut")
        mirror(false,true,"","angle",-90,0,4,crochet,"quadOut")
        flashCamera("hud","",crochet*0.002)
    end
    if curStep == 272 then
        setShaderProperty("bars","angle1",0)
        tweenShader('bars','effect',0.1,crochet*0.0005,"quadOut") 
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"quadOut")
    elseif curStep == 274 then
         tweenShader('bars','effect',0,crochet*0.0005,"quadIn") 
        mirror(false,true,"","zoom",0,1,0.5,crochet,"quadIn")
    elseif curStep == 276 then
         tweenShader('bars','effect',0.1,crochet*0.0005,"quadOut") 
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"quadOut")
    elseif curStep == 278 then
        tweenShader('bars','effect',0.55,crochet*0.0005,"quadIn") 
        mirror(false,true,"","zoom",0,3,0.5,crochet,"quadIn")
    elseif curStep == 280 then
        tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
        mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
        mirror(true,true,"angle","angle",65,0,3,crochet,"quadOut")
    elseif curStep == 384 then
        tweenShader('bars','effect',0.3,crochet*0.001,"quadOut") 
        tweenShader('mirror3','zoom',2.5,crochet*0.001,"quadOut") 
        --mirror(false,true,"","zoom",0,2.5,1,crochet,"quadOut")
    elseif curStep == 388 then
         mirror(true,true,"y","y",-2,0,2,crochet,"quadInOut")
        --tweenShader('bump','y',2,crochet*0.002,"quadInOut") 
    elseif curStep == 392 then
         tweenShader('bars','effect',0.1,crochet*0.001,"quadOut") 
         tweenShader('mirror3','zoom',1,crochet*0.001,"quadOut") 
         tweenShader('mirror3','angle',-180,crochet*0.002,"quadIn") 
    
    elseif curStep == 396 then
        tweenShader('bars','effect',0.55,crochet*0.001,"quadIn") 
         tweenShader('mirror3','zoom',3,crochet*0.001,"quadIn") 
         mirror(true,true,"x","x",-0,1,1,crochet,"quadInOut")
    elseif curStep == 400 then
          tweenShader('bars','effect',0.1,crochet*0.003,"quadOut") 
        tweenShader('mirror','x',0,crochet*0.00001) 
            st(true,true,'mirror3','zoom','zoom',0,1,3,crochet,"quadOut")
                st(true,true,'mirror3','angle','angle',65,0,3,crochet,"quadOut")
         --mirror(true,true,"zoom","zoom",0.25,1,3,crochet,"quadOut")
      --  mirror(false,true,"","angle",65,0,3,crochet,"quadOut")
        flashCamera("hud","",crochet*0.002)
    elseif curStep == 460 then
        mirror(false,true,"","zoom",0,1.25,0.5,crochet,"quadOut")
        mirror(true,true,"x","x",-0.3,0,0.5,crochet,"quadOut")
    elseif curStep == 462 then
        tweenShader('bars','effect',0.55,crochet*0.0005,"quadIn") 
        mirror(false,true,"","zoom",0,1,0.5,crochet,"quadIn")
        mirror(true,true,"x","x",0.3,0,1,crochet,"quadOut")
    elseif curStep == 464 then
        tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
         mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
    elseif curStep == 512 then
        tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
    elseif curStep == 516 then
         mirror(false,true,"","y",0,-1,3,crochet,"quadIn")
    elseif curStep == 528 then
        setShaderProperty("color","hueShift",1.1)
        mirror(false,true,"","y",0,0,0.01,crochet,"")
        st(true,true,'greyscale','strength','strength',1,0,2,crochet,"")
         tweenShader('bars','effect',0,crochet*0.004,"quadOut") 
         mirror(true,true,"zoom","zoom",3,1,3,crochet,"quadOut")
    elseif curStep == 624 then
        tweenShader('color','strength',0,crochet*0.008,"quadIn") 
    elseif curStep == 640 then
        tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
    elseif curStep == 648 then
         mirror(false,true,"","zoom",0,3,2,crochet,"quadIn")
          mirror(false,true,"","angle",0,180,2,crochet,"quadIn")
    elseif curStep == 656 then
         tweenShader('color','strength',0.8,crochet*0.002,"quadOut") 
          tweenShader('bars','effect',0.1,crochet*0.003,"quadOut") 
         mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
        mirror(true,true,"angle","angle",-65,0,3,crochet,"quadOut")
        flashCamera("hud","",crochet*0.002)
    elseif curStep == 684  then
         mirror(true,true,"y","y",0,-1,1,crochet,"quadIn")
    elseif curStep == 692 then
        mirror(true,true,"y","y",-1,-2,1,crochet,"quadIn")
    elseif curStep == 768 then
         mirror(false,true,"","zoom",0,0.6,2,crochet,"quadIn")
    elseif curStep == 776 then
         tweenShader('bars','effect',0.25,crochet*0.001,"quadOut") 
         mirror(false,true,"","zoom",0,2,1,crochet,"quadOut")
          mirror(false,true,"","angle",0,25,2,crochet,"quadIn")
    elseif curStep == 780 then
        mirror(false,true,"","zoom",0,1,1,crochet,"quadIn")
         tweenShader('bars','effect',0,crochet*0.001,"quadIn") 
    elseif curStep == 784 then
         mirror(false,true,"","angle",0,0,2,crochet,"quadOut")
    elseif curStep == 896 then
         tweenShader('bars','effect',0.55,crochet*0.004,"cubeIn") 
    elseif curStep == 904 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeIn")
    elseif curStep == 912 then
         tweenShader('glitch', 'GLITCH', 0.5,crochet*0.004,"quadIn")
        mirror(true,true,"zoom","zoom",0,1,2,crochet,"quadOut")
        tweenShader('bars','effect',0.25,crochet*0.001,"quadOut") 
        mirror(false,true,"","angle",0,-90,4,crochet,"cubeIn")
    elseif curStep == 920 then
          tweenShader('color','strength',0,crochet*0.002,"quadOut") 
        tweenShader('greyscale','strength',1,crochet*0.001,"quadOut") 
         tweenShader('bars','effect',0.55,crochet*0.002,"cubeIn") 
        mirror(false,true,"","zoom",0,0,2,crochet,"cubeIn")
    elseif curStep == 928 then
        tweenShader('glitch', 'GLITCH', 0,crochet*0.002,"quadOut")
        tweenShader('greyscale','strength',0,crochet*0.001,"quadOut") 
         tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
        mirror(true,true,"zoom","zoom",3,1,3,crochet,"quadOut")
         mirror(true,true,"angle","angle",90,0,3,crochet,"quadOut")
        flashCamera("game","",crochet*0.002)
         setActorScroll(1,1, 'gfCharacter0')
        setActorScroll(1, 1, 'gfCharacter1')
        setActorScaleXY(1, 1, 'gfCharacter0')
        setActorScaleXY(1, 1, 'gfCharacter1')
        otracamara = true
       
    elseif curStep == 1048 then
         mirror(true,true,"y","y",-2,0,3.5,crochet,"quadInOut")
    elseif curStep == 1136 then
        mirror(false,true,"","zoom",0,0.6,4,crochet,"quadOut")
    elseif curStep == 1160 then
        mirror(false,true,"","zoom",0,2.5,3,crochet,"quadOut")
    elseif curStep == 1164 then
        tweenShader('mirror3','y',1,crochet*0.001,"quadIn") 
    elseif curStep == 1168 then
          tweenShader('glitch', 'GLITCH', 0.5,crochet*0.004,"quadIn")
         tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
        tweenShader('mirror3','y',2,crochet*0.001,"quadIn") 
    elseif curStep == 1172 then
         mirror(false,true,"","zoom",0,10,2,crochet,"quadIn")
        tweenShader('mirror3','y',3,crochet*0.001,"quadIn") 
    elseif curStep == 1176 then
        tweenShader('mirror3','y',4,crochet*0.001,"quadIn")
    elseif curStep == 1184 then
       
        setShaderProperty("ruleta","strength",0.5)
          tweenShader('glitch', 'GLITCH', 0,crochet*0.002,"quadOut")
          tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
        mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
         mirror(true,true,"angle","angle",90,0,3,crochet,"quadOut")
    elseif curStep == 1296 then
        mirror(false,true,"","zoom",0,4,4,crochet,"quadIn")
        tweenShader('bars','effect',0.55,crochet*0.004,"quadIn")
    elseif curStep == 1312 then
        setShaderProperty("color","strength",0.88)
        mirror(true,true,"zoom","zoom",0,1,4,crochet,"quadOut")
        mirror(true,true,"x","x",-1,0,4,crochet,"quadOut")
        tweenShader('bars','effect',0.1,crochet*0.003,"quadOut")
    elseif curStep == 1368 then
        mirror(true,true,"x","x",0,-2,2,crochet,"quadIn")
    elseif curStep == 1376 then
         mirror(false,true,"","x",0,0,3,crochet,"quadOut")
    elseif curStep == 1424 or curStep == 1552 then
         mirror(false,true,"","zoom",0,3,4,crochet,"quadIn")
          mirror(false,true,"","angle",0,180,4,crochet,"quadIn")
        tweenShader('glitch', 'GLITCH', 0.5,crochet*0.004,"quadIn")
         tweenShader('bars','effect',0.55,crochet*0.004,"quadIn") 
    elseif curStep == 1440 then
        otracamara = false
         set("defaultCamZoom", 0.85)
          setActorAlpha(0.7, 'blackBG')
           --      mirror(false,true,"","x",0,-0.5,3,crochet,"quadOut")
                mirror(false,true,"","warp",0,0.25,3,crochet,"quadOut")
        setShaderProperty("ruleta","strength",0.5)
          tweenShader('glitch', 'GLITCH', 0,crochet*0.002,"quadOut")
          tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
        mirror(true,true,"zoom","zoom",0,1.25,3,crochet,"quadOut")
         mirror(true,true,"angle","angle",-90,0,3,crochet,"quadOut")
    elseif curStep == 1480 or curStep == 1544 then
       --  mirror(false,true,"","x",0,0,2,crochet,"quadIn")
        mirror(false,true,"","warp",0,0,2,crochet,"quadIn")
    elseif curStep == 1488 then
         tweenShader('mirror2', 'barrel', -2,crochet*0.004,"quadIn")
         st(true,true,'mirror3','y','y',-2,0,4,crochet,"quadIn")
        mirror(false,true,"","zoom",0,5,2,crochet,"quadOut")
        mirror(false,true,"","angle",0,180,4,crochet,"quadIn")
    elseif curStep == 1496 then
         mirror(false,true,"","zoom",0,0.8,2,crochet,"quadIn")
    elseif curStep == 1504 then
       --  mirror(false,true,"","x",0,0.5,3,crochet,"quadOut")
                mirror(false,true,"","warp",0,0.25,3,crochet,"quadOut")
         tweenShader('mirror2', 'barrel', 0,crochet*0.002,"quadOut")
        mirror(false,true,"","zoom",0,1.25,2,crochet,"quadOut")
        mirror(true,true,"angle","angle",-180,0,4,crochet,"quadOut")
    elseif curStep == 1568 then
                  tweenShader('glitch', 'GLITCH', 0,crochet*0.002,"quadOut")
          tweenShader('bars','effect',0.1,crochet*0.002,"quadOut") 
        mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
         mirror(true,true,"angle","angle",-90,0,3,crochet,"quadOut")
    elseif curStep == 1680 then
        mirror(false,true,"","angle",0,-180,4,crochet,"quadIn")
          tweenShader('bars', 'effect', 0.2,crochet*0.001,"quadOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
    elseif curStep == 1688 then
          tweenShader('bars', 'effect', 0.55,crochet*0.002,"quadIn")
        mirror(false,true,"","zoom",0,3,2,crochet,"quadIn")
    elseif curStep == 1696 then
                 setActorAlpha(0.1, 'blackBG')
      setShaderProperty("ruleta","strength",0)
        setShaderProperty("greyscale","strength",1)
          setShaderProperty("color","strength",0)
        tweenShader('bars', 'effect', 0,crochet*0.003,"quadOut")
        mirror(true,true,"zoom","zoom",0,1,3,crochet,"quadOut")
          mirror(true,true,"angle","angle",90,0,3,crochet,"quadOut")
    end
    if curStep == 1736 then
         mirror(false,true,"","zoom",0,1.5,2,crochet,"quadOut")
    elseif curStep == 1744 then
         mirror(false,true,"","zoom",0,2.5,3,crochet,"quadOut")
         mirror(false,true,"","angle",0,180,2,crochet,"quadIn")
    elseif curStep == 1752 then
        mirror(false,true,"","angle",0,360,7,crochet,"quadOut")
    elseif curStep == 1756 then
         tweenShader('bars', 'effect', 0.2,crochet*0.003,"quadOut")
    elseif curStep == 1776 then
         mirror(false,true,"","zoom",0,1,4,crochet,"quadIn")
    elseif curStep == 1776+16 then
        mirror(false,true,"","zoom",0,1.25,1.5,crochet,"quadOut")
        mirror(true,true,"angle","angle",0,-25,1.5,crochet,"quadOut")
        tweenShader('bars', 'effect', 0.15,crochet*0.001,"quadOut")
     elseif curStep == 1800 then
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"quadOut")
        tweenShader('bars', 'effect', 0.2,crochet*0.001,"quadOut")
        mirror(false,true,"","angle",0,25,1.5,crochet,"quadOut")
     elseif curStep == 1808 then
         mirror(false,true,"","zoom",0,1.75,1.5,crochet,"quadOut")
        tweenShader('bars', 'effect', 0.25,crochet*0.001,"quadOut")
        mirror(false,true,"","angle",0,-25,1.5,crochet,"quadOut")
          st(true,true,'mirror2','x','x',-2,0,5,crochet,"quadInOut")
     elseif curStep == 1816 then
         mirror(false,true,"","zoom",0,2,1.5,crochet,"quadOut")
         mirror(false,true,"","angle",0,180,2,crochet,"quadIn")
     elseif curStep == 1820 then
         tweenShader('greyscale', 'strength', 0,crochet*0.001,"quadIn")
        tweenShader('bars', 'effect', 0.5,crochet*0.001,"quadIn")
     elseif curStep == 1824 then
         flashCamera("game","",crochet*0.002)
         setActorScroll(0.4,0.4, 'gfCharacter0')
        setActorScroll(0.4, 0.4, 'gfCharacter1')
        setActorScaleXY(0.6, 0.6, 'gfCharacter0')
        setActorScaleXY(0.6, 0.6, 'gfCharacter1')

      --  otracamara = false
         mirror(true,true,"zoom","zoom",0,1,6,crochet,"quadOut")
        mirror(true,true,"angle","angle",-180,0,6,crochet,"quadOut")
        tweenShader('bars', 'effect', 0,crochet*0.003,"quadOut")
    end
    if curStep == 1872 then
         mirror(false,true,"","zoom",0,1.25,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,15,1,crochet,"quadOut")
    elseif curStep == 1876 then
         mirror(false,true,"","zoom",0,1.5,1,crochet,"quadOut")
         mirror(false,true,"","angle",0,-25,1,crochet,"quadOut")
     elseif curStep == 1880 then
        tweenShader('bars', 'effect', 0.3,crochet*0.004,"quadOut")
         mirror(false,true,"","zoom",0,4,6,crochet,"quadOut")
         mirror(true,true,"angle","angle",-90,0,8,crochet,"quadOut")
     elseif curStep == 1904 then
        mirror(false,true,"","zoom",0,1,8,crochet,"quadIn")
         elseif curStep == 1928 then
        tweenShader('bars', 'effect', 0,crochet*0.002,"quadIn")
         elseif curStep == 1936 then
             tweenShader('bars', 'effect', 0.1,crochet*0.001,"quadOut")
             st(true,true,'mirror3','angle','angle',-25,0,1,crochet,"quadOut")
             tweenShader('mirror3', 'zoom', 1.5,crochet*0.001,"quadOut")
         elseif curStep == 1940 or curStep == 1948 then
             tweenShader('bars', 'effect', 0,crochet*0.001,"quadIn")
             tweenShader('mirror3', 'zoom', 1,crochet*0.001,"quadIn")
         elseif curStep == 1944 then
             tweenShader('bars', 'effect', 0.25,crochet*0.001,"quadOut")
            st(true,true,'mirror3','angle','angle',25,0,1,crochet,"quadOut")
             tweenShader('mirror3', 'zoom', 2,crochet*0.001,"quadOut")
             mirror(true,true,"y","y",-2,0,4,crochet,"quadInOut")
         elseif curStep == 1952 then
            tweenShader('mirror3', 'zoom', 1.25,crochet*0.004,"quadOut")
         elseif curStep == 1968 then
             tweenShader('mirror3', 'zoom', 1,crochet*0.003,"quadIn")
         elseif curStep == 1980  then
            tweenShader('mirror3', 'zoom', 1.25,crochet*0.002,"quadOut")
         elseif curStep == 1988 or curStep == 2012 then
             tweenShader('mirror3', 'zoom', 1,crochet*0.001,"quadIn")
         elseif curStep == 1992 then
            tweenShader('bars', 'effect', 0.15,crochet*0.002,"quadOut")
             tweenShader('mirror3', 'zoom', 2,crochet*0.002,"quadOut")
         elseif curStep == 2004 then
            tweenShader('bars', 'effect', 0.25,crochet*0.001,"quadOut")
            st(true,true,'mirror3','zoom','zoom',1.25,2.5,2,crochet,"quadOut")
         
        
    end
     if curStep == 2012 then
             tweenShader('bars', 'effect', 0,crochet*0.001,"quadIn")
             tweenShader('greyscale', 'strength', 1,crochet*0.001,"quadIn")
     elseif curStep == 2016 then
        tweenShader('greyscale', 'strength', 0,crochet*0.001,"quadOut")
     elseif curStep == 2072 then
         tweenShader('greyscale', 'strength', 1,crochet*0.004,"quadOut")
          tweenShader('mirror3', 'zoom', 1.5,crochet*0.008,"quadOut")
            tweenShader('mirror3', 'angle', -25,crochet*0.008,"quadOut")
     elseif curStep == 2080 then
mirror(true, true, "y", "y",0, 1, 16, crochet, "quadIn")
  tweenShader('bars', 'effect', 0.55,crochet*0.016,"quadIn")
     elseif curStep == 2096 then
        tweenShader('mirror3', 'angle', -65,crochet*0.008,"quadIn")
     elseif curStep == 2144 then
        tweenShader('bars', 'effect', 0,crochet*0.003,"quadOut")
        mirror(true, true, "y", "y",1, 2, 3, crochet, "quadOut")
         tweenShader('greyscale', 'strength', 0,crochet*0.003,"quadOut")
          tweenShader('mirror3', 'zoom', 1,crochet*0.003,"quadOut")
            tweenShader('mirror3', 'angle',0,crochet*0.003,"quadOut")
                      --  tweenShader('bars', 'effect', 0.55,crochet*0.004,"quadIn")
         end
    if curStep == 1792 then
        tween("tres",{angleX = 0},crochet*0.001,"quadOut")
    elseif curStep == 1796 then
        tween("tres",{angleX = -90},crochet*0.001,"quadIn")
    elseif curStep == 1800 then
        tween("dos",{angleX = 0},crochet*0.001,"quadOut")
    elseif curStep == 1804 then
        tween("dos",{angleX = -90},crochet*0.001,"quadIn")
    elseif curStep == 1808 then
        tween("uno",{angleX = 0},crochet*0.001,"quadOut")
    elseif curStep == 1812 then
        tween("uno",{angleX = -90},crochet*0.001,"quadIn")
     elseif curStep == 1816 then
        tween("jump",{angleX = 0},crochet*0.001,"quadOut")
    elseif curStep == 1820 then
        tween("jump",{angleX = -90},crochet*0.001,"quadIn")
    end
    if curStep == 1736 or curStep == 1744 then
        x = -0.2
    elseif curStep == 1740 or curStep == 1748 then
       x = 0.2
    end
    if curStep == 1440 or curStep == 1468 or curStep == 1480 or curStep == 1484 or curStep == 1492 
    or curStep == 1504 or curStep == 1532 or curStep == 1544 or curStep == 1552 or curStep == 1560
    or curStep == 1824 or curStep == 1832 or curStep == 1852 or curStep == 1864 or curStep == 1868
    or curStep == 1876 or curStep == 1888 or curStep == 1916 or curStep == 1928 or curStep == 1952
    or curStep == 1980 or curStep == 1992 or curStep == 2004 or curStep == 2016 or curStep == 2024
    or curStep == 2044 or curStep == 2056 or curStep == 2068 then
        bumps()
    end
    if curStep == 1200 or curStep == 1232 or curStep == 1264 or curStep == 1296 
        or curStep == 1304 or curStep == 1212 or curStep == 1244 or curStep == 1276 then
            mirror(true, true, "angle", "angle", 25, 0, 1, crochet, "quadOut")
        elseif curStep == 1206 or curStep == 1238 or curStep == 1270 or curStep == 1300 or curStep == 1308 then
            mirror(true, true, "angle", "angle", -25, 0, 1, crochet, "quadOut")
        end
        if curStep == 1600 or curStep == 1608 or curStep == 1632 or curStep == 1640 or curStep == 1664 or curStep == 1672 then
            mirror(true, true, "x", "x", -1, 0, 2, crochet, "quadOut")
        elseif curStep == 1616 or curStep == 1622 or curStep == 1630 or curStep == 1648 
        or curStep == 1654 or curStep == 1660 or curStep == 1680 then
            mirror(true, true, "x", "x", -1, 0, 2, crochet, "quadOut")
            mirror(true, true, "y", "y", 1, 0, 2, crochet, "quadOut")
        end


    if curStep == 272 or curStep == 304 or curStep == 312 then
         st(true,true,'mirror3','y','y',-0.1,0,0.5,crochet,"quadOut")
          st(true,true,'mirror3','x','x',-0.2,0,0.5,crochet,"quadOut")
        mirror(true,true,"angle","angle",-25,0,0.5,crochet,"quadOut")
    elseif curStep == 276 or curStep == 308 or curStep == 316 then
          st(true,true,'mirror3','y','y',0.1,0,0.5,crochet,"quadOut")
          st(true,true,'mirror3','x','x',0.2,0,0.5,crochet,"quadOut")
            mirror(true,true,"angle","angle",25,0,0.5,crochet,"quadOut")
    end
    if curStep == 532 or curStep == 536 or curStep == 544 or curStep == 548 or curStep == 564 or curStep == 568
    or curStep == 576 or curStep == 582 or curStep == 596 or curStep == 600 or curStep == 608 or curStep == 612
    or curStep == 628 or curStep == 632 or curStep == 640 or curStep == 644 then
         st(true,true,'mirror3','x','x',-0.1,0,0.5,crochet,"quadOut")
    elseif curStep == 534 or curStep == 538 or curStep == 546 or curStep == 566 or curStep == 566 or curStep == 570
    or curStep == 580 or curStep == 598 or curStep == 602 or curStep == 610 or curStep == 630 or curStep == 634 
    or curStep == 642 then
         st(true,true,'mirror3','x','x',0.1,0,0.5,crochet,"quadOut")
     elseif curStep == 552 or curStep == 556 or curStep == 560 or curStep == 588 or curStep == 616 or curStep == 620
     or curStep == 624 then
         st(true,true,'mirror3','y','y',0.1,0,0.5,crochet,"quadOut")
     elseif curStep == 554 or curStep == 558 or curStep == 590 or curStep == 618 or curStep == 622 or curStep == 626 then
         st(true,true,'mirror3','y','y',-0.1,0,0.5,crochet,"quadOut")
    end
    if curStep >= 536 and curStep < 648 then
        if curStep % 32 == 8 then
            st(true,true,'mirror3','angle','angle',15,0,2,crochet,"quadOut")
        elseif curStep % 32 == 24 then
            st(true,true,'mirror3','angle','angle',-15,0,2,crochet,"quadOut")
        end
    end
end