local floatShit = 0
local rockY = 0

local mattX, mattY,mattZ = 0, 0,0
local shaggyX, shaggyY,shaggyZ = 0, 0,0

function createPost()
	rockY = getActorY('undefinedSprite0')
end
function update(elapsed)
    local songSine = songPos * 0.001
    local songSineY = songPos * 0.004
    setActorY(rockY + 50 * math.sin(songSine), 'undefinedSprite1')
    setActorY(rockY + 50 * math.sin(songPos * 0.003), 'undefinedSprite0')

    if curStep < 1606 then

    local curMattX, curMattY = getActorX('dadCharacter1'), getActorY('dadCharacter1')--,getActorAngle("dadCharacter1")
    local curShaggyX, curShaggyY = getActorX('dadCharacter0'), getActorY('dadCharacter0')--, getActorAngle('dadCharacter0')

    setActorX(curMattX + math.sin(songSine) * 0.5, 'dadCharacter1')
    setActorY(curMattY + math.sin(songSineY) * 1, 'dadCharacter1')

    setActorX(curShaggyX + math.sin(songSine) * -0.5, 'dadCharacter0')
    setActorY(curShaggyY + math.sin(songSineY) * -1, 'dadCharacter0')

     --setActorAngle(curMattZ + math.sin(songSine) * 7, 'dadCharacter1')
  --  setActorAngle(curShaggyZ + math.sin(songSine) * -7, 'dadCharacter0')


    end
end


