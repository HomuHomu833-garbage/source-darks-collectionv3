local time = 0

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('RainEffect', 'iTime', time)
    
end

function createPost()
    initShader('RainEffect', 'RainEffect')
    setCameraShader('game', 'RainEffect')
end