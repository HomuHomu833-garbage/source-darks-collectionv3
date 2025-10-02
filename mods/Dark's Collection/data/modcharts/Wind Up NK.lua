flash = {320,576,832,960,1088,1344,1504,1536}
function createPost()
    
    
    initShader('color', 'ColorOverrideEffect')
    setCameraShader('game', 'color')
    setCameraShader('hud', 'color')
    setShaderProperty('color', 'red', 1)
    setShaderProperty('color', 'green',1)
    setShaderProperty('color', 'blue', 1)

    
    initShader('Pincush', 'PincushNewEffect')
    setCameraShader('game', 'Pincush')
    setCameraShader('hud', 'Pincush')
    setShaderProperty('Pincush', 'zoom',1)
    setShaderProperty('Pincush', 'angle', 0)
    setShaderProperty('Pincush', 'x', 0)
    setShaderProperty('Pincush', 'y', 0)
    setShaderProperty('Pincush', 'barrel',0)
    setShaderProperty('Pincush', 'doChroma', true)

    initShader('pincushgame', 'PincushNewEffect')
    setCameraShader('game', 'pincushgame')
    setShaderProperty('pincushgame', 'zoom',1)
    setShaderProperty('pincushgame', 'angle', 0)
    setShaderProperty('pincushgame', 'x', 0)
    setShaderProperty('pincushgame', 'y', 0)
    setShaderProperty('pincushgame', 'barrel', -2)
    setShaderProperty('pincushgame', 'doChroma', true)

    initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)

    makeSprite('topBar', 'topBar', 0, -440, 3)
    setObjectCamera('topBar', 'hud')
    setActorLayer('topBar', layershit)
    setActorAlpha(1, "topBar")
    setActorProperty('topBar', 'angle',-90)
    setActorProperty('topBar', 'x',300)

    makeSprite('bottomBar', 'bottomBar', 0, -1120, 3)
    setActorLayer('bottomBar', layershit)
    setObjectCamera('bottomBar', 'hud')
    setActorAlpha(1, "bottomBar")
    setActorProperty('bottomBar', 'angle',90)
    setActorProperty('bottomBar', 'x',-1080)
    if not middlescroll then
        for i = 0,7 do
            if (i >= 0 and i <= 3) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]+50)
            elseif (i >= 4 and i <= 7) then
                setActorProperty(i,"x",_G["defaultStrum"..i.."X"]-50)
            end
        end
    end
    


end

function bloomBurst(valor,valor2,steps)
    setShaderProperty('bloom', 'contrast',valor)
    tweenShaderProperty('bloom', 'contrast', valor2, crochet*0.001*steps, 'cubeOut')
end


function stepHit()

    for i = 1, #flash do
        if curStep == flash [i]-1 then
            flashCamera('game', 'black', 0.6)
        end
    end

    if curStep == 58 then
        setShaderProperty('pincushgame', 'y', -2)
        tweenShaderProperty('pincushgame', 'y', 0, stepCrochet*0.001*8, 'cubeIn')
    end
    if curStep == 64 or curStep == 704 or curStep == 1472 then
        tweenShaderProperty('color', 'red', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'green', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'blue', 4, stepCrochet*0.001*4, 'cubeOut')
        flashCamera('game', 'black', 0.6)
    elseif curStep == 448 or curStep == 1216 then
        tweenShaderProperty('color', 'red', 8, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'green', 1, stepCrochet*0.001*4, 'cubeOut')
        tweenShaderProperty('color', 'blue', 1, stepCrochet*0.001*4, 'cubeOut')
        flashCamera('game', 'black', 0.6)
    end

    
    
    if curStep >= 0 and curStep < 96 or curStep >= 320 and curStep < 448 or curStep >= 1088 and curStep < 1216 or curStep >= 1472 and curStep < 1504 or curStep >= 1728 and curStep < 1760 then
        if curStep % 16 == 0 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        elseif curStep % 16 == 8 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
        end
    end


    if curStep >= 96 and curStep < 320 or curStep >= 704 and curStep < 1088 or curStep >= 1504 and curStep < 1728 then
        if curStep % 16 == 0 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 4 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 8 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 12 then
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        end
    end


    if curStep >= 448 and curStep < 568 or curStep >= 576 and curStep < 696 or curStep >= 1216 and curStep < 1336 or curStep >= 1344 and curStep < 1464 then
        if curStep % 16 == 0 then
            setShaderProperty('pincushgame', 'angle', -15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'x', -0.07)
            tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 4 then
            setShaderProperty('pincushgame', 'angle', 15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'x', 0.07)
            tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 8 then
            setShaderProperty('pincushgame', 'angle', -15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'x', -0.07)
            tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        elseif curStep % 16 == 12 then
            setShaderProperty('pincushgame', 'angle', 15)
            tweenShaderProperty('pincushgame', 'angle', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'x', 0.07)
            tweenShaderProperty('pincushgame', 'x', 0, stepCrochet*0.001*4, 'linear')
            setShaderProperty('pincushgame', 'zoom', 0.8)
            tweenShaderProperty('pincushgame', 'zoom', 1, stepCrochet*0.001*4, 'cubeOut')
        end
    end
end
