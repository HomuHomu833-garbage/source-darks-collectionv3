local window = 0
local a = 0

local start_Rock_Num = 2
local end_Rock_Num = 12

local rock_Stuff = {
	0
}

function start (song)

	print(song)
    
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")
	makeSprite("here it goes", "here it goes", -500, -500, 1)
    setObjectCamera("here it goes", "hud")
    setActorAlpha(2, "here it goes")
	makeSprite("ultra instinct", "ultra instinct", -500, -500, 1)
    setObjectCamera("ultra instinct", "hud")
    setActorAlpha(3, "ultra instinct")
    makeSprite("leave it to me", "leave it to me", -500, -500, 1)
    setObjectCamera("leave it to me", "hud")
    setActorAlpha(3, "leave it to me")

	window = 240

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)

		table.insert(rock_Stuff, getActorY(actor_Name))
	end
end

function update(elapsed)

	a = a + (elapsed * 1.5)
	
	setActorPos(-750 + ((math.cos(a) * 2) * window), 700 + (math.sin(2 * a) * window), "dad")

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)
	end
end

function playerTwoSing(data, time, type)

    if getHealth() - 0.025 > 0 then
        setHealth(getHealth() - 0.009)
    else
        setHealth(0.015)
    end
    
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
		setShaderProperty('MirrorRepeatEffect', 'zoom', 2)
		setShaderProperty('MirrorRepeatEffect','x',0)
		setShaderProperty('MirrorRepeatEffect','y',0)
		setShaderProperty('MirrorRepeatEffect','angle', 20)
		setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
		setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
		initShader('vignette', 'VignetteEffect')
        setCameraShader('hud', 'vignette')
        setCameraShader('game', 'vignette')
        setShaderProperty('vignette', 'strength', 8)
        setShaderProperty('vignette', 'size', 0.5)
		initShader('chroma', 'ChromAbEffect')
        setCameraShader('game', 'chroma')
        setCameraShader('hud', 'chroma')
        setCustomShaderFloat('chroma', 'strength', 0)
		initShader('BloomEffect', 'BloomEffect')
		setCameraShader('game', 'BloomEffect')
		setCameraShader('hud', 'BloomEffect')
		setShaderProperty("BloomEffect","contrast", 1)
		initShader("grayscale","GreyscaleEffect")
	    setCameraShader('game', 'grayscale')
	    setCameraShader('hud', 'grayscale')
	    setShaderProperty("grayscale","strength", 0.5)
		initShader('ScanlineEffect', 'ScanlineEffect')
        setCameraShader('game', 'ScanlineEffect')
        setShaderProperty('ScanlineEffect', 'strength', 0)
        setShaderProperty('ScanlineEffect', 'pixelsBetweenEachLine', 10)
		initShader('MosaicEffect', 'MosaicEffect')
		setCameraShader('hud', 'MosaicEffect')
        setCameraShader('game', 'MosaicEffect')
		setShaderProperty("MosaicEffect","strength",7)
		initShader('barrel', 'BarrelBlurEffect')
	    setCameraShader('game', 'barrel')
	    setCameraShader('hud', 'barrel')
	    setShaderProperty('barrel', 'barrel', 0.0)
	    setShaderProperty('barrel', 'zoom', 1.0)
	    setShaderProperty('barrel', 'doChroma', true)
end

function bloomBurst()
    setShaderProperty('BloomEffect', 'effect', 0.5)
    setShaderProperty('BloomEffect', 'strength', 1)
    tweenShaderProperty('BloomEffect', 'effect', 0, stepCrochet*0.001*12, 'cubeOut')
    tweenShaderProperty('BloomEffect', 'strength', 0, stepCrochet*0.001*12, 'cubeOut')
end

function stepHit( step )
	if curStep == 1376 then
        tweenFadeIn("wea del borde voiid",1,0.8) -- empieza el drop
        if not middlescroll then
            for i = 1,9 do 
                for i = 1,9 do
                    tweenPosOut(i-1,getActorX(i-1)+330,getActorY(i-1),0.85)
                end
            end
            for i = 9,17 do
                tweenFadeOut(i,0,0.85)
            end
        end
    end
    if curStep == 1400 then --empieza bf
        if not middlescroll then
            tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.3)
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)-300,getActorY(i-1),0.85)
                    tweenFadeIn(i-1,1,0.85)
                end
            end
            for i= 1,9 do
                for i = 1,9 do
                    tweenFadeOut(i-1,0,0.85)
                end
            end
        end
    end
    if curStep == 1440 then --le toca a sxm repitiendose
        if not middlescroll then
            for i = 10,18 do
                for i = 10,18 do
                    tweenFadeOut(i-1,0,0.4)
                end
            end
            for i= 1,9 do
                for i = 1,9 do
                    tweenFadeIn(i-1,1,0.3)
                end
            end
        end
    end
    if curStep == 1467 then --le toca a bf repitiendose
        if not middlescroll then
            for i = 10,18 do
                for i = 10,18 do
                    tweenFadeIn(i-1,1,0.3)
                end
            end
            for i= 1,9 do
                for i = 1,9 do
                    tweenFadeOut(i-1,0,0.5)
                end
            end
        end
    end
    if curStep == 1504 then -- termina el drop
        if not middlescroll then
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)+300,getActorY(i-1),0.85)
                end
            end
            for i = 0,9 do
                for i = 0,9 do
                    tweenPosOut(i-1,getActorX(i-1)-330,getActorY(i-1),0.85)
                end
            end
            for i = 0,8 do
                tweenFadeIn(i,1,0.85)
            end
        end
    end
	if curStep == 64 then
        tweenPosOut("here it goes",250,140,0.3)
    end --          id de la imagen   x   y  tiempo
    if curStep == 78 then
        tweenPosOut("here it goes",250,650,1)
    end --          id de la imagen   x   y  tiempo
	if curStep == 80 then
        tweenPosOut("ultra instinct",250,140,0.3)
    end --          id de la imagen   x   y  tiempo
    if curStep == 94 then
        tweenPosOut("ultra instinct",250,-650,1)
    end --          id de la imagen   x   y  tiempo
	if curStep == 1547 then
        tweenPosOut("leave it to me",250,180,0.3)
    end --          id de la imagen   x   y  tiempo
    if curStep == 1557 then
        tweenPosOut("leave it to me",1350,180,1)
    end --          id de la imagen 9 x   y  tiempo
	if curStep == 1402 then
		tweenPosOut("ratingsGroup",-400,getActorY("ratingsGroup"),1)
	end
	if curStep == 1542 then
		tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),1)
	end
	if curStep == 128 or curStep == 256 or curStep == 288 or curStep == 320 or curStep == 352 or curStep == 384 or curStep == 416 or curStep == 448 or curStep == 480 or curStep == 512 then
        bloomBurst()
    end
	if curStep == 6 then
        tweenFadeOut("BlackBox",0,5,"")
		tweenShaderProperty('MosaicEffect', 'strength', 0, crochet*0.001*70, 'cubeOut')
	end
	if curStep == 1 then
        tweenFadeOut('iconP1',0.5,0.1)
        tweenFadeOut('iconP2',0.5,0.1)
        tweenFadeOut('healthBar',0.5,0.1)
    end
    if curStep == 96 then
        tweenFadeIn('iconP1',0,0.1)
        tweenFadeIn('iconP2',0,0.1)
        tweenFadeIn('healthBar',0,0.1)
    end
	if curStep == 1 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*20, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*20, 'cubeOut')
	end
    if curStep == 64 then 
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, crochet*0.001*8, 'cubeIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 10, crochet*0.001*8, 'cubeIn')
    elseif curStep == 96 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
	if curStep == 96 then
		tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*2, 'cubeIn')
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeOut")
		tweenShaderProperty('ScanlineEffect', 'strength', 1, crochet*0.001*4, 'cubeOut')
	end 
	if curStep == 184 or curStep == 216 or curStep == 256 or curStep == 272 or curStep == 322 or curStep == 344 or curStep == 385 or curStep == 408 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 189 or curStep == 221 or curStep == 264 or curStep == 280 or curStep == 326 or curStep == 347 or curStep == 390 or curStep == 412 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 194 or curStep == 224 or curStep == 300 or curStep == 332 or curStep == 356 or curStep == 396 or curStep == 414 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 224 then
	tweenShaderProperty("grayscale", "strength", 0.4, stepCrochet*0.001*4, "cubeIn")
	end
	if curStep == 224 then
	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
	tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*4, 'cubeIn')
    elseif curStep == 415 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
    end 
	if curStep == 287 then
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty("grayscale", "strength", 0.2, stepCrochet*0.001*4, "cubeIn")
	end
	if curStep == 352 then
		tweenShaderProperty("BloomEffect","contrast", 1,stepCrochet*0.001*2,"cubeIn")
	end 
	if curStep == 415 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*10, "cubeIn")
	end 
	if curStep == 425 then
		tweenShaderProperty("mirrorGame", "zoom", 3, stepCrochet*0.001*60, "cubeIn")
	end 
	if curStep == 479 then
		tweenShaderProperty('chroma', 'strength', 0.005, stepCrochet*0.001*2, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'angle', -360, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty("grayscale", "strength", 0.2, stepCrochet*0.001*10, "cubeIn")
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 529 or curStep == 592 then
		tweenShaderProperty("mirrorGame", "zoom", 3, stepCrochet*0.001*12, "backOut")
	elseif curStep == 544 or curStep == 607 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end 
	if curStep == 625 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 640 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 656 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', -360, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 672 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 754 then 
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*10, 'backOut')
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*10, 'cubeIn')
	elseif curStep == 832 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeIn')
	end
	if curStep == 804 then
		tweenShaderProperty('vignette', 'size', 0.3, stepCrochet*0.001*2, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 2, crochet*0.001*4, 'cubeIn')
    elseif curStep == 940 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 824 or curStep == 838 or curStep == 860 or curStep == 888 or curStep == 916 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 834 or curStep == 856 or curStep == 896 or curStep == 912 or curStep == 920 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 848 or curStep == 864 or curStep == 902 or curStep == 928 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 992 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*4, "cubeIn")
	elseif curStep == 1000 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1056 then
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeIn")
		tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*2, 'cubeIn')
	end
	if curStep == 935 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', -360, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 961 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1040 then 
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*4, 'backOut')
		tweenShaderProperty('mirrorGame', 'angle', 360, crochet*0.001*2, 'cubeIn')
	elseif curStep == 1056 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1072 then 
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*10, 'cubeOut')
	end
	if curStep == 1142 then 
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*8, 'cubeOut')
	end
	if curStep == 1152 then 
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*10, 'cubeOut')
	end
	if curStep == 1176 then 
		tweenShaderProperty('mirrorGame', 'angle', 360, crochet*0.001*8, 'cubeOut')
	elseif curStep == 1190 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1248 then 
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*20, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'angle', 0, crochet*0.001*20, 'cubeIn')
	elseif curStep == 1376 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1376 then
		tweenShaderProperty('vignette', 'size', 0.3, stepCrochet*0.001*2, 'cubeIn')
		tweenShaderProperty("grayscale", "strength", 0.3, stepCrochet*0.001*4, "cubeIn")
	end
	if curStep == 1380 or curStep == 1440 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'x', 1.5, crochet*0.001*4, 'cubeOut')
	end
    if curStep == 1408 or curStep == 1472 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'x', 2.5, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 1504 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('mirrorGame', 'x', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 1380 then
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*4, 'backOut')
	elseif curStep == 1568 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'cubeIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1528 or curStep == 1560 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1533 or curStep == 1565 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1538 or curStep == 1570 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1568 then
		tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*2, 'cubeIn')
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeIn")
	end
	if curStep == 1600 or curStep == 1616 or curStep == 1727 or curStep == 1752 or curStep == 2168 or curStep == 2220 or curStep == 2242 or curStep == 2264 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1608 or curStep == 1624 or curStep == 1732 or curStep == 1757 or curStep == 2178 or curStep == 2225 or curStep == 2247 or curStep == 2269 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 10, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1632 or curStep == 1737 or curStep == 1762 or curStep == 2182 or curStep == 2230 or curStep == 2252 or curStep == 2274 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, crochet*0.001*1, 'cubeOut')
	end
	if curStep == 1640 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2.5, crochet*0.001*12, 'backOut')
	elseif curStep == 1696 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1760 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*4, "cubeIn")
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*14, 'cubeOut')
	end
	if curStep == 1824 then
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeIn")
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'backIn')
		tweenShaderProperty('chroma', 'strength', 0.004, stepCrochet*0.001*2, 'cubeOut')
	end
	if curStep == 1840 or curStep == 1904 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', -360, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 1856 or curStep == 1920 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1872 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 1888 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 1951 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*4, 'cubeIn')
	elseif curStep == 2016 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2016 then
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 2080 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*60, 'cubeIn')
    elseif curStep == 2144 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, 'cubeIn')
	end
	if curStep == 2288 or curStep == 2416 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', -360, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 2304 or curStep == 2432 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2320 or curStep == 2448 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, stepCrochet*0.001*18, 'backOut')
        tweenShaderProperty('mirrorGame', 'angle', 0, stepCrochet*0.001*20, 'cubeIn')
	elseif curStep == 2336 or curStep == 2464 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2368 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*5, 'backIn')
	elseif curStep == 2400 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*4, 'backIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2496 then
		tweenShaderProperty('mirrorGame', 'zoom', 3, crochet*0.001*10, 'cubeOut')
	end
	if curStep == 2520 then 
		tweenShaderProperty('mirrorGame', 'angle', 360, crochet*0.001*8, 'cubeOut')
	elseif curStep == 2528 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*3, 'backIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2592 then 
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*8, 'cubeIn')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*8, 'cubeIn')
    elseif curStep == 2736 then
	    setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
    end
	if curStep == 2656 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*30, "cubeIn")
		tweenShaderProperty('MosaicEffect', 'strength', 12, crochet*0.001*70, 'cubeOut')
		tweenShaderProperty('ScanlineEffect', 'strength', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 2740 then
        tweenFadeIn("BlackBox",1,0.5,"")
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*2, "cubeIn")
	end
end

print("Mod Chart script loaded :)")