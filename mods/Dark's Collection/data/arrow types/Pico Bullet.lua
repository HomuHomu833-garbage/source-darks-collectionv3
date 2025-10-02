local bleedDamage = 0.2
local xOffsets = {50, 20, 15, -10}
local yOffsets = {-20, -10, 40, -20}

function createPost()
    local noteCount = getUnspawnNotes()
    for i = 0, noteCount - 1 do 
        local nt = getUnspawnedNoteNoteType(i)
        local nd = getSingDirectionID(getUnspawnedNoteNoteData(i))

        if nt == 'Pico Bullet' and not getUnspawnedNoteSustainNote(i) then 
            setUnspawnedNoteXOffset(i, xOffsets[nd+1] * getUnspawnedNoteScaleX(i))
            setUnspawnedNoteYOffset(i, yOffsets[nd+1] * getUnspawnedNoteScaleX(i))
        end
    end
end

function playerOneSing(data, time, noteType) 
    if noteType == 'Pico Bullet' then
        if data == 0 or data == 1 then  -- izquierda o arriba
            playCharacterAnimation('bfCharacter1', 'shootLEFT', true)
        elseif data == 2 or data == 3 then  -- abajo o derecha
            playCharacterAnimation('bfCharacter1', 'shootRIGHT', true)
        end
        setCharacterPreventDanceForAnim('bfCharacter1', true)
    end
end
