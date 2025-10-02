function start()

	rotatStart1 = 9999 -- ENTER WHEN FIRST HUD ROTATE SHOULD START
	rotatEnd1 =9999 -- ENTER WHEN FIRST HUD ROTATE SHOULD END
	
	rotatStart2 = 9999 -- ENTER WHEN SECOND HUD ROTATE SHOULD START
	rotatEnd2 = 9999 -- ENTER WHEN SECOND HUD ROTATE SHOULD END
	
	rotatStart3 = 9999 -- ENTER WHEN THIRD HUD ROTATE SHOULD START
	rotatEnd3 = 9999 -- ENTER WHEN FTHIRD HUD ROTATE SHOULD END
	
	rotatStrength = 0 -- ROTATION STRENGTH
	rotatSpeed = 0 -- ROTATION SPEED
	
	flyStart1 = 2815 -- ENTER WHEN FIRST CHARACTERS START TO FLY
	flyStart2 = 2815 -- ENTER WHEN SECOND CHARACTERS START TO FLY
	flyStart3 = 2815 -- ENTER WHEN THIRD CHARACTERS START TO FLY
	flyStart4 = 2815 -- ENTER WHEN THIRD CHARACTERS START TO FLY

	charPos = {
		{getActorX("dadCharacter0"), getActorY("dadCharacter0")-80},
		{getActorX("dadCharacter1"), getActorY("dadCharacter1")-80},
		{getActorX("dadCharacter2")-220, getActorY("dadCharacter2")-150},
		{getActorX("dadCharacter3")-200, getActorY("dadCharacter3")-150},
		{getActorX("bfCharacter0"), getActorY("bfCharacter0")-80},
		{getActorX("bfCharacter1"), getActorY("bfCharacter1")-80},
		{getActorX("bfCharacter2"), getActorY("bfCharacter2")-80},
		{getActorX("bfCharacter3"), getActorY("bfCharacter3")-80}
	}
	
	flySettings = {
		{1783, 659, 2.5, 2815, "dadCharacter0"},
		{170, 210, 1.5, 9999, "dadCharacter1"},
		{140, 150, 1.95, 9999, "dadCharacter2"},
		{1800, 670, 2.75, 2815, "dadCharacter3"},
		{2188, -1475, 2, 2815, "bfCharacter0"},
		{185, 120, 2.25, 9999, "bfCharacter1"},
		{2300, -1480, 1.25, 2815, "bfCharacter2"},
		{2350, -1485, 2.15, 2815, "bfCharacter3"}
	}
	
	setActorAlpha(0, "ratingText")
	setActorAlpha(0, "infoTxt")
	setActorAlpha(0, "timeBar")
	setActorAlpha(0, "timeBarBG")
	triggerEvent("Camera Flash", "black", "5.7")
	arrowY = getActorY("0")
end

function update()

	setActorLayer("dadCharacter3", 991)
	setActorLayer("dadCharacter2", 998)
	setActorLayer("dadCharacter1", 990)
	setActorLayer("dadCharacter0", 989)
	
	for i = 0, 33 do
		setActorY(arrowY + math.sin((songPos + i*500)/500)*3, i)
	end
	
	for i = 1, 8 do
		if flySettings[i][4] <= curStep then
			setActorPos(charPos[i][1] + math.sin(songPos/(1000/(flySettings[i][3]/1.5)))*flySettings[i][1], charPos[i][2] + math.cos(songPos/(1000/flySettings[i][3]))*flySettings[i][2], flySettings[i][5])
		end
	end
	
	if curStep >= rotatStart1 and curStep < rotatEnd1 then
		setHudAngle(math.sin(songPos/(1000/rotatSpeed))*rotatStrength)
		setProperty("camera", "angle", math.sin(songPos/(900/rotatSpeed))*rotatStrength)
	end
	
	if curStep == rotatEnd1 or curStep == rotatEnd2 or curStep == rotatEnd3 then
		tweenHudAngle(0, 1)
		setProperty("camera", "angle", 0)
	end
	
	if curStep >= rotatStart2 and curStep < rotatEnd2 then
		setHudAngle(math.sin(songPos/(1000/rotatSpeed))*rotatStrength)
		setProperty("camera", "angle", math.sin(songPos/(900/rotatSpeed))*rotatStrength)
	end
	
	if curStep >= rotatStart3 and curStep < rotatEnd3 then
		setHudAngle(math.sin(songPos/(1000/rotatSpeed))*rotatStrength)
		setProperty("camera", "angle", math.sin(songPos/(900/rotatSpeed))*rotatStrength)
	end

end

function stepHit()
	if curStep == 9999 then
		rotatStrength = 7
		rotatSpeed = 6
	end
	if curStep == 9999 then
		rotatStrength = 6
		rotatSpeed = 4
	end
end