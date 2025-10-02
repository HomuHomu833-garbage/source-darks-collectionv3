local noteXPos = {}
local targetnoteXPos = {}
local noteYPos = {}
local targetnoteYPos = {}
local noteZPos = {}
local noteZScale = {}
local targetnoteZPos = {}
local noteAngle = {}
local targetnoteAngle = {}
local startSpeed = 1
local modcharts = true
local time = 0
function createPost()

    startSpeed = getProperty('', 'speed')
	for i = 0, (keyCount*2)-1 do 
		table.insert(noteXPos, 0) --setup default pos and whatever
		table.insert(noteYPos, 0)
		table.insert(noteZPos, 0)
		table.insert(noteZScale, 1)
		table.insert(noteAngle, 0)
		table.insert(targetnoteXPos, 0)
		table.insert(targetnoteYPos, 0)
		table.insert(targetnoteZPos, 0)
		table.insert(targetnoteAngle, 0) 
		noteXPos[i+1] = getActorX(i)
		targetnoteXPos[i+1] = getActorX(i)
		targetnoteYPos[i+1] = _G['defaultStrum'..i..'Y']
		noteYPos[i+1] = _G['defaultStrum'..i..'Y']
	end
end
local noteScale = 1

function lerp(a, b, ratio)
	return a + ratio * (b - a); --the funny lerp
end
local defaultNoteScale = -1
local lerpX = true
local lerpY = false
local lerpAngle = true
local lerpScale = true

local defaultWidth = -1
local defaultSusWidth = -1
local defaultSusHeight = -1
local defaultSusEndHeight = -1

local notesSeen = {}

local noteRotX = 0
local targetNoteRotX = 0

local lerpSpeedScale = 5
local lerpSpeedX = 4
local lerpSpeedY = 10
local lerpSpeedZ = 4
local lerpSpeedAngle = 3
local lerpSpeednoteRotX = 5

local drunkLerp = 1.5
local drunk = 0
local drunkSpeed = 2
function stepHit()
    if curStep >= 1 and curStep < 512 then
		if curStep % 16 == 0 then
			noteRotX = 5
            noteScale = noteScale + 0.3
            for i = 0,17 do
               noteXPos[i+1] = 40
               noteXPos[i+1] = targetnoteXPos[i+1] + 50
            end

		end
		if curStep % 16 == 8 then
			noteRotX = -5
            noteScale = noteScale + 0.3
            for i = 0,17 do
                noteXPos[i+1] = targetnoteXPos[i+1] - 50
                noteAngle[i+1] = -40
            end
		end
    end
    if curStep >= 512 and curStep < 1024 then
		if curStep % 16 == 0 then
			noteRotX = 20
            noteScale = noteScale + 0.2
            for i = 0,17 do
                noteAngle[i+1] = 40
               noteYPos[i+1] = targetnoteYPos[i+1] + 50
            end

		end
		if curStep % 16 == 8 then
			noteRotX = -20
            noteScale = noteScale + 0.2
            for i = 0,17 do
                noteYPos[i+1] = targetnoteYPos[i+1] - 50
                noteAngle[i+1] = -40
            end
		end
    end
