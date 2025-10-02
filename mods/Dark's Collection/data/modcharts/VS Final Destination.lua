function createPost()

  
      local shaders = { 
      {"particles", "particlesnew", {transparency = 0.87, red = 1.5, blue = 3.5, green = 1}},
      {"pixel", "MosaicEffect", {strength = 50}},
      {"mirror", "BarrelBlurEffect", {zoom = 0, angle = -20, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"mirror2", "PincushNewEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"bars", "bars", {effect = 0.6,effect2 = 0, angle1 = 0 , angle2 = 0}},
      {"bump", "BarrelBlurEffect", {zoom = 1, angle = 0, x = 0, y = 0, barrel = 0, doChroma = true}},
      {"vignette", "VignetteEffect", {strength = 15, size = 0.35}},
      {"color", "ColorOverrideEffect", {red = 1.4 ,blue = 1.4 , green = 1.4}},
      {"ca", "ChromAbEffect", {strength = 0.003}},
      {"bloom", "BloomEffect", {contrast = 5 , brightness = -0.05,effect = 0, strength = 0}}
  }
      for _, shader in ipairs(shaders) do
          local name, effect, properties = shader[1], shader[2], shader[3]
          initShader(name, effect)
          setCameraShader('game', name)
  
          if name ~= "bump" and name ~= "fish" 
          and name ~= "titleeffect" and name ~= "mirror"
          and name ~= "bars" and name ~= "particles"
          and name ~= "ca" and name ~= "bloom"  then
              setCameraShader('hud', name)
          end 
          for prop, value in pairs(properties) do
              setShaderProperty(name, prop, value)
          end
      end
  end
function startSong()
    mirror(false,true,"","zoom",0,1,8,crochet,"cubeOut")
    mirror(false,true,"","angle",0,0,8,crochet,"cubeOut")
    tweenShader('bars','effect',0.1,crochet*0.008,'cubeOut')
    tweenShader('bloom','contrast',1,crochet*0.008,'cubeOut')
    tweenShader('pixel','strength',0,crochet*0.008,'cubeOut')
end
function bloomBurst(e, s, t, ease)
    setShaderProperty('bloom', 'effect', e)
    setShaderProperty('bloom', 'strength', s)
    tweenShaderProperty('bloom', 'effect', 0.0, crochet*0.001*t, ease)
    tweenShaderProperty('bloom', 'strength', 0.0, crochet*0.001*t, ease)
end
function mirror(set,tween,value,value2,valor,valor2,s,speed,ease)
    if set then
        setShaderProperty('mirror',value,valor)
    end
    if tween then
        tweenShaderProperty('mirror',value2,valor2, speed*0.001*s,ease)
    end
end
perlinX,perlinY,perlinZ,perlinSpeed,perlinXRange,perlinYRange,perlinZRange,time = 0,0,0,1.5,0.08,0.08,10,0
a,speed,angle = 0,2,5
sxm = false
function update(elapsed)
    time  = time + elapsed
    setShaderProperty("particles", "iTime", time)
    perlinX = perlinX + elapsed * math.random() * perlinSpeed
    perlinY = perlinY + elapsed * math.random() * perlinSpeed
    perlinZ = perlinZ + elapsed * math.random() * perlinSpeed
    local perlinNoiseX = (-0.5 + perlin(perlinX, 0, 0)) * perlinXRange
    local perlinNoiseY = (-0.5 + perlin(0, perlinY, 0)) * perlinYRange
    local perlinNoiseZ = (-0.5 + perlin(0, 0, perlinZ)) * perlinZRange
    setShaderProperty('mirror2', 'x', perlinNoiseX)
    setShaderProperty('mirror2', 'y', perlinNoiseY)
    setShaderProperty('mirror2', 'angle', perlinNoiseZ)
  
    if sxm then
        set("camFollow.x",500)
        set("camFollow.y",1200)
    end
end
function doShake(steps, freq)
    triggerEvent('screen shake', (stepCrochet*0.001*steps)..','..freq, (stepCrochet*0.001*steps)..','..freq)
end
swap = 1
function stepHit()
    if curStep == 104 then
        mirror(false,true,"","y",0,2,6,crochet,"cubeIn")
        mirror(false,true,"","barrel",0,-2,6,crochet,"cubeIn")
    elseif curStep == 116 then
    elseif curStep == 128 then
        flashCamera("hud","",1)
        setProperty('', 'cameraSpeed', 3)
        mirror(true,true,"barrel","barrel",-8,0,4,crochet,"cubeOut")
    end
    if curStep >= 128 and curStep < 1152 
    or curStep >= 1856 and curStep < 2624 then
        if curStep < 1856 then
            if curStep % 128 == 0 then
                sxm = true
            elseif curStep % 128 == 64 then
                sxm = false
            end
        end
         if curStep % 64 == 0 then
            set("defaultCamZoom", 0.7)
         elseif curStep % 64 == 16 then
            set("defaultCamZoom", 0.8)
         elseif curStep % 64 == 32 then
            set("defaultCamZoom", 0.6)
        elseif curStep % 64 == 48 then
            set("defaultCamZoom", 0.5)
         end
        if curStep % 16 == 4 then
            swap = swap * -1
            tweenShader("mirror2", "zoom", 0.87, crochet * 0.001, "cubeIn")
            mirror(false,true,"","x",0,0.1*swap,1,crochet,"cubeIn")
            mirror(false,true,"","y",0,-0.03,1,crochet,"cubeIn")
        elseif curStep % 16 == 8 then
            tweenShader("mirror2", "zoom", 1, crochet * 0.001, "cubeOut")
            mirror(false,true,"","x",0,0,1,crochet,"backOut")
            mirror(false,true,"","y",0,0,1,crochet,"backInOut")
        end
    end
    section = math.floor(curStep/16)
	local secStep = curStep % 16

   if curStep >= 1152 and curStep < 1408 or curStep >= 2624 and curStep < 2880 then
         
        if curStep % 128 == 0 then
            sxm = true
        elseif curStep % 128 == 64 then
            sxm = false
        end
         if curStep % 64 == 0 then
            set("defaultCamZoom", 0.7)
         elseif curStep % 64 == 16 then
            set("defaultCamZoom", 0.6)
         elseif curStep % 64 == 32 then
            set("defaultCamZoom", 0.8)
        elseif curStep % 64 == 48 then
            set("defaultCamZoom", 0.5)
         end
    end

    if secStep == 0 then 
        if section == 8 or section == 96 then 
            bloomBurst(2, 2, 4, 'cubeOut')
            doShake(2, 0.01)
            setAndEaseBackShader('ca', 'strength', 0.01, crochet*0.002, 'cubeOut')
          perlinXRange,perlinYRange,perlinZRange = 0.08,0.08,10
            perlinSpeed = 3.5

            
        elseif section == 56 or section == 148 then 
            bloomBurst(2, 2, 4, 'cubeOut')
            doShake(2, 0.01)
           
            setAndEaseBackShader('ca', 'strength', 0.01, crochet*0.002, 'cubeOut')
        elseif section == 70 or section == 162 or section == 210 then 
            tweenShaderProperty('mirror2', 'barrel', 3, stepCrochet*0.001*32, 'cubeIn')
            tweenShaderProperty('bloom', 'effect', 2, stepCrochet*0.001*32, 'cubeIn')
            tweenShaderProperty('bloom', 'strength', 2, stepCrochet*0.001*32, 'cubeIn')
        elseif section == 72 or section == 164 then 
            bloomBurst(2, 2, 4, 'cubeOut')
            doShake(2, 0.01)
            lol = true
            tweenShaderProperty('mirror2', 'barrel', 0.0, crochet*0.002, 'cubeOut')
            setAndEaseBackShader('ca', 'strength', 0.01, crochet*0.002, 'cubeOut')
         perlinXRange,perlinYRange,perlinZRange = 0.1,0.1,15
            perlinSpeed = 4.5  
        elseif section == 86 then
            tweenShaderProperty('mirror2', 'barrel', 6, stepCrochet*0.001*32, 'cubeIn')
        elseif section == 88 then 
            perlinSpeed = 1
           flashCamera("hud","",2)
           lol = false
           tweenShaderProperty('mirror2', 'barrel', 0, stepCrochet*0.001*16, 'cubeOut')
        elseif section == 178 then 
            tweenShaderProperty('mirror2', 'barrel', 6, stepCrochet*0.001*32, 'cubeIn')
            tweenStageColorSwap('hue', 0.04, stepCrochet*0.001*32, 'cubeIn')
           tweenShaderProperty('bloom', 'effect', 2, stepCrochet*0.001*32, 'cubeIn')
            tweenShaderProperty('bloom', 'strength', 2, stepCrochet*0.001*32, 'cubeIn')
        elseif section == 180 then 
            tweenShaderProperty('mirror2', 'barrel', 0.2, crochet*0.002, 'cubeOut')
          bloomBurst(2, 2, 4, 'cubeOut')
          doShake(2, 0.01)
            setAndEaseBackShader('ca', 'strength', 0.01, crochet*0.002, 'cubeOut')
          perlinXRange,perlinYRange,perlinZRange = 0.125,0.125,20
            perlinSpeed = 5.5
       
        elseif section == 212 then 
           flashCamera("hud","",1)
           bloomBurst(2, 2, 4, 'cubeOut')
           perlinXRange,perlinYRange,perlinZRange = 0.05,0.05,10
            tweenShaderProperty('mirror2', 'barrel', 0.0, crochet*0.002, 'cubeOut')
            perlinSpeed = 4
           
        end
           if curStep == 2868 then
        playCharacterAnimation('dadCharacter1', 'trans', true)
           elseif curStep == 3136 then
            sxm = false 
        
         end
    end 
end
function setAndEaseBackShader(mod, prop, set, time, ease)
	setShaderProperty(mod, prop, set)
	tweenShaderProperty(mod, prop, 0, time, ease)
end
lol = false
function playerTwoSing(data, time, type)
    if lol then
		FDGODMattTrail(data)
        FDGODShagTrail(data)
    end
end





local trailCount = 0
local trailLimit = 150
function FDGODMattTrail(data)
    destroySprite('trail'..trailCount)
    makeSpriteCopy('trail'..trailCount, 'dadCharacter1')
    tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*16, 'trailFinish')
    tweenScaleX('trail'..trailCount, 2, stepCrochet*0.001*16, 'cubeInOut', 'trailFinish')
    tweenScaleY('trail'..trailCount, 2, stepCrochet*0.001*16, 'cubeInOut')
    tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*16, 'trailFinish')
	--setActorShader('trail'..trailCount, 'colorShit')
    local angle = data*(math.pi/2)
    tweenActorProperty('trail'..trailCount, 'x', 150*math.sin(angle), stepCrochet*0.001*16, 'cubeIn')
    tweenActorProperty('trail'..trailCount, 'y', 150*math.cos(angle), stepCrochet*0.001*16, 'cubeIn')
    setActorLayer('trail'..trailCount, getActorLayer('dadCharacter1')-1)
    trailCount = trailCount + 1
    if trailCount >= trailLimit then 
        trailCount = 0
    end
end
function FDGODShagTrail(data)
    destroySprite('trail'..trailCount)
    makeSpriteCopy('trail'..trailCount, 'dadCharacter0')
    tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*16, 'trailFinish')
    tweenScaleX('trail'..trailCount, 2, stepCrochet*0.001*16, 'cubeInOut', 'trailFinish')
    tweenScaleY('trail'..trailCount, 2, stepCrochet*0.001*16, 'cubeInOut')
    tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*16, 'trailFinish')
	--setActorShader('trail'..trailCount, 'colorShit')
    local angle = data*(math.pi/2)
    tweenActorProperty('trail'..trailCount, 'x', 150*math.sin(angle), stepCrochet*0.001*16, 'cubeIn')
    tweenActorProperty('trail'..trailCount, 'y', 150*math.cos(angle), stepCrochet*0.001*16, 'cubeIn')
    setActorLayer('trail'..trailCount, getActorLayer('dadCharacter0')-1)
    trailCount = trailCount + 1
    if trailCount >= trailLimit then 
        trailCount = 0
    end
end