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
end

function update(elapsed)
    CUR_SECTION = math.floor(curBeat / 4)
    a = a + (elapsed * 1.5)
    setActorPos(-50 + ((math.cos(a) * 0.5) * window), 750 + (math.sin(1 * (a + 1)) * window), "dadCharacter0")
	setActorPos(350 + ((math.cos(a + 0.3) * 0.5) * window), 950 + (math.sin(1 * (a + 0.5)) * window), "dadCharacter1")

end

print("Mod Chart script loaded :)")
