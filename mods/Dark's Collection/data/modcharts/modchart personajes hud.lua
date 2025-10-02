local characters = {"dadCharacter0", "dadCharacter1", "dadCharacter2", "dadCharacter3", "bfCharacter0", "bfCharacter1"}--escoger los personajes
local yPositions = {30, 400, -20, 250, 450, 300}  -- lo mismo pero
local xPositions = {-12, -12, -12, -12, 30, 30} --posiciones donde estaran en el hud
local originalPositions = {}


function posiciones(context, spacing) -- para seleccionar en que camara en hud pones posiciones("hud",50)  y en game solo poes posiciones("game") , 50 en el hud es por el espaciado 🐟
    spacing = spacing or 50
    for i, character in ipairs(characters) do
        if context == "hud" then        
            set(character .. ".x", xPositions[i] * spacing)
            set(character .. ".y", yPositions[i] or 0)
        elseif context == "game" then
            local originalPos = originalPositions[character]
            if originalPos then
                set(character .. ".x", originalPos.x)
                set(character .. ".y", originalPos.y)
            end
        end
        setCamera(character, context)
    end
end

function movimiento(nuevasPosiciones, duration, ease, moverDadCharacters)--mover los personaes , el moverdadcharac<ters es en true o false 
    for i, nuevaPos in ipairs(nuevasPosiciones) do
        local targetX = nuevaPos * 50
        if moverDadCharacters then
            if i <= 4 then--mueven 0 a 4
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        else
            if i > 4 then --mueven 4 a mas
                tween(characters[i], {x = targetX},crochet*0.001*duration, ease)
            end
        end
    end
end
function createPost()
    for i, character in ipairs(characters) do -- guarda posiciones
        originalPositions[character] = {x = get(character .. ".x"), y = get(character .. ".y")}
    end

end

function stepHit()--test perroxd

    if curStep == 1792 or curStep == 1920 or curStep == 2176 then
        posiciones("hud", 50)
        movimiento({7, 12, -2, 0, 0, 0}, 2, "cubeOut", true)
    elseif curStep == 1848 or curStep == 1976 or curStep == 2176 or curStep == 2232 then
        movimiento({-12, -12, -12, -12, 0, 0}, 1.8, "cubeIn", true)
    elseif curStep == 1856 or curStep == 1984 or curStep == 2240 then
        movimiento({0, 0, 0, 0, 12, 15}, 2, "cubeOut", false)
    elseif curStep == 1912 or curStep == 2040 or curStep == 2168 or curStep == 2296 then
        movimiento({0, 0, 0, 0, 30, 30}, 1.8, "cubeIn", false)
    elseif curStep == 2048 or curStep == 2304 then
        posiciones("game") 
    elseif curStep == 2112 then
        posiciones("hud", 50)
        movimiento({0, 0, 0, 0, 12, 15}, 2, "cubeOut", false)
    end
end
