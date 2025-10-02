function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "hide hud" then
        setActorAlpha(0, "camHUD")
    end
end