local window = 0
local a = 0

local start_Rock_Num = 2
local end_Rock_Num = 12

local rock_Stuff = {
	0
}

function start (song)
	window = 60

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)

		table.insert(rock_Stuff, getActorY(actor_Name))
	end
end

function update(elapsed)
	a = a + (elapsed * 1.2)
	setActorPos(1100 + ((math.cos(a + 1) * 2) * window), 440 + (math.sin(2 * (a + 1)) * window), "dadCharacter1")
	
	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)	
	end

end