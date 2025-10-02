import openfl.display.BlendMode;
import flixel.math.FlxMath;
import openfl.Assets; 
import flixel.addons.display.FlxRuntimeShader;
import flixel.text.FlxTextBorderStyle;

var strength:Float = 0.0;
var shaderp1:FlxRuntimeShader;
var shaderp2:FlxRuntimeShader;

function createPost():Void {
    var corruptedBar = (PlayState.SONG.ui_Skin == "Corrupted" || PlayState.SONG.ui_Skin == "Corrupted Glitched");

    if (corruptedBar) {
        var frag:String = "ChromAbEffect"; 
        var vert:String = "ChromAbEffect"; 
        var vertSrc:String = Assets.exists(Paths.vert(vert)) ? Assets.getText(Paths.vert(vert)) : null;

        shaderp1 = new FlxRuntimeShader(Assets.getText(Paths.frag(frag)), vertSrc);
        shaderp2 = new FlxRuntimeShader(Assets.getText(Paths.frag(frag)), vertSrc);

        var ps = PlayState.instance;
        var textObjects = [ps.scoreTxt, ps.ratingSuffix, ps.accText, ps.ratingText];
        for (txt in textObjects) {
            txt.setFormat(Paths.font("droidbold.ttf"), 18, FlxColor.WHITE);
            txt.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.2);
        }
        ps.timeBar.text.setFormat(Paths.font("droidbold.ttf"), 28, FlxColor.WHITE);
        ps.timeBar.text.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.2);
        
        ps.healthBarBG.loadGraphic(Paths.image("full"));
        ps.healthBarBG.scale.set(0.6, 0.6);
        ps.healthBarBG.screenCenter(FlxG.ALIGN_CENTER);
        ps.healthBarBG.scrollFactor.set(0, 0);
        ps.healthBarBG.pixelPerfectPosition = true;
        ps.healthBarBG.y = Options.getData("downscroll") ? 60 : FlxG.height * 0.9;
        ps.healthBarBG.offset.y += 230;

        ps.healthBar.blend = BlendMode.MULTIPLY;
        ps.healthBar.x -= 63;
        ps.healthBar.y -= 80;
        ps.healthBar.scale.set(1.2, 9.9);
        ps.healthBar.alpha = 0.6;

        if (ps.iconP1 != null) {
            ps.remove(ps.iconP1);
            ps.insert(2, ps.iconP1);
            ps.iconP1.scale.set(2, 5);
            ps.iconP1.shader = shaderp1;
        }

        if (ps.iconP2 != null) {
            ps.remove(ps.iconP2);
            ps.insert(2, ps.iconP2);
            ps.iconP2.shader = shaderp2;
        }

        if (ps.healthBarBG != null) {
            ps.remove(ps.healthBarBG);
            ps.insert(1, ps.healthBarBG);
        }

        if (ps.healthBar != null) {
            ps.remove(ps.healthBar);
            ps.insert(2, ps.healthBar);
        }

        ps.healthBar.updateHitbox();
    }
}

function update(elapsed:Float):Void {
    var corruptedBar = (PlayState.SONG.ui_Skin == "Corrupted" || PlayState.SONG.ui_Skin == "Corrupted Glitched");
    var ps = PlayState.instance;

    if (corruptedBar) {
        if (shaderp1 != null)
            shaderp1.setFloat("strength", Math.abs(ps.health - 2) / 250 + strength);
        if (shaderp2 != null)
            shaderp2.setFloat("strength", (ps.health / 250) + strength);

        if (ps.iconP1 != null)
            ps.iconP1.x = ps.healthBarBG.x + 920;

        if (ps.iconP2 != null)
            ps.iconP2.x = ps.healthBarBG.x + 260;
    }
}
