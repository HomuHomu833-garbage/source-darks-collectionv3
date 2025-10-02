local window = 0
local a = 0
local start_Rock_Num = 2
local end_Rock_Num = 12
local tracer = 1
local rock_Stuff = {
    0
}
local CUR_SECTION = 0

function start (song) playerTwoSing(data, time, type)
    print(song)
    print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
    
    window = 240

    for i=start_Rock_Num, end_Rock_Num do
        local actor_Name = "undefinedSprite" .. tostring(i)

        table.insert(rock_Stuff, getActorY(actor_Name))
    end
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.02 > 0 then
        setHealth(getHealth() - 0.012)
    else
        setHealth(0.050)
    end
end


function update(elapsed)
    CUR_SECTION = math.floor(curBeat / 4)
    a = a + (elapsed * 1.5)
    setActorPos(400 + ((math.cos(a) * 2) * window), 0 + (math.sin(2 * a) * window), "dadCharacter0")
	setActorPos(400 + ((math.cos(a + 3) * 2) * window), 0 + (math.sin(2 * (a + 3)) * window), "dadCharacter3")
    for i=start_Rock_Num, end_Rock_Num do
        local actor_Name = "undefinedSprite" .. tostring(i)
    end

end

print("Mod Chart script loaded :)")
