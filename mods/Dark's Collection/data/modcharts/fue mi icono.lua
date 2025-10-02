function playerTwoSing(data, time, type)
    if getHealth() - 0.0 > 0 then
        setHealth(getHealth() - 0.0)
    else
        setHealth(0.0)
    end
    triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
end

print("Mod Chart script loaded :)")



local scales = {}

function onCreate()
    scales["iconP1"] = {1, 1}
    scales["iconP2"] = {1, 1}
end

function beatHit(curBeat)
    local gfSpeed = getProperty("", "gfSpeed")

    -- main bullshit
    if curBeat % gfSpeed == 0 then
        -- rotation shit
        if curBeat % (gfSpeed * 2) == 0 then
            setActorScaleXY(1, 1.0, "iconP1")
            scales["iconP1"] = {1, 1.0}

            setActorScaleXY(1, 1.1, "iconP2")
            scales["iconP2"] = {1, 1.1}

            setActorAngle(0, "iconP1")
            tweenAngleOut("iconP1", -7.5, (getPropertyFromClass("game.Conductor", "crochet") / 1300) * gfSpeed)

            setActorAngle(0, "iconP2")
            tweenAngleOut("iconP2", 7.5, (getPropertyFromClass("game.Conductor", "crochet") / 1300) * gfSpeed)
        else
            setActorScaleXY(1, 1.1, "iconP1")
            scales["iconP1"] = {1, 1.1}

            setActorScaleXY(1, 1.0, "iconP2")
            scales["iconP2"] = {1, 1.0}

            setActorAngle(0, "iconP1")
            tweenAngleOut("iconP1", 7.5, (getPropertyFromClass("game.Conductor", "crochet") / 1300) * gfSpeed)

            setActorAngle(0, "iconP2")
            tweenAngleOut("iconP2", -7.5, (getPropertyFromClass("game.Conductor", "crochet") / 1300) * gfSpeed)
        end
    end
end

function update(elapsed)
    lerp(scales["iconP1"][1], 1, 50 * elapsed)
    lerp(scales["iconP1"][2], 1, 50 * elapsed)

    lerp(scales["iconP2"][1], 1, 50 * elapsed)
    lerp(scales["iconP2"][2], 1, 50 * elapsed)

    setActorScaleXY(scales["iconP1"][1], scales["iconP1"][2], "iconP1")
    setActorScaleXY(scales["iconP2"][1], scales["iconP2"][2], "iconP2")
end
function lerp(a, b, ratio)
    return a + ratio * (b - a)
end
