function start(song)    
    print(song)
    createCustomShader("grayscale", "grayscale", 120)
    setCameraCustomShader("grayscale", "game")
    setCameraCustomShader("grayscale", "hud")
    makeSprite("BlackBox", "BlackBox", 0, 0, 10)
    makeSprite('purple','purple',0,0,0.5)
    setObjectCamera("BlackBox", "hud")
    setObjectCamera("purple", "hud")
    setActorAlpha(1, "BlackBox")
    setActorAlpha(0, "purple")
end

function update(elapsed)
    for i = 1, elapsed*80 do
        setActorAlpha (getActorAlpha("BlackBox") + fadeSpeed, "BlackBox")
    end
    for i = 1, elapsed*80 do
        setActorAlpha (getActorAlpha("purple") + fadeSpeed, "purple")
    end
end

function stepHit (step)
    if curStep == 1 then
        tweenFadeOut("BlackBox",0,8,"")
    end
    if curStep == 192 then
        setCameraNoCustomShader("game")
        setCameraNoCustomShader("hud")
    end
    if curStep == 448 then
        tweenFadeIn("purple",0.25,0.5,"")
    end
    if curStep == 704 then
        tweenFadeIn("purple",0.5,0.5,"")
    end
    if curStep == 1216 then
        tweenFadeOut("purple",0,2,"")
        setCameraCustomShader("grayscale", "game")
        setCameraCustomShader("grayscale", "hud")
    end
    if curStep == 1344 then
        setActorAlpha(0, "BlackBox")
        tweenFadeIn("purple",0,0.5,"")
        setCameraNoCustomShader("game")
        setCameraNoCustomShader("hud")
    end
    if curStep == 1600 then
        tweenFadeOut("purple",0,2,"")
        setCameraCustomShader("grayscale", "game")
        setCameraCustomShader("grayscale", "hud")
    end
    if curStep == 1632 then
        tweenFadeIn("BlackBox",1,2.4,"")
    end
end
print("Mod Chart script loaded :)")