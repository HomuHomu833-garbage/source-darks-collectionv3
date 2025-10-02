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

function createBar(name, x, y, width, height, color, layer, alpha)
    makeSprite(name, name, x, y, 1)
    makeGraphic(name, width, height, color)
    actorScreenCenter(name)
    setActorLayer(name, layer)
    setActorY(y, name)
    setObjectCamera(name, 'hud')
    setActorAlpha(alpha, name)
end
local characters = {"dadCharacter0", "dadCharacter1", "dadCharacter2", "dadCharacter3", "bfCharacter0", "bfCharacter1"}
local yPositions = {30, 400, -20, 250, 450, 300}  
local xPositions = {-12, -12, -12, -12, 30, 30} 
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
            if i <= 4 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 4 then
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end
function createPost()
    for i, character in ipairs(characters) do
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end
    setActorAlpha(0,"undefinedSprite9")
  
    lascosasdelhud(0,crochet,2,"cubeOut")
    initShader("godrays","godrays")
    setCameraShader('game', 'godrays')
    setShaderProperty('godrays', 'decay', 0.75)
    setShaderProperty('godrays', 'density',0.15)
    setShaderProperty('godrays', 'weigth', 0.5)

    initShader('particles', 'particlesnew')--
    setCameraShader('game', 'particles')
    setShaderProperty('particles', 'transparency', 0.84)
    setShaderProperty('particles', 'red', 1.5)
    setShaderProperty('particles', 'green', 3)
    setShaderProperty('particles', 'blue', 1)



    initShader('glowBorder', 'glowBorder')--
    setCameraShader('game', 'glowBorder')
    setShaderProperty('glowBorder', 'transparency', 0.9)

    
    initShader('greyscale', 'GreyscaleEffect')--
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness', 0)

    initShader('zoomblur', 'zoomblur')
    setCameraShader('game', 'zoomblur')
    setShaderProperty('zoomblur', 'posY', 0)
    setShaderProperty('zoomblur', 'posX', 2)
    setShaderProperty('zoomblur', 'focusPower', 0)

    
    
    initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
    setShaderProperty('barrel', 'zoom', 1)
	setShaderProperty('barrel', 'barrel', 0)


    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 12)
    setShaderProperty('mirror', 'angle',-10)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)

    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle', 0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 1)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)

    initShader('RayMarchEffect', 'RayMarchEffect')--
    setCameraShader('game', 'RayMarchEffect')
    setShaderProperty('RayMarchEffect', 'Xdirection', 0)
    setShaderProperty('RayMarchEffect', 'Ydirection', 0)

   -- initShader('mirrorhud', 'PincushNewEffect')--
    --setCameraShader('hud', 'mirrorhud')
    --setShaderProperty('mirrorhud', 'zoom', 2)
   -- setShaderProperty('mirrorhud', 'angle',0)
	--setShaderProperty('mirrorhud', 'x', -0.5)


    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0)

    initShader('gay', 'thegayeffect')--
   -- setCameraShader('game', 'thegayeffect')



    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('bars2', 'bars')--
    setCameraShader('game', 'bars2')
    setShaderProperty('bars2', 'effect', 0)

    initShader('ca', 'ChromAbEffect')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0.003)

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('color', 'ColorOverrideEffect')--
    setCameraShader('hud', 'color')
    setCameraShader('game', 'color')
    setShaderProperty('color', 'red', 1.35)
    setShaderProperty('color', 'green',1.35)
    setShaderProperty('color', 'blue',1.35)
    
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function bumps(mirror,xd,valor,valor2,speed,curStep,ease)
	setShaderProperty(mirror,xd,valor)
	tweenShaderProperty(mirror,xd,valor2,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
local time = 0
local sxm = true
local bfs = false
local barrel = 0
local angle = 0
local x = 0
local rotCamInd = 0 
local rotCamSpd = 1 
local rotCamRange = 360 
local cam = false
local bloomxd = false
local bloomq = 1
local raymarchx = 0
local raymarchy = 0
function update(elapsed)
    time = time + elapsed
    rotCamInd = rotCamInd + (elapsed * rotCamSpd * rotCamRange)

    if rotCamInd > 360 then
        rotCamInd = rotCamInd - 360
    end
   
    set('undefinedSprite9.angle', rotCamInd)
    if cam then
        set("camFollow.x",2520)
        set("camFollow.y",1450)
    end
    if sxm then
        set("camFollow.x",1820)--1155 es del far
        set("camFollow.y",1600)--550 es del far
        set("defaultCamZoom", 0.8)
    end
    if bfs then
        set("camFollow.x",3365) -- 2365 es del far
        set("camFollow.y",1650)-- 750 es del far
        set("defaultCamZoom", 0.65) 
    end
    barrel = lerp(barrel, 0, elapsed*8)
    setShaderProperty('barrel', 'barrel', barrel)
    angle = lerp(angle, 0, elapsed*8)
    setShaderProperty('mirror2', 'angle', angle)
    x = lerp(x, 0, elapsed*8)
    setShaderProperty('barrel', 'x', x)

    raymarchx = lerp(raymarchx, 0, elapsed*8)
    setShaderProperty('RayMarchEffect', 'Xdirection', raymarchx)
    raymarchy = lerp(raymarchy, 0, elapsed*8)
    setShaderProperty('RayMarchEffect', 'Ydirection', raymarchy)

    if bloomxd then
    bloomq = lerp(bloomq, 1, elapsed*8)
    setShaderProperty('bloom', 'contrast', bloomq)
    end
    setCustomShaderFloat("godrays","iTime",time)
    setCustomShaderFloat("particles","iTime",time)
    setCustomShaderFloat("glowBorder","iTime",time)
    setCustomShaderFloat("gay","iTime",time)
end

function songStart()

    bloom(8,1,crochet,12,"cubeOut")
    tweenShaderProperty("mirror2","y",2,crochet*0.001*5,"cubeOut")
    tweenShaderProperty("mirror","angle",0,crochet*0.001*5,"cubeOut")
    tweenShaderProperty("mirror","zoom",1,crochet*0.001*30,"cubeOut")
    triggerEvent('Change Camera Speed', '2')
   -- set("camHUD.zoom",0.1)
end



local zoomlol = true
local lolxd = true
function stepHit()
    if curStep == 64 or curStep == 192 then
        sxm = false
        bfs = true
      
     
    end
    if curStep == 120 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("greyscale","strength",0.5,crochet*0.001*1,"cubeOut")
    
      
    elseif curStep == 124 then
        bloom(8,1,crochet,1,"cubeOut")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","x",-2,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("mirror2","barrel",-2,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,20,1,crochet,"cubeIn")
    elseif curStep == 128 then
        sxm = true
        bfs = false
        bloom(8,1,crochet,1,"cubeOut")
        setShaderProperty('greyscale', 'strength', 1)
        tweenShaderProperty("greyscale","strength",0.5,crochet*0.001*24,"cubeOut")
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == 224 then
        tweenShaderProperty("mirror2","zoom",0.7,crochet*0.001*2,"quadOut")
    elseif curStep == 232 then
        tweenShaderProperty("mirror2","zoom",1,crochet*0.001*2,"cubeIn")
    elseif curStep == 240 then
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.1,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.3,crochet*0.001*1,"cubeOut")
        sxm = false
        bfs = false
        bloom(6,1,crochet,2,"cubeOut")
    elseif curStep == 244 then
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("mirror2","x",-3,crochet*0.001*2,"cubeInOut")
    elseif curStep == 248 then
        bloom(6,1,crochet,2,"cubeOut")
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == 252 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*2,"cubeInOut")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 256 then
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
        setShaderProperty('mirror', 'zoom', 1)
        setShaderProperty('mirror', 'angle', 0)
        lascosasdelhud(1,crochet,4,"cubeOut")
        set("defaultCamZoom", 0.45)
        
    
       cam = true
    end

    if curStep == 1152 then
        triggerEvent('screen shake', (crochet*0.001*2)..',0.015')
    elseif curStep == 1184 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
    elseif curStep == 1188 then
        mirror(true,true,"angle","angle",360,0,3,crochet,"cubeInOut")
    elseif curStep == 1196 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == 1200 then
        mirror(false,true,"","zoom",0,3,2,crochet,"cubeOut")
        setShaderProperty('mirror2', 'x', -2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 1208 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        setShaderProperty('mirror2', 'x', 2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*4,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeIn")
    elseif curStep == 1244 then
        tweenShaderProperty("zoomblur","focusPower",5,crochet*0.001*1,"cubeOut")

    elseif curStep == 1248 then
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*2,"cubeInOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",8,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == 1252  then
        mirror(false,true,"","angle",0,-360,24,stepCrochet,"cubeInOut")
    elseif curStep == 1256 then
        tweenShaderProperty("mirror2","x",1,crochet*0.001*3,"cubeInOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == 1264 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*2,"cubeOut")
    elseif curStep == 1272 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",12,crochet*0.001*2,"cubeIn")
    elseif curStep == 1276 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,3,crochet,"cubeInOut")
        tweenShaderProperty("mirror2","x",4,crochet*0.001*3,"cubeInOut")
        tweenShaderProperty("bars2","effect",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == 1280 then
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*4,"cubeOut")
    end
    if curStep == 1660 then
        zoomlol = false
    elseif curStep == 1664 then
        mirror(false,true,"","zoom",0,3,24,crochet,"cubeIn")
        bloomxd = true
        lolxd = false
    elseif curStep == 1760 then
        tweenShaderProperty("bars2","effect",0.25,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*2,"cubeOut")
        bloomxd = false
        lolxd = true
    elseif curStep == 1784 then
        tweenShaderProperty("bars2","effect",0,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*2,"cubeIn")
    
    elseif curStep == 1792 then
        set("undefinedSprite9.alpha",0.7)
        mirror(false,true,"","zoom",0,1.1,1,crochet,"cubeOut")
  
        triggerEvent('screen shake', (stepCrochet*0.001*512)..',0.015')
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeOut")
    end
    
    if curStep >= 1664 and curStep < 1728 and curStep % 4 == 0 then
            barrel = -2
            bloomq = 4
    end
    if curStep >= 1728 and curStep < 1760 and curStep % 2 == 0 then
        barrel = -2
        bloomq = 4
    end
    if curStep >= 1792 and curStep < 2048 or curStep >= 2112 and curStep < 2304  then
        if curStep % 16 == 0 then
            barrel = -1.5
            angle = -5
            raymarchx = -2
            raymarchy = -0.7
        end
        if curStep % 16 == 8 then
            barrel = -1.5
            angle = 5
            raymarchx = 2
            raymarchy = -0.7
        end
    end
    
    if curStep >= 128 and curStep < 240 then
        if curStep % 8 == 0 then
            barrel = -1
            mirror(false,true,"","zoom",0,1.1,1,crochet,"cubeOut")
        elseif curStep % 8 == 4 then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        end
    end
    if curStep >= 256 and curStep < 512 or curStep >= 1280 and curStep < 1464  then
        if curStep % 8 == 0 then
            barrel = -1.5
        end
    end

    
    if curStep == 1792 or curStep == 1920 or curStep == 2176 then--drop
        posiciones("hud", 50)
        movimiento({7, 12, -2, 0, 0, 0}, 2, "cubeOut", true)
    elseif curStep == 1848 or curStep == 1976 or curStep == 2176 or curStep == 2232 then
        movimiento({-12, -12, -12, -12, 0, 0}, 1.8, "cubeIn", true)
    elseif curStep == 1856 or curStep == 1984 or curStep == 2240 then
        movimiento({0, 0, 0, 0, 12, 15}, 2, "cubeOut", false)
    elseif curStep == 1912 or curStep == 2040 or curStep == 2168 or curStep == 2296 then
        movimiento({0, 0, 0, 0, 30, 30}, 1.8, "cubeIn", false)
    elseif curStep == 2048 or curStep == 2304 then
        posiciones("game")
        flashCamera("hud","white",crochet*0.001*2)
    elseif curStep == 2112 then
        flashCamera("hud","white",crochet*0.001*2)
        posiciones("hud", 50)
        movimiento({0, 0, 0, 0, 12, 15}, 2, "cubeOut", false)
    end

    if curStep == 1840 or curStep == 1904 or curStep == 1968 or curStep == 2160 or curStep == 2224 or curStep == 2288 then
        mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1.5,"cubeOut")
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*1.5,"cubeOut")
    elseif curStep == 1848-2 or curStep == 1976-2 or curStep == 2168-2 or curStep == 2296-2 then
        setShaderProperty('mirror2', 'x', -2)
        tweenShaderProperty("mirror2","x",0,stepCrochet*0.001*18,"cubeInOut")
    elseif curStep == 1912-2 or curStep == 2040-2 or curStep == 2232-2 then
        setShaderProperty('mirror2', 'x', 2)
        tweenShaderProperty("mirror2","x",0,stepCrochet*0.001*18,"cubeInOut")
    elseif curStep == 1852 or curStep == 1916 or curStep == 1980 or curStep == 2172 or curStep == 2236 or curStep == 2300 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("bars","effect",0.1,crochet*0.001*2,"cubeIn")
    elseif curStep == 2048 then
        sxm = true
        mirror(false,true,"","zoom",0,2.5,2,crochet,"cubeOut")
        tweenShaderProperty("greyscale","strength",1,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*2,"cubeOut")
        bf = false
        cam = false
    elseif curStep == 2080 then
        tweenShaderProperty("mirror2","barrel",-10,crochet*0.001*8,"cubeIn")
        mirror(false,true,"","zoom",0,1,8,crochet,"expoIn")
        tweenShaderProperty("greyscale","strength",0,crochet*0.001*8,"expoIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*8,"expoIn")
    elseif curStep == 2112 then
        tweenShaderProperty("mirror2","barrel",0,crochet*0.001*4,"cubeOut")
        cam = true
        sxm = false
        set("defaultCamZoom", 0.45)
    end
    if curStep == 2168-2 or curStep == 2232-2 or curStep == 2296-2 then
        mirror(true,true,"angle","angle",-360,0,18,stepCrochet,"cubeInOut")
    end
    parte1(384)
    parte1(1408)
    parte2(512)
    parte2(1536)
    parte3(768)
    parte4(1024)
    parte4(1088)
end
function parte1(s)
    if curStep >= s and curStep < s+48 then
        if curStep % 16 == 0 then
            bloom(4,1,crochet,2,"cubeOut")
            mirror(false,true,"","angle",0,-20,2,crochet,"cubeIn")
            setShaderProperty('mirror2', 'y', -2)
            tweenShaderProperty("mirror2","y",0,crochet*0.001*4,"cubeInOut")
        elseif curStep % 16 == 8 then
            mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        end
    end
    if curStep >= s+56 and curStep < s+64 then
        if curStep % 4 == 0 then
            x = -0.1
            --setShaderProperty("bloom","brightness",-0.2)
           -- tweenShaderProperty("bloom","brightness",-1,crochet*0.001*0.5,"cubeOut")
        elseif curStep % 4 == 2 then
            --setShaderProperty("bloom","brightness",-0.2)
            --tweenShaderProperty("bloom","brightness",-1,crochet*0.001*0.5,"cubeOut")
            x = 0.1
        end
    end
    if curStep == s+48 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        x = -0.1
    elseif curStep == s+52 then
        x = 0.1
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*2,"cubeOut")
    elseif curStep == s+56 then
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("bloom","brightness",-1,crochet*0.001*1,"cubeOut")
    elseif curStep == s+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+64 then
        bloom(4,1,crochet,2,"cubeOut")
        tweenShaderProperty("bloom","brightness",0,crochet*0.001*0.5,"cubeOut")
    elseif curStep == s+104 then
        mirror(false,true,"","angle",0,-40,1,crochet,"cubeOut")
    elseif curStep == s+108 then
        mirror(false,true,"","angle",0,40,1,crochet,"cubeIn")
    elseif curStep == s+112 then
        mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
        setShaderProperty("mirror2","x",-2)
        tweenShaderProperty("mirror2","x",0,crochet*0.001*4,"linear")
    elseif curStep == s+120 then
        tweenShaderProperty("bloom","brightness",-1,crochet*0.001*1,"cubeOut")
    elseif curStep == s+124 then
        tweenShaderProperty("bars","effect",0.2,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"cubeIn")
        mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeOut")
    elseif curStep == s+128 then
        tweenShaderProperty("bloom","brightness",0,crochet*0.001*0.5,"cubeOut")
    end
    if curStep >= s+56 and curStep < s+64 or curStep >= s+120 and curStep < s+128 then
        if curStep % 2 == 0 then
            bloom(4,1,crochet,0.5,"cubeOut")
        end
    end
    if curStep >= s+64 and curStep < s+104 then
        if curStep % 8 == 0 then
            barrel = -1.5
        end
        if curStep % 16 == 0 then
            angle = 20
            x = 0.1
        elseif curStep % 16 == 8 then
         angle = -20
            x = -0.1
            
        end
    end