end
function updatePost(elapsed)
	if not modcharts then 
		return
	end
	if lerpScale then 
		noteScale = lerp(noteScale, 1, elapsed*lerpSpeedScale)
	end
	noteRotX = lerp(noteRotX, targetNoteRotX, elapsed*lerpSpeednoteRotX)

	drunk = lerp(drunk, drunkLerp, elapsed*5)

	local currentBeat = (songPos / 1000)*(bpm/60)

	for i = 0,(keyCount*2)-1 do 
		noteXPos[i+1] = lerp(noteXPos[i+1], targetnoteXPos[i+1], elapsed*lerpSpeedX)
		noteYPos[i+1] = lerp(noteYPos[i+1], targetnoteYPos[i+1], elapsed*lerpSpeedY)
		noteZPos[i+1] = lerp(noteZPos[i+1], targetnoteZPos[i+1], elapsed*lerpSpeedZ)

		local thisnotePosX = noteXPos[i+1] + getXOffset(i, 0)
		local thisnotePosY = noteYPos[i+1]
		local noteRotPos = getNoteRot(thisnotePosX, thisnotePosY, noteRotX)

		thisnotePosX = noteRotPos[1]
		thisnotePosY = noteRotPos[2]
		local thisnotePosZ = noteRotPos[3]+(noteZPos[i+1]/1000)
		--local thisnotePosX = noteXPos[i+1]
		--local thisnotePosY = noteYPos[i+1]
		--local thisnotePosZ = (noteZPos[i+1]/1000)-1

		noteAngle[i+1] = lerp(noteAngle[i+1], targetnoteAngle[i+1], elapsed*lerpSpeedAngle)
		setActorModAngle(noteAngle[i+1], i)

		local totalNotePos = calculatePerspective(thisnotePosX, thisnotePosY, thisnotePosZ)
		
		--setActorX(noteXPos[i+1], i)
		--setActorY(noteYPos[i+1], i)
		setActorX(totalNotePos[1], i)
		setActorY(totalNotePos[2], i)
		
		noteZScale[i+1] = totalNotePos[3]
		setActorScaleXY(noteScale * (1/-noteZScale[i+1]), noteScale * (1/-noteZScale[i+1]), i)
		if getPlayingActorAnimation(i) == 'confirm' then 
			setActorScaleXY(noteScale*1.45 * (1/-noteZScale[i+1]), noteScale*1.45 * (1/-noteZScale[i+1]), i) --confirm is weird ig
		end
		
	end
    local songSpeed = getProperty('', 'speed')
	local noteCount = getRenderedNotes()
	if noteCount>0 then 
		for i = 0, noteCount-1 do 
			local data = getRenderedNoteType(i)
			if getRenderedNoteHit(i) then 
				data = data + keyCount --player notes
			end
			if defaultWidth == -1 then 
				defaultWidth = getRenderedNoteWidth(i)
			end
			if defaultNoteScale == -1 then 
				defaultNoteScale = getRenderedNoteScaleX(i)
			end
			local offsetX = getRenderedNoteOffsetX(i)
			local strumTime = getRenderedNoteStrumtime(i)
			if downscrollBool then 
				if isRenderedNoteSustainEnd(i) then 
					strumTime = getRenderedNotePrevNoteStrumtime(i)
				end
			end
			
			local curPos = ((songPos-strumTime)*songSpeed)
			offsetX = offsetX + getXOffset(data, curPos)
			local thisnoteYPos = noteYPos[data+1]
			if downscrollBool then 
				thisnoteYPos = thisnoteYPos + (0.45*curPos) - (getRenderedNoteOffsetY(i))
				if isRenderedNoteSustainEnd(i) then 
					thisnoteYPos = thisnoteYPos - (getRenderedNoteHeight(i))+2
				end
			else 
				thisnoteYPos = thisnoteYPos - (0.45*curPos) - (getRenderedNoteOffsetY(i))
			end
			local thisnoteXPos = noteXPos[data+1]+offsetX
			
			local noteRotPos = getNoteRot(thisnoteXPos, thisnoteYPos, noteRotX)
	
			thisnoteXPos = noteRotPos[1]
			thisnoteYPos = noteRotPos[2]
			local thisnotePosZ = noteRotPos[3]+(noteZPos[data+1]/1000)
			local totalNotePos = calculatePerspective(thisnoteXPos, thisnoteYPos, thisnotePosZ)

			if not isSustain(i) then 
				--setRenderedNoteScale(getRenderedNoteWidth(i)*,getRenderedNoteHeight(i)*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleX(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteScaleY(defaultNoteScale*noteScale * (1/-totalNotePos[3]), i)
				setRenderedNoteAlpha(1,i)
				setRenderedNoteAngle(noteAngle[data+1],i)
			else
				--offsetX = 37 * (1/-totalNotePos[3]) * (defaultWidth/112)
				setRenderedNoteAlpha(0.6,i)
				if defaultSusWidth == -1 then 
					defaultSusWidth = getRenderedNoteWidth(i)
				end

				if isRenderedNoteSustainEnd(i) then --sustain ends
					if defaultSusEndHeight == -1 then 
						defaultSusEndHeight = getRenderedNoteScaleY(i)
					end
					
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusEndHeight* (1/-totalNotePos[3]), i)
				else 
                    if defaultSusHeight == -1 then 
                        defaultSusHeight = getRenderedNoteScaleY(i)
                    end
					setRenderedNoteScale(defaultSusWidth*noteScale * (1/-totalNotePos[3]),1, i)
					setRenderedNoteScaleY(defaultSusHeight* (1/-totalNotePos[3])* (songSpeed/startSpeed), i)
				end

				setRenderedNoteAngle(0,i)

				
				--susOffset = 37*noteScale
			end
			
			setRenderedNotePos(totalNotePos[1],totalNotePos[2], i)
		end
	end

end

function getXOffset(data, curPos)

	local xOffset = 0
	if drunk ~= 0 then 
		xOffset = xOffset + drunk * (math.cos( ((songPos*0.001) + ((data%keyCount)*0.2) ) * (drunkSpeed*0.2)) * 112*0.5);
	end

	return xOffset
end

function getSustainAngle(i)

	local data = getRenderedNoteType(i)
	local mustPress = getRenderedNoteHit(i)
	if mustPress then 
		data = data + keyCount --player notes
	end

	local noteYPos = ((songPos-getRenderedNoteStrumtime(i))*songSpeed)
	local nextYPos = noteYPos + stepCrochet

	local noteOffsetX = getXOffset(data, noteYPos)
	local nextOffsetX = getXOffset(data, nextYPos)

	local thisNoteX = getRenderedNoteCalcX(i)+noteOffsetX
	local nextNoteX = getRenderedNoteCalcX(i)+nextOffsetX

	local thisNoteY = getRenderedNoteY(i)
	

	local ang = 0
	if downscrollBool then 
		local nextNoteY = getRenderedNoteY(i) + (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) - (math.pi/2))
		--debugPrint(ang)
	else 
		local nextNoteY = getRenderedNoteY(i) - (0.45*stepCrochet*songSpeed)
		ang = math.deg(math.atan2( (nextNoteY-thisNoteY), (nextNoteX-thisNoteX) ) + (math.pi/2))
	end
	return ang
