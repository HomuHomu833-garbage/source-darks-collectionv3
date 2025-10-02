import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.VarTween;
import lime.app.Application;
import flixel.util.FlxTimer;

var oldX:Int = 0;
var oldY:Int = 0;
var time:Float = 0; 
var ampX:Float = 150;
var ampY:Float = 80; 
var centerX:Int = 0;
var centerY:Int = 0;

function createPost(){
    FlxG.fullscreen = false; 
    oldX = FlxG.stage.window.x;
    oldY = FlxG.stage.window.y;
    centerX = oldX;
    centerY = oldY;
}
function update(elapsed:Float) {
    
    if (curStep >= 16 && curStep < 128) {
        time += elapsed * 5;

        var win = Application.current.window;

        var moveX = Math.sin(time) * ampX;
        var moveY = Math.sin(time) * Math.cos(time) * ampY;

        win.x = Std.int(centerX + moveX);
        win.y = Std.int(centerY + moveY);
    }
}