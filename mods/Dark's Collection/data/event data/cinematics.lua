

StartStop = 0
Speed = 0
function onEvent(name, position, argument1, argument2)
	if string.lower(name) == "cinematics" then
		StartStop = tonumber(argument1)
		Speed = tonumber(argument2)	

	if StartStop == 1 then
		--THE TOP BAR
		destroySprite('UpperBar')
		makeSprite('UpperBar', '', 0, -120)
		makeGraphic('UpperBar', 1280, 120, '#000000')
		setObjectCamera('UpperBar', 'hud')
		setActorLayer('UpperBar', 0)
		--THE BOTTOM BAR
		destroySprite('LowerBar')
		makeSprite('LowerBar', '', 0, 720)
		makeGraphic('LowerBar', 1280, 120, '#000000')
		setObjectCamera('LowerBar', 'hud')
		setActorLayer('LowerBar', 0)
		tweenPos('UpperBar', getActorX('UpperBar'), 0, Speed)
		tweenPos('LowerBar', getActorX('LowerBar'), 600, Speed)
		tweenFadeOut('healthBarBG', 0, 0.1)
		tweenFadeOut('healthBar', 0, 0.1)
		tweenFadeOut('scoreTxt', 0, 0.1)
		tweenFadeOut('iconP1', 0, 0.1)
		tweenFadeOut('iconP2', 0, 0.1)
		tweenFadeOut('timeBar', 0, 0.1)
		tweenFadeOut('timeBarBG', 0, 0.1)
		tweenFadeOut('infoTxt', 0, 0.1)
	end

	if downscrollBool and StartStop == 1 then
		--THE TOP BAR
		destroySprite('UpperBar')
		makeSprite('UpperBar', '', 0, -120)
		makeGraphic('UpperBar', 1280, 120, '#000000')
		setObjectCamera('UpperBar', 'hud')
		setActorLayer('UpperBar', 0)
		--THE BOTTOM BAR
		destroySprite('LowerBar')
		makeSprite('LowerBar', '', 0, 720)
		makeGraphic('LowerBar', 1280, 120, '#000000')
		setActorLayer('LowerBar', 0)
		setObjectCamera('LowerBar', 'hud')
		tweenPos('UpperBar', getActorX('UpperBar'), 0, Speed)
		tweenPos('LowerBar', getActorX('LowerBar'), 600, Speed)
		tweenFadeOut('healthBarBG', 0, 0.1)
		tweenFadeOut('healthBar', 0, 0.1)
		tweenFadeOut('scoreTxt', 0, 0.1)
		tweenFadeOut('iconP1', 0, 0.1)
		tweenFadeOut('iconP2', 0, 0.1)
		tweenFadeOut('timeBar', 0, 0.1)
		tweenFadeOut('timeBarBG', 0, 0.1)
		tweenFadeOut('infoTxt', 0, 0.1)
	end


	if StartStop == 2 then
		
		tweenPos('UpperBar', getActorX('UpperBar'), -120, Speed)
		tweenPos('LowerBar', getActorX('LowerBar'), 720, Speed)
		tweenFadeOut('healthBarBG', 1, 0.1)
		tweenFadeOut('healthBar', 1, 0.1)
		tweenFadeOut('scoreTxt', 1, 0.1)
		tweenFadeOut('iconP1', 1, 0.1)
		tweenFadeOut('iconP2', 1, 0.1)
		tweenFadeOut('timeBar', 1, 0.1)
		tweenFadeOut('timeBarBG', 1, 0.1)
		tweenFadeOut('infoTxt', 1, 0.1)
	end

	if downscrollBool and StartStop == 2 then
	
		tweenPos('UpperBar', getActorX('UpperBar'), -120, Speed)
		tweenPos('LowerBar', getActorX('LowerBar'), 720, Speed)
		tweenFadeOut('healthBarBG', 1, 0.1)
		tweenFadeOut('healthBar', 1, 0.1)
		tweenFadeOut('scoreTxt', 1, 0.1)
		tweenFadeOut('iconP1', 1, 0.1)
		tweenFadeOut('iconP2', 1, 0.1)
		tweenFadeOut('timeBar', 1, 0.1)
		tweenFadeOut('timeBarBG', 1, 0.1)
		tweenFadeOut('infoTxt', 1, 0.1)
	
		end

		if StartStop == 3 then
		
			tweenPos('UpperBar', getActorX('UpperBar'), -120, Speed)
			tweenPos('LowerBar', getActorX('LowerBar'), 720, Speed)
			tweenFadeOut('healthBarBG', 0, 0.1)
			tweenFadeOut('healthBar', 0, 0.1)
			tweenFadeOut('scoreTxt', 0, 0.1)
			tweenFadeOut('iconP1', 0, 0.1)
			tweenFadeOut('iconP2', 0, 0.1)
			tweenFadeOut('timeBar', 0, 0.1)
			tweenFadeOut('timeBarBG', 0, 0.1)
			tweenFadeOut('infoTxt', 0, 0.1)
		end
	
		if downscrollBool and StartStop == 3 then
		
			tweenPos('UpperBar', getActorX('UpperBar'), -120, Speed)
			tweenPos('LowerBar', getActorX('LowerBar'), 720, Speed)
			tweenFadeOut('healthBarBG', 0, 0.1)
			tweenFadeOut('healthBar', 0, 0.1)
			tweenFadeOut('scoreTxt', 0, 0.1)
			tweenFadeOut('iconP1', 0, 0.1)
			tweenFadeOut('iconP2', 0, 0.1)
			tweenFadeOut('timeBar', 0, 0.1)
			tweenFadeOut('timeBarBG', 0, 0.1)
			tweenFadeOut('infoTxt', 0, 0.1)
		
			end
	end
end
