local dodgeAnim = 0
local dodgeMap = {
	{'singLEFT', 'dodgeLEFT'},
	{'singDOWN', 'dodgeDOWN'},
	{'singUP', 'dodgeUP'},
	{'singRIGHT', 'dodgeRIGHT'}
}
function playerOneSing(a,b,c,d)
    if c == "Voiid Punch" or c == "Voiid Punch 2" or c == "Punch" or c == "VC Bullet" or c == "Sword" then --- el "or c ==" se puede repetir por si las dudas
        dodgeAnim = dodgeAnim + 1
        local anim = dodgeAnim%4
        playCharacterAnimation('boyfriend', dodgeMap[anim+1][2], true)
        setCharacterPreventDanceForAnim('boyfriend', true)
    end
end