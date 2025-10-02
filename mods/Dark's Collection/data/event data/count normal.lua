function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "count normal" then
		colour = tonumber(argument2);
		duration = tonumber(argument1);
        if colour == 1 then
			destroySprite('uno normalaparece')
			makeSprite('uno normalaparece', 'uno normal', 140, 230);
			setObjectCamera('uno normalaparece', 'hud');
            tweenFadeOut('uno normalaparece', 0, duration, "destroySprite('uno normalaparece')")
		end
        if colour == 2 then
			destroySprite('dos normalaparece')
			makeSprite('dos normalaparece', 'dos normal', 140, 230);
			setObjectCamera('dos normalaparece', 'hud');
            tweenFadeOut('dos normalaparece', 0, duration, "destroySprite('dos normalaparece')")
		end
        if colour == 3 then
			destroySprite('tres normalaparece')
			makeSprite('tres normalaparece', 'tres normal', 140, 230);
			setObjectCamera('tres normalaparece', 'hud');
            tweenFadeOut('tres normalaparece', 0, duration, "destroySprite('tres normalaparece')")
		end
        if colour == 4 then
			destroySprite('cuatro normalaparece')
			makeSprite('cuatro normalaparece', 'cuatro normal', 140, 230);
			setObjectCamera('cuatro normalaparece', 'hud');
            tweenFadeOut('cuatro normalaparece', 0, duration, "destroySprite('cuatro normalaparece')")
		end
    end
end