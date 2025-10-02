local time = 0
function createPost()

    initShader('titleeffect', 'titleeffect') 
    setCameraShader("game","titleeffect")
    setShaderProperty('titleeffect', 'money', 0)

end
function update(elapsed)
    time = time + elapsed
    --setCustomShaderFloat('titleeffect', 'uTime', time)
end
function songStart()
    tweenShaderProperty("titleeffect","money",0.1,crochet*0.001*16,"cubeOut")
end
