function playerTwoSing(data,time,type)
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.010)
    else
        setHealth(0.001)
    end
    triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
end
function playerTwoSingHeld()
    if getHealth() - 0.010 > 0 then
        setHealth(getHealth() - 0.010)
    else
        setHealth(0.001)
    end
    triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
end
function update(elapsed)
    setActorX(getActorX('iconP1'), 'Voiid BF Pico')
	setActorY(getActorY('iconP1'), 'Voiid BF Pico')
end
local dodgeAnim = 0
local dodgeMap = {
	{'singLEFT', 'dodgeLEFT'},
	{'singDOWN', 'dodgeDOWN'},
	{'singUP', 'dodgeUP'},
	{'singRIGHT', 'dodgeRIGHT'}
}
function playerOneSing(a,b,c,d)
    if c == "Sword VIP" or c == "Punch VIP" or c == "VC Bullet VIP" then
        dodgeAnim = dodgeAnim + 1
        local anim = dodgeAnim%4
        playCharacterAnimation('bfCharacter0', dodgeMap[anim+1][2], true)
        setCharacterPreventDanceForAnim('bfCharacter0', true)
    end
    if c == "Pico Bullet" then
        playCharacterAnimation('bfCharacter1', "shoot", true)
    end
    if c == "VC Bullet VIP" then
        playCharacterAnimation('dad', "shoot", true)
    end
end
function start (song)
    makeSprite('Voiid BF Pico', 'Voiid BF Pico', getActorX('iconP1'), getActorY('iconP1'), 1)
    setActorScroll(0, 0, 'Voiid BF Pico')
    setActorAlpha(0, 'Voiid BF Pico')
    setObjectCamera('Voiid BF Pico', "hud")


    tweenFadeIn("bfCharacter1", 0,0.00001)

    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")
    makeSprite("FINISH HIM!", "FINISH HIM!", -500, -500, 1)
    setObjectCamera("FINISH HIM!", "hud")
    setActorAlpha(1, "FINISH HIM!")
    makeSprite("BlackCamera", "BlackCamera", -500, -500, 10)
    setObjectCamera("BlackCamera", "camera")
    setActorAlpha(1, "BlackCamera")
    makeSprite('yellow','yellow',0,0,0.5)
    setObjectCamera('yellow','hud')
    setActorAlpha(0,'yellow')
    makeSprite("Rejected Vip Start", "Rejected Vip Start", -500, -500, 1)
    setObjectCamera("Rejected Vip Start", "hud")
    setActorAlpha(1, "Rejected Vip Start")
    makeSprite("BITRL VIP", "BITRL VIP", -500, -500, 1)
    setObjectCamera("BITRL VIP", "hud")
    setActorAlpha(1, "BITRL VIP")
end
function stepHit (step)
    if curStep == 4388 then
        tweenPosOut("BITRL VIP",300,170,0.65)
    end
    if curStep == 4415 then
        tweenPosOut("BITRL VIP",-725,-725,0.2)
    end
    if curStep == 4900 then
        tweenPosOut("BITRL VIP",300,170,0.65)
    end
    if curStep == 4927 then
        tweenPosOut("BITRL VIP",-725,-725,0.2)
    end
    if curStep == 255 then 
        tweenPosOut("Rejected Vip Start",0,0,0.5)
    end
    if curStep == 316 then 
        tweenPosOut("Rejected Vip Start",-725,-725,0.3)
    end
	if curStep == 1 then -- chao chao ratings
        setActorY(-1000000,"ratingsGroup")
	end
    if curStep == 1 then
        if not middlescroll then
            for i = 0,3 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.01,"linear")
                tweenActorProperty(i,"alpha",0,1,"linear")
            end
            for i = 4,7 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.3,"linear")
            end
        end
    end
    if curStep == 10574 then
        tweenPosOut("FINISH HIM!",300,170,0.2)
    end --          id de la imagen   x   y  tiempo
    if curStep == 10591 then
        tweenPosOut("FINISH HIM!",-5000,-5000,0.1)
    end --          id de la imagen   x   y  tiempo
    if curStep == 1 then
        tweenFadeOut("iconP1",1,0.01,"")
        tweenFadeIn("Voiid BF Pico",0,0.01,"")
        tweenFadeOut("BlackCamera",0,0.01,"")
    end
    if curStep == 2303 then
        tweenFadeOut("Voiid BF Pico",0,0.01,"")
    end
    if curStep == 2563 then
        tweenFadeIn("Voiid BF Pico",0,0.01,"")
        tweenFadeOut("iconP1",1,0.01,"")
    end
	if curStep == 64 then
		tweenFadeOut("BlackBox",0,9,"")
	end
    if curStep == 1534 then
        tweenFadeIn("yellow",0.5,0.2,"")
    end
    if curStep == 2047 then
        tweenFadeOut("yellow",0,0.1,"")
    end
    if curStep == 2592 then
        tweenFadeIn("yellow",0.5,0.1,"")
    end
    if curStep == 3104 then
        tweenFadeOut("yellow",0,0.1,"")
    end
    if curStep == 5183 then
        tweenFadeIn("yellow",0.5,0.1,"")
    end
    if curStep == 5695 then
        tweenFadeOut("yellow",0,0.1,"")
    end
    if curStep == 7999 then
        tweenFadeIn("yellow",0.5,0.2,"")
    end
    if curStep == 8511 then
        tweenFadeOut("yellow",0,0.1,"")
    end
    if curStep == 9023 then
        tweenFadeIn("BlackCamera",1,0.01,"")
    end
    if curStep == 9055 then
        tweenFadeOut("BlackCamera",0,0.01,"")
    end
    if curStep == 9055 then
        tweenFadeIn("yellow",0.5,0.2,"")
    end
    if curStep == 9567 then
        tweenFadeOut("yellow",0,0.1,"")
    end
    if curStep == 9823 then
        tweenFadeIn("bfCharacter1", 1,0.01)
        tweenFadeOut("Voiid BF Pico",1,0.01,"")
        setActorAlpha(0,"iconP1")
    end
    if curStep == 10335 then
        tweenFadeOut("bfCharacter1", 0,0.01)
        tweenFadeOut("iconP1",1,0.01,"")
        tweenFadeIn("Voiid BF Pico",0,0.01,"")
    end
    if curStep == 10847 then
        tweenFadeIn("yellow",0.5,0.2,"")
    end
    if curStep == 11359 then
        tweenFadeIn("BlackCamera",1,0.01,"")
    end
    if curStep == 11359 then 
        tweenFadeIn("BlackBox",1,2,"")
    end
end if curStep % 64 == 0 then
    setShaderProperty('barrel', 'angle', 15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 6 then
    setShaderProperty('barrel', 'angle', -15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 12 then
    setShaderProperty('barrel', 'angle', 15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 16 then
    setShaderProperty('barrel', 'angle', -15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 22 then
    setShaderProperty('barrel', 'angle', 15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 28 then
    setShaderProperty('barrel', 'angle', -15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 32 then
    setShaderProperty('barrel', 'angle', 15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
elseif curStep % 64 == 40 then
    setShaderProperty('barrel', 'angle', -15)
    tweenShaderProperty('barrel', 'angle', 0, stepCrochet*0.001*4, 'cubeOut')
    setShaderProperty('blur', 'strength', 5)
    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*4,"cubeOut")
end
end
setShaderProperty("barrel","y",-2)
        tweenShaderProperty('barrel', 'y', 0, crochet*0.001*2, 'cubeInOut')
        setShaderProperty("betterblurGame","strength",0)


        beatSwap = beatSwap * -1
	        setShaderProperty('barrelGame', 'angle',20*beatSwap)
            tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
			tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
			setShaderProperty('blur', 'strength', 9)
            tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
            
            
            
            
            
            
            
            
            if (curStep >= 1760 and curStep < 1824) then
                if curStep % 64 == 0 then
                    beatSwap = beatSwap * -1
                    setShaderProperty('barrelGame', 'angle',20*beatSwap)
                    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
                    tweenShaderProperty('barrelGame', 'zoom', 0.7, crochet*0.001*2, 'cubeOut')
                    setShaderProperty('blur', 'strength', 9)
                    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
                elseif curStep % 64 == 16 then
                    beatSwap = beatSwap * -1
                    setShaderProperty('barrelGame', 'angle',20*beatSwap)
                    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
                    tweenShaderProperty('barrelGame', 'zoom', 0.6, crochet*0.001*2, 'cubeOut')
                    setShaderProperty('blur', 'strength', 9)
                    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
                elseif curStep % 64 == 32 then
                    beatSwap = beatSwap * -1
                    setShaderProperty('barrelGame', 'angle',20*beatSwap)
                    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
                    tweenShaderProperty('barrelGame', 'zoom', 0.5, crochet*0.001*2, 'cubeOut')
                    setShaderProperty('blur', 'strength', 9)
                    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
                elseif curStep % 64 == 48 then
                    beatSwap = beatSwap * -1
                    setShaderProperty('barrelGame', 'angle',20*beatSwap)
                    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
                    tweenShaderProperty('barrelGame', 'zoom', 0.4, crochet*0.001*2, 'cubeOut')
                    setShaderProperty('blur', 'strength', 9)
                    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
                elseif curStep % 64 == 56 then
                    beatSwap = beatSwap * -1
                    setShaderProperty('barrelGame', 'angle',20*beatSwap)
                    tweenShaderProperty('barrelGame', 'angle', 0, crochet*0.001*2, 'cubeOut')
                    tweenShaderProperty('barrelGame', 'zoom', 1, crochet*0.001*2, 'cubeOut')
                    setShaderProperty('blur', 'strength', 9)
                    tweenShaderProperty('blur', 'strength', 0,stepCrochet*0.001*8,"cubeOut")
                end
            end