package ui;

import ui.TextShader;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import haxe.Json;
import flixel.math.FlxMath;
import game.FreeplaySong;
import ui.TextShader;
import utilities.FlxTextFix;

using StringTools;

class DesingText extends FlxTextFix  {
	public var textShaderWrapper:TextShader; // referencia al wrapper del shader

	public var border1Size:Float = 7;
	public var border1Color:FlxColor = 0xFF0000FF;
	public  var targetY:Float = 0;
	public  var targetX:Float = 0;
	public  var isMenuItem:Bool = false;
	public var border2Size:Float = 3;
	public var border2Color:FlxColor = 0xFFFF0000;
	public var scaleX:Float = 1.0;
	public var scaleY:Float = 1.0;

	public var borderIterations:Int = 25;

	public var childText:DesingText;

	override function regenGraphic():Void {
		if (textField == null || !_regen)
			return;

		var oldWidth:Int = 0;
		var oldHeight:Int = FlxText.VERTICAL_GUTTER;

		if (graphic != null) {
			oldWidth = graphic.width;
			oldHeight = graphic.height;
		}

		var newWidth:Int = Math.ceil(textField.width + ((border1Size + border2Size) * 5));
		var textfieldHeight = _autoHeight ? textField.textHeight : textField.height;
		var vertGutter = _autoHeight ? FlxText.VERTICAL_GUTTER : 0;
		var newHeight:Int = Math.ceil(textfieldHeight + ((border1Size + border2Size) * 5)) + vertGutter;

		if (textField.textHeight == 0) {
			newHeight = oldHeight;
		}

		if (oldWidth != newWidth || oldHeight != newHeight) {
			height = newHeight;
			var key:String = FlxG.bitmap.getUniqueKey("text");
			makeGraphic(newWidth, newHeight, FlxColor.TRANSPARENT, false, key);

			if (_hasBorderAlpha)
				_borderPixels = graphic.bitmap.clone();

			if (_autoHeight)
				textField.height = newHeight;

			_flashRect.x = 0;
			_flashRect.y = 0;
			_flashRect.width = newWidth;
			_flashRect.height = newHeight;
		} else {
			graphic.bitmap.fillRect(_flashRect, FlxColor.TRANSPARENT);
			if (_hasBorderAlpha) {
				if (_borderPixels == null)
					_borderPixels = new BitmapData(frameWidth, frameHeight, true);
				else
					_borderPixels.fillRect(_flashRect, FlxColor.TRANSPARENT);
			}
		}

		if (textField != null && textField.text != null && textField.text.length > 0) {
			copyTextFormat(_defaultFormat, _formatAdjusted);

			_matrix.identity();

			borderColor = border1Color;
			borderSize = border1Size;
			applyBorderStyle();
			applyBorderTransparency();

			borderColor = border2Color;
			borderSize = border2Size;
			applyBorderStyle();
			applyBorderTransparency();
			applyFormats(_formatAdjusted, false);

			drawTextFieldTo(graphic.bitmap);
		}

		_regen = false;
		resetFrame();
	}

	override function drawTextFieldTo(graphic:BitmapData):Void {
		_matrix.translate((border1Size + border2Size) * 2, (border1Size + border2Size) * 2);
		graphic.draw(textField, _matrix);
		_matrix.translate(-(border1Size + border2Size) * 2, -(border1Size + border2Size) * 2);
	}

	override function applyBorderStyle():Void {
		var iterations:Int = Std.int(borderSize * borderQuality);
		if (iterations <= 0) {
			iterations = 1;
		}
		var delta:Float = borderSize / iterations;

		applyFormats(_formatAdjusted, true);

		var curDelta:Float = delta;
		var graphic:BitmapData = _hasBorderAlpha ? _borderPixels : graphic.bitmap;

		iterations = borderIterations;
		for (i in 0...iterations) {
			var ang = (360 / iterations) * i * (Math.PI / 180);
			var x = Math.cos(ang) * borderSize;
			var y = Math.sin(ang) * borderSize;
			_matrix.translate(-x, -y);
			drawTextFieldTo(graphic);
			_matrix.translate(x, y);
		}
	}

	override public function draw():Void {
    super.draw();
    if (childText != null) {
        childText.cameras = cameras;
        childText.scale.set(scale.x * 0.75, scale.y * 0.75);
        childText.updateHitbox();
        childText.x = x + (width * 0.5) - (childText.width * 0.45);
        var yOffset = (height * 0.5) - (childText.height * 0.2);
        if (Options.getData("downscroll")) {
            yOffset = 0;
        }
        childText.y = y + yOffset;
        childText.draw();
    }
}
	public function updateShaderFade(curSelected:Int, index:Int):Void {
		if (textShaderWrapper == null) return;

		var distance:Int = Std.int(Math.abs(index - curSelected));

		var opacityValues = [1.0, 0.5, 0.25];
		textShaderWrapper.opacity = (distance < opacityValues.length) ? opacityValues[distance] : 0.0;

		var scale = Math.max(0.5, 1 - 0.2 * distance);
		this.scale.set(scale, scale);

		textShaderWrapper.selectedIndex = curSelected;
		textShaderWrapper.update(FlxG.elapsed);
	}

	

	static var defaultData:String = '{
		"outerBorderTop": "#000000",
		"outerBorderBot": "#000000",
		"midBorderTop": "#c735ff",
		"midBorderBot": "#6414ea",
		"innerBorderTop": "#3f3f3f",
		"innerBorderBot": "#121617"
	}';

	public static function createSongText(x:Float, y:Float, song:String, size:Int, spacing:Float, ?data:SongTextExtraData, ?alpha:Float = 1.0):DesingText {
		var isVIP = false;
		if (StringTools.endsWith(song, " VIP")) {
			isVIP = true;
			song = StringTools.replace(song, " VIP", "");
		}

		if (data == null) {
			data = Json.parse(defaultData);
		}

		var songText = new DesingText(0, 0, 0, song.toUpperCase(), size);
		songText.borderStyle = OUTLINE;
		songText.letterSpacing = spacing;
		songText.borderSize = 5;

		if (data.outerBorderSize != null) songText.border1Size = data.outerBorderSize;
		if (data.midBorderSize != null) songText.border2Size = data.midBorderSize;
		if (data.innerBorderSize != null) songText.borderSize = data.innerBorderSize;

		var shader = new TextShader();
		songText.shader = shader.shader;

		songText.textShaderWrapper = shader;
		shader.outerColorTop = getColorArray(data.outerBorderTop, 0);
		shader.outerColorBot = getColorArray(data.outerBorderBot, 0);
		shader.midColorTop = getColorArray(data.midBorderTop, -0.1);
		shader.midColorBot = getColorArray(data.midBorderBot, 0.1);
		shader.innerColorTop = getColorArray(data.innerBorderTop, -0.3);
		shader.innerColorBot = getColorArray(data.innerBorderBot, 0.3);
		
		shader.mixGap = (data.mixGap != null) ? data.mixGap : 2.0;
		shader.strength = (data.sobelStrength != null) ? data.sobelStrength : 0.0;
		shader.intensity = (data.sobelIntensity != null) ? data.sobelIntensity : 0.0;
		shader.opacity = ((data.opacity != null) ? data.opacity : 1.0) * alpha; 

		songText.screenCenter();
		songText.color = 0xFF00FF00;
		songText.antialiasing = true;

		if (isVIP) {
			var vipText = new DesingText(0, 0, 0, "VIP", size);
			vipText.borderStyle = OUTLINE;
			vipText.letterSpacing = 80;
			vipText.borderSize = 5;
			vipText.font = Paths.font("dumbnerd.ttf");
			vipText.screenCenter();
			vipText.color = 0xFF00FF00;
			vipText.antialiasing = true;
			songText.childText = vipText;

			var vipShader = new TextShader();
			vipText.shader = vipShader.shader;

			vipShader.outerColorTop = getColorArray(data.outerBorderTopVIP, 0);
			vipShader.outerColorBot = getColorArray(data.outerBorderBotVIP, 0);
			vipShader.midColorTop = getColorArray(data.midBorderTopVIP, -0.1);
			vipShader.midColorBot = getColorArray(data.midBorderBotVIP, 0.1);
			vipShader.innerColorTop = getColorArray(data.innerBorderTopVIP, -0.3);
			vipShader.innerColorBot = getColorArray(data.innerBorderBotVIP, 0.3);

			vipShader.strength = 0;
			vipShader.intensity = 0;
			vipShader.mixGap = 2.0;
			vipShader.opacity = 1.0 * alpha; 
		}

		return songText;
	}



	override function update(elapsed:Float) {
		if (isMenuItem) {
			var scaledY = FlxMath.remapToRange(targetY, 0, 1, 0, 1.3);
			var lerpVal:Float = CoolUtil.boundTo(elapsed * 9.6, 0, 1);
			y = FlxMath.lerp(y, (scaledY * 90) + (FlxG.height * 0.48), lerpVal);
			x = FlxMath.lerp(x, targetX, lerpVal);
		}
		super.update(elapsed);
	}

	public static function getColorArray(colorString:String, offset:Float):Array<Float> {
		var col:FlxColor = FlxColor.fromString(colorString);
		var red = (col >> 16) & 0xff;
		var green = (col >> 8) & 0xff;
		var blue = (col) & 0xff;
		return [red / 255 * (1 + offset), green / 255 * (1 + offset), blue / 255 * (1 + offset)];
	}
}
