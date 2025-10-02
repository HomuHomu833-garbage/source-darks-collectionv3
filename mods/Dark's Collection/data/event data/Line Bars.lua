local layerShit = 0
function createPost()
    makeSprite('UpperBar', 'UpperBar', -1200, -720, 1)
    setObjectCamera('UpperBar', 'hud')
    makeGraphic('UpperBar', 4000, 720, '0xFF000000')
    actorScreenCenter('UpperBar')
    setActorY(720, 'UpperBar')

    makeSprite('LowerBar', 'LowerBar', -1200, 720, 1)
    setObjectCamera('LowerBar', 'hud')
    makeGraphic('LowerBar', 4000, 720, '0xFF000000')
    actorScreenCenter('LowerBar')
    setActorY(-720, 'LowerBar')
    layerShit = getActorLayer('UpperBar')
end
function onEvent(name, position, value1, value2)
    if string.lower(name) == "line Bars" then
        local height = tonumber(value1)
        tweenPos('UpperBar', getActorX('UpperBar'), height-720, 0.5)
        tweenPos('LowerBar', getActorX('UpperBar'), -height+720, 0.5)
        setActorLayer('UpperBar', layerShit)
        setActorLayer('LowerBar', layerShit)
        if value2 == '2' then 
            setActorLayer('UpperBar', 0)
            setActorLayer('LowerBar', 0)
        elseif value2 == '1' then 
            for i=0,7 do
                if downscrollBool then 
                    --112 = note width
                    local pos = 720-height-112
                    if pos >= strumLineY-56 then 
                        pos = strumLineY-56
                    end
                    tweenPosYAngle(i, pos, 360, 0.5)
                else 
                    local pos = height
                    if pos <= strumLineY-56 then 
                        pos = strumLineY-56
                    end
                    tweenPosYAngle(i, pos, 360, 0.5)
                end
                
            end
        end
    end
end