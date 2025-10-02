function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "count voiid" then
		colour = tonumber(argument2);
		duration = tonumber(argument1);
        if colour == 1 then
			destroySprite('unoaparece')
			makeSprite('unoaparece', 'uno voiid', 0, 0);
			setObjectCamera('unoaparece', 'hud');
            tweenFadeOut('unoaparece', 0, duration, "destroySprite('unoaparece')")
		end
        if colour == 2 then
			destroySprite('dosaparece')
			makeSprite('dosaparece', 'dos voiid', 0, 0);
			setObjectCamera('dosaparece', 'hud');
            tweenFadeOut('dosaparece', 0, duration, "destroySprite('dosaparece')")
		end
        if colour == 3 then
			destroySprite('tresaparece')
			makeSprite('tresaparece', 'tres voiid', 0, 0);
			setObjectCamera('tresaparece', 'hud');
            tweenFadeOut('tresaparece', 0, duration, "destroySprite('tresaparece')")
		end
        if colour == 4 then
			destroySprite('cuatroaparece')
			makeSprite('cuatroaparece', 'cuatro voiid', 0, 0);
			setObjectCamera('cuatroaparece', 'hud');
            tweenFadeOut('cuatroaparece', 0, duration, "destroySprite('cuatroaparece')")
		end
		if colour == 5 then
			destroySprite('concentrateaparece')
			makeSprite('concentrateaparece', 'concentrate', 0, 0);
			setObjectCamera('concentrateaparece', 'hud');
            tweenFadeOut('concentrateaparece', 0, duration, "destroySprite('concentrateaparece')")
		end
    end
end