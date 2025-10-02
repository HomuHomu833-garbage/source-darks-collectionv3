function start(song)

    print(song)

    createCustomShader("grayscale", "grayscale", 120)
    setCameraCustomShader("grayscale", "game")
    setCameraCustomShader("grayscale", "hud")
end

function stepHit( step )
    if curStep == 9999 then
        tweenFadeOut("BlackBox",0,7,"")
    end
    if curStep == 9999 then
        tweenFadeIn("BlackBox",1,0.01,"")
    end
    if curStep == 0 then
        tweenFadeOut("BlackBox",0,0.01,"")
    end
    if curStep == 9999 then
        tweenFadeIn("BlackBox",1,0.01,"")
    end
    if curStep == 1 then
        setCameraNoCustomShader("hud")
        setCameraNoCustomShader("game")
    end
    if curStep == 2240 then
        setCameraCustomShader("grayscale", "game")
        setCameraCustomShader("grayscale", "hud")
    end
    if curStep == 3000 then
        setCameraNoCustomShader("hud")
        setCameraNoCustomShader("game")
    end
    if curStep == 3100 then
        setCameraCustomShader("grayscale", "game")
        setCameraCustomShader("grayscale", "hud")
    end
    if curStep == 3200 then
        setCameraNoCustomShader("hud")
        setCameraNoCustomShader("game")
    end
    if curStep == 3300 then
        setCameraCustomShader("grayscale", "game")
        setCameraCustomShader("grayscale", "hud")
    end
    if curStep == 3400 then
        setCameraNoCustomShader("hud")
        setCameraNoCustomShader("game")
    end
end
function playerOneSing(a,b,c,d)
	if c == "BoxingMatchPunch" then
		playCharacterAnimation("boyfriend", "dodgeLEFT", true)
	end
	if c == "Punch" then
		playCharacterAnimation("boyfriend", "dodge", true)
	end
end
