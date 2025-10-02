function start (song)
    print(song)
    makeSprite('purple','purple',0,0,0.5)
    setObjectCamera('purple','hud')
    setActorAlpha(0,'purple')
end

function start()
	camAngle = 0
	camAngleTo = 0
	camSpeed = 1
	camSavedAngle = 17
end

function update(elapsed)
	camAngle = camAngle + (camAngleTo - camAngle)*camSpeed*elapsed
	if math.abs(camAngle/camAngleTo) > 0.75 and camAngleTo ~= 0 then
		camSpeed = camSpeed/5
		camAngleTo = 0
	end
	setProperty("camera", "angle", camAngle)
	setHudAngle(camAngle)
end

function stepHit (step)
	if curStep == 9999 then
			camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
	end
    if curStep == 9999 then -- turning off time
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then -- turning on shaders
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then --turning off time
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 320 then --turning on shaders
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then --turning off time
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        tweenFadeIn("puple",0.5,0.2,"")
    end
    if curStep == 9999 then
        tweenFadeOut("purple",0,0.01,"")
    end
    if curStep == 1632 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 1648 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 1872 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then --turning on shaders
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then --turning off time
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 1920 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2048 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2056 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2064 then
                	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2068 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 1888 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 1876 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2072 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2076 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2080 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2088 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2096 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2100 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2104 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2108 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2464 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2480 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 9999 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2816 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2848 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2880 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2936 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 2976 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 3008 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 3056 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
    if curStep == 3064 then
        	camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
    end
end