function lascosasdelhud(s)
    set("healthBar.alpha",s)
    set("healthBarBG.alpha",s)
    set("infoTxt.alpha",s)
    set("iconP1.alpha",s)
    set("iconP2.alpha",s)
    set("scoreTxt.alpha",s)
    set("timeBar.alpha",s)
    set("timeBarBG.alpha",s)
    set("ratingText.alpha",s)
end
function createPost()
    lascosasdelhud(0)


    makeSprite('topBar', 'topBar', 0, -420, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")

    makeSprite('bottomBar', 'bottomBar', 0, -1120, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")

    initShader('scanline', 'ScanlineEffect')
    setCameraShader('hud', 'scanline')
    setShaderProperty('scanline', 'strength', 0.5)
    setShaderProperty('scanline', 'smooth', true)
    setShaderProperty('scanline', 'pixelsBetweenEachLine', 5)

    initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 15)
    setShaderProperty('vignette', 'size', 0.5)

    initShader('greyscale', 'GreyscaleEffect')
    setCameraShader('game', 'greyscale')
    setCameraShader('hud', 'greyscale')
    setShaderProperty('greyscale', 'strength', 1)

    initShader('barrel', 'BarrelBlurEffect')
    setCameraShader('game', 'barrel')
    setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0)
    setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty('barrel', 'angle', 0)
    setShaderProperty('barrel', 'x', 0)
    setShaderProperty('barrel', 'y', 0)
    setShaderProperty('barrel', 'doChroma', true)

    initShader('mirrorGame', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirrorGame')

    setShaderProperty('mirrorGame', 'zoom', 3)
    setShaderProperty('mirrorGame', 'angle', 40)
    setShaderProperty('mirrorGame', 'x', 0)
    setShaderProperty('mirrorGame', 'y', 0)


    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1.5)
    setShaderProperty('color', 'green', 1.5)
    setShaderProperty('color', 'blue', 1.5)

    initShader('EyeFishEffectGame', 'EyeFishEffect')--
    setCameraShader('game', 'EyeFishEffectGame')
    setCameraShader('nose', 'EyeFishEffectGame')
    setShaderProperty('EyeFishEffectGame', 'power', 0)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty("bloom","contrast",0)


    for i = 0,11 do
        setActorProperty(i,"y",_G["defaultStrum"..i.."Y"]-140)
    end

end

function bloom(contrast,value1,speed,curStep,ease)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",value1,speed*0.001*curStep,ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirrorGame',value,valor)
    end
    if tween then
        tweenShaderProperty('mirrorGame',value2,valor2, speed*0.001*s,ease)
    end
end
function update(elapsed)
    zoom = lerp(zoom, 1, elapsed * 8)
    setShaderProperty('barrel', 'zoom', zoom)
    angle = lerp(angle, 0, elapsed * 8)
    setShaderProperty('barrel', 'angle', angle)
end
function songStart()
    tweenShaderProperty('bloom', 'contrast', 1, crochet*0.001*8, 'cubeIn')
    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*14, 'cubeOutIn')
    tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*14, 'cubeOutIn')
    tweenShaderProperty('vignette', 'size', 0.2, crochet*0.001*16, 'cubeIn')
end
angulomirror ={60,572,700,956,1340,1468,1724}
angulomirrorotro={92,636,828,1084,1440,1596,1852}--1544 empieza drop final
function stepHit()
    
    for i = 1, #angulomirror do
        if curStep == angulomirror [i] then
            mirror(false,true,"","zoom",0,2,0.5,crochet,"quartOut")
            mirror(false,true,"","angle",0,-30,0.5,crochet,"quartOut")
            tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*0.5,"quartOut")
        elseif curStep == angulomirror [i]+2 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,30,0.5,crochet,"cubeIn")
        elseif curStep == angulomirror [i]+4 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end
    for i = 1, #angulomirrorotro do
        if curStep == angulomirrorotro [i] then
            mirror(false,true,"","zoom",0,2,0.5,crochet,"quartOut")
            mirror(false,true,"","angle",0,30,0.5,crochet,"quartOut")
            tweenShaderProperty("EyeFishEffectGame","power",0.5,crochet*0.001*1,"quartOut")
        elseif curStep == angulomirrorotro [i]+2 then
            mirror(false,true,"","zoom",0,1,0.5,crochet,"cubeIn")
            mirror(false,true,"","angle",0,-30,0.5,crochet,"cubeIn")
        elseif curStep == angulomirrorotro [i]+4 then
            tweenShaderProperty("EyeFishEffectGame","power",0,crochet*0.001*1,"cubeOut")
            mirror(false,true,"","angle",0,0,1,crochet,"cubeOut")
            bloom(6,1,crochet,2,"cubeOut")
        end
    end
   
    if curStep == 64 then
      lascosasdelhud(1)
    elseif curStep == 66 then
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*8, 'cubeOut')
        setShaderProperty("bloom","contrast",3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"linear")
        setShaderProperty("greyscale","strength",0)
        for i = 0,11 do
            tweenActorProperty(i,"y",_G["defaultStrum"..i.."Y"]+0,1,"cubeOut")
        end
    elseif curStep == 304 or curStep == 1088 then
        setShaderProperty("bloom","contrast",3)
        tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"linear")
        setShaderProperty("greyscale","strength",1)
    elseif curStep == 320 or curStep == 1344 then
       setShaderProperty("greyscale","strength",0)
    elseif curStep == 704 or curStep == 1856 then
        tweenShaderProperty('mirrorGame', 'zoom', 2, crochet*0.016, 'cubeOut') 
    end
    if curStep == 1856 then
        fadeCamera("hud","black",crochet*0.001*16,"cubeIn",true)
    end
    

    if curStep >= 64 and curStep < 304 or curStep >= 320 and curStep < 1088 or curStep >= 1344 and curStep < 1856  then
        if curStep % 4 == 0 then
            zoom = 0.95
        end
    end
        if curStep >= 320 and curStep < 1088 or curStep >= 1472 and curStep < 1856 then
            if curStep  % 8 == 0 then
              angle = 5
            elseif curStep % 8 == 4 then
                angle = -5
            end
        end
end