package ui;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;

using StringTools;

class FreeplayTxt extends FlxText {
    public var delay:Float = 0.05;
    public var paused:Bool = false;
    public var targetY:Float = 0;
    public var isMenuItem:Bool = false;
    private var _finalText:String = "";
    private var _curText:String = "";
    private var yMulti:Float = 1;
    private var splitWords:Array<String> = [];
    private var isBold:Bool = false;
    private var isTyped:Bool = false;

    public function new(x:Float, y:Float, text:String = "", ?bold:Bool = false, typed:Bool = false) {
        var fontSize:Int = bold ? 64 : 48;
        super(x, y, FlxG.width, "", fontSize); // usamos FlxText directo

        _finalText = text;
        this.text = "";
        isBold = bold;
        isTyped = typed;

        // formato inicial
        setFormat(Paths.font("EurostileExtendedBlack.ttf"), fontSize, 0xFF000000, "left");
        borderStyle = FlxTextBorderStyle.OUTLINE;
        borderColor = 0xFFFFFFFF;
        borderSize = 2;

        if (text != "") {
            if (typed) {
                startTypedText();
            } else {
                addText();
            }
        }
    }

    public function addText() {
        text = _finalText; // en FlxText basta asignar el texto
    }

    public function doSplitWords():Void {
        splitWords = [];
        for (i in 0..._finalText.length) {
            splitWords.push(_finalText.substr(i, 1));
        }
    }


   public function startTypedText():Void {
        doSplitWords();
        text = "";

        for (loopNum in 0..._finalText.length) {
            new FlxTimer().start(0.05 + (0.05 * loopNum), function(tmr:FlxTimer) {
                if (this != null && this.active && this.visible && this.alpha != 0) {
                    text += splitWords[loopNum];
                }
            });
        }
    }


    override function update(elapsed:Float) {
        if (isMenuItem) {
            var scaledY = FlxMath.remapToRange(targetY, 0, 1, 0, 1.3);
            var lerpVal:Float = CoolUtil.boundTo(elapsed * 9.6, 0, 1);
            y = FlxMath.lerp(y, (scaledY * 120) + (FlxG.height * 0.48), lerpVal);
            x = FlxMath.lerp(x, (targetY * 20) + 90, lerpVal);
        }
        super.update(elapsed);
    }
}