end
function parte2(s)
    if curStep == s then
        tweenShaderProperty("bars","effect",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        bloom(4,1,crochet,2,"cubeOut")
        sxm = true
    elseif curStep == s+8 or curStep == s+72 then
        angle = 10
    elseif curStep == s+12 or curStep == s+76 then
        tweenShaderProperty("EyeFishEffectGame","power",0.2,crochet*0.001*1,"cubeIn")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*1,"cubeInOut")
        tween("undefinedSprite9",{alpha = 0.5},crochet*0.001*1,"cubeOut")
    elseif curStep == s+20 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",2,crochet*0.001*2,"cubeInOut")
    elseif curStep == s+24 then
       -- mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == s+28 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+32 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","x",2,crochet*0.001*1,"cubeOut")
        tween("undefinedSprite9",{alpha = 0},crochet*0.001*1,"cubeOut")
    elseif curStep == s+36 or curStep == s+100 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
    elseif curStep == s+40 or curStep == s+104 then
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
        mirror(false,true,"","zoom",0,1.25,1,crochet,"cubeOut")
        triggerEvent('screen shake', (crochet*0.001*1)..',0.01')
    elseif curStep == s+44 or curStep == s+108 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+48 or curStep == s+112 then
        mirror(true,true,"angle","angle",-180,0,2,crochet,"cubeOut")
        tween("undefinedSprite9",{alpha = 0.5},crochet*0.001*2,"cubeOut")
    elseif curStep == s+56 then
        tween("undefinedSprite9",{alpha = 0},crochet*0.001*1,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","y",2,crochet*0.001*2,"cubeInOut")
    elseif curStep == s+60 or curStep == s+124 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
       -- tweenShaderProperty("mirror2","y",2,crochet*0.001*2,"cubeInOut")
    elseif curStep == s+64 or curStep == s+128 then
        angle = 20
        setShaderProperty("EyeFishEffectGame","power",0.5)
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
    elseif curStep == s+80 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","x",3,crochet*0.001*1,"cubeInOut")
        tween("undefinedSprite9",{alpha = 0.5},crochet*0.001*1,"cubeOut")
    elseif curStep == s+84 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",0,crochet*0.001*2,"cubeInOut")
    elseif curStep == s+92 then
        mirror(false,true,"","angle",0,0,1,crochet,"cubeIn")
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,0.7,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+96 then
        mirror(false,true,"","angle",0,20,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1,"cubeOut")
        tween("undefinedSprite9",{alpha = 0},crochet*0.001*1,"cubeOut")
   -- elseif curStep == s+112 then
    --    mirror(true,true,"angle","angle",180,0,2,crochet,"cubeOut")
    elseif curStep == s+120 then
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tween("undefinedSprite9",{alpha = 0},crochet*0.001*1,"cubeOut")
    elseif curStep == s+136 then
        if zoomlol then
            mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
         end
        mirror(true,true,"angle","angle",20,0,1,crochet,"cubeOut")
    elseif curStep == s+140 then
        if zoomlol then
            mirror(false,true,"","zoom",0,1,1,crochet,"cubeOut")
        end
    elseif curStep == s+144 then
        if zoomlol then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        end
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeOut")
    elseif curStep == s+148 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+152 then
        if zoomlol then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        end
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeIn")
        angle = 10
    elseif curStep == s+156 then
        setShaderProperty("mirror2","y",-2)
        tweenShaderProperty("mirror2","y",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+160 then
        angle = 10
    elseif curStep == s+168 then
        angle = -10
    elseif curStep == s+176 then
        mirror(false,true,"","angle",0,10,1,crochet,"cubeOut")
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeInOut")
    elseif curStep == s+180 then
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*2,"cubeInOut")
    elseif curStep == s+184 then
        mirror(false,true,"","angle",0,-10,1,crochet,"cubeOut")
    elseif curStep == s+188 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1,"cubeInOut")
    elseif curStep == s+192 then
        cam = true
        set("defaultCamZoom", 0.45)
        if zoomlol then
        mirror(false,true,"","zoom",0,2.5,8,crochet,"cubeOut")
        end
        mirror(false,true,"","angle",0,-180,8,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",10,crochet*0.001*8,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == s+192+32 then
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*8,"cubeIn")
        mirror(false,true,"","zoom",0,1,8,crochet,"cubeIn")
        mirror(false,true,"","angle",0,-380,8,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*8,"cubeIn")
        lascosasdelhud(0,crochet,4,"cubeOut")
    elseif curStep == s+192+64 then
        flashCamera("hud","white",crochet*0.001*2,"cubeOut")
        mirror(false,true,"","angle",0,-360,2,crochet,"cubeOut")
    end
    if curStep == s+64 then
        sxm = false
        bfs = true
    elseif curStep == s+128 then
        sxm = true
        bfs = false
    elseif curStep == s+192 then
        sxm = false
        bfs = false
    end
    if lolxd then
        if curStep >= s and curStep < s+256 and curStep % 8 == 0 then
            barrel = -2
            bloom(4,1,crochet,2,"cubeOut")
           
        end
    end
