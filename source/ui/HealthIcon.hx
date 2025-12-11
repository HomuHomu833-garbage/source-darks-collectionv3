package ui;

import flixel.FlxSprite;
import haxe.Json;
import lime.utils.Assets;
import flixel.FlxG;
import toolbox.CharacterCreator;

class HealthIcon extends TrackerSprite {
	public var isPlayer:Bool = false;
	public var animatedIcon:Bool = false;
	public var offsetX:Float = 0.0;
	public var offsetY:Float = 0.0;
	public var startSize:Float = 1;
	public var char(default, null):String = "placeholder";

	public var extraIcons:Array<FlxSprite> = [];
	public var extraOffsets:Array<Array<Float>> = [];
	public var iconOffset:Array<Float> = [0, 0];
	public var showAllIcons:Bool = true;
	public var currentIndex:Int = 0;

	public function new(char:String = 'placeholder', isPlayer:Bool = false) {
		super(null, 10, -30, RIGHT);
		this.isPlayer = isPlayer;
		setupIcon(this.char = char);
		scrollFactor.set();
	}

	public function setupIcon(char:String = 'placeholder') {
		var iconPath:String = 'placeholder-icons';
		var iconConfig:HealthIconConfig = {
			offset: [0, 0],
			scale: 1,
			fps: 24,
			antialiasing: true
		};

		for (path in [char, '$char-icons', 'icon-$char']) {
			if (Assets.exists(Paths.image('icons/$path'))) {
				iconPath = path;
				break;
			}
		}

		if (Assets.exists('assets/images/icons/$iconPath.json')) {
			iconConfig = cast Json.parse(Assets.getText('assets/images/icons/$iconPath.json'));
		} else if (Assets.exists('assets/images/icons/$iconPath.txt')) {
			var textArray:Array<String> = Assets.getText('assets/images/icons/$iconPath.txt').split(" ");
			iconConfig.offset = [Std.parseFloat(textArray[0]), Std.parseFloat(textArray[1])];
			iconConfig.scale = Std.parseFloat(textArray[2]);
		}

		animatedIcon = Assets.exists('assets/images/icons/$iconPath.xml');
		if (animatedIcon) {
			frames = Paths.getSparrowAtlas('icons/$iconPath', null, FlxG.state is CharacterCreator);
			animation.addByPrefix('neutral', '${char}0', iconConfig.fps, true, isPlayer);
			animation.addByPrefix('lose', '${char}-lose0', iconConfig.fps, true, isPlayer);
			animation.addByPrefix('win', '${char}-win0', iconConfig.fps, true, isPlayer);
		} else {
			var dummy:FlxSprite = new FlxSprite().loadGraphic(Paths.gpuBitmap('icons/$iconPath'));
			if (dummy.height == 32)
				loadGraphic(Paths.gpuBitmap('icons/$iconPath', null, FlxG.state is CharacterCreator), true, 32, 32);
			else if (dummy.height != 150)
				loadGraphic(Paths.gpuBitmap('icons/$iconPath', null, FlxG.state is CharacterCreator), true, Std.int(dummy.width / 2), Std.int(dummy.height));
			else
				loadGraphic(Paths.gpuBitmap('icons/$iconPath', null, FlxG.state is CharacterCreator), true, 150, 150);

			var winFrame:Int = (dummy.width >= dummy.height * 3 ? 2 : 0);
			var loseFrame:Int = (dummy.width >= dummy.height * 2 ? 1 : 0);

			dummy.destroy();
			dummy = null;

			animation.add('win', [winFrame], 0, false, isPlayer);
			animation.add('lose', [loseFrame], 0, false, isPlayer);
			animation.add('neutral', [0], 0, false, isPlayer);
		}

		animation.play('neutral');
		scale.set(iconConfig.scale, iconConfig.scale);
		offsetX = iconConfig.offset[0];
		offsetY = iconConfig.offset[1];
		antialiasing = iconConfig.antialiasing;
		if (char.endsWith('-pixel')) antialiasing = false;
		startSize = scale.x;
		updateHitbox();
		centerOffsets();
	}

	public function cycleIcons() {
		if (extraIcons.length == 0) return;
		for (icon in extraIcons) icon.visible = false;
		currentIndex++;
		if (currentIndex >= extraIcons.length) currentIndex = 0;
		extraIcons[currentIndex].visible = true;
	}

	public function clearExtraIcons() {
		for (old in extraIcons)
			if (old != null && old.exists) old.destroy();
		extraIcons = [];
		extraOffsets = [];
	}

	public function setMainOffset(off:Array<Float>) {
		if (off == null || off.length < 2) iconOffset = [0, 0];
		else iconOffset = [off[0], off[1]];
	}

	public function addExtraIcons(iconNames:Array<String>, isPlayer:Bool, ?customOffsets:Array<Array<Float>>) {
		if (iconNames == null || iconNames.length == 0) return;
		var baseIndex = FlxG.state.members.indexOf(this);
		if (baseIndex < 0) baseIndex = FlxG.state.members.length;
		for (k in 0...iconNames.length) {
			var i = iconNames.length - 1 - k;

			var newIcon = new HealthIcon(iconNames[i], isPlayer);
			newIcon.cameras = this.cameras;
			newIcon.scrollFactor.set();
			newIcon.scale.set(this.scale.x, this.scale.y);
			newIcon.alpha = this.alpha;
			newIcon.visible = showAllIcons;

			var off:Array<Float> = [0, 0];
			if (customOffsets != null && i < customOffsets.length && customOffsets[i] != null && customOffsets[i].length >= 2)
				off = [customOffsets[i][0], customOffsets[i][1]];
			extraOffsets.insert(0, off); // mantenemos mismo orden lógico que iconNames

			newIcon.x = this.x + iconOffset[0] + off[0];
			newIcon.y = this.y + iconOffset[1] + off[1];

			FlxG.state.insert(baseIndex, newIcon); // SIEMPRE antes del principal
			extraIcons.insert(0, newIcon);
		}
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (extraIcons.length == 0) return;

		var baseX = this.x + iconOffset[0];
		var baseY = this.y + iconOffset[1];

		for (i in 0...extraIcons.length) {
			var icon = extraIcons[i];
			var off = (i < extraOffsets.length) ? extraOffsets[i] : [0.0, 0.0];

			icon.cameras = this.cameras;
			icon.alpha = this.alpha;

			icon.scale.set(this.scale.x, this.scale.y);
			icon.updateHitbox();

		
			icon.x = baseX + off[0];
			icon.y = baseY + off[1];

			if (this.animation.curAnim != null && icon.animation.curAnim != null) {
				if (icon.animation.curAnim.name != this.animation.curAnim.name)
					icon.animation.play(this.animation.curAnim.name, true);
				icon.animation.curAnim.curFrame = this.animation.curAnim.curFrame;
			}
	}
}

}
typedef HealthIconConfig = {
	var offset:Array<Float>;
	var scale:Float;
	var fps:Int;
	var antialiasing:Bool;
}