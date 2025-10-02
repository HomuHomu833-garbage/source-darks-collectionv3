function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "matt line" then
		colour = tonumber(argument2);
		duration = tonumber(argument1);
        if colour == 1 then
			destroySprite('BITRLaparece')
			makeSprite('BITRLaparece', 'BITRL', -400,-155);
			setObjectCamera('BITRLaparece', 'hud');
            tweenFadeOut('BITRLaparece', 0, duration, "destroySprite('BITRLaparece')")
		end
    end
end