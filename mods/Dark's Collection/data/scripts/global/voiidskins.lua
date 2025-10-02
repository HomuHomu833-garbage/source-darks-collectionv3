function createPost()
    if get("SONG.ui_Skin") == 'voiid' or get("SONG.ui_Skin") == 'pixelvoiid' then
        setActorLayer('healthBar', getActorLayer('healthBarBG'))
        if get("SONG.song") == "Rejected VIP" then

            set("healthBar.scale.x", get("healthBar.scale.x") * 1.74)
        end
    end
    if get("SONG.ui_Skin") == 'default' then
        if get("SONG.song") == "Rejected PS" then
            setActorLayer('healthBar', getActorLayer('healthBarBG'))
        end
    end
end
