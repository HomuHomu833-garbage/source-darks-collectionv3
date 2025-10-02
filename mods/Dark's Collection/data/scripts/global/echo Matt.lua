local echos = {}
--punch anim to punch frame = 333ms
local punchFrame = 333
local echoDirectionFlip = false
function onEventLoaded(name, position, value1, value2)
    if not charsAndBGs then 
        return
    end
    if name == 'punch' then
        for i = 1, tonumber(value1) do
            local randomFlip = math.random(0, 1) == 1
            local random3D = math.random(0, 2) == 1
            table.insert(echos, {tonumber(position) + (crochet * 4 * (i - 1) * tonumber(value2)),'whiteWiik3',false, false, false,punchFrame,randomFlip,random3D})
        end
    elseif name == 'slash' then
        for i = 1, tonumber(value1) do
            local randomFlip = math.random(0, 1) == 1
            local random3D = math.random(0, 2) == 1
            table.insert(echos, {tonumber(position) + (crochet * 4 * (i - 1) * tonumber(value2)),'whiteWiik4',false, false, false,punchFrame,randomFlip,random3D})
        end
    end
end


function createPost()
    if not charsAndBGs then return end
        math.randomseed(os.time())
    local noteCount = getUnspawnNotes()
    local typeToName = {
        ['Wiik3Punch']      = 'purpleWiik3',
        ['Wiik4Sword']      = 'purpleWiik4',
        ['BoxingMatchPunch'] = 'purpleWiik2',
        ['Sword Green']     = 'Green Sword',
        ['RevPunch']        = 'Rev Punch',
        ['Green Punch']     = 'Green Punch',
        ['Punch']           = 'Punch',
        ['paperpunch']      = 'Paper Punch',
        ['Punch Paper']     = 'Punch Paper',
        ['Punch_Paper']     = 'Paper Punch Pixel',
        ['papersword']      = 'Paper Sword',
        ['swordOrange']     = 'Orange Sword',
        ['MattYellowPunch'] = 'vipWiik3',
        ['Punch VIP']       = 'vipWiik3',
        ['Sword VIP']       = 'vipWiik4'
    }

    for i = 0, noteCount - 1 do
        if getUnspawnedNoteMustPress(i) then
            local nt = getUnspawnedNoteNoteType(i)
            local st = getUnspawnedNoteStrumtime(i)
            local name = typeToName[nt]
            if name then
                echoDirectionFlip = not echoDirectionFlip
                local delay = (nt == 'BoxingMatchPunch') and 650 or punchFrame
                local random3D = math.random(0, 2) == 1
                table.insert(echos, {st, name, false, false, false, delay, echoDirectionFlip, random3D})

            end
        end
    end

    local nameToSheet = {
        ['whiteWiik3']        = {'characters/ECHOS/WhiteMattStand_Attack', 'attack'},
        ['purpleWiik4']       = {'characters/ECHOS/MattSlash', 'mattslash'},
        ['Green Sword']       = {'characters/ECHOS/MattSlashGreen', 'mattslash'},
        ['Paper Sword']       = {'characters/ECHOS/MattSlash Remix', 'mattslash'},
        ['Orange Sword']      = {'characters/ECHOS/MattSlashOrange', 'mattslash'},
        ['Punch']             = {'characters/ECHOS/MattStand_Attack_Orange', 'attack'},
        ['Rev Punch']         = {'characters/ECHOS/MattStand_Attack_Rev', 'attack'},
        ['Paper Punch Pixel'] = {'characters/ECHOS/MattStand_Attack_Remix', 'attack'},
        ['Paper Punch']       = {'characters/ECHOS/MattStand_Attack_Remix', 'attack'},
        ['Punch Paper']       = {'characters/ECHOS/MattStand_Attack_Remix', 'attack'},
        ['Green Punch']       = {'characters/ECHOS/MattStand_Attack_Green', 'attack'},
        ['MattYellowPunch']   = {'characters/ECHOS/Echo Matt Wiik 3 VIP', 'attack'},
        ['vipWiik3']          = {'characters/ECHOS/Echo Matt Wiik 3 VIP', 'attack'},
        ['vipWiik4']          = {'characters/ECHOS/Echo Matt Wiik 4 VIP', 'mattslash'},
        ['whiteWiik4']        = {'characters/ECHOS/WhiteMattSlash', 'mattslash'}
    }

    for i = 1, #echos do
        local name = echos[i][2]
        local animName, spritesheet = 'attack', 'characters/ECHOS/MattStand_Attack'

        if name == 'purpleWiik2' then
            spritesheet = 'characters/ECHOS/Wiik 2 Echo'
            makeAnimatedPerspectiveSprite('splash'..i, 'characters/ECHOS/Splash', 0, 0)
            addActorAnimation('splash'..i, 'splash', 'splash', 24, false)
            setActorVisible(false, 'splash'..i)
            makeAnimatedPerspectiveSprite('echoglove'..i, 'characters/ECHOS/EchoGlove', 0, 0)
            addActorAnimation('echoglove'..i, 'echoglove', 'echoglove', 24, true)
            setActorVisible(false, 'echoglove'..i)
            setActorAngle(45, 'echoglove'..i)
        else
            local data = nameToSheet[name]
            if data then
                spritesheet, animName = data[1], data[2]
            end
        end
        makeAnimatedPerspectiveSprite('echo'..i, spritesheet, 0, 0)
        addActorAnimation('echo'..i, 'attack', animName, 24, false)
        setActorVisible(false, 'echo'..i)
        setActorScale(1.5, 'echo'..i)

        if songLower == 'hyper destination 3' or songLower == 'final destination old' or songLower == 'vc disadvantage' then
            setActorFlipX(true, 'echo'..i)
             echos[i][7] = true
            echoDirectionFlip = true
        end
    end
end


function update(elapsed)
    for i = 1,#echos do
        if songPos >= echos[i][1] - echos[i][6] and not echos[i][3] then
            local echoType = echos[i][2]
            local echoID = 'echo'..i

            local offsetX, offsetY = -830, -60 --default
            local typeOffsets = {
                ['purpleWiik4'] = {x = -1000, y = -320},
                ['Green Sword'] = {x = -1000, y = -350},
                ['Punch Paper'] = {x = -830, y = 0},
                ['MattYellowPunch'] = {x = -900, y = 30},
                ['Punch'] = {x = -830, y = 0},
                ['Paper Punch'] = {x = -830, y = 0},
                ['Paper Punch Pixel'] = {x = -830, y = 0},
                ['Paper Sword'] = {x = -1000, y = -300},
                ['Orange Sword'] = {x = -1000, y = -300},
                ['Green Punch'] = {x = -700, y = -85},
                ['whiteWiik4'] = {x = -1000, y = -320},
                ['vipWiik4'] = {x = -1000, y = -450},
            }
            if typeOffsets[echoType] then
                offsetX = typeOffsets[echoType].x
                offsetY = typeOffsets[echoType].y
            end
            if echoType == 'purpleWiik4' and songLower == "vc disadvantage" then
                offsetX = -1200
                offsetY = -320
            elseif echoType == 'purpleWiik2' then
                offsetY = -450 + math.random(-150, 100)
            elseif echoType == 'vipWiik4' and songLower == "rejected vip" and curStep >= 9824 and curStep < 10336 then
                offsetX = -1200
                offsetY = -450
            elseif echoType == 'vipWiik3' and songLower == "rejected vip" and curStep >= 9824 and curStep < 10336 then
                offsetX = -800
                offsetY = -150
            end
            
            setActorFlipX(echos[i][7], echoID)

                    if echos[i][8] then
                    --set('echo'..i..'.angle', 10)
                    --set('echo'..i..'.angleY', -25)
                   -- setActorScale(1.25, 'echo'..i)
                    --set('echo'..i..'.y', getActorY("boyfriend")-70)
                else
                    --set('echo'..i..'.angle', 0)
                    --set('echo'..i..'.angleY', 0)
                   --setActorScale(1, 'echo'..i)
                end

            if  getActorFlipX(echoID) then
                offsetX = offsetX + getActorWidth(echoID) + 70
                if echoType == 'purpleWiik2' then
                    offsetX = offsetX + 1050
                end
            end
            local bfX, bfY = getActorX('boyfriend'), getActorY('boyfriend')
            setActorPos(bfX + offsetX + math.random(-100, 150), bfY + offsetY + math.random(-20, 20), echoID)
            setActorVisible(true, echoID)
            playActorAnimation(echoID, 'attack', true)
            setActorLayer(echoID, getActorLayer(songLower == "rejected vip" and 'bfCharacter1' or 'boyfriend') + 1)
            echos[i][3] = true
        end

        if echos[i][2] == 'purpleWiik2' then
            if songPos >= echos[i][1] and not echos[i][7] then
                local echoID = 'echo'..i
                local gloveID = 'echoglove'..i
                local bfX, bfY = getActorX('boyfriend'), getActorY('boyfriend') + 250
                local echoX, echoY = getActorX(echoID), getActorY(echoID) + 100
                local offsetX = getActorWidth(echoID) - 250
                setActorPos(echoX + offsetX, echoY, gloveID)
                if getActorFlipX(echoID) then
                    setActorPos(echoX, echoY, gloveID)
                end
                setActorVisible(true, gloveID)
                playActorAnimation(gloveID, 'echoglove', true)
                local ang = math.deg(math.atan2(getActorX(gloveID) - bfX, getActorY(gloveID) - bfY))
                if getActorFlipX(echoID) then ang = ang - 180 end
                setActorAngle(ang + 180, gloveID)
                tweenActorProperty(gloveID, 'x', bfX, 0.1)
                tweenActorProperty(gloveID, 'y', bfY, 0.1)
                echos[i][7] = true
            end
            if songPos >= echos[i][1] + 100 and not echos[i][8] then
                local splashID = 'splash'..i
                local bfX, bfY = getActorX('boyfriend'), getActorY('boyfriend')
                setActorVisible(false, 'echoglove'..i)
                setActorPos(bfX - 130, bfY + 190, splashID)
                setActorVisible(true, splashID)
                playActorAnimation(splashID, 'splash', true)
                setActorLayer(splashID, getActorLayer('boyfriend'))
                echos[i][8] = true
            end
        end
        if songPos >= echos[i][1]+500 and not echos[i][4] then 
            if echos[i][2] == 'purpleWiik2' then
            end
            tweenFadeOut('echo'..i, 0, 1)
            echos[i][4] = true
        end
        if songPos >= echos[i][1]+2000 and not echos[i][5] then 
            destroySprite('echo'..i)
            if echos[i][2] == 'purpleWiik2' then
                destroySprite('splash'..i)
                setActorVisible(false, 'echoglove'..i)
                destroySprite('echoglove'..i)

            end
            echos[i][5] = true
        end
    end
end
function onEvent(name, position, value1, value2)
    if name == 'flip echo direction' then 
        echoDirectionFlip = not echoDirectionFlip
    end
end