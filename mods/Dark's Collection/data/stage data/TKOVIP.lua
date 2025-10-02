local floatShit = 0
local rockY0 = 0
local rockY1 = 0
function createPost()
    rockY0 = getActorY('rock2')
    rockY1 = getActorY('rock1')
	
end

function update(elapsed)
    floatShit = 150 * math.sin(songPos * 0.001)

    setActorY(rockY0 + floatShit, 'rock1')
    setActorY(rockY1 + floatShit, 'rock2')
end
