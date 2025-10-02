local window = 0
local a = 0
local viewskysections = {182,183,186,187,190,191,194,195,216,217,224,225,-1}
local start_Rock_Num = 2
local end_Rock_Num = 12
local tracer = 1
local rock_Stuff = {
	0
}
local CUR_SECTION = 0

function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
	
	window = 240

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)

		table.insert(rock_Stuff, getActorY(actor_Name))
	end
end

function update(elapsed)
	CUR_SECTION = math.floor(curBeat / 4)
	if viewskysections[tracer] == CUR_SECTION then
		setActorPos(getActorX("dadCharacter1"), getActorY("dadCharacter1") + 60, "dad")
		lock = true
	else
		setActorPos(getActorX("dadCharacter0"), getActorY("dadCharacter0") + 60, "dad")
		if lock == true then
			tracer = tracer + 1
		end
		lock = false
	end
	a = a + (elapsed * 1.5)
	setActorPos(-10 + ((math.cos(a) * 2) * window), 750 + (math.sin(2 * a) * window), "dadCharacter0")
	setActorPos(-20 + ((math.cos(-a) * 2) * window), 850 + (math.sin(2 * -a) * window), "dadCharacter1")

	for i=start_Rock_Num, end_Rock_Num do
		local actor_Name = "undefinedSprite" .. tostring(i)
		
		setActorPos(getActorX(actor_Name), rock_Stuff[i] + (math.sin(2 * (a + i)) * 80), actor_Name)
	end

	setActorPos(getActorX('boyfriend') - 200, getActorY('boyfriend') + 200, "bf_rock")
	setActorPos(getActorX('girlfriend') - 10, getActorY('girlfriend') + 575, "gf_rock")
end

print("Mod Chart script loaded :)")