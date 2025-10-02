local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1

function createPost()

    initShader('xd', 'BarrelBlurEffect')-- the saders
    setCameraShader('game', 'xd')
    setCameraShader('hud', 'xd')
    setShaderProperty('xd', 'barrel', 0.0)
    setShaderProperty('xd', 'zoom', 1.0)
    setShaderProperty('xd', 'doChroma', true)
    
end

function update(elapsed)

    perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('xd', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('xd', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('xd', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end
--function songStart()
 --   perlinXRange = 0.25
 --   perlinYRange = 0.01
---    perlinZRange = 12
---    perlinSpeed = 1.2
--end
local reversaaa = 1
function stepHit( )
    if curStep % 16 == 0 then
        local offset = 100 * reversaaa
            for i = 0, 7 do
                setActorProperty(i, 'x', _G['defaultStrum'..i..'X'] + offset) 
                tweenActorProperty(i, 'x', _G['defaultStrum'..i..'X'], crochet * 0.001 * 3, 'cubeOut') 
                local qxdddddd = (i <= 3) and 45 or 45
                 setActorProperty(i, 'angle', qxdddddd*reversaaa)
                tweenActorProperty(i, 'angle', 0, crochet * 0.001 * 3, 'cubeOut')
            end
            reversaaa = -reversaaa 
        end
        

    if curStep == 1 then -- also use songstart for curstep 1
        perlinXRange = 0.25
        perlinYRange = 0.01
        perlinZRange = 12
        perlinSpeed = 1.2
    end
    if curStep == 999 then
        perlinXRange = 0.01
        perlinYRange = 0.01
        perlinZRange = 0.01
        perlinSpeed = 0.5
    end
end
