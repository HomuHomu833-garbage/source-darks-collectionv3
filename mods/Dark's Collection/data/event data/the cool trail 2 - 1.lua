--please dont become overused pleasedontbecomeoverusedpleasedontbecomeoverusedpleasedontbecomeoverusedpleasedontbecomeoverusedpleasedontbecomeoverusedpleasedontbecomeoverused
local trailCountDadCharacter0 = 0
local trailCountDadCharacter1 = 0
local trailCount = 0
local doingBf = false
local doingDadCharacter0 = false
local doingDadCharacter1 = false

function onEvent(name, position, value1, value2)
    if string.lower(name) == "the cool trail 2 - 1" then
        if value1 == 'bf' then
            doingBf = not doingBf
        elseif value1 == 'dadCharacter0' then
            doingDadCharacter0 = not doingDadCharacter0
        elseif value1 == 'dadCharacter1' then
            doingDadCharacter1 = not doingDadCharacter1
        else
            doingDadCharacter0 = not doingDadCharacter0
            doingDadCharacter1 = not doingDadCharacter1
            doingBf = not doingBf
        end
    end
end
function playerOneSingHeld(data, time, type)
    if doingBf then
        destroySprite('trail'..trailCount)
        makeSpriteCopy('trail'..trailCount, 'boyfriend')
        tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*8)
        set('trail'..trailCount..'.color', get('boyfriend.barColor'))
        setActorLayer('trail'..trailCount, getActorLayer('boyfriend')-1)
        if getPlayingActorAnimation('boyfriend') == 'singRIGHT' then
            tweenPos('trail'..trailCount, getActorX('boyfriend') + 150, getActorY('boyfriend'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('boyfriend') == 'singUP' then
            tweenPos('trail'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('boyfriend') == 'singDOWN' then
            tweenPos('trail'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trail'..trailCount, getActorX('boyfriend') - 150, getActorY('boyfriend'), stepCrochet*0.001*8)
        end
        trailCount = trailCount + 1
    end
end
function playerOneSing(data, time, type)
    if doingBf then
        destroySprite('trail'..trailCount)
        makeSpriteCopy('trail'..trailCount, 'boyfriend')
        tweenFadeOut('trail'..trailCount, 0, stepCrochet*0.001*8)
        set('trail'..trailCount..'.color', get('boyfriend.barColor'))
        setActorLayer('trail'..trailCount, getActorLayer('boyfriend')-1)
        if getPlayingActorAnimation('boyfriend') == 'singRIGHT' then
            tweenPos('trail'..trailCount, getActorX('boyfriend') + 150, getActorY('boyfriend'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('boyfriend') == 'singUP' then
            tweenPos('trail'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('boyfriend') == 'singDOWN' then
            tweenPos('trail'..trailCount, getActorX('boyfriend'), getActorY('boyfriend') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trail'..trailCount, getActorX('boyfriend') - 150, getActorY('boyfriend'), stepCrochet*0.001*8)
        end
        trailCount = trailCount + 1
    end
end
function playerTwoSingHeld(data, time, type)
    if doingDadCharacter0 then
        destroySprite('trailDadCharacter0'..trailCountDadCharacter0)
        makeSpriteCopy('trailDadCharacter0'..trailCountDadCharacter0, 'dadCharacter0')
        tweenFadeOut('trailDadCharacter0'..trailCountDadCharacter0, 0, stepCrochet*0.001*8)
        set('trailDadCharacter0'..trailCountDadCharacter0..'.color', get('dadCharacter0.barColor'))
        setActorLayer('trailDadCharacter0'..trailCountDadCharacter0, getActorLayer('dadCharacter0')-1)
        if getPlayingActorAnimation('dadCharacter0') == 'singRIGHT' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0') + 150, getActorY('dadCharacter0'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter0') == 'singUP' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0'), getActorY('dadCharacter0') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter0') == 'singDOWN' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0'), getActorY('dadCharacter0') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0') - 150, getActorY('dadCharacter0'), stepCrochet*0.001*8)
        end
        trailCountDadCharacter0 = trailCountDadCharacter0 + 1
    end
    if doingDadCharacter1 then
        destroySprite('trailDadCharacter1'..trailCountDadCharacter1)
        makeSpriteCopy('trailDadCharacter1'..trailCountDadCharacter1, 'dadCharacter1')
        tweenFadeOut('trailDadCharacter1'..trailCountDadCharacter1, 0, stepCrochet*0.001*8)
        set('trailDadCharacter1'..trailCountDadCharacter1..'.color', get('dadCharacter1.barColor'))
        setActorLayer('trailDadCharacter1'..trailCountDadCharacter1, getActorLayer('dadCharacter1')-1)
        if getPlayingActorAnimation('dadCharacter1') == 'singRIGHT' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1') + 150, getActorY('dadCharacter1'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter1') == 'singUP' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1'), getActorY('dadCharacter1') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter1') == 'singDOWN' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1'), getActorY('dadCharacter1') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1') - 150, getActorY('dadCharacter1'), stepCrochet*0.001*8)
        end
        trailCountDadCharacter1 = trailCountDadCharacter1 + 1
    end
end
function playerTwoSing(data, time, type)
    if doingDadCharacter0 then
        destroySprite('trailDadCharacter0'..trailCountDadCharacter0)
        makeSpriteCopy('trailDadCharacter0'..trailCountDadCharacter0, 'dadCharacter0')
        tweenFadeOut('trailDadCharacter0'..trailCountDadCharacter0, 0, stepCrochet*0.001*8)
        set('trailDadCharacter0'..trailCountDadCharacter0..'.color', get('dadCharacter0.barColor'))
        setActorLayer('trailDadCharacter0'..trailCountDadCharacter0, getActorLayer('dadCharacter0')-1)
        if getPlayingActorAnimation('dadCharacter0') == 'singRIGHT' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0') + 150, getActorY('dadCharacter0'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter0') == 'singUP' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0'), getActorY('dadCharacter0') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('dadCharacter0') == 'singDOWN' then
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0'), getActorY('dadCharacter0') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trailDadCharacter0'..trailCountDadCharacter0, getActorX('dadCharacter0') - 150, getActorY('dadCharacter0'), stepCrochet*0.001*8)
        end
        trailCountDadCharacter0 = trailCountDadCharacter0 + 1
    end
    if doingDadCharacter1 then
        destroySprite('trailDadCharacter1'..trailCountDadCharacter1)
        makeSpriteCopy('trailDadCharacter1'..trailCountDadCharacter1, 'dadCharacter1')
        tweenFadeOut('trailDadCharacter1'..trailCountDadCharacter1, 0, stepCrochet*0.001*8)
        set('trailDadCharacter1'..trailCountDadCharacter1..'.color', get('dadCharacter1.barColor'))
        setActorLayer('trailDadCharacter1'..trailCountDadCharacter1, getActorLayer('dadCharacter1')-1)
        if getPlayingActorAnimation('dadCharacter1') == 'singRIGHT' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1') + 150, getActorY('dadCharacter1'), stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('daddadCharacter1') == 'singUP' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1'), getActorY('dadCharacter1') - 150, stepCrochet*0.001*8)
        elseif getPlayingActorAnimation('daddadCharacter1') == 'singDOWN' then
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1'), getActorY('dadCharacter1') + 150, stepCrochet*0.001*8)
        else
            tweenPos('trailDadCharacter1'..trailCountDadCharacter1, getActorX('dadCharacter1') - 150, getActorY('dadCharacter1'), stepCrochet*0.001*8)
        end
        trailCountDadCharacter1 = trailCountDadCharacter1 + 1
    end
end