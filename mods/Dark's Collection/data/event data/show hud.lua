function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "show hud" then
        setActorAlpha(1, "camHUD")
    end
end