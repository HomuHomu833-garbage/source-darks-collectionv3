
local strength = 0
function createPost()
    initShader('rgb', 'ChromAbEffect')
    setCameraShader('hud', 'rgb')
    setCameraShader('game', 'rgb')
    setShaderProperty('rgb', 'strength', strength)
end
function lerp(a, b, ratio)
	return a + ratio * (b - a); --the funny lerp
end
function onEvent(name, position, value1, value2)
    if string.lower(name) == "ca burst" then
        strength = strength + value1
        if value2 ~= nil or value2 ~= '' then 
            if (strength > value2) then 
                strength = value2
            end
        end
    end
end

function update(elapsed)
    strength = lerp(strength, 0, elapsed*5)
    setShaderProperty('rgb', 'strength', strength)
end