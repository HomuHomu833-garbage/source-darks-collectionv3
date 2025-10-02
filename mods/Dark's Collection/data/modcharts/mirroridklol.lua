function createPost()
    initShader('mirror', 'PincushNewEffect')-- -- mirror = name shader in lua  pincushneweffect is shader in shaders folder
    setCameraShader('game', 'mirror')--camera
    setShaderProperty('mirror', 'zoom', 1)
    setShaderProperty('mirror', 'angle', 0)
	setShaderProperty('mirror', 'x', 0)
    setShaderProperty('mirror', 'y', 0)
	setShaderProperty('mirror', 'barrel', 0)
    setShaderProperty('mirror', 'doChroma', true)
end
function stepHit()
    if curStep == 128 then -- 128 is the number in chart editor curstep
        tweenShaderProperty('mirror', 'zoom', 2, crochet*0.001*4, 'cubeOut')        --mirror is name shader , zoom is property i thik , 2 is value , crochet is 4 steps i mean crochet 1 is like stepcrochet 4 and cubeout is the ease
    elseif curStep == 256 then
        tweenShaderProperty('mirror', 'zoom', 1, crochet*0.001*4, 'cubeOut') -- elseif is sequence 
    end
end