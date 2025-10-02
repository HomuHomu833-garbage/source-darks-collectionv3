local mattX, mattY = 0, 0
local shaggyX, shaggyY = 0, 0

function createPost()
    -- guardamos las posiciones iniciales por si luego quieres usarlas
    mattX, mattY = getActorX('dadCharacter1'), getActorY('dadCharacter1')
    shaggyX, shaggyY = getActorX('dadCharacter0'), getActorY('dadCharacter0')
end

function update(elapsed)
    local songSine = songPos * 0.002 
    local xAmp, yAmp = 0.2, 0.2

    local curMattX, curMattY = getActorX('dadCharacter1'), getActorY('dadCharacter1')
    local curShaggyX, curShaggyY = getActorX('dadCharacter0'), getActorY('dadCharacter0')

    setActorX(curMattX - math.cos(songSine) * xAmp, 'dadCharacter1')
    setActorY(curMattY + math.sin(songSine) * yAmp, 'dadCharacter1')

    setActorX(curShaggyX - math.cos(songSine) * xAmp, 'dadCharacter0')
    setActorY(curShaggyY - math.sin(songSine) * yAmp, 'dadCharacter0')
end
