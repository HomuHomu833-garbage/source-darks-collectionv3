local currentcamerachar = 0
local makethestupid = 0
function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "groupchar switch" then
        if tonumber(argument1) ~= nil then
            currentcamerachar = argument1
        end
    end
end
function update(elapsed)
    setActorPos(getActorX("dadCharacter"..tostring(currentcamerachar)) + 300, getActorY("dadCharacter"..tostring(currentcamerachar)) + 600, "dad")
end