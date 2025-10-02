local dodgeAnim = 0
local dodgeMap = {
	{'singLEFT', 'dodgeLEFT'},
	{'singDOWN', 'dodgeDOWN'},
	{'singUP', 'dodgeUP'},
	{'singRIGHT', 'dodgeRIGHT'}
}

function playerOneSing(a,b,c,d)
    if c == "BoxingMatchPunch" or c == "Wiik3Punch" then
        dodgeAnim = dodgeAnim + 1
        local anim = dodgeAnim%4
        playCharacterAnimation('boyfriend', dodgeMap[anim+1][2], true)
        setCharacterPreventDanceForAnim('boyfriend', true)
    end
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.003)
    else
        setHealth(0.020)
    end
end

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
    if curStep == 9999 then
        tweenFadeIn("BlackBox",1,0.01,"")
    end
    if curStep == 9999 then
        tweenFadeOut("BlackBox",0,0.01,"")
    end
    if curStep == 9999 then
        tweenFadeIn("BlackBox",1,0.01,"")
    end
 
end
