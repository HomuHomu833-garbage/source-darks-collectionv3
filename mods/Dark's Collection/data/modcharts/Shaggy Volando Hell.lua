function start(song)
    print(song)
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
end
local window = 0
local a = 0

local start_Rock_Num = 2
local end_Rock_Num = 12

local rock_Stuff = {
	0
}

function start (song)
	window = 240

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)

		table.insert(rock_Stuff, getActorY(actor_Name))
	end
end

function update(elapsed)
	a = a + (elapsed * 1.5)
	
	setActorPos(-400 + ((math.cos(a) * 2) * window), -1050 + (math.sin(2 * a) * window), "dad")

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)
		
	end

end