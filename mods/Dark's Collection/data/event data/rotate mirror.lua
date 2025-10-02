function createPost()
    initShader('mirror', 'mirror')
    setCameraShader('game', 'mirror')
    setCameraShader('hud', 'mirror')
	setShaderProperty("mirror","zoom",1)
	setShaderProperty("mirror","x",0)
    setShaderProperty("mirror","y",0)
    setShaderProperty("mirror","angle", 0)
end
function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "rotate mirror" then
        local values = splitString(argument1, ",")
        local times = splitString(argument2, ",")
        tween('zoomstufflol', {width = tonumber(values[1])}, tonumber(times[1]), 'linear')
        tween('zoomstufflol', {angle = tonumber(values[2])}, tonumber(times[2]), 'linear')
        tween('zoomstufflol', {x = tonumber(values[3])}, tonumber(times[3]), 'linear')
        tween('zoomstufflol', {y = tonumber(values[4])}, tonumber(times[4]), 'linear')
    end
end
function update( elapsed )
    setCustomShaderFloat('mirror',  'zoom', get('zoomstufflol.width'))
    setCustomShaderFloat('mirror',  'angle', get('zoomstufflol.angle'))
    setCustomShaderFloat('mirror',  'x', get('zoomstufflol.x'))
    setCustomShaderFloat('mirror',  'y', get('zoomstufflol.y'))
end
function splitString(stringParam, delemiter)
    local strings = {}

    local funnyString = ""

    for i = 1, #stringParam do
        if string.sub(stringParam, i, i) == delemiter then
            table.insert(strings, funnyString)
            funnyString = ""
        end

        if string.sub(stringParam, i, i) ~= delemiter or delemiter == "" then
            funnyString = funnyString .. string.sub(stringParam, i, i)
        end
    end

    table.insert(strings, funnyString)
    
    return strings
end