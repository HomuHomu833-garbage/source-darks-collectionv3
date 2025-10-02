local floatShit = 0
local rockY = 0
local bfY = 0
local mattY = 0
function createPost()
	
	rockY = getActorY('undefinedSprite4')
	rockY = getActorY('undefinedSprite1')
	rockY = getActorY('undefinedSprite2')
end


function update(elapsed)
	floatShit = 150*math.sin(songPos*0.001)
    --setActorX(getActorX('iconP1') + 50, 'boyfriend')
	setActorY(rockY + floatShit, 'undefinedSprite2')
	setActorY(rockY + floatShit, 'undefinedSprite4')
	setActorY(rockY + floatShit, 'undefinedSprite13')
end