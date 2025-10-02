function createPost()
    local shaders = {
        {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = false}}, 
        {"bars", "bars", {effect = 0,effect2 = 0, angle1 = 0 , angle2 = 0}},
        {"mirror", "BarrelBlurEffect", {zoom = 3, angle = 45, x = 0, y = 0, barrel = 0,warp = 0, doChroma = true}},
        {"greyscale", "GreyscaleEffect", {strength = 1}},   
        {"ca", "ChromAbEffect", {strength = 0.001}},
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
end
function startSong()
    bloom(0,1,crochet,28,"")
    mirror(false,true,"","zoom",0,1,28,crochet,"quadOut")
    mirror(false,true,"","angle",0,0,28,crochet,"quadOut")
end
local perlinCa = 0
local perlinCaSpeed = 12.0
local perlinCaRange = 0.0
function update(elapsed)
    if perlinCaRange == 0 then
        setShaderProperty('ca', 'strength', 0.002)
    else
        perlinCa = perlinCa + (elapsed * math.random() * perlinCaSpeed)
        local strength = (-0.5 + perlin(0, perlinCa, 0)) * perlinCaRange
        setShaderProperty('ca', 'strength', strength)
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
function stepHit()
    if curStep == 128 then
        bloom(2,1,crochet,2,"")
        tweenShader('greyscale','strength',0,crochet*0.001,"cubeOut") 
    elseif curStep == 248 or curStep == 504 or curStep == 1016 or curStep == 1528 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 252 or curStep == 508 or curStep == 1020 or curStep == 1532 then
        mirror(false,true,"","zoom",0,0.8,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
    elseif curStep == 256 or curStep == 512 or curStep == 1024 or curStep == 1536 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 336 or curStep == 368 or curStep == 528 or curStep == 560
    or curStep == 592 or curStep == 624 or curStep == 880 or curStep == 1104 or curStep == 1136 
    or curStep == 1296 or curStep == 1328 or curStep == 1360 or curStep == 1392 or curStep == 1888 then
        set("defaultCamZoom", 0.75) 
        perlinCaRange = 0.05
    elseif curStep == 352 or curStep == 384 or curStep == 544 or curStep == 576
    or curStep == 608 or curStep == 640 or curStep == 896 or curStep == 1120 or curStep == 1152 
    or curStep == 1312 or curStep == 1344 or curStep == 1376 or curStep == 1408  then
        set("defaultCamZoom", 0.6)
        perlinCaRange = 0 
         bloom(2,1,crochet,2,"")
    elseif curStep == 656 or curStep == 688 or curStep == 1744 or curStep == 1776 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 660 or curStep == 692 or curStep == 1748 or curStep == 1780 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeOut")
    elseif curStep == 664 or curStep == 696 or curStep == 1752 or curStep == 1784 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,15,1,crochet,"cubeOut")
    elseif curStep == 668 or curStep == 700 or curStep == 1756 or curStep == 1788 then
        mirror(false,true,"","zoom",0,0.85,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-15,1,crochet,"cubeIn")
    elseif curStep == 672 or curStep == 704 or curStep == 1760 or curStep == 1792 then
         bloom(2,1,crochet,2,"")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
    elseif curStep == 1600 or curStep == 1632 or curStep == 1920 then
        set("defaultCamZoom", 0.6)
        perlinCaRange = 0 
       bloom(2,1,crochet,2,"") tweenShader('greyscale','strength',1,crochet*0.001,"cubeOut") 
    elseif curStep == 1616 or curStep == 1648 then
       tweenShader('greyscale','strength',0,crochet*0.002,"cubeOut") set("defaultCamZoom", 0.75) 
        perlinCaRange = 0.05
    elseif curStep == 1664 then
        set("defaultCamZoom", 0.6)
        perlinCaRange = 0 
       bloom(2,1,crochet,2,"") tweenShader('greyscale','strength',0,crochet*0.002,"cubeOut") 
    end
end