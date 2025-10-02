
function playerTwoSingHeld()
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.001)
    end
    triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
end
function start (song)

    makeSprite("GMIcredits", "GMIcredits", -1500, 0, 1)
    setObjectCamera("GMIcredits", "hud")
    setActorAlpha(1, "GMIcredits")
    makeSprite("goodluck", "goodluck", 150, 900, 1)
    setObjectCamera("goodluck", "hud")
    setActorAlpha(1, "goodluck")
end
function stepHit (step)
    if curStep == 1 then 
        tweenPosOut("GMIcredits",150,0,4.7)
    end
    if curStep == 64 then 
        tweenPosOut("GMIcredits",1500,0,0.5)
    end
	if curStep == 32 and difficulty == "100%" then 
        tweenPosOut("goodluck",150,100,0.5)
    end
    if curStep == 64 and difficulty == "100%" then 
        tweenPosOut("goodluck",610,160,1.5)
    end
end