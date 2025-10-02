local floatShit = 0
local rockY = 0
local bfY = 0
local mattY = 0
function createPost()
	rockY = getActorY('undefinedSprite2')
end


function update(elapsed)
	floatShit = 100*math.sin(songPos*0.001)
	setActorY(rockY + floatShit, 'undefinedSprite2')
    
end