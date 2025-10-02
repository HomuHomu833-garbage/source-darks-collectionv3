--Written by Vortex
enabled = false
function createPost()
    makeSprite('whitebglol', 'empty', 0, 0)
	makeGraphic('whitebglol', 1920, 1080, '#FFFFFF')
	setActorLayer('whitebglol', 0)
    setActorLayer('whitebglol', getActorLayer('girlfriend'))
    setActorAlpha(0, 'whitebglol')
    setActorScroll(1,1,'whitebglol')
    screenCenter('whitebglol')
end
function update(elapsed)
    setActorScale((getCamZoom()- 1 * 10)/-1, 'whitebglol')
end
function onEvent(name, position, argument1, argument2)
	if string.lower(name) == "bad apple x1" then
        Speed = tonumber(argument1)
        enabled = not enabled
        if enabled then
            tweenFadeIn('whitebglol',1,Speed)
            tweenActorColor('boyfriend',255,255,255,0,0,0,Speed)
            tweenActorColor('dad',255,255,255,0,0,0,Speed)
            tweenActorColor('girlfriend',255,255,255,0,0,0,Speed)
            tweenActorColor('iconP1',255,255,255,0,0,0,Speed)
            tweenActorColor('iconP2',255,255,255,0,0,0,Speed)
            tweenActorColor('healthBar',255,255,255,0,0,0,Speed)
            for i=0,15 do -- hopefully this should be enough
                tweenActorColor('dadCharacter'..i,255,255,255,0,0,0,Speed)
                tweenActorColor('bfCharacter'..i,255,255,255,0,0,0,Speed)
                tweenActorColor('gfCharacter'..i,255,255,255,0,0,0,Speed)
            end
        end
        if not enabled then
            tweenFadeIn('whitebglol',0,Speed)
            tweenActorColor('boyfriend',0,0,0,255,255,255,Speed)
            tweenActorColor('dad',0,0,0,255,255,255,Speed)
            tweenActorColor('girlfriend',0,0,0,255,255,255,Speed)
            tweenActorColor('iconP1',0,0,0,255,255,255,Speed)
            tweenActorColor('iconP2',0,0,0,255,255,255,Speed)
            tweenActorColor('healthBar',0,0,0,255,255,255,Speed)
        end
    end
end