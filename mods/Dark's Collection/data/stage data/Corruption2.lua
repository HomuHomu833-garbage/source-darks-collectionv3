local floatShit = 0
local rockY = 0

local gf0OffsetX, gf0OffsetY = 0, 0
local gf1OffsetX, gf1OffsetY = 0, 0

function createPost()
    rockY = getActorY('undefinedSprite3')

    set("gfCharacter0.x", getActorX('gfCharacter0') - 50)
    set("gfCharacter0.y", getActorY('gfCharacter0') + 50)

    set("gfCharacter1.y", getActorY('gfCharacter1') + 180)

    gf0OffsetX = getActorX('gfCharacter0') - getActorX('undefinedSprite2')
    gf0OffsetY = getActorY('gfCharacter0') - getActorY('undefinedSprite2')

    gf1OffsetX = getActorX('gfCharacter1') - getActorX('undefinedSprite2')
    gf1OffsetY = getActorY('gfCharacter1') - getActorY('undefinedSprite2')

    setActorScroll(0.4, 0.4, 'gfCharacter0')
    setActorScroll(0.4, 0.4, 'gfCharacter1')
    setActorScaleXY(0.6, 0.6, 'gfCharacter0')
    setActorScaleXY(0.6, 0.6, 'gfCharacter1')
end
time = 0
function update(elapsed)
    time = time + elapsed
    floatShit = 100 * math.sin(songPos * 0.001)
    setActorY(rockY + floatShit, 'undefinedSprite3')

    local bpm = get("curBpm") or 120
    local curStep = get("curStep") or 0
    setActorY(math.sin(time * (bpm / 220) * 0.8) * 100 - 800, "undefinedSprite2")

    setActorX(lerp(getActorX("undefinedSprite2"), -300 - math.sin(curStep / 9.5 / 4 * time / 10) * 200, elapsed), "undefinedSprite2")

    setActorX(getActorX("undefinedSprite2") + gf0OffsetX, "gfCharacter0")
    setActorY(getActorY("undefinedSprite2") + gf0OffsetY, "gfCharacter0")

    setActorX(getActorX("undefinedSprite2") + gf1OffsetX, "gfCharacter1")
    setActorY(getActorY("undefinedSprite2") + gf1OffsetY, "gfCharacter1")
end
