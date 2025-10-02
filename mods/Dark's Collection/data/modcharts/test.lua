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
    hud(1,crochet,4,"cubeOut")

    makeSprite('chessnose', '', 0, 0, 1) 
	defaultZoom = getCamZoom()
    makeGraphic('chessnose', 1920/defaultZoom, 1080/defaultZoom, '')
	actorScreenCenter('chessnose')
	setActorScroll(0,0, 'chessnose')
    setActorAlpha(0.0111111, 'chessnose')

    initShader('chess', 'chess') 
 --   setActorShader('chessnose', 'chess') 
    setShaderProperty('chess', 'transparency', 0.1)
    setShaderProperty('chess', 'direction', -1.0)

    initShader('rayMarch', 'SpiralNoise')--
    setCameraShader('game', 'rayMarch')
    setShaderProperty('rayMarch', 'strength', 1)
    setShaderProperty('rayMarch', 'rotationDir', 1)
    --for i = 0,0 do
  --      setActorShader(i, 'rayMarch')
  --  end
end
time = 0
function update(elapsed)
    time = time + elapsed
    setShaderProperty("rayMarch","iTime",time*2)
end
function stepHit()
    if curStep == 32 then
       -- tweenShader('rayMarch', 'rotationDir', 0,crochet *0.002,"linear")
    end
end