
BlasterSize = 0.7

function onCreate()
	createSound('shot', 'blaster_shoot')
	if downscrollBool then
		makeAnimatedSprite('blaster', 'gasterBlaster', -150, -325, BlasterSize)
	else
		makeAnimatedSprite('blaster', 'gasterBlaster', -150, 250, BlasterSize)
	end
	setActorAlpha(0, 'blaster')
	addActorAnimation('blaster', 'blast', 'shoot', 20, false)
	setObjectCamera("blaster","hud")
end

function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "blaster" then
		playSound('shot', true)
		setActorAlpha(1, 'blaster')
		playActorAnimation('blaster', 'blast')
		setHealth(0.4)
    end
end