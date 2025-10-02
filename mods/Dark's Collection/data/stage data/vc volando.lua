local window = 0
local a = 0
local start_Rock_Num = 2
local end_Rock_Num = 12
local tracer = 1
local rock_Stuff = {
	0
}

local preSection = -5
local CUR_SECTION = 0
local windowGoal = 24
local initialized = false
function createPost()
    window = 24
end

function volandoxd(character, y, character2, speed, offset)
    setActorPos(getActorX(character), y + (math.cos(2 * (a + offset)) * speed), character2)
end
function updateTrailPosition(character)
    local pos = getPosition(character)
    setTrailPosition(character .. ".trail", pos.x, pos.y)
end

local isTweening = false
function update(elapsed)
	
	a = a + (elapsed * 1.5)
	CUR_SECTION = math.floor((songPos / 1000) * (bpm / 60) / 4)

	if not initialized then
        setActorPos(1300, 1750, "dadCharacter0") 
        setActorPos(0, 1750, "dadCharacter1")
        setActorPos(100, 1750, "undefinedSprite11")
		setActorPos(1525,0, "gf")
        initialized = true 
        return -- esto hace votar del uptade para q no este bug qlol
    end


	if math.floor((songPos / 1000) * (bpm / 60)) >= 232 then	--curbeats el 232
		if not isTweeningDad0 then
			isTweeningDad0 = true
			tween("dadCharacter0", {y = 200}, crochet * 0.001 * 2, "cubeOut", function()
				isTweeningDad0 = false
				updateTrailPosition("dadCharacter0")  
			end)
		end
	end
	if math.floor((songPos / 1000) * (bpm / 60)) >= 242 then
		
		if not isTweening then
			isTweening = true 
			tween("dadCharacter1", {y = 300}, crochet * 0.001 * 2, "cubeOut", function()
				isTweening = false 
				updateTrailPosition("dadCharacter1")  
			end)
			tween("undefinedSprite11", {y = 900}, crochet * 0.001 * 2, "cubeOut", function()
				updateTrailPosition("undefinedSprite11")  
			end)
		end
	end
    -- para que empiezen a volar
    if math.floor((songPos / 1000) * (bpm / 60)) >= 256 then
		windowGoal = 240
        setActorPos(0, 300 + (math.cos(a) * window), "dadCharacter1")
        setActorPos(100, 900 + (math.cos(a) * window), "undefinedSprite11")
		setActorPos(1300 + ((math.cos(a) * 2) * window), 200 + (math.sin(2 * a) * window), "dadCharacter0")
    end

	-- Movimiento de las rocas y el bf esto ya es desde el inicio q lolxdxdxd
	for i = start_Rock_Num, end_Rock_Num do
		volandoxd("boyfriend", 650, "boyfriend", 80, 1.25)
		volandoxd("gf", 150, "gf", 60,1)
		volandoxd("undefinedSprite10", 800, "undefinedSprite10", 80, 1.25)
		volandoxd("undefinedSprite6", 200, "undefinedSprite6", 60, 0)   
		volandoxd("undefinedSprite7", 200, "undefinedSprite7", 80, 0.5) 
		volandoxd("undefinedSprite8", 350, "undefinedSprite8", 60, 1)  --roca de lagf
		volandoxd("undefinedSprite9", 200, "undefinedSprite9", 70, 1.5) 
	end
	window = window + ((windowGoal - window) * (elapsed / (0.004 * crochet)))
end
