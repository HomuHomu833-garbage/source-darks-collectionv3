local ang = {90, 0, 180, -90}
function createPost()
	local noteCount = getUnspawnNotes()
    for i = 0,noteCount-1 do 
        local nt = getUnspawnedNoteNoteType(i)
        local st = getUnspawnedNoteStrumtime(i)
        if not getUnspawnedNoteSustainNote(i) then 
			if nt == 'Punch' then 
				local d = getSingDirectionID(getUnspawnedNoteNoteData(i))
				setUnspawnedNoteAngle(i, ang[d+1])
			end
        end
		if nt == 'Punch' then 
			setUnspawnedNoteSingAnimPrefix(i, 'dodge')
		end
    end
end
local doChrom = true
function create()
	
	local blackListedSongs = 
	{
		'king hit'
	} 

	for i = 0,#blackListedSongs-1 do 
		if songLower == blackListedSongs[i+1] then 
			doChrom = false
		end
	end

end
