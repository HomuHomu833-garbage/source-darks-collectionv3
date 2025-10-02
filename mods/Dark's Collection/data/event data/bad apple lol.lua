--Written by Vortex
enabled = false
function createPost()
    makeSprite('WhiteBG', 'WhiteBox', 0, 0)
	makeGraphic('WhiteBG', 1920, 1080, '#FFFFFF')
	setActorLayer('WhiteBG', 0)
    setActorLayer('WhiteBG', getActorLayer('girlfriend'))
    setActorAlpha(0, 'WhiteBG')
    setActorScroll(1,1,'WhiteBG')
    screenCenter('WhiteBG')
end
function update(elapsed)
    setActorScale((getCamZoom()- 1 * 10)/-1, 'WhiteBG')
end
function onEvent(name, position, argument1, argument2)
	if string.lower(name) == "bad apple lol" then
        Duration = tonumber(argument1)
        enabled = not enabled
        if enabled then
            tweenFadeIn('WhiteBG',1,Duration)
            tweenFadeOut('girlfriend',0,Duration)
            tweenActorColor('boyfriend',255,255,255,0,0,0,Duration)
            tweenActorColor('dadCharacter0',255,255,255,0,0,0,Duration)
            tweenActorColor('dadCharacter1',255,255,255,0,0,0,Duration)
            tweenActorColor('iconP1',255,255,255,0,0,0,Duration)
            tweenActorColor('iconP2',255,255,255,0,0,0,Duration)
            tweenActorColor('healthBar',255,255,255,0,0,0,Duration)
            for i=0,15 do -- hopefully this should be enough
                tweenActorColor('bf'..i,255,255,255,0,0,0,Duration)
                tweenActorColor('dadCharacter0'..i,255,255,255,0,0,0,Duration)
                tweenActorColor('dadCharacter1'..i,255,255,255,0,0,0,Duration)
                tweenFadeOut('girlfriend',0,Duration)
            end
        end
        if not enabled then
            tweenFadeIn('WhiteBG',0,Duration)
            tweenActorColor('boyfriend',0,0,0,255,255,255,Duration)
            tweenActorColor('dadCharacter0',0,0,0,255,255,255,Duration)
            tweenActorColor('dadCharacter1',0,0,0,255,255,255,Duration)
            tweenActorColor('girlfriend',0,0,0,255,255,255,Duration)
            tweenActorColor('iconP1',0,0,0,255,255,255,Duration)
            tweenActorColor('iconP2',0,0,0,255,255,255,Duration)
            tweenActorColor('healthBar',0,0,0,255,255,255,Duration)
        end
    end
end