end
function parte3(s)
    if curStep == s then
        lascosasdelhud(1,crochet,4,"cubeOut")
    end
    if curStep == s+48 then
        mirror(false,true,"","zoom",0,2,3,crochet,"cubeOut")
        mirror(true,true,"angle","angle",0,-20,3,crochet,"cubeOut")
        setShaderProperty("mirror2","x",0)
        tweenShaderProperty("mirror2","x",1,crochet*0.001*3,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == s+60 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*2,"cubeInOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,2,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeIn")
        tweenShaderProperty("zoomblur","focusPower",8,crochet*0.001*2,"cubeIn")
    elseif curStep == s+64 or curStep == s+128 then
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*4,"cubeOut")
    elseif curStep == s+96 then
        tweenShaderProperty("mirror2","x",-1,crochet*0.001*2,"cubeInOut")
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",8,crochet*0.001*4,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == s+100 then
        mirror(false,true,"","angle",0,-360,24,stepCrochet,"cubeInOut")
    elseif curStep == s+104 then
        tweenShaderProperty("mirror2","x",1,crochet*0.001*3,"cubeInOut")
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
    elseif curStep == s+112 then
        mirror(false,true,"","zoom",0,2,2,crochet,"cubeOut")
        tweenShaderProperty("bars2","effect",0.2,crochet*0.001*2,"cubeOut")
    elseif curStep == s+120 then
        mirror(false,true,"","zoom",0,3,1,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",12,crochet*0.001*2,"cubeIn")
    elseif curStep == s+124 then
        mirror(false,true,"","zoom",0,1,2,crochet,"cubeIn")
        mirror(false,true,"","angle",0,0,3,crochet,"cubeInOut")
        tweenShaderProperty("mirror2","x",4,crochet*0.001*3,"cubeInOut")
        tweenShaderProperty("bars2","effect",0,crochet*0.001*1,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+160 or curStep == s+192+32 then
        mirror(false,true,"","zoom",0,1.5,1.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,-20,1.5,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1.5,"cubeOut")
    elseif curStep == s+166 or curStep == s+192+38 then
        mirror(false,true,"","zoom",0,2,1.5,crochet,"cubeOut")
        mirror(false,true,"","angle",0,20,1.5,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2.5,"cubeIn")
    elseif curStep == s+172 or curStep == s+192+44 then
        mirror(false,true,"","zoom",0,1.2,1,crochet,"cubeOut")
        mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
    elseif curStep == s+176  or curStep == s+192+48 then
        mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeOut")
    elseif curStep == s+184 then
        mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",5,crochet*0.001*2,"cubeOut")
    elseif curStep == s+188 or curStep == s+192+60 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+192 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*2,"cubeOut")
    elseif curStep == s+192+56 then--1016
         mirror(false,true,"","zoom",0,2.5,1,crochet,"cubeOut")
         mirror(false,true,"","angle",0,-360,3,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",5,crochet*0.001*2,"cubeOut")
    elseif curStep == s+192+64 then
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*2,"cubeOut")
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*3,"cubeOut")
    end
    --360 1
    if curStep >= s and curStep < s+256 and curStep % 16 == 0 then
        barrel = -1
       
    end
