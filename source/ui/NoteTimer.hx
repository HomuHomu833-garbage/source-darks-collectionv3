package ui;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxShader;
import flixel.math.FlxMath;
import game.Conductor;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import states.PlayState;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

using flixel.util.FlxSpriteUtil;

class BarShader extends FlxShader
{
    @:glFragmentSource('
        #pragma header
        uniform float percent;

        void main()
        {
            vec2 uv = openfl_TextureCoordv;
            vec4 color = flixel_texture2D(bitmap, uv);

            float center = 0.5;
            float halfWidth = max(percent * 0.5, 0.001);

            if (uv.x < center - halfWidth || uv.x > center + halfWidth)
                discard;

            gl_FragColor = color;
        }
    ')

    public function new()
    {
        super();
    }
}

class NoteTimer extends FlxTypedSpriteGroup<FlxSprite>
{
    private var instance:PlayState;
    private var timerText:FlxText;
    private var timerBar:FlxSprite;
    private var barShader:BarShader = new BarShader();
    private var barBG:FlxSprite;
    private var skipText:FlxText;
    private var firstNoteTime:Float = 0;
    private var lastStartTime:Float = FlxMath.MAX_VALUE_FLOAT;
    public var skipped:Bool = false;

    public function new(instance:PlayState)
    {
        super();
        this.instance = instance;

        if (!Options.getData("noteTimer"))
        {
            skipped = true;
            destroy();
            return;
        }

        barBG = new FlxSprite().makeGraphic(240, 14, FlxColor.BLACK);
        barBG.antialiasing = true;
        barBG.scale.set(0.65, 1.3);
        barBG.updateHitbox();

        timerBar = new FlxSprite().makeGraphic(240, 14, FlxColor.WHITE);
        timerBar.antialiasing = true;
        timerBar.shader = barShader;
        timerBar.scale.set(0.65, 0.65);
        timerBar.updateHitbox();

        add(barBG);
        add(timerBar);

        timerText = new FlxText(0, 0, 0, "");
        timerText.setFormat(Paths.font("consola.ttf"), 22, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(timerText);

        skipText = new FlxText(0, 0, 0, "PRESS SHIFT TO SKIP INTRO");
        skipText.setFormat(Paths.font("consola.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(skipText);
        skipText.visible = false;

        timerBar.alpha = 0;
        barBG.alpha = 0;
        timerText.alpha = 0;


       updatePosition();

        barShader.percent.value = [0.0];

        firstNoteTime = getClosestNote();

        if (Options.getData("skipTimer") && firstNoteTime != FlxMath.MAX_VALUE_FLOAT && firstNoteTime > 5000)
        {
            skipped = false;
            skipText.visible = true;
            skipText.alpha = 0;

            PlayState.instance.tweenManager.tween(skipText, {alpha: 1}, 1, {
                ease: FlxEase.cubeInOut,
                startDelay: Conductor.crochet * 0.001 * 5,
                onComplete: function(twn)
                {
                    PlayState.instance.tweenManager.tween(skipText, {alpha: 0}, 1, {
                        ease: FlxEase.cubeIn,
                        startDelay: Conductor.crochet * 0.001 * 5
                    });
                }
            });
        }
        else
            skipped = true;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (skipped)
            skipText.visible = false;

        var timeTillNextNote:Float = FlxMath.MAX_VALUE_FLOAT;
        var targetAlpha:Float = 0.0;

        if (instance != null)
        {
            if (Conductor.songPosition > 0)
            {
                for (daNote in instance.notes)
                    if (daNote.mustPress == (PlayState.characterPlayingAs == 0))
                    {
                        var timeDiff = daNote.strumTime - Conductor.songPosition;
                        if (timeDiff < timeTillNextNote)
                            timeTillNextNote = timeDiff;
                    }

                if (timeTillNextNote == FlxMath.MAX_VALUE_FLOAT)
                {
                    for (daNote in instance.unspawnNotes)
                        if (daNote.mustPress == (PlayState.characterPlayingAs == 0))
                        {
                            var timeDiff = daNote.strumTime - Conductor.songPosition;
                            if (timeDiff < timeTillNextNote)
                            {
                                timeTillNextNote = timeDiff;
                                break;
                            }
                        }
                }

                var show:Bool = (timeTillNextNote != FlxMath.MAX_VALUE_FLOAT);

                if (show)
                {
                    if (lastStartTime == FlxMath.MAX_VALUE_FLOAT && timeTillNextNote > 3000)
                        lastStartTime = timeTillNextNote;

                    if (lastStartTime != FlxMath.MAX_VALUE_FLOAT)
                    {
                        var secsLeft:Float = Math.ceil(timeTillNextNote * 0.001);
                        var percent:Float = FlxMath.bound(timeTillNextNote / lastStartTime, 0, 1);

                        if (percent <= 0)
                        {
                            lastStartTime = FlxMath.MAX_VALUE_FLOAT;
                            barShader.percent.value = [0.0];
                            timerText.text = "";
                            targetAlpha = 0.0;
                        }
                        else
                        {
                            barShader.percent.value = [percent];
                            timerText.text = "" + secsLeft;

                            if (timeTillNextNote <= 1000)
                                targetAlpha = 0.0;
                            else
                                targetAlpha = 1.0;
                        }

                        updatePosition();
                    }

                    if (FlxG.keys.justPressed.SHIFT && !skipped && Conductor.songPosition < firstNoteTime - 1000)
                        skipToTime(firstNoteTime - 1000);
                }
                else
                {
                    barShader.percent.value = [0.0];
                    timerText.text = "";
                    targetAlpha = 0.0;
                }

                timerText.alpha = FlxMath.lerp(timerText.alpha, targetAlpha, elapsed * 4);
                timerBar.alpha = timerText.alpha;
                barBG.alpha = timerText.alpha;
            }
        }
    }

    function updatePosition()
    {
        skipText.x = FlxG.width - skipText.width - 20;
        skipText.y = utilities.Options.getData("downscroll")
            ? 20
            : FlxG.height - skipText.height - 20;

        timerBar.x = (FlxG.width - timerBar.width) / 2;
        timerBar.y = utilities.Options.getData("downscroll")
            ? (FlxG.height - timerBar.height - 80)
            : 80;

        barBG.x = timerBar.x;
        barBG.y = timerBar.y + (timerBar.height - barBG.height) / 2;

        timerText.x = timerBar.x + (timerBar.width - timerText.width) / 2;
        timerText.y = timerBar.y + (timerBar.height - timerText.height) / 2;
    }


    public function getClosestNote()
    {
        var t:Float = FlxMath.MAX_VALUE_FLOAT;
        for (daNote in instance.notes)
        {
            var timeDiff = daNote.strumTime;
            if (timeDiff < t)
                t = timeDiff;
        }

        for (daNote in instance.unspawnNotes)
        {
            var timeDiff = daNote.strumTime;
            if (timeDiff < t)
                t = timeDiff;
        }
        return t;
    }

    public function skipToTime(time:Float)
    {
        if (skipped)
            return;
        skipped = true;
        var timeDiff = time - Conductor.songPosition;
        var addedTime = Conductor.songPosition;

        while (timeDiff > 0)
        {
            var timeToAdd = Conductor.stepCrochet;
            var ending:Bool = false;
            if (timeDiff <= timeToAdd)
            {
                timeToAdd = timeDiff;
                ending = true;
            }
            timeDiff -= timeToAdd;
            FlxG.state.update(timeToAdd * 0.001);
            addedTime += timeToAdd;
            Conductor.songPosition = addedTime;
            if (ending)
            {
                timeDiff = 0;
                Conductor.songPosition = time;
                FlxG.sound.music.time = time;
                break;
            }
        }
    }
}
