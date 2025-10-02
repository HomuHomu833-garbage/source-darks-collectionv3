local window = 0
local a = 0
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
    a = a + (elapsed * 1.5)
    setActorPos(-250 + ((math.cos(a) * 2) * window), -100 + (math.sin(2 * a) * window), "dadCharacter0")
	setActorPos(-240 + ((math.cos(a + 1) * 2) * window), -80 + (math.sin(2 * (a + 1)) * window), "dadCharacter1")
	setActorPos(-230 + ((math.cos(a + 2) * 2) * window), -120 + (math.sin(2 * (a + 2)) * window), "dadCharacter2")
	setActorPos(-220 + ((math.cos(a + 3) * 2) * window), -60 + (math.sin(2 * (a + 3)) * window), "dadCharacter3")
    setActorPos(1250 + ((math.cos(a) * 2) * window), 100 + (math.sin(2 * a) * window), "bfCharacter0")
	setActorPos(1230 + ((math.cos(a + 2) * 2) * window), 120 + (math.sin(2 * (a + 2)) * window), "bfCharacter2")
	setActorPos(1220 + ((math.cos(a + 3) * 2) * window), 60 + (math.sin(2 * (a + 3)) * window), "bfCharacter3")
    for i=start_Rock_Num, end_Rock_Num do
        local actor_Name = "undefinedSprite" .. tostring(i)
        
    end
end

print("Mod Chart script loaded :)")