end
function parte4(s)
    if curStep == s+8 then
        mirror(true,true,"x","x",0.1,0,1,crochet,"cubeOut")
    elseif curStep == s+12 then
        mirror(true,true,"x","x",-0.1,0,1,crochet,"cubeOut")
    elseif curStep == s+16 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
        tweenShaderProperty("bars","effect",0.25,crochet*0.001*1,"cubeOut")
        setShaderProperty("mirror2","x",0)
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1.5,"cubeOut")
        setShaderProperty("zoomblur","focusPower",12)
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+24 then
        setShaderProperty("zoomblur","focusPower",12)
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
        setShaderProperty("mirror2","x",1)
        tweenShaderProperty("mirror2","x",2,crochet*0.001*1.5,"cubeOut")
    elseif curStep == s+28 then
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("bars","effect",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+32 then
        mirror(false,true,"","zoom",0,2,1,crochet,"cubeOut")
    elseif curStep == s+36 then
        tweenShaderProperty("zoomblur","focusPower",10,crochet*0.001*1,"cubeOut")
        mirror(true,true,"angle","angle",-360,0,3,crochet,"cubeInOut")
        tweenShaderProperty("EyeFishEffectGame","power",0.3,crochet*0.001*1,"cubeOut")
    elseif curStep == s+44 then
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeIn")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
        tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeIn")
    elseif curStep == s+48 then
        mirror(false,true,"","zoom",0,1.5,1,crochet,"cubeOut")
        setShaderProperty("mirror2","y",0)
        tweenShaderProperty("mirror2","y",1,crochet*0.001*1,"cubeOut")
        setShaderProperty("zoomblur","focusPower",12)
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+52 then
        setShaderProperty("mirror2","x",0)
        tweenShaderProperty("mirror2","x",1,crochet*0.001*1,"cubeOut")
        setShaderProperty("zoomblur","focusPower",12)
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*1,"cubeOut")
    elseif curStep == s+56 then
        tweenShaderProperty("mirror2","y",0,crochet*0.001*1,"cubeInOut")
        tweenShaderProperty("zoomblur","focusPower",10,crochet*0.001*2,"cubeOut")
    elseif curStep == s+60 then
        tweenShaderProperty("mirror2","x",0,crochet*0.001*1,"cubeInOut")
        mirror(false,true,"","zoom",0,1,1,crochet,"cubeIn")
    elseif curStep == s+64 then
        mirror(true,true,"angle","angle",-360,0,2,crochet,"cubeOut")
        tweenShaderProperty("zoomblur","focusPower",0,crochet*0.001*2,"cubeOut")
        flashCamera("game","white",crochet*0.001*2,"cubeOut")
    end
end