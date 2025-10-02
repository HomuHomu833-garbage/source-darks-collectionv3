function start() -- thank u Refenger to help me with this
    makeSprite("BlackBox 2", "BlackBox 2", -500, -500, 10)
    setObjectCamera("BlackBox 2", "hud")
    setActorAlpha(0, "BlackBox 2")
    fadeSpeed = 0
    fadeStay = 0
    fadeAway = 0
end

function update()
    setActorAlpha (getActorAlpha("BlackBox 2") + fadeSpeed, "BlackBox 2")
end

function playerOneSing(a, b, c, d)
    if c == "Rev Punch" or c == "Bullet" or c == "caution" then
        playCharacterAnimation("boyfriend", "dodge", true)
    end
end


function stepHit()
    if curStep >= fadeStay then
        fadeSpeed = fadeAway * -1
    end
end

function fadeOut(fadeIn, fadeOut, dur)
    fadeSpeed = fadeIn / 100
    fadeAway = fadeOut / 100
    fadeStay = curStep + dur
end

function stepHit() -- thank u Refenger to help me with this again as9dfubs
    if curStep >= fadeStay then
        fadeSpeed = fadeAway * -1
    end
    if curStep == 1 then
        fadeOut(1, 0.1, 162)
    end
    if curStep == 1252 or curStep == 2020 or curStep == 2532 then
        fadeOut(0.3, 0.4, 25)
    end
    if curStep == 732 then
        fadeOut(0.2, 0.3, 32)
    end
    if curStep == 1 or curStep == 316 or curStep == 380 or curStep == 740 or curStep == 1084 or curStep == 1148 or curStep == 1252 or curStep == 1776 or curStep == 2296 then
        triggerEvent('set camera zoom','0.8','1')
    end
    if curStep == 256 or curStep == 320 or curStep == 384 or curStep == 768 or curStep == 1088 or curStep == 1152 or curStep == 1408 or curStep == 1792 or curStep == 2304 then
        triggerEvent('set camera zoom','0.7','1')
    end
    if curStep == 256 or curStep == 1792 then
        triggerEvent('Camera Flash','#ffffff','0.7')
    end
    if curStep == 816 or curStep == 820 or curStep == 824 or curStep == 880 or curStep == 884 or curStep == 888 or curStep == 944 or curStep == 948 or curStep == 952 or curStep == 1008 or curStep == 1012 or curStep == 1016 or curStep == 1328 or curStep == 1332 or curStep == 1336 or curStep == 1392 or curStep == 1396 or curStep == 1400 or curStep == 1456 or curStep == 1460 or curStep == 1464 or curStep == 1520 or curStep == 1524 or curStep == 1528 or curStep == 2352 or curStep == 2356 or curStep == 2360 or curStep == 2364 or curStep == 2416 or curStep == 2420 or curStep == 2424 or curStep == 2428 or curStep == 2480 or curStep == 2484 or curStep == 2488 or curStep == 2492 or curStep == 2544 or curStep == 2548 or curStep == 2552 or curStep == 2556 then
        triggerEvent('Camera Flash','#ffffff','0.1')
    end
    if curStep == 320 or curStep == 768 or curStep == 896 or curStep == 960 or curStep == 1024 or curStep == 1280 or curStep == 1408 or curStep == 1536 or curStep == 2048 or curStep == 2304 or curStep == 2368 or curStep == 2560 or curStep == 2816 then
        triggerEvent('Camera Flash','#ffffff','0.8')
    end
end

function lerp(a, b, ratio)
    return a + ratio * (b - a)
end
