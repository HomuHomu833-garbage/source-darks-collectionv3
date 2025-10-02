function start ()
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(0, "BlackBox")
    makeSprite("white","white",0,0,0.5)
    setObjectCamera("white","hud")
    setActorAlpha(0,"white")
    makeSprite("red","red",0,0,0.5)
    setObjectCamera("red","hud")
    setActorAlpha(0,"red")
end

function stepHit(curStep)
    if curStep == 766 then
        tweenFadeIn("white",0.5,0.2,"")
    end
    if curStep == 1280 then
        tweenFadeOut("white",0,0.1,"")
    end
    if curStep == 2815 then
        tweenFadeIn("red",0.5,0.2,"")
    end
    if curStep == 3327 then
        tweenFadeOut("red",0,0.1,"")
    end
    if curStep == 3329 then
        tweenFadeIn("BlackBox",1,0.2,"")
    end
    if curStep == 1855 then
        tweenFadeIn("white",0.5,0.2,"")
    end
    if curStep == 2559 then
        tweenFadeOut("white",0,0.1,"")
    end
end