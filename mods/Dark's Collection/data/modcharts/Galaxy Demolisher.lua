local window = 240
local a = 0
local start_Rock_Num = 2
local end_Rock_Num = 12
local rock_Stuff = {}

function createPost(song)
    for i = start_Rock_Num, end_Rock_Num do
        table.insert(rock_Stuff, getActorY("undefinedSprite" .. i))
    end
    initShader('mirror2', 'PincushNewEffect')--
    setCameraShader('game', 'mirror2')
    setShaderProperty('mirror2', 'zoom', 1)
    setShaderProperty('mirror2', 'angle',0)
	setShaderProperty('mirror2', 'x', 0)
    setShaderProperty('mirror2', 'y', 0)
	setShaderProperty('mirror2', 'barrel', 0)
    setShaderProperty('mirror2', 'doChroma', true)
    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle',0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', -2)
    setShaderProperty('mirror', 'doChroma', true)
    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.6)
    initShader('ca', 'ChromAbBlueSwapEffect')
    setCameraShader('game', 'ca')
    setCameraShader('hud', 'ca')
    setShaderProperty('ca', 'strength', 0.0005)
end

function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror2',value,valor)
    end
    if tween then
        tweenShader('mirror2',value2,valor2, speed*0.001*s,ease)
    end
end
local shaggyred,shaggy,shaggyblue,shaggyyellow,time = false,true,false,false,0
local camByStep = false
local perlinX,perlinY,perlinSpeed,perlinXRange,perlinYRange,speed,angle = 0,0,2,0.2,0.2,2,2
function update(elapsed)
    a = a + (elapsed * 1.5)
    local section = math.floor(curStep/16)
    zoom = lerp(zoom, 1, elapsed * 8)
    setShaderProperty('mirror', 'zoom', zoom)
    y = lerp(y, 0, elapsed * 8)
    setShaderProperty('mirror', 'y', y)
    x = lerp(x, 0, elapsed * 8)
    setShaderProperty('mirror', 'x', x)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    local perlinNoiseX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinNoiseY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    setShaderProperty('mirror', 'x', perlinNoiseX+x)
    setShaderProperty('mirror', 'y', perlinNoiseY+y)
    
        time = time + (elapsed / (1 / 120))
        setShaderProperty('mirror', 'angle', 0 + math.sin(time / 100 * speed) * 5)

    for i = 0, 3 do
        setActorPos(
            -400 - (i * 200) + (math.cos(a + i) * 2 * window),
            -2700 + (math.sin(2 * (a + i)) * window),
            "dadCharacter" .. i
        )
    end

    for i = start_Rock_Num, end_Rock_Num do
        setActorPos(
            getActorX("undefinedSprite" .. i),
            rock_Stuff[i - start_Rock_Num + 1] + math.sin(2 * (a + i)) * 80,
            "undefinedSprite" .. i
        )
    end
    
    setActorPos(getActorX('boyfriend') - 100, getActorY('boyfriend') + 250, "bf_rock")

    if shaggyred then
        set("camFollow.x", getActorX("dadCharacter1")+150)
        set("camFollow.y", getActorY("dadCharacter1")+300)
    end
    if shaggy then     
        set("camFollow.x", getActorX("dadCharacter0")+150)
        set("camFollow.y", getActorY("dadCharacter0")+250)
    end
    if shaggyblue then
        set("camFollow.x", getActorX("dadCharacter2")+150)
        set("camFollow.y", getActorY("dadCharacter2")+300)
    end
    if shaggyyellow then
        set("camFollow.x", getActorX("dadCharacter3")+150)
        set("camFollow.y", getActorY("dadCharacter3")+300)
    end
 
    local section = math.floor(curBeat / 4)

    if  camByStep then
        if section >= 8 and section < 12 or section >= 26 and section < 30 or section >= 58 and section < 60 
        or section >= 74 and section < 78 or section >= 82 and section < 84 or section >= 86 and section < 87
         or section >= 92 and section < 96 or section >= 124 and section < 126 then
            shaggyred = false
            shaggy = true 
        elseif section >= 16 and section < 20 or section >= 34 and section < 38 or section >= 60 and section < 62
        or section >= 84 and section < 86 or section >= 88 and section < 89 or section >= 100 and section < 104
        or section >= 126 and section < 128 then
            shaggy = false
            shaggyred = true
        elseif section >= 42 and section < 46 or section >= 66 and section < 68 or section >= 87 and section < 88
         or section >= 108 and section < 112 or section >= 132 and section < 134 then
            shaggyred = false
            shaggyblue = true
        elseif section >= 50 and section < 54 or section >= 68 and section < 70 or section >= 89 and section < 90
         or section >= 116 and section < 120 or section >= 136 and section < 138 then
            shaggyblue = false
            shaggyyellow = true
        else
            shaggy = false
            shaggyred = false 
            shaggyblue = false
            shaggyyellow = false 
        end
    end
end
function startSong()
    tweenShader('bars','effect',0.05,crochet*0.008,'cubeOut')
end
zoomlol = {120,920,1464,1592,1976,2232}
function stepHit(curStep)
    for i = 1, #zoomlol do
        if curStep == zoomlol [i] then
            mirror(false,true,"","zoom",0,0.6,2,crochet,"cubeIn")
            mirror(false,true,"","angle",0,60,2,crochet,"cubeIn")
        end
        if curStep == zoomlol [i]+8 then
            mirror(false,true,"","zoom",0,1,2,crochet,"cubeOut")
            mirror(false,true,"","angle",0,0,2,crochet,"cubeOut")
             flashCamera("hud","",1)
        end
    end
    if curStep < 128 then
        if curStep % 8 == 0 then
            zoom,x,y = 0.8,0.05,-0.04
        end
    end
    if curStep == 416 or curStep == 1056 or curStep == 1472 then
        flashCamera("hud","",1)
    end
    if curStep >= 128 then
        if curStep % 16 == 0 or curStep % 16 == 6 or curStep % 16 == 10 then
           zoom = 0.8
        end
    end
    if curStep == 16 or curStep == 384 then
        shaggyblue = true
        shaggy = false
    elseif curStep == 32 or curStep == 96 or curStep == 392 or curStep == 408 then
        shaggyyellow = false
        shaggyblue = false
    elseif curStep == 64 then
        shaggyred = true
    elseif curStep == 80 or curStep == 400 then
        shaggyred = false
        shaggyyellow = true
    end
    if curStep == 128 or curStep == 416 then
        camByStep = true
    elseif curStep == 384 then
        camByStep = false
    end
    if curStep == 384 then
        shaggy = true
        setProperty('', 'cameraSpeed', 3)
    elseif curStep == 388 then
        shaggy = false
    elseif curStep == 392 then
        shaggyblue = true
    elseif curStep == 396 then
        shaggyblue = false
    elseif curStep == 400 then
        shaggyred = true
    elseif curStep == 404 then
        shaggyred = false
    elseif curStep == 408 then
        shaggyyellow = true
    elseif curStep == 412 then
        shaggyyellow = false
    end
        if curStep % 32 == 0 then
            set("defaultCamZoom", 0.8)
        elseif curStep % 32 == 8 then
            set("defaultCamZoom", 0.7)
        elseif curStep % 32 == 16 then
            set("defaultCamZoom", 0.6)
        elseif curStep % 32 == 24 then
            set("defaultCamZoom", 0.5)
        end
        
    
end

