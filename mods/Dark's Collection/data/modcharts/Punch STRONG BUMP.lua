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
	if c == "bell" or c == "RevPunch" then --- el "or c ==" se puede repetir :)
		camAngleTo = camSavedAngle
		camSpeed = 25
		camSavedAngle = camSavedAngle * -1
		playCharacterAnimation("boyfriend", "dodge", true)

	end
end