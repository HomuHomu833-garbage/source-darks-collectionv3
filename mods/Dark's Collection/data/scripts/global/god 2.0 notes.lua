local number = 0
local damage = 0.035
local kiblastmiss = 0
local crackalpha = 0
local stupidhealth = 1
local missmirror = 0
local dascroll = math.random(1,5)
function createPost()
  makeSprite('crack','crack',0,0)
  setObjectCamera("crack", "hud")
  set("crack.alpha", 0)
  initShader('mirrormiss', 'MirrorRepeatEffect')
  setCameraShader('hud', 'mirrormiss')
  setShaderProperty('mirrormiss', 'zoom', 1)
  createSound("blast","blast")
  createSound("slash1","slash1")
  createSound("slash2","slash2")
  createSound("burst","burst")
  createSound("powerup","powerup")
  createSound("punch1","punch1")
  createSound("punch2","punch2")
end
function start()
    poisonStrength = 20
    poison1 = 0
end
function playerOneMiss(data, songPos, type, strumTime, char)
    if type == 'default' then
        return
    end
  if type == 'kiblast' then
    kiblastmiss = kiblastmiss + 1
    ki = damage * kiblastmiss
    stupidhealth = stupidhealth - ki
    set("health", stupidhealth)
    playSound("blast",true)
  end
if type == 'aura' then
    if math.random(1,2) == 1 then
        playSound("burst",true)
        triggerEvent('Screen Shake','0.2,0.005','0.2,0.005')
    else
        playSound("powerup",true)
        triggerEvent('Screen Shake','0.2,0.005','0.2,0.005')
    end
    if math.random(1,2) == 1 then
        triggerEvent('camera flash', 'purple', '0.2')
    else
        triggerEvent('camera flash', 'pink', '0.2')
    end
end
    if type == 'New sword' then
        playSound("slash"..math.random(1,2),true)
        if math.random(1,2) == 1 then
            triggerEvent('camera flash', 'red', '0.2')
        else
            triggerEvent('camera flash', 'black', '0.2')
        end
    end
  if type == 'glove' then
    number = number + 1
    crackalpha = 0.1 * number * 2
    playSound("punch"..math.random(1,2),true)
  end
end
function playerOneSing(data, songPos, type, strumTime, char)
    if type == 'default' then
        return
    end
    if type == 'glove' then
        playSound("punch"..math.random(1,2),true)
        if math.random(1,2) == 1 then
            triggerEvent('camera flash', 'yellow', '0.2')
        else
            triggerEvent('camera flash', 'white', '0.2')
        end
    end
    if type == 'kiblast' then
        playSound("blast",true)
        if math.random(1,2) == 1 then
            triggerEvent('camera flash', 'cyan', '0.2')
        else
            triggerEvent('camera flash', 'white', '0.2')
        end
    end
    if type == 'aura' then
        triggerEvent('change scroll speed', tostring(dascroll), '0.5')
        if math.random(1,2) == 1 then
            playSound("burst",true)
            triggerEvent('Screen Shake','0.2,0.005','0.2,0.005')
        else
            playSound("powerup",true)
            triggerEvent('Screen Shake','0.2,0.005','0.2,0.005')
        end
        if math.random(1,2) == 1 then
            triggerEvent('camera flash', 'purple', '0.2')
        else
            triggerEvent('camera flash', 'pink', '0.2')
        end
    end
    if type == 'New sword' then
        missmirror = missmirror + 1
        setShaderProperty('mirrormiss', 'zoom', missmirror)
        playSound("slash"..math.random(1,2),true)
        if math.random(1,2) == 1 then
            triggerEvent('camera flash', 'red', '0.2')
        else
            triggerEvent('camera flash', 'black', '0.2')
        end
    end
end
function update()
	tween('crack',{alpha = crackalpha},0.1)
    if number == 20 or missmirror == 10 then
        setHealth(0)
    end
end
function stepHit(curStep)

	if crackalpha > 0 then
		crackalpha = crackalpha - 0.01
	end
	
	if ecrackalpha <= 0 then
		crackalpha = 0 
	end
end

