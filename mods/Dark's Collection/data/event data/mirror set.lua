function createPost()
    createCustomShader('mirror', 'mirror')
    setCameraCustomShader('mirror', 'game')
    makeSprite('zoomstufflol', '', 0, 0)
    makeGraphic('zoomstufflol',1,1,'#000000')
    setProperty("zoomstufflol", 'width', 1)
    setActorAlpha(0,'zoomstufflol')
end
function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "mirror set" then
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