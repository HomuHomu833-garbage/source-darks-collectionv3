local imageCount = 0
function onEvent(name, position, value1, value2)
    if string.lower(name) == "flashimage" then
        --trace('asdhjalsdlj')
        makeSprite('image'..imageCount, value1, 0, 0, 1)
        setObjectCamera('image'..imageCount, 'hud')
        actorScreenCenter('image'..imageCount)
        tweenFadeCubeInOut('image'..imageCount, 0, tonumber(value2))
        setActorScroll(0, 0, 'image'..imageCount)
        imageCount = imageCount + 1
    elseif string.lower(name) == "uno" then
        local name = 'uno'
        if value1 == '1' then 
            name = name..'-god'
        end
        triggerEvent('flashimage', name, stepCrochet/250)
    elseif string.lower(name) == "dos" then
                local name = 'dos'
        if value1 == '1' then 
            name = name..'-god'
        end
        triggerEvent('flashimage', name, stepCrochet/250)
    elseif string.lower(name) == "tres" then
                local name = 'tres'
        if value1 == '1' then 
            name = name..'-god'
        end
        triggerEvent('flashimage', name, stepCrochet/250)
    elseif string.lower(name) == "cuatro" then
                local name = 'cuatro'
        if value1 == '1' then 
            name = name..'-god'
        end
        triggerEvent('flashimage', name, stepCrochet/250)
    elseif string.lower(name) == "gato" then
        triggerEvent('flashimage', 'que opinas de este gato', stepCrochet/250)

    elseif string.lower(name) == "3" then
        triggerEvent('flashimage', 'ui skins/default/countdown/3????', stepCrochet/250)
    elseif string.lower(name) == "2" then
        triggerEvent('flashimage', 'ui skins/default/countdown/ready', stepCrochet/250)
        setActorY(getActorY('image'..(imageCount-1))+100, 'image'..(imageCount-1))
        --tweenActorProperty('image'..(imageCount-1), 'y', getActorY('image'..(imageCount-1))+100, stepCrochet/250, 'cubeInOut')
        setObjectCamera('image'..(imageCount-1), 'game')
        actorScreenCenter('image'..(imageCount-1))
    elseif string.lower(name) == "1" then
        triggerEvent('flashimage', 'ui skins/default/countdown/set', stepCrochet/250)
        setActorY(getActorY('image'..(imageCount-1))+100, 'image'..(imageCount-1))
        --tweenActorProperty('image'..(imageCount-1), 'y', , stepCrochet/250, 'cubeInOut')
        setObjectCamera('image'..(imageCount-1), 'game')
        actorScreenCenter('image'..(imageCount-1))
    elseif string.lower(name) == "go" then
        triggerEvent('flashimage', 'ui skins/default/countdown/go', stepCrochet/250)
        setActorY(getActorY('image'..(imageCount-1))+100, 'image'..(imageCount-1))
        --tweenActorProperty('image'..(imageCount-1), 'y', getActorY('image'..(imageCount-1))+100, stepCrochet/250, 'cubeInOut')
        setObjectCamera('image'..(imageCount-1), 'game')
        actorScreenCenter('image'..(imageCount-1))
    end
end