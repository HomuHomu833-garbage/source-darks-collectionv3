
local trailCountDad = 0
local trailCount = 0
local doingBf = false
local doingDad = false

function onEvent(name, position, value1, value2)
    if string.lower(name) == "the cool trail" then
        if value1 == 'bf' then
            doingBf = not doingBf
        elseif value1 == 'dad' then
            doingDad = not doingDad
        else
            doingDad = not doingDad
            doingBf = not doingBf
        end
    end
end
function playerOneSingHeld(data, time, t, st, char)
    bfTrail(data, time, t, st, char)
end
function playerOneSing(data, time, t, st, char)
    bfTrail(data, time, t, st, char)
end
function playerTwoSingHeld(data, time, t, st, char)
    dadTrail(data, time, t, strumTime, char)
end
function playerTwoSing(data, time, t, strumTime, char)
    dadTrail(data, time, t, strumTime, char)
end
function bfTrail(data, time, type, strumTime, char)
    if doingBf then
        if get("boyfriend.otherCharacters.length") ~= nil then
            destroySprite('trailBF'..trailCount)
            makeSpriteCopy('trailBF'..trailCount, 'bfCharacter'..char)
            tweenFadeOut('trailBF'..trailCount, 0, stepCrochet*0.001*8)
            set('trailBF'..trailCount..'.color', get('boyfriend.barColor'))
            setActorLayer('trailBF'..trailCount, getActorLayer('bfCharacter'..char)-1)
            if getPlayingActorAnimation('bfCharacter'..char) == 'singRIGHT' then
                tweenPos('trailBF'..trailCount, getActorX('bfCharacter'..char) + 150, getActorY('bfCharacter'..char), stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('bfCharacter'..char) == 'singUP' then
                tweenPos('trailBF'..trailCount, getActorX('bfCharacter'..char), getActorY('bfCharacter'..char) - 150, stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('bfCharacter'..char) == 'singDOWN' then
                tweenPos('trailBF'..trailCount, getActorX('bfCharacter'..char), getActorY('bfCharacter'..char) + 150, stepCrochet*0.001*8)
            else
                tweenPos('trailBF'..trailCount, getActorX('bfCharacter'..char) - 150, getActorY('bfCharacter'..char), stepCrochet*0.001*8)
            end
        else
            destroySprite('trailBF'..trailCount)
            makeSpriteCopy('trailBF'..trailCount, 'boyfriend')
            tweenFadeOut('trailBF'..trailCount, 0, stepCrochet*0.001*8)
            set('trailBF'..trailCount..'.color', get('boyfriend.barColor'))
            setActorLayer('trailBF'..trailCount, getActorLayer('boyfriend')-1)
            if getPlayingActorAnimation('boyfriend') == 'singRIGHT' then
                tweenPos('trailBF'..trailCount, getActorX('boyfriend') + 150, getActorY('boyfriend'), stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('boyfriend') == 'singUP' then
                tweenPos('trailBF'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') - 150, stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('boyfriend') == 'singDOWN' then
                tweenPos('trailBF'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') + 150, stepCrochet*0.001*8)
            else
                tweenPos('trailBF'..trailCount, getActorX('boyfriend') - 150, getActorY('boyfriend'), stepCrochet*0.001*8)
            end
        end
        trailCount = trailCount + 1
    end
end
function dadTrail(data, time, type, strumTime, char)
    if doingDad then
        if get("dadCharacter0.x") ~= nil then --????????????????
            destroySprite('trailDad'..trailCountDad)
            makeSpriteCopy('trailDad'..trailCountDad, 'dadCharacter'..char)
            tweenFadeOut('trailDad'..trailCountDad, 0, stepCrochet*0.001*8)
            set('trailDad'..trailCountDad..'.color', get('dad.barColor'))
            setActorLayer('trailDad'..trailCountDad, getActorLayer('dadCharacter'..char)-1)
            if getPlayingActorAnimation('dadCharacter'..char) == 'singRIGHT' then
                tweenPos('trailDad'..trailCountDad, getActorX('dadCharacter'..char) + 150, getActorY('dadCharacter'..char), stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('dadCharacter'..char) == 'singUP' then
                tweenPos('trailDad'..trailCountDad, getActorX('dadCharacter'..char), getActorY('dadCharacter'..char) - 150, stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('dadCharacter'..char) == 'singDOWN' then
                tweenPos('trailDad'..trailCountDad, getActorX('dadCharacter'..char), getActorY('dadCharacter'..char) + 150, stepCrochet*0.001*8)
            else
                tweenPos('trailDad'..trailCountDad, getActorX('dadCharacter'..char) - 150, getActorY('dadCharacter'..char), stepCrochet*0.001*8)
            end
        else
            destroySprite('trailDad'..trailCountDad)
            makeSpriteCopy('trailDad'..trailCountDad, 'dad')
            tweenFadeOut('trailDad'..trailCountDad, 0, stepCrochet*0.001*8)
            set('trailDad'..trailCountDad..'.color', get('dad.barColor'))
            setActorLayer('trailDad'..trailCountDad, getActorLayer('dad')-1)
            if getPlayingActorAnimation('dad') == 'singRIGHT' then
                tweenPos('trailDad'..trailCountDad, getActorX('dad') + 150, getActorY('dad'), stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('dad') == 'singUP' then
                tweenPos('trailDad'..trailCountDad, getActorX('dad'), getActorY('dad') - 150, stepCrochet*0.001*8)
            elseif getPlayingActorAnimation('dad') == 'singDOWN' then
                tweenPos('trailDad'..trailCountDad, getActorX('dad'), getActorY('dad') + 150, stepCrochet*0.001*8)
            else
                tweenPos('trailDad'..trailCountDad, getActorX('dad') - 150, getActorY('dad'), stepCrochet*0.001*8)
            end
        end
        trailCountDad = trailCountDad + 1
    end
end
function update( e )
end