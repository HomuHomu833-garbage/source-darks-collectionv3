
function start(song)

    print(song)
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")
end

function stepHit( step )
    if curStep == 32 then
        tweenFadeOut("BlackBox",0,7,"")
    end
    
end