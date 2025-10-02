function lascosasdelhud(s,step,c,ease)
    tween("healthBar",{alpha = s},step*0.001*c,ease)
    tween("healthBarBG",{alpha = s},step*0.001*c,ease)
    tween("iconP1",{alpha = s},step*0.001*c,ease)
    tween("iconP2",{alpha = s},step*0.001*c,ease)
    tween("scoreTxt",{alpha = s},step*0.001*c,ease)
    tween("timeBar",{alpha = s},step*0.001*c,ease)
    tween("ratingText",{alpha = s},step*0.001*c,ease)
end
local sprites = {
    {'nubeabajo','Final/Clouds-abajo', -600, -850, 0.5,"game"},---350
    {'nubearriba','Final/Clouds-arriba', -600,950,0.5,"game"},--650
    {'logo','Final/logo', -150,1000,1,"game"},
    {'nose','Final/STAINS', -600,-300,0.65,"game"},
    {'death','Final/death notes', 1100,-1350,2,"game"},
    {'punch','Final/Punch', 1100,-1350,2,"game"},
    {'shaggy','Final/Shaggy', -250,-250,1.5,"game"},
    {'matt','Final/Matt', -50,250,1.25,"game"},
    {'shaggy1','Final/Shaggy1', -650,50,0.8,"hud"},--150
    {'shaggy2','Final/Shaggy2', 950,100,0.8,"hud"},--50
    {'shaggy3','Final/Shaggy3', -250,0,0.8,"hud"},--150
    {'render','freeplay/Renders/GOD VOIID SXM VIP', -600,1100,1.5,"game"},---200
    {'final','Final/final destination', -450,600,1,"game"},
    {'matt1','Final/Matt1', 950,150,0.7,"hud"},
    {'matt2','Final/Matt2', -250,150,0.7,"hud"},
    {'matt3','Final/Matt3', 950,150,0.7,"hud"},
    {'godmode','Final/Godmode', 250,830,0.4,"hud"},--y 330
    {'punch1','Final/punch1', 50,250,1,"hud"},
    {'death10','Final/death', 50,200,1,"hud"},
    {'death1','Final/death', 50,200,1,"hud"},
    {'death6','Final/death1', 50,200,1,"hud"},
    {'death7','Final/death2', 50,200,1,"hud"},
    {'death8','Final/death3', 50,200,1,"hud"},
    {'death9','Final/death4', 50,200,1,"hud"},
    
   
}

