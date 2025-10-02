local ghostTappingEnabled = true  -- Activar ghost tapping automáticamente
local ghostTapCount = 0  -- Contador de ghost taps
local time = 0
function createPost()
    initShader('nebula', 'particles')
    setCameraShader('game', 'nebula')
    setShaderProperty("nebula","fade",0.5)
end
function update(elapsed)
    time = time + (elapsed*2)
    setCustomShaderFloat('nebula', 'iTime', time)
end