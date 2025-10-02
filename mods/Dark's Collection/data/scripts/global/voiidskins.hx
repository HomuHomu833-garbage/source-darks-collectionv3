
var perroxd:FlxText = null; 

function createPost() {
    var healthBarPosY = Options.getData("downscroll") ? 60 : FlxG.height * 0.9;
    var uiSkin = PlayState.SONG.ui_Skin;
    var songName = PlayState.SONG.song.toLowerCase(); 

    var isVoiidBar = (uiSkin == "voiid" || uiSkin == "pixelvoiid");
    var useRejectedBar = (songName == "rejected vip"); 

    if (isVoiidBar) { 
       var isFinalDestination = (songName == "vc final destination");
        var healthBarImage = useRejectedBar ? "rejectedbar" : (isFinalDestination ? "newHealthBarGod" : "newHealthBar");


        PlayState.instance.healthBarBG.loadGraphic(Paths.image(healthBarImage));
        PlayState.instance.healthBarBG.screenCenter(0x01);
        PlayState.instance.healthBarBG.scrollFactor.set();
        PlayState.instance.healthBarBG.pixelPerfectPosition = true;
        PlayState.instance.healthBarBG.y = healthBarPosY;
        PlayState.instance.healthBarBG.offset.y += 8;
        PlayState.instance.healthBarBG.offset.x -= 10;
        PlayState.instance.healthBar.y = PlayState.instance.healthBarBG.y + 10;
        PlayState.instance.healthBar.scale.set(1.025, 1.7);
        
        PlayState.instance.healthBar.updateHitbox();

        if (PlayState.instance.iconP2 != null) {//layers
            PlayState.instance.remove(PlayState.instance.iconP2);
            PlayState.instance.insert(2, PlayState.instance.iconP2);
        }
        if (PlayState.instance.iconP1 != null) {
            PlayState.instance.remove(PlayState.instance.iconP1);
            PlayState.instance.insert(2, PlayState.instance.iconP1);
        }
        if (PlayState.instance.healthBarBG != null) {
            PlayState.instance.remove(PlayState.instance.healthBarBG);
            PlayState.instance.insert(1, PlayState.instance.healthBarBG);
        }
        if (PlayState.instance.healthBar != null) {
            PlayState.instance.remove(PlayState.instance.healthBar);
            PlayState.instance.insert(1, PlayState.instance.healthBar);
        }
        if (useRejectedBar && perroxd == null) {
            perroxd = new FlxText(100, 75, 500, "", 32);
            perroxd.setFormat("vcr.ttf", 32, FlxColor.WHITE);
            perroxd.scrollFactor.set();
            perroxd.cameras = [PlayState.instance.camHUD];
            PlayState.instance.add(perroxd);
            if (Options.getData("downscroll")) {
                perroxd.y = 600;  
            }
            PlayState.instance.healthBarBG.offset.y += 40;
            PlayState.instance.healthBar.scale.set(1.79, 1.51); 
            PlayState.instance.minHealth = 0;
            PlayState.instance.maxHealth = 5;
            PlayState.instance.health = 2.5;
            PlayState.instance.healthBar.setRange(0, 5);
            PlayState.instance.healthBar.x += -225;    
            PlayState.instance.healthBar.updateHitbox();
        }
        else if (!useRejectedBar && perroxd != null) {
            PlayState.instance.remove(perroxd);
            perroxd = null;
        }
    }
}

function update(elapsed:Float) {
    if (perroxd != null) {
        perroxd.text = "Health: " + Std.string(FlxMath.roundDecimal(PlayState.instance.health * 50));
    }
}
