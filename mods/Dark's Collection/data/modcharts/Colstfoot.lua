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
    if curStep == 1150 then
        tweenFadeIn("red",0.5,0.2,"")
    end
    if curStep == 1408 then
        tweenFadeOut("red",0,0.1,"")
    end
    if curStep == 127 then
        tweenFadeIn("white",0.5,0.2,"")
    end
    if curStep == 1023 then
        tweenFadeOut("white",0,0.1,"")
    end
    if curStep == 2367 then
        tweenFadeIn("red",0.5,0.2,"")
    end
    if curStep == 2622 then
        tweenFadeOut("red",0,0.1,"")
    end
    if curStep == 2687 then
        tweenFadeIn("BlackBox",1,0.2,"")
    end
    if curStep == 1760 then
        tweenFadeIn("white",0.5,0.2,"")
    end
    if curStep == 2239 then
        tweenFadeOut("white",0,0.1,"")
    end
end