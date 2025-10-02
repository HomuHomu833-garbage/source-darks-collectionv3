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
    setActorAlpha(100, "BlackBox")
    makeSprite("blue","blue",0,0,0.5)
    setObjectCamera("blue","hud")
    setActorAlpha(0,"blue")
    makeSprite("lineas", "lineas", 0, 0, 1)
    setObjectCamera("lineas", "hud")
    setActorAlpha(0, "lineas")

	window = 240

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)

		table.insert(rock_Stuff, getActorY(actor_Name))
	end
end

function update(elapsed)
	a = a + (elapsed * 1.5)
	
	setActorPos(-600 + ((math.cos(a) * 2) * window), -2650 + (math.sin(2 * a) * window), "dad")

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)
		
		setActorPos(getActorX(actor_Name), rock_Stuff[i] + (math.sin(2 * (a + i)) * 80), actor_Name)
	end

	setActorPos(getActorX('boyfriend') - 200, getActorY('boyfriend') + 200, "bf_rock")
	setActorPos(getActorX('girlfriend') - 10, getActorY('girlfriend') + 575, "gf_rock")
end

function createPost()

initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')

	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
    setShaderProperty('MirrorRepeatEffect','x',0)
    setShaderProperty('MirrorRepeatEffect','y',0)
    setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.008 > 0.09 then
        setHealth(getHealth() - 0.008)
    else
        setHealth(0.035)
    end
end

function stepHit( step )
      if curStep == 1430 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 3, stepCrochet*0.001*12, 'cubeIn')
         end
      if curStep == 1445 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*12, 'cubeIn')
         end
      if curStep == 672 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*9, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*15, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'x', 4, stepCrochet*0.001*15, 'cubeIn')
         end
      if curStep == 368 or curStep == 527 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*9, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*15, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'x', 1.5, stepCrochet*0.001*15, 'cubeIn')
	 elseif curStep == 378 or curStep == 548 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.5, stepCrochet*0.001*9, 'cubeOut')
	        tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*14, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'x', 2.5, stepCrochet*0.001*15, 'cubeIn')
         end
      if curStep == 406 or curStep == 568 or curStep == 1311 or curStep == 1474 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*12, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*16, 'cubeOut')
         elseif curStep == 1184 or curStep == 2240 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 6, stepCrochet*0.001*40, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*40, 'cubeOut')
         end
      if curStep == 1216 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*20, 'cubeOut')
         end
      if curStep == 1055 or curStep == 1120 or curStep == 2048 or curStep == 2176 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*10, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 20, stepCrochet*0.001*12, 'cubeOut')
         elseif curStep == 1088 or curStep == 1151 or curStep == 2080 or curStep == 2208 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*10, 'cubeIn')
	        tweenShaderProperty('MirrorRepeatEffect', 'angle', -10, stepCrochet*0.001*12, 'cubeIn')
         end
      if curStep == 1984 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*9, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*5, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'x', -1.5, stepCrochet*0.001*9, 'cubeIn')
         end
      if curStep == 2016 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*9, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*5, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'x', -1.5, stepCrochet*0.001*9, 'cubeIn')
                tweenShaderProperty('MirrorRepeatEffect', 'y', 2, stepCrochet*0.001*7, 'cubeIn')
         end
      if curStep == 2112 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*6, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*5, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'x', -2.5, stepCrochet*0.001*9, 'cubeIn')
         end
      if curStep == 2145 then 
         	tweenShaderProperty('MirrorRepeatEffect', 'zoom', 2, stepCrochet*0.001*6, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'angle', 0, stepCrochet*0.001*5, 'cubeOut')
                tweenShaderProperty('MirrorRepeatEffect', 'x', -2.5, stepCrochet*0.001*9, 'cubeIn')
         end

     if curStep == 112 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*4, 'cubeIn')
	elseif curStep == 128 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
     if curStep == 912 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*4, 'cubeIn')
	elseif curStep == 928 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
     if curStep == 1584 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*4, 'cubeIn')
	elseif curStep == 1599 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
     if curStep == 1967 then 
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, crochet*0.001*4, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 8, crochet*0.001*4, 'cubeIn')
	elseif curStep == 1983 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end

    if curStep == 1 then
        tweenFadeOut("lineas",0,7,"")
    end
    if curStep == 124 then
        tweenFadeIn("lineas",0,10,"")
    end
    if curStep == 927 then
        tweenFadeOut("lineas",0,0.1,"")
    end
    if curStep == 1373 then
        tweenFadeIn("lineas",0,10,"")
    end
    if curStep == 928 then
        tweenFadeIn("blue",0.5,0.2,"")
    end
    if curStep == 1184 then
        tweenFadeOut("blue",0,0.1,"")
    end

    if curStep == 1984 then
        tweenFadeIn("blue",0.5,0.2,"")
    end
    if curStep == 2239 then
        tweenFadeOut("blue",0,0.1,"")
    end
    if curStep == 1 then
        tweenFadeOut("BlackBox",0,7,"")
    end
     if curStep == 2257 then 
        tweenFadeIn("BlackBox",3,2,"")
     end
	if curStep == 1 then -- chao chao ratings
        setActorY(-1000000,"ratingsGroup")
	end
end


print("Mod Chart script loaded :)")