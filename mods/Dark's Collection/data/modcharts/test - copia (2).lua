local noteAngle = {}  
local noteXPos = {} 
local noteYPos = {} 
local defaultAngle = 0  
local lerpSpeed = 5 -- speed
local originalNoteXPos = {}
local originalNoteYPos = {}

function createPost()
    -- Inicialización de las posiciones y ángulos de las notas.
    for i = 0, (keyCount * 2) - 1 do
        table.insert(noteAngle, defaultAngle)
        originalNoteXPos[i + 1] = _G['defaultStrum'..i..'X']
        originalNoteYPos[i + 1] = _G['defaultStrum'..i..'Y']
        noteXPos[i + 1] = originalNoteXPos[i + 1]
        noteYPos[i + 1] = originalNoteYPos[i + 1]

        set(i..".angle", noteAngle[i + 1])
        set(i..".x", noteXPos[i + 1])
        set(i..".y", noteYPos[i + 1])
    end
end

function flechas(lol, angulo, lolx, valorx, loly, valory)
    -- Mueve las flechas cuando sea necesario.
    for i = 0, (keyCount * 2) - 1 do
        if lol then
            noteAngle[i + 1] = angulo
        end
        if lolx then
            noteXPos[i + 1] = originalNoteXPos[i + 1] + valorx  
        end
        if loly then
            noteYPos[i + 1] = originalNoteYPos[i + 1] + valory
        end

        -- Aplicar las posiciones actualizadas de las flechas.
        setActorX(noteXPos[i + 1], i) 
        setActorY(noteYPos[i + 1], i) 
        setActorAngle(noteAngle[i + 1], i) 
    end
end

function stepHit()
    -- Movimiento de las flechas solo en ciertos pasos.
    if (curStep >= 1 and curStep <= 44444) or (curStep >= 896 and curStep <= 992) then
        if curStep % 8 == 0 then
            flechas(true, 25, true, -50, true, 50)
        elseif curStep % 8 == 4 then
            flechas(true, -25, true, 50, false, -50)
        end
    end
end

function update(elapsed)

    -- Interpolación para suavizar el movimiento de las notas jugables.
    for i = 0, (keyCount * 2) - 1 do
        noteAngle[i + 1] = lerp(noteAngle[i + 1], defaultAngle, elapsed * lerpSpeed)
        noteXPos[i + 1] = lerp(noteXPos[i + 1], originalNoteXPos[i + 1], elapsed * lerpSpeed)
        noteYPos[i + 1] = lerp(noteYPos[i + 1], originalNoteYPos[i + 1], elapsed * lerpSpeed)

        -- Aplicar la interpolación solo a las posiciones de las notas jugables.
        set(i..".angle", noteAngle[i + 1])
        set(i..".x", noteXPos[i + 1])
        set(i..".y", noteYPos[i + 1])
    end
end