function createPost()
     for i = 0,7 do
        setActorAlpha(0,i)
    end
    setCamZoom(0.55)
    lascosasdelhud(0,crochet,4,"cubeOut")
    set("boyfriend.alpha",0)
    set("girlfriend.alpha",0)
    set("dadCharacter0.alpha",0)
    set("dadCharacter1.alpha",0)
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
    setShaderProperty('chess', 'direction',-1.0)



    --set("undefinedSprite1.alpha",0)
   -- set("undefinedSprite2.alpha",0)
   -- set("undefinedSprite3.alpha",0)
   -- set("undefinedSprite4.alpha",0)
    set("undefinedSprite0.x",getActorX("undefinedSprite0")-350)
    set("undefinedSprite0.y",getActorY("undefinedSprite0")-1000)
   -- setActorScale(0.55,"undefinedSprite0")
    
    for _, sprite in ipairs(sprites) do
        makeSprite3D(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5])
        setObjectCamera(sprite[1], sprite[6])
        setActorScroll(0,0,sprite[1])
        if sprite[1] == "punch1" or sprite[1] == "death1" or sprite[1] == "shaggy1" or sprite[1] == "shaggy2" or sprite[1] == "shaggy3"
        or sprite[1] == "matt1" or sprite[1] == "matt2" or sprite[1] == "matt3"then
            setActorAlpha(0,sprite[1])
        end
        if sprite[1] == "shaggy1" or sprite[1] == "shaggy3" or sprite[1] == "matt1" or sprite[1] == "matt3" then
            setActorAngle(25,sprite[1])
        
        elseif sprite[1] == "shaggy2" or sprite[1] == "matt2"  then
            setActorAngle(-25,sprite[1])
        end
    end
  


   
    local shaders = { 
    {"color", "SwapManiaColor", {hueShift = 0,saturationBoost = 1,strength = 0.25,brightnessBoost= 0}},
    {"ca", "ChromAbBlueSwapEffect", {strength = 0.003}},
    {"Sunrays", "Sunrays", {strength = 2}},
    {"frequency", "GradianFreqcyMania", {strength = 0.21}},
    {"bloom", "BloomEffect", {contrast = 1.2, brightness = 0}},
    {"mirror", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"mirror2", "PincushNewEffect", {zoom = 1.2, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
    {"bars2", "bars", {effect = 0,effect2 = 0,angle1 = 0}},
    {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0.5, doChroma = true}},
    {"vignette", "vignette", {strength = 15, size = 0.3}},
    {"fish", "EyeFishEffect", {power = 0.2}},
    {"bars", "bars", {effect = 0.55,effect2 = 0}}
    }

    for _, shader in ipairs(shaders) do
        local name, effect, properties = shader[1], shader[2], shader[3]
        initShader(name, effect)
        setCameraShader('game', name)
    


        for prop, value in pairs(properties) do
            setShaderProperty(name, prop, value)
        end
    end
   -- setCameraShader('hud', "Sunrays")
    setCameraShader('hud', "bloom")
    makeSpriteCopy("punch2","punch1")
    makeSpriteCopy("punch3","punch1")
    makeSpriteCopy("punch4","punch1")

    makeSpriteCopy("punch5","punch1")
    makeSpriteCopy("punch6","punch1")
    makeSpriteCopy("punch7","punch1")
    makeSpriteCopy("punch8","punch1")
    makeSpriteCopy("punch9","punch1")

    set("punch2.x",350)
    set("punch3.x",650)
    set("punch4.x",950)

    makeSpriteCopy("death2","death1")
    makeSpriteCopy("death3","death1")
    makeSpriteCopy("death4","death1")
    set("death2.x",350)
    set("death3.x",650)
    set("death4.x",950)

    setActorFlipX(1,"shaggy2")
    setActorFlipX(1,"matt1")
    setActorFlipX(1,"matt3")
    
    deathSprites = {'death10','death6','death7','death8','death9'}
    punchSprites = {'punch5', 'punch6', 'punch7', 'punch8','punch9'}

    for _, id in ipairs(deathSprites) do
    set(id .. ".x", math.random(100, 1100)) 
    set(id .. ".y", -200 - math.random(0, 300))
    setActorAlpha(1, id)
end

for _, id in ipairs(punchSprites) do
    set(id .. ".x", math.random(100, 1100)) 
    set(id .. ".y", -200 - math.random(0, 300))
    setActorAlpha(0, id) 
end



    makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#fff')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('girlfriend'))
end
local valores = {}
flip = false
flip2 = false
function setValor(actorName, eje, valor, speed)
    if valores[actorName] == nil then
        valores[actorName] = {}
    end
    valores[actorName][eje] = {
        valor = valor,
        speed = speed or 6 
    }
end
function texto(actor,alpha,s,ease)
    tween(actor, {alpha = alpha}, 0.001)
    tween(actor, {alpha = 0}, crochet*0.001*s,ease)
end
local floatShit = 0
time,a,speed,angle = 0,0,3,5
local currentActor = 'death'
local actorOrder = {'death','punch'}
local currentIndex = 1
swap = 1
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.05
function update(elapsed)
    time = time + elapsed

    if curStep >= 484 then
        for _, id in ipairs(deathSprites) do
            local speed = 1600 * elapsed
            setActorY(getActorY(id) + speed, id)

            if curStep < 604 then
                if getActorY(id) > 1000 then
                    setActorY(-200 - math.random(0, 300), id)
                    setActorX(math.random(0, 1000), id)
                    setActorScale(math.random() * 0.25 + 0.85, id)
                end
            end
        end
    end
    if curStep >= 604 then
        for _, id in ipairs(punchSprites) do
            if getActorAlpha(id) < 1 then
                setActorAlpha(1, id)
            end

            local speed = 1600 * elapsed
            setActorY(getActorY(id) + speed, id)
            if curStep < 704 then
                if getActorY(id) > 1200 then
                    setActorY(-200 - math.random(0, 300), id)
                    setActorX(math.random(0, 1000), id)
                    setActorScale(math.random() * 0.1 + 0.75, id)
                    local angles = {-90, -45, 45, 90}
                    local randAngle = angles[math.random(1, #angles)]
                    setActorAngle(randAngle, id)
                end
            end
        end
    end

    setShaderProperty("Sunrays","iTime",time*6)
    setShaderProperty("chess","iTime",time)
    setShaderProperty("color","iTime",time)
    setShaderProperty("frequency","iTime",time)
    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.005)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
    end
    zoom = lerp(zoom, 1, elapsed * 6)
    setShaderProperty('bump', 'zoom',zoom)
    bloom = lerp(bloom, 1.2, elapsed * 6)
    setShaderProperty('bloom', 'contrast',bloom)
    angle2 = lerp(angle2, 0, elapsed * 6)
    setShaderProperty('bump', 'angle',angle2)
    x = lerp(x, 0, elapsed * 6)
    setShaderProperty('bump', 'x',x)
    y = lerp(y, 0, elapsed * 6)
    setShaderProperty('bump', 'y',y)
    local songSine = songPos * 0.001
    local songSineY = songPos * 0.004
    local curMattX, curMattY = getActorX('matt'), getActorY('matt')
    local curShaggyX, curShaggyY = getActorX('shaggy'), getActorY('shaggy')
    setActorX(curShaggyX + math.sin(songSine) * -0.5, 'shaggy')
    setActorY(curShaggyY + math.sin(songSineY) * -1, 'shaggy')
    setActorX(curMattX + math.sin(songSine) * 0.5, 'matt')
    setActorY(curMattY + math.sin(songSineY) * 1, 'matt')

        setActorX(getActorX("shaggy1") + math.sin(songSine) * -0.5, 'shaggy1')
    setActorY(getActorY("shaggy1") + math.sin(songSineY) * -1, 'shaggy1')
        setActorX(getActorX("shaggy2") + math.sin(songSine) * -0.5, 'shaggy2')
    setActorY(getActorY("shaggy2") + math.sin(songSineY) * -1, 'shaggy2')
        setActorX(getActorX("shaggy3") + math.sin(songSine) * -0.5, 'shaggy3')

    setActorY(getActorY("matt1") + math.sin(songSineY) * 1, 'matt1')
     setActorX(getActorX("matt1") + math.sin(songSine) * 0.5, 'matt1')
        setActorX(getActorX("matt2") + math.sin(songSine) * 0.5, 'matt2')
    setActorY(getActorY("matt2") + math.sin(songSineY) * 1, 'matt2')
        setActorX(getActorX("matt3") + math.sin(songSine) * 0.5, 'matt3')
    setActorY(getActorY("matt3") + math.sin(songSineY) * 1, 'matt3')


    local floatShit = 50 * math.tan(songPos * 0.002)
    local posY = floatShit - 200
        setActorY(posY, currentActor)

        if getActorY(currentActor) > 720 then  
            swap=-swap
            setActorY(-1800, currentActor)
            currentIndex = currentIndex + 1
            if currentIndex > #actorOrder then
                currentIndex = 1
            end
            setValor(currentActor,"y",180*swap)
            currentActor = actorOrder[currentIndex]
        end

    for actor, ejes in pairs(valores) do
        for eje, datos in pairs(ejes) do
            datos.valor = lerp(datos.valor, 0, elapsed * (datos.speed or 6))
            set(actor .. '.angle3D.' .. eje, datos.valor)
        end
    end

    a = a + (elapsed / (1 / 120))
    setShaderProperty('bump', 'angle', math.sin(a / 100 * speed) * angle + angle2)
    
    if curStep >= 230 then
        set("camFollow.y", -500 + time*3)
    end
    if curStep >= 364 then
        local t1 = songPos * 0.001
        local t2 = songPos * 0.004
        local angleT = songPos * 0.003
        local renderX = 2 * math.sin(t1)
        local renderY = 2 * math.sin(t2)
        local logoX = -2 * math.sin(t1)
        local logoY = -2 * math.sin(t2)
        local angleOscillation = -3 * math.cos(angleT) 
        setActorX(getActorX("render") + renderX, "render")
        setActorY(getActorY("render") + renderY, "render")

        setActorX(getActorX("logo") + logoX, "logo")
        setActorY(getActorY("logo") + logoY, "logo")
        setActorAngle(angleOscillation, "render")
        setActorAngle(-angleOscillation, "logo") 
    else
        setActorX(getActorX("render") + math.sin(songSine) * 0.5, "render")
        setActorY(getActorY("render") + math.sin(songSineY) * 1, "render")

        setActorX(getActorX("logo") + math.sin(songSine) * -0.5, "logo")
        setActorY(getActorY("logo") + math.sin(songSineY) * -1, "logo")
    end


end

function songStart()
    tweenShader("bars", "effect", 0, crochet * 0.004, "",0.1)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
bump = {11,27,41,56,71,87,102,116,132,146,161,176,191}
function stepHit()
    if curStep == 94 then
        setValor('matt',"y", 180,3)
        setValor('shaggy',"y", 180,3)
        flashCamera("hud","",crochet*0.002)
        setActorFlipX(1,"matt")
        setActorFlipX(1,"shaggy")
        tween("matt",{x= 500},crochet*0.006,"cubeInOut")
        tween("shaggy",{x= 400},crochet*0.006,"cubeInOut")
        tween("punch",{x= -400},crochet*0.006,"cubeInOut")
        tween("death",{x= -400},crochet*0.006,"cubeInOut")
        mirror(false,true,"","zoom",0,3,3,crochet,"cubeOut")
        mirror(false,true,"","angle",0,25,3,crochet,"cubeOut")
        tweenShader("bars","effect",0.1,crochet*0.004,"cubeOut")
    elseif curStep == 106 then
        mirror(false,true,"","zoom",0,1,1.5,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1.5,crochet,"cubeIn")
    elseif curStep == 112 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-25,2,crochet,"cubeOut")
        tweenShader("bars","effect",0.55,crochet*0.003,"cubeIn")
    elseif curStep == 120 then
        mirror(false,true,"","angle",0,25,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
    elseif curStep == 124 then
        flashCamera("hud","",crochet*0.002)
        tweenShader("bars","effect",0,crochet*0.004,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 154 then
        mirror(false,true,"","angle",0,25,5.5,crochet,"cubeOut")
    elseif curStep == 176 then
        mirror(false,true,"","angle",0,0,8,stepCrochet,"cubeIn")
    elseif curStep == 184 then
        mirror(false,true,"","angle",0,-25,6,crochet,"cubeOut")
    end
    if curStep == 214 then
        tweenShader("bars","effect",0,crochet*0.004,"cubeInOut")
        mirror(false,true,"","angle",0,0,4,crochet,"cubeOut")
        tween("undefinedSprite1",{y=700},crochet*0.006,"cubeIn")
        tween("undefinedSprite2",{y=700},crochet*0.006,"cubeIn")
        tween("undefinedSprite3",{y=700},crochet*0.006,"cubeIn")
        tween("undefinedSprite4",{y=700},crochet*0.006,"cubeIn")
        tween("matt",{x=2500},crochet*0.008,"cubeIn")
        tween("shaggy",{x=2500},crochet*0.008,"cubeIn")
        tween("punch",{alpha=0},crochet*0.008,"cubeOut")
        tween("death",{alpha=-0},crochet*0.008,"cubeOut")
        tween("final",{y=250},crochet*0.008,"cubeInOut")
        mirror(true,true,"x","x",-1,0,6,crochet,"cubeInOut")
        tweenShader("bars","effect2",0.1,crochet*0.004,"cubeInOut")
    elseif curStep == 228 then
        mirror(false,true,"","zoom",0,2.5,4,crochet,"cubeIn")
        setValor('final',"y", 180,3)
        tweenShader("mirror2","barrel",-4,crochet*0.004,"cubeIn")
        tweenShader("bloom","brightness",0.5,crochet*0.004,"cubeIn")
         tweenShader("fish", "power",0.5,crochet*0.004,"cubeIn")
    elseif curStep == 244 then
        tweenShader("bars","effect2",0,crochet*0.004,"cubeOut")
        flashCamera("hud","",crochet*0.002)
        setActorScale(0.55,"undefinedSprite0")
        tweenShader("mirror2","barrel",0,crochet*0.001,"cubeOut")
       -- mirror(false,true,"","angle",0,-15,1.8,crochet,"cubeOut")
        mirror(true,true,"y","y",1,0,8,crochet,"cubeOut")
        tweenShader("bloom","brightness",0,crochet*0.002,"cubeOut")
        tween("nubeabajo",{y=-350},crochet*0.008,"cubeInOut")
        tween("render",{y=-200},crochet*0.008,"cubeOut")
        tween("nubearriba",{y=650},crochet*0.008,"cubeInOut")
        triggerEvent('screen shake', (crochet*0.256)..',0.009')
         tween("final",{y=600},crochet*0.008,"cubeOut")
         tweenShader("chess", "transparency",0.12,crochet*0.002,"linear")
         setValor("render","y",-180,3)
        tweenShader("bars2","effect",0.15,crochet*0.004,"cubeOut")
         tweenShader("fish", "power",0.2,crochet*0.008,"cubeOut")
    end
    if curStep == 251 then
       --mirror(false,true,"","angle",0,0,5,stepCrochet,"cubeIn")
        tweenShader("fish", "power",0,crochet*0.002,"cubeIn")
    elseif curStep == 256 then
        mirror(true,true,"x","x",0,1,1,crochet,"quadIn")
       -- mirror(false,true,"","angle",0,15,1,crochet,"quadInOut")
    elseif curStep == 259 then
         tweenShader("bars2","angle1",0,crochet*0.004,"cubeOut")
         tweenShader("fish", "power",0.2,crochet*0.002,"cubeOut")
    elseif curStep == 260 then
       -- mirror(false,true,"","angle",0,-15,1,crochet,"quadIn")
        tween("render",{x= -200},crochet*0.003,"quadOut")
         tween("logo",{y= 0},crochet*0.003,"quadOut")
          setValor("logo","y",180,3)
        mirror(true,true,"x","x",1,2,2,crochet,"quadOut")
    elseif curStep == 274 then
        tween("render",{x= -900,angle= 5},crochet*0.003,"quadInOut")
        tween("logo",{x= 900 ,angle = -5},crochet*0.003,"quadInOut")
    elseif curStep == 289 then
        tween("render",{x= -200,angle= 5},stepCrochet*0.007,"quadInOut")
        tween("logo",{x= -150 ,angle = 5},stepCrochet*0.007,"quadInOut")
    elseif curStep == 296 then
        mirror(true,true,"x","x",-20,0,10,crochet,"cubeInOut")
        tween("render",{x= -900,angle= 5},crochet*0.002,"quadInOut")
        tween("logo",{x= 900 ,angle = 5},crochet*0.002,"quadInOut")
    elseif curStep == 304 then
        tweenShader("fish", "power",0.5,crochet*0.004,"cubeOut")
        mirror(false,true,"","angle",0,45,8,crochet,"cubeIn")
    elseif curStep == 320 then
        tweenShader("fish", "power",0,crochet*0.004,"cubeIn")
    elseif curStep == 328 then
        mirror(true,true,"y","y",-20,0,10,crochet,"cubeInOut")
    elseif curStep == 336 then
        tweenShader("fish", "power",0.2,crochet*0.004,"cubeOut")
        mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
    elseif curStep == 364 then
        flashCamera("hud","",crochet*0.002)
        
        -- setActorFlipX(0,"matt")

        -- setActorX(-1500,"matt")
        -- tween("shaggy",{x= 550},stepCrochet*0.016,"quadOut")
        -- tween("matt",{x= -350},stepCrochet*0.016,"quadOut")
    elseif curStep == 446-8 then
         mirror(false,true,"","x",0,2,4,crochet,"cubeInOut")
   
    elseif curStep == 472 then
        mirror(false,true,"","zoom",0,4,3,crochet,"cubeOut")
        
    elseif curStep == 476 then
        bloom = 10
        --mirror(true,true,"angle","angle",360,0,6,crochet,"cubeOut")

        set("blackBG.alpha",1)
        tweenActorColor("render",0,0,0,255,255,255,crochet*0.003,"cubeIn")
        tweenActorColor("logo",0,0,0,255,255,255,crochet*0.003,"cubeIn")
        setValor("final","y",180,3.5)
        tween("final",{y=250},crochet*0.001,"quadOut")
    elseif curStep == 480 then
        tween("final",{y=600},crochet*0.001,"quadIn")
    elseif curStep == 484 then
        setShaderProperty("bump","barrel",-0.5)
        setShaderProperty("bump","doChroma",false)
        set("shaggy.alpha",0)
        setActorScale(0.55,'shaggy')
        setShaderProperty("color","hueShift",1.1)
        setShaderProperty("color","strength",1)
        flashCamera("hud","",crochet*0.002)
        setActorAngle(-25,"shaggy")
        setActorX(800,"shaggy")
        tween("shaggy3",{x = 150,angle = 0},crochet*0.006,"quadOut")
        setObjectCamera("shaggy","hud")
             setObjectCamera("matt","hud")
             setActorScale(0.55,'matt')
             setActorFlipX(0,"matt")
             set("matt.alpha",0)
             setActorY(getActorY("matt")-200,"matt")
             setActorX(-650,"matt")
        set("blackBG.alpha",0)
        setValor("shaggy3","y",180,2)
        tween("shaggy3",{alpha=1},crochet*0.004,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",3,crochet*0.006,"quadOut")
        tweenShader("mirror2", "y",-3,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",25,crochet*0.004,"quadOut")
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
    elseif curStep == 500 or curStep == 530 or curStep == 560 or curStep == 590 then
        tweenShader("mirror2", "zoom",1,crochet*0.0035,"quadIn")
        tweenShader("mirror2", "angle",0,crochet*0.0035,"quadIn")
         tweenShader("bump", "barrel",2,crochet*0.0035,"quadIn")
        tweenShader("fish", "power",0.2,crochet*0.0035,"quadIn")
         mirror(true,true,"y","y",0,-2,4,crochet,"quadInOut")
    elseif curStep == 514  then
        tweenShader("bump", "barrel",-0.5,crochet*0.004,"quadOut")
        setShaderProperty("mirror2","y",-3)
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
        tweenShader("mirror2", "y",-6,crochet*0.006,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",0,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",-25,crochet*0.004,"quadOut")
    elseif curStep == 574 then
        tweenShader("bump", "barrel",-0.5,crochet*0.004,"quadOut")
        setShaderProperty("mirror2","y",-3)
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
        tweenShader("mirror2", "y",-6,crochet*0.006,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",-2,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",-180,crochet*0.004,"quadOut")
    elseif curStep == 544 then
        tweenShader("bump", "barrel",-0.5,crochet*0.004,"quadOut")
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",3,crochet*0.006,"quadOut")
        tweenShader("mirror2", "y",-9,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",25,crochet*0.004,"quadOut")
    elseif curStep == 604 or curStep == 664 then
        tweenShader("bump", "barrel",-0.5,crochet*0.004,"quadOut")
        setShaderProperty("mirror2","y",0)
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
        tweenShader("mirror2", "y",-3,crochet*0.006,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",5,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",360,crochet*0.006,"quadOut")
    elseif curStep == 620 or curStep == 650 or curStep == 680 then
        tweenShader("mirror2", "zoom",1,crochet*0.0035,"quadIn")
        tweenShader("fish", "power",0.2,crochet*0.0035,"quadIn")
     elseif curStep == 634 then
        setShaderProperty("mirror2","y",-3)
        tweenShader("fish", "power",0.4,crochet*0.004,"cubeOut")
        tweenShader("mirror2", "y",0,crochet*0.006,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.004,"quadOut")
        tweenShader("mirror2", "x",0,crochet*0.006,"quadOut")
        tweenShader("mirror2", "angle",0,crochet*0.006,"quadOut")
     elseif curStep == 694 then
         tweenShader("mirror2", "y",2,crochet*0.006,"quadOut")
        tweenShader("mirror2", "zoom",3,crochet*0.002,"quadOut")
        tweenShader("mirror2", "x",6,crochet*0.006,"quadOut")
         tween("final",{y = -550},crochet*0.004,"cubeIn")
     elseif curStep == 702 then
        tweenShader("mirror2", "zoom",1,crochet*0.002,"quadIn")
     elseif curStep == 710 then
           bloom = 10
           angle,speed = 0,0
           setObjectCamera("final","hud")
           setActorScale(0.5,"final")
           setValor("final","y",180,3.5)
           tween("final",{y = 100},crochet*0.002,"quadOut")
           mirror(false,true,"","zoom",0,1,2,crochet)
           tweenShader("fish", "power",0,crochet*0.002)
     elseif curStep == 716 then
         tweenShader("bars2", "effect2",0.55,crochet*0.002,"expoIn")
            setValor("godmode","y",-180,3.5)
             tween("godmode",{y = 330},crochet*0.002,"quadOut")
     elseif curStep == 724 then
        flashCamera("hud","",1)
        setActorAlpha(0,"matt3")
    end
    if curStep == 508 then
        setValor("shaggy3","y",-360,3)
        tween("shaggy3",{alpha=0,x = -150,angle = 15},crochet*0.002,"quadIn")
    elseif curStep == 516 then
        tween("shaggy2",{x = 650,angle = 0},crochet*0.006,"quadOut")
        setValor("shaggy2","y",180,2)
        tween("shaggy2",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 540 then
        setValor("shaggy2","y",-360,3)
        tween("shaggy2",{alpha=0,x = 800,angle = -15},crochet*0.002,"quadIn")
    elseif curStep == 548 then
        tween("shaggy1",{x = 150,angle = 0},crochet*0.006,"quadOut")
        setValor("shaggy1","y",180,2)
        tween("shaggy1",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 572 then
        setValor("shaggy1","y",-360,3)
        tween("shaggy1",{alpha=0, x = -150},crochet*0.002,"quadIn")
    elseif curStep == 580 then
        tween("shaggy",{x=600,angle = 0},crochet*0.006,"quadOut")
        setValor("shaggy","y",180,2)
        tween("shaggy",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 604 then
          flashCamera("hud","",crochet*0.002)
        setValor("shaggy","y",-360,3)
        tween("shaggy",{alpha=0, x = 800},crochet*0.002,"quadIn")
    elseif curStep == 612 then
        tween("matt2",{x = 150,angle = 0},crochet*0.006,"quadOut")
        setValor("matt2","y",180,2)
        tween("matt2",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 636 then
        setValor("matt2","y",-360,3)
        tween("matt2",{alpha=0, x = -150},crochet*0.002,"quadIn")
    elseif curStep == 644 then
        tween("matt1",{x = 750,angle = 0},crochet*0.006,"quadOut")
        setValor("matt1","y",180,2)
        tween("matt1",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 668 then
        setValor("matt1","y",-360,3)
        tween("matt1",{alpha=0,x = 900,angle = -15},crochet*0.002,"quadIn")
    elseif curStep == 676 then
        tween("matt",{x = -250,angle = 0},crochet*0.006,"quadOut")
        setValor("matt","y",180,2)
        tween("matt",{alpha=1},crochet*0.004,"quadOut")
    elseif curStep == 700 then
        setValor("matt","y",-360,3)
        tween("matt",{alpha=0, x = -850},crochet*0.002,"quadIn")
    elseif curStep == 708 then
       -- tween("matt3",{x = 750,angle = 0},crochet*0.006,"quadOut")
       -- setValor("matt3","y",180,2)
       -- tween("matt3",{alpha=1},crochet*0.0035,"quadOut")
    elseif curStep == 736 then
        tweenShader("bloom", "brightness",-1.5,crochet*0.004,"cubeIn")
    end
    if curStep == 304 then
        tweenShader("bars", "effect",0.3,crochet*0.002,"cubeOut")
        texto("punch1",1,4,"cubeOut")
        setValor("punch1","z",180)
         setValor("punch1","y",180)
    elseif curStep == 312 then
        setValor("punch2","z",-180)
         setValor("punch2","y",-180)
        texto("punch2",1,4,"cubeOut")
     elseif curStep == 319 then
         setValor("punch3","z",180)
        setValor("punch3","y",180)
        texto("punch3",1,4,"cubeOut")
     elseif curStep == 327 then
         setValor("punch4","z",-180)
        setValor("punch4","y",-180)
        texto("punch4",1,4,"cubeOut")

     elseif curStep == 334 then
         texto("death4",1,4,"cubeOut")
        setValor("death4","z",180)
         setValor("death4","y",180)
     elseif curStep == 341 then
         texto("death3",1,4,"cubeOut")
        setValor("death3","z",-180)
         setValor("death3","y",-180)
         elseif curStep == 349 then
         texto("death2",1,4,"cubeOut")
        setValor("death2","z",180)
         setValor("death2","y",180)
         elseif curStep == 357 then
         texto("death1",1,4,"cubeOut")
        setValor("death1","z",-180)
         setValor("death1","y",-180)
          tweenShader("bars", "effect",0,crochet*0.004,"cubeOut")
    end
    if curStep < 90 or curStep >= 124 and curStep < 214 then
        swap = swap * -1
        if curStep % 8 == 0 then
            mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        end

        if curStep % 32 == 0 then
            mirror(true,true,"y","y",0,1,2,crochet,"cubeOut")
        elseif curStep % 32 == 8 then
            mirror(true,true,"y","y",1,2,2,crochet,"cubeOut")
        elseif curStep % 32 == 16 then
            mirror(true,true,"x","x",0,1,2,crochet,"cubeOut")
        elseif curStep % 32 == 24 then
            mirror(true,true,"x","x",1,2,2,crochet,"cubeOut")
        end
    end
    for i = 1,#bump do
        if curStep == bump [i]-4 then
            tweenShader("mirror2", "zoom", 0.87, crochet * 0.001, "cubeIn")
            tweenShader("bump", "x", 0.1 * swap, crochet * 0.001, "cubeIn")
            tweenShader("bump", "y", -0.03, crochet * 0.001, "cubeIn")
        elseif curStep == bump [i] then
            setShaderProperty('chess', 'transparency',0.2)
            tweenShader("chess", "transparency",0,crochet*0.002,"linear")
            tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeOut")
            tweenShader("bump", "x", 0, crochet * 0.001, "backOut")
            tweenShader("bump", "y", 0, crochet * 0.001, "backInOut")
        end
    end
    if curStep >= 240 and curStep < 476 or curStep >= 480 and curStep < 710 then
        if curStep % 16 == 5 then
            bloom,angle2,x,y = 4,-5,0.1,-0.1
            setValor("final","z",5)
            setValor("final","y",45)
            mirror(false,true,"","zoom",0,1.5,2,crochet,"cubeOut")
        elseif curStep % 16 == 13 then
            mirror(false,true,"","zoom",0,0.85,2,crochet,"cubeIn")
            bloom,angle2,x,y = 4,5,-0.1,0.1
            setValor("final","z",-5)
            setValor("final","y",-45)
        end
        if curStep >= 368 and curStep < 448 then
            if curStep % 16 == 5 then
                if flip then
                     mirror(true,true,"angle","angle",360,0,3,crochet,"cubeOut")
                else
                    mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeOut")
                end
                flip = not flip 
                setValor("shaggy","y",95)
                setValor("matt","y",-95)
            elseif curStep % 16 == 13 then
                setValor("shaggy","y",-95)
                setValor("matt","y",95)
                if flip2 then
                     mirror(true,true,"x","x",0,2,2,crochet,"expoIn")
                else
                    mirror(true,true,"y","y",0,2,2,crochet,"expoIn")
                end
                flip2 = not flip2 
            end

        end
    end
end