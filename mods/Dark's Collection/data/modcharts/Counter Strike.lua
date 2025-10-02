function start (song)

	print(song)
    
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")

end

function createPost()

	    initShader('mirrorGame', 'MirrorRepeatEffect') --blur
	    setCameraShader('game', 'mirrorGame')
	    setShaderProperty('mirrorGame', 'zoom', 1)
	    setShaderProperty('mirrorGame','x',0)
	    setShaderProperty('mirrorGame','y',0)
	    setShaderProperty('mirrorGame','angle', 0)
	    initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
		setCameraShader('game', 'MirrorRepeatEffect')
		setCameraShader('hud', 'MirrorRepeatEffect')
		setShaderProperty('MirrorRepeatEffect', 'zoom', 2.5)
		setShaderProperty('MirrorRepeatEffect','x',0)
		setShaderProperty('MirrorRepeatEffect','y',0)
		setShaderProperty('MirrorRepeatEffect','angle', 180)
		setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
		setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
		initShader('vignette', 'VignetteEffect')
        setCameraShader('hud', 'vignette')
        setCameraShader('game', 'vignette')
        setShaderProperty('vignette', 'strength', 8)
        setShaderProperty('vignette', 'size', 0.4)
		
end

function stepHit( step )
	if curStep == 32 then
        tweenFadeOut("BlackBox",0,5,"")
	end
	if curStep == 1 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*115, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*115, 'cubeIn')
	elseif curStep == 470 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*11, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*11, 'cubeIn')
	elseif curStep == 512 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
    if curStep == 726 or curStep == 1495 or curStep == 2518 or curStep == 3286 or curStep == 3542 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*11, 'cubeOut')
      	tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*11, 'cubeIn')
    elseif curStep == 768 or curStep == 1024 or curStep == 1536 or curStep == 2560 or curStep == 2816 or curStep == 3328 or curStep == 3584 then
	   setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	   tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	   tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 2009 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*11, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*11, 'cubeIn')
	elseif curStep == 2264 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', 8)
	   tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*11, 'cubeOut')
	elseif curStep == 2304 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	   tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	   tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end

end


function playerOneSing()
    if c == "caution" then -- nombre de la nota
        triggerEvent("ca burst","0.008","0.015")
    end
end