end

--the funny perspective math

local zNear = 0
local zFar = 1000
local zRange = zNear - zFar 
local tanHalfFOV = math.tan(math.pi/4) -- math.pi/2 = 90 deg, then half again

function calculatePerspective(x,y,z)

	if (z >= 1) then
		z = 1 --stop weird shit
	end

	x = x - (1280/2) + (defaultWidth/2)
	y = y - (720/2) + (defaultWidth/2)

	local zPerspectiveOffset = (z+(2 * zFar * zNear / zRange));

	local xPerspective = x*(1/tanHalfFOV);
	local yPerspective = y/(1/tanHalfFOV);
	xPerspective = xPerspective/-zPerspectiveOffset;
	yPerspective = yPerspective/-zPerspectiveOffset;

	xPerspective = xPerspective + (1280/2) - (defaultWidth/2)
	yPerspective = yPerspective + (720/2) - (defaultWidth/2)

	return {xPerspective,yPerspective,zPerspectiveOffset}
end
local rad = math.pi/180;
function getNoteRot(XPos, YPos, rotX)
	local x = 0
	local y = 0
	local z = -1

	--fucking math
	local strumRotX = getCartesianCoords3D(rotX,90, XPos-(1280/2))
	x = strumRotX[1]+(1280/2)
	local strumRotY = getCartesianCoords3D(90,0, YPos-(720/2))
	y = strumRotY[2]+(720/2)
	--notePosY = _G['default'..strum..'Y'..i%keyCount]+strumRot[2]
	z = z + strumRotX[3] + strumRotY[3]
	return {x,y,z}
end
--the funny spherical to cartesian for 3d angles
function getCartesianCoords3D(theta, phi, radius)

	local x = 0
	local y = 0
	local z = 0

	x = math.cos(theta*rad)*math.sin(phi*rad);
	y = math.cos(phi*rad);
	z = math.sin(theta*rad)*math.sin(phi*rad);
	x = x*radius;
	y = y*radius;
	z = z*radius;

	return {x,y,z/1000}
end

--https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
function scale(valueIn, baseMin, baseMax, limitMin, limitMax)
	return ((limitMax - limitMin) * (valueIn - baseMin) / (baseMax - baseMin)) + limitMin
end

local modchartState = 0

local flipShit = 1
local flipShit2 = 1
function doModchartShit(state)
    flipShit = flipShit * -1
	if state == 0 then --note angle para un lao
        for i = 0,18 do
            noteAngle[i+1] = 10*flipShit
        end
        noteScale = noteScale - 0.05
    elseif state == 1 then --note angle pero para el otro lao 
        for i = 0,18 do 
            noteAngle[i+1] = -10*flipShit
        end
        noteScale = noteScale - 0.05
    elseif state == 2 then --las notas como que van algunas arriba y otras abajo, esta guapo 
        flipShit2 = flipShit2 * -1
        for i = 0,4 do 
            if flipShit2 == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (10 * note)
            end
        end
        for i = 5,8 do 
            if flipShit2 == -1 then
                local note = (0-i)+keyCount
                noteYPos[i+1] = noteYPos[i+1] + (-10 * note)
                
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] - (-10 * i)
            else
                noteYPos[i+1] = noteYPos[i+1] - (-10 * i)
                local note = (0-i)+keyCount
                noteYPos[i+1+keyCount] = noteYPos[i+1+keyCount] + (-10 * note)
            end
        end
	end
end