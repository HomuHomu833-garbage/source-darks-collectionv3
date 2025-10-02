import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import openfl.display.BlendMode;

var bg:FlxBackrop;


function onEvent(name, position, value1, value2) {
    if(name.toLowerCase() == "toggle checker bg"){
        FlxTween.tween(bg, {alpha: Std.parseFloat(value1)}, Std.parseFloat(value2));
    }
}

function createPost(){
    bg = new FlxBackdrop(FlxGridOverlay.createGrid(40, 40, FlxG.width, FlxG.height, true, FlxColor.BLACK, FlxColor.WHITE));
    bg.blend = BlendMode.fromString("add");
    bg.scale.set(4,4);
    bg.alpha = 0;
    bg.velocity.set(Conductor.crochet);
    PlayState.instance.addBehindGF(bg);
}