function createPost()
    initShader('mirror', 'PincushNewEffect')--
    setCameraShader('game', 'mirror')
    setShaderProperty('mirror', 'zoom', 0.5)
    setShaderProperty('mirror', 'angle',20)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)
    initShader('bump', 'PincushNewEffect')--
    setCameraShader('game', 'bump')
    setCameraShader('hud', 'bump')
    setShaderProperty('bump', 'zoom', 1)
    setShaderProperty('bump', 'angle',0)
	setShaderProperty('bump', 'x', 0)
    setShaderProperty('bump', 'y', 0)
	setShaderProperty('bump', 'barrel', 0)
    setShaderProperty('bump', 'doChroma', true)
    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 0.5)
    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 0)
    setShaderProperty('bloom', 'brightness',0)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function update(elapsed)
    zoom,x,y = lerp(zoom, 1, elapsed * 12),lerp(x, 0, elapsed * 12)
    ,lerp(y, 0, elapsed * 12)
        setShaderProperty('bump', 'zoom', zoom)
        setShaderProperty('bump', 'x', x)
        setShaderProperty('bump', 'y', y)
end
function songStart()
    bloom(0,1,crochet,7,"cubeOut")
    mirror(false,true,"","zoom",0,1,8,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
end
bump = {0,8,16,22,26,30,32,40,48,54,58,62,64,72,78,86,90,96,97,104,112,118,122
,126,128,136,139,142,144,150,160,168,176,182,186,190,192,200,206,208,214,218,222
,224,232,240,246,250,254,256,264,267,270,272,278,282}
function stepHit()

    
    if curStep % 16 == 0 and curStep <= 128 then
        set("defaultCamZoom", 0.8)
        if curStep ~= 32 then
            mirror(false, true, "", "zoom", 0, 1, 2, crochet, "cubeOut")
        end
    end
    if curStep == 32 then
        set("defaultCamZoom", 0.8)
        setShaderProperty('greyscale', 'strength', 0)
        bloom(4, 1, crochet, 2, "linear")
    elseif curStep == 54 or curStep == 72 or curStep == 118 or curStep == 136 
    or curStep == 168 or curStep == 200 or curStep == 232 or curStep == 270 then
        set("defaultCamZoom", 0.95)
    elseif curStep == 88 or curStep == 152 or curStep == 182 or curStep == 214
    or curStep == 246 then
        set("defaultCamZoom", 0.8)
    end
    if curStep == 152 or curStep == 280 then
        tweenShaderProperty("bloom", "contrast", 4, crochet * 0.002, "cubeIn")
    elseif curStep == 160 or curStep == 288 then
        set("defaultCamZoom", 0.8)
        bloom(5, 1, crochet, 2, "cubeOut")
    end

   
    for i = 1,#bump do
        if curStep == bump [i] then
            zoom = 0.94
        end
    end
end

