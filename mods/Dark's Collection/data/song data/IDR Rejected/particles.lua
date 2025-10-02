local particleSpawnTime = 0.01 --seconds in between each particle spawn
local particleKillHeight = -500 -- y value at which particles are killed
local particlePoolCount = 200 --max number of particles, dont make it too high

local particleSize = 0.2 --particle scale
local particleSizeRange = 0.15 --random range of scale difference that each particle can be
local particleAngle = 90 --particle angle
local particleAngleRange = 90
local particleScrollFactor = 1 --particle scroll factor
local particleScrollFactorRange = 0.1

local particleSpriteLayer = 5 --you can use getObjectLayer to find layer that you want it on
function onCreatePost()
    particleSpriteLayer = getObjectOrder('boyfriendGroup')+1 --behind gf
end
local particleSprite = "blob" --can set the sprite, leave as "" for white cubes

local particleVelocityY = 400 --how fast they move up
local particleAccelerationY = 100 --how fast the velocity changes

local particleSpawnX = 700
local particleWidthRange = 2000
local particleSpawnY = -200


--dont mess with these
local particleCount = 0
local particleTimer = 0

function onUpdate(elapsed)

    particleTimer = particleTimer + elapsed
    if particleTimer > particleSpawnTime then 
        particleTimer = 0
        spawnParticle()
    end
    for i = 0, particlePoolCount-1 do 
        if getProperty('particle'..i..'.y') < particleKillHeight then 
            removeLuaSprite('particle'..i)
        end
    end
end

function spawnParticle()

    makeLuaSprite('particle'..particleCount, particleSprite, particleSpawnX + math.random(-particleWidthRange, particleWidthRange), particleSpawnY)
    if particleSprite == '' then 
        makeGraphic('particle'..particleCount, 100, 100, '0xFFFFFFFF')
    end
    local scale = particleSize + ((math.random()*2)-1)*particleSizeRange
    setProperty('particle'..particleCount..'.scale.x', scale)
    setProperty('particle'..particleCount..'.scale.y', scale)
    local sf = particleScrollFactor + ((math.random()*2)-1)*particleScrollFactorRange
    setProperty('particle'..particleCount..'.scrollFactor.x', sf)
    setProperty('particle'..particleCount..'.scrollFactor.y', sf)
    setProperty('particle'..particleCount..'.angle', particleAngle + ((math.random()*2)-1)*particleAngleRange)
    setProperty('particle'..particleCount..'.velocity.y', particleVelocityY)
    setProperty('particle'..particleCount..'.acceleration.y', particleAccelerationY)

    addLuaSprite('particle'..particleCount)
    setObjectOrder('particle'..particleCount, particleSpriteLayer)

    particleCount = particleCount + 1
    if particleCount >= particlePoolCount then 
        particleCount = 0
    end
end