function createPost() {
    var healthBarPosY = FlxG.height * 0.9;

    if (Options.getData("downscroll"))
        healthBarPosY = 60;

    var songName = PlayState.SONG.song.toLowerCase();

    if (PlayState.SONG.ui_Skin == "default" && songName == "rejected ps") {
        PlayState.instance.healthBarBG.loadGraphic(Paths.image("Unt0ld"));
        PlayState.instance.healthBarBG.screenCenter(0x01);
        PlayState.instance.healthBarBG.scrollFactor.set();
        PlayState.instance.healthBarBG.pixelPerfectPosition = true;
        PlayState.instance.healthBarBG.y = healthBarPosY;
        PlayState.instance.healthBarBG.offset.y += 50;
        PlayState.instance.healthBar.y = PlayState.instance.healthBarBG.y + 10;
        PlayState.instance.healthBar.scale.set(1.025, 1.51);

        var layer = 1; 
        var layerIcons = 2;

        if (PlayState.instance.iconP2 != null) {
            PlayState.instance.remove(PlayState.instance.iconP2);
            PlayState.instance.insert(layerIcons, PlayState.instance.iconP2);
        }
        if (PlayState.instance.iconP1 != null) {
            PlayState.instance.remove(PlayState.instance.iconP1);
            PlayState.instance.insert(layerIcons, PlayState.instance.iconP1);
        }
        if (PlayState.instance.healthBarBG != null) {
            PlayState.instance.remove(PlayState.instance.healthBarBG);
            PlayState.instance.insert(layer, PlayState.instance.healthBarBG);
        }
        if (PlayState.instance.healthBar != null) {
            PlayState.instance.remove(PlayState.instance.healthBar);
            PlayState.instance.insert(layer, PlayState.instance.healthBar);
        }

    }
}
