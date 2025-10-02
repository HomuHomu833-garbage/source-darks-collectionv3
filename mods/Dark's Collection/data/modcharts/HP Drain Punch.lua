function start(song)
    print(song)
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
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

function playerOneSing(a,b,c,d)
	if c == "Rev Punch" then
		camAngleTo = camSavedAngle
		camSpeed = 35
		camSavedAngle = camSavedAngle * -1
		playCharacterAnimation("boyfriend", "dodge", true)

	end
end
