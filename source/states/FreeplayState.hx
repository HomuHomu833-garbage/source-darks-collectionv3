package states;

import toolbox.ChartingState;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import substates.BlockedAndErrorSubState;

#if (target.threaded)
import sys.thread.Thread;
#end
#if DISCORD_ALLOWED
import utilities.DiscordClient;
#end
import game.Conductor;
import utilities.Options;
import flixel.util.FlxTimer;
import substates.ResetScoreSubstate;
import flixel.sound.FlxSound;
import flixel.tweens.FlxTween;
import game.SongLoader;
import game.Highscore;
import game.FreeplaySong;
import ui.HealthIcon;
import ui.InfoBanner;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import ui.DesingText;
import states.GroupSelectState;
import flixel.perspective.PerspectiveSprite;
import shaders.Shaders.CutBitmapEffect;
import utilities.FiltersBG;
using utilities.BackgroundUtil;
//import utilities.AudioAnalyzer;
using StringTools;
class FreeplayState extends MusicBeatState {
	public static var songs:Array<FreeplaySong> = [];
	public var mostrarGrupo:FlxSprite;
	public var selector:FlxText;
	public static var curSelected:Int = 0;
	public static var curDifficulty:Int = 1;
	public static var curSpeed:Float = 1;
	public var rankText:FlxText;
	public var curMisses:Int = 0;
	public var godEffectDone:Map<String, Bool> = new Map();

	public var scoreText:FlxText;
	public var diffText:FlxText;
	public var speedText:FlxText;
	public var lerpScore:Int = 0;
	public var intendedScore:Int = 0;
	//public var audioBarsActive:Bool = true;
	public var grpSongs:FlxTypedGroup<DesingText>;
	public var curPlaying:Bool = false;
	private var lastSong:FreeplaySong = null;

	public var iconArray:Array<HealthIcon> = [];

	public static var songsReady:Bool = false;

	public var bg:FlxSprite;
	public var selectedColor:Int = 0xFF7F1833;
	public var scoreBG:FlxSprite;

	public var curRank:String = "N/A";

	public var curDiffString:String = "normal";
	public var curDiffArray:Array<String> = ["easy", "normal", "hard"];

	public var vocals:FlxSound = new FlxSound();

	public var canEnterSong:Bool = true;

	// thx psych engine devs
	public var colorTween:FlxTween;
	#if (target.threaded)
	public var loading_songs:Thread;
	public var stop_loading_songs:Bool = false;
	#end
	public var lastSelectedSong:Int = -1;

	public var ports:Map<String, FlxSprite> = new Map();

	public var renders:Map<String, PerspectiveSprite> = new Map();

	public var cutShader = new CutBitmapEffect();
	 public var lastPort:FlxSprite;      
    public var currentPort:FlxSprite;   // port 
    public var currentRender:PerspectiveSprite; // render 
	/**
		Current instance of `FreeplayState`.
	**/
	public static var instance:FreeplayState = null;
	public static var lastGroup:Int = 0;
	var preloadedStyles:Array<Dynamic> = [];
	public static var curSong:FreeplaySong = songs[curSelected];
	var groupVisuals:Map<Int, {hue:Float}> = [
        0 => {hue: 0.75},   // VC
        1 => {hue: 0.6},   // PS
        2 => {hue: 0.12},   // REV
        3 => {hue: 0.8},  // S
		4 => {hue: 0.8},   // VC
        5 => {hue: 0.9},   // PS
        6 => {hue: 0.25},   // REV
        7 => {hue: 0.45}    // S
    ];
	public var selectedGroup:Int;

	
	var changeGodIconAfter:Bool = false;
	var pendingGodIconIsGod:Bool = false;
	var pendingGodSong:String = "";
	public var targetBrightness:Float = 1.2;
	public var isCurrentlyGod:Bool = false;

	public function new(selectedGroup:Int = 0, groupSongs:Array<FreeplaySong> = null) {
		super();
		this.selectedGroup = selectedGroup;
		FreeplayState.lastGroup = selectedGroup;
		grpSongs = new FlxTypedGroup<DesingText>();
		iconArray = [];
		preloadedStyles = [];
		if (groupSongs != null) {
			loadGroupSongs(groupSongs);
		}
	}
override function create() {
	instance = this;
	MusicBeatState.windowNameSuffix = " Freeplay";

	var black = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);

	#if MODDING_ALLOWED
	CoolUtil.convertFromFreeplaySongList();
	#end

	#if NO_PRELOAD_ALL
	if (!songsReady) {
		Assets.loadLibrary("songs").onComplete(function(_) {
			FlxTween.tween(black, {alpha: 0}, 0.5, {
				ease: FlxEase.quadOut,
				onComplete: function(_) {
					remove(black);
					black.kill();
					black.destroy();
				}
			});
			songsReady = true;
		});
	}
	#else
	songsReady = true;
	#end

	if (FlxG.sound.music == null || !FlxG.sound.music.playing)
		TitleState.playTitleMusic();

	if (curSelected > songs.length)
		curSelected = 0;

	#if DISCORD_ALLOWED
	DiscordClient.changePresence("Freeplay", null);
	#end

	bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
	bg.shader = cutShader.shader;

	if (groupVisuals.exists(selectedGroup))
		cutShader.hue = groupVisuals.get(selectedGroup).hue;
	else
		cutShader.hue = 0.0;

	cutShader.brightness = 1.2;
	cutShader.borderWidth = 10;
	cutShader.topX = 0.45;
	cutShader.bottomX = 0.55;
	cutShader.side = 1;
	cutShader.strength = 2;
	cutShader.strengthChrom = 0;

	var filter = FiltersBG.makeBackground(true, "Filter1");
	if (filter != null) insert(0, filter);
	insert(members.indexOf(filter), bg);
	
	var panelWidth = 180;
	var panelHeight = 120;
	var panelGap = 15;
	var totalWidth = (panelWidth * 3) + (panelGap * 2);
	var startX = FlxG.width - totalWidth - 110;
	var yPos = 5;

	function createText(x:Float, y:Float, w:Float, txt:String, size:Int, color:Int, ?font:String = "Ethnocentric-Regular.otf"):FlxText {
		var t = new FlxText(x, y, w, txt, size);
		t.setFormat(Paths.font(font), size, color, CENTER);
		t.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);
		return t;
	}

	// === SCORE ===
	add(createText(startX, yPos + 10, panelWidth, "SCORE", 22, FlxColor.WHITE, "Orbitron Bold.otf"));
	scoreText = createText(startX, yPos + panelHeight - 65, panelWidth, "N/A", 22, 0xFF00FFC8);
	add(scoreText);
	// === SPEED ===
	var panelSpeedX = startX + panelWidth + panelGap;
	add(createText(panelSpeedX - 30, yPos + 10, panelWidth, "SONG SPEED", 22, FlxColor.WHITE, "Orbitron Bold.otf"));
	speedText = createText(panelSpeedX - 30, yPos + panelHeight - 65, panelWidth, "", 22, 0xFF00FFC8);
	add(speedText);
	// === DIFFICULTY ===
	var panelDiffX = panelSpeedX + panelWidth + panelGap;
	add(createText(panelDiffX - 50, yPos + 10, panelWidth, "DIFFICULTY", 22, FlxColor.WHITE, "Orbitron Bold.otf"));
	diffText = createText(panelDiffX - 70, yPos + panelHeight - 65, panelWidth + 35, "N/A", 18, 0xFF00FFC8);
	add(diffText);
	// === RANK ===
	add(createText(panelDiffX + 100, yPos + 10, panelWidth, "RANK", 22, FlxColor.WHITE, "Orbitron Bold.otf"));
	rankText = createText(panelDiffX + 100, yPos + panelHeight - 65, panelWidth, "N/A", 18, 0xFF00FFC8);
	add(rankText);



	var texto = (selectedGroup >= 0 && selectedGroup < GroupSelectState.groupNames.length)
		? GroupSelectState.groupNames[selectedGroup]
		: Std.string(selectedGroup);

	var fontName = GroupSelectState.groupFonts.exists(selectedGroup)
		? GroupSelectState.groupFonts.get(selectedGroup)
		: "vcr.ttf";

	var grupoText = new FlxText(150, 40, FlxG.width - 140, texto);
	grupoText.setFormat(Paths.font(fontName), 50, FlxColor.WHITE, "left");
	grupoText.scrollFactor.set(0, 0);

	//add(scoreBG);
	add(grupoText);

	selector = new FlxText();
	selector.size = 40;
	selector.text = "<";

	if (!songsReady) {
		add(black);
	} else {
		remove(black);
		black.kill();
		black.destroy();
		songsReady = false;
		new FlxTimer().start(1, function(_) songsReady = true);
	}

	var infoBanner = new InfoBanner(FlxColor.BLACK, 0.6, 16, Paths.font("vcr.ttf"),0xFF00FFC8);
	add(infoBanner);

	#if PRELOAD_ALL
	infoBanner.show([
		"Press RESET to reset song score and rank",
		"Press SPACE to play Song Audio",
		"Shift + LEFT and RIGHT to change song speed",
		"Press E to see you Stars"
	], 3.0);
	#else
	infoBanner.show([
		"Press RESET to reset song score",
		"Shift + LEFT and RIGHT to change song speed",
		"Press E to see you Stars"
	], 3.0);
	#end

	super.create();
	call("createPost");
}

function loadPort(portName:String):FlxSprite {
	var port = new FlxSprite().loadGraphic(Paths.gpuBitmap('freeplay/ports/' + portName));
	port.antialiasing = Options.getData("antialiasing");
	port.alpha = 0;
	port.x = -350;
	port.setGraphicSize(FlxG.width, FlxG.height);
	port.updateHitbox();
	insert(members.indexOf(bg), port);
	return port;
}

function loadRender(renderName:String):PerspectiveSprite {
	var render:PerspectiveSprite = cast new PerspectiveSprite().loadGraphic(Paths.gpuBitmap('freeplay/Renders/' + renderName));
	render.alpha = 0;
	render.angleX = 90;
	render.z = -250;
	render.antialiasing = Options.getData("antialiasing");
	insert(members.indexOf(bg) + 2, render);
	return render;
}

function loadGroupSongs(groupSongs:Array<FreeplaySong>) {
	songs = groupSongs;
	curSelected = 0;

	if (grpSongs == null) grpSongs = new FlxTypedGroup<DesingText>();
	grpSongs.clear();

	iconArray = [];
	preloadedStyles = [];

	for (song in groupSongs) {
		var songDir = song.name;

		#if MODDING_ALLOWED
		var modPath = 'mods/${Options.getData("curMod")}/data/song data/' + songDir;
		var modStylePath = modPath + '/style.json';
		#end

		var assetPath = 'assets/data/song data/' + songDir;
		var assetStylePath = assetPath + '/style.json';

		var styleData:Dynamic = null;

		#if MODDING_ALLOWED
		if (FileSystem.exists(modStylePath))
			styleData = Json.parse(File.getContent(modStylePath));
		#end

		if (styleData == null && Assets.exists(assetStylePath))
			styleData = Json.parse(Assets.getText(assetStylePath));

		preloadedStyles.push(styleData);
	}



	#if (target.threaded)
	if (!Options.getData("loadAsynchronously") || !Options.getData("healthIcons")) {
	#end

	for (i in 0...groupSongs.length) {
		var song = groupSongs[i];
		var data = preloadedStyles[i];
		var spacing = (data != null && data.letterSpacing != null) ? data.letterSpacing : 0;
		var defaultSize = 80;
		var textSize:Int = GroupSelectState.groupTextSizes.exists(selectedGroup)
			? (GroupSelectState.groupTextSizes.get(selectedGroup) ?? defaultSize)
			: defaultSize;

		if (data != null && data.songFontSize != null)
			textSize = Std.int(Std.parseFloat(Std.string(data.songFontSize)));

		var songText = DesingText.createSongText(0, 60 * i, song.name, textSize, spacing, data, 1);

		songText.isMenuItem = true;
		songText.targetY = i;

		
		if (data == null || data.songFont == null) {
			var fontName = GroupSelectState.groupFonts.exists(selectedGroup)
				? GroupSelectState.groupFonts.get(selectedGroup)
				: "freeplayTxt.ttf";
			songText.font = Paths.font(fontName);
		}
		songText.alignment = "right";

		var padding = 100;
		var textWidth = songText.textField.textWidth * songText.scale.x;
		songText.targetX = FlxG.width - textWidth - padding;
		songText.scrollFactor.set(0, 0);
		songText.origin.x = songText.width;
		songText.origin.y = songText.height / 2;

		grpSongs.add(songText);

		if (Options.getData("healthIcons")) {
			var icon = new HealthIcon(song.icon);
			icon.sprTracker = songText;
			icon.origin.x = icon.width;
			icon.origin.y = icon.height / 2;
			iconArray.push(icon);
			insert(members.indexOf(songText) + 1, icon);
		}
	}

	#if (target.threaded)
	}
	#end

	add(grpSongs);
}
	public var mix:String = null;

	/*public function addSong(songName:String, weekNum:Int, songCharacter:String) {
			call("addSong", [songName, weekNum, songCharacter]);
			songs.push(new FreeplaySong(songName, weekNum, songCharacter));
			call("addSongPost", [songName, weekNum, songCharacter]);
		}*/
	var time:Float = 0;
	var godOffset:Float = 0;          // desplazamiento actual
	var godTargetOffset:Float = 0;    // desplazamiento objetivo (0 o 1000)
	var godMoveSpeed:Float = 20;      // velocidad del lerp (ajustable)

override function update(elapsed:Float) {
	call("update", [elapsed]);

	#if MODDING_ALLOWED
	if (FlxG.keys.justPressed.TAB) {
		openSubState(new modding.SwitchModSubstate());
		persistentUpdate = false;
	}
	#end

	super.update(elapsed);
	cutShader.time += elapsed;

	if (FlxG.sound.music.playing)
		Conductor.songPosition = FlxG.sound.music.time;

		// Actualización de iconos
		for (i in 0...iconArray.length) {
			var icon = iconArray[i];
			if (i == lastSelectedSong) continue;
			icon.scale.set(icon.startSize, icon.startSize);
		}

		for (i in 0...iconArray.length) {
			var icon = iconArray[i];
			if (icon.sprTracker == null) continue;

			var distance = Std.int(Math.abs(i - curSelected));
			var scale = Math.max(0.5, Math.min(1, 1 - 0.2 * distance));
			icon.scale.set(scale, scale);

			var opacityValues = [1.0, 0.5, 0.25];
			icon.alpha = (distance < opacityValues.length) ? opacityValues[distance] : 0.0;

			var txt:DesingText = cast icon.sprTracker;
			var textWidth = txt.textField.textWidth * txt.scale.x;
			var targetX = FlxG.width - textWidth - 100 - icon.width * scale - 10;

			if (Math.abs(icon.x - targetX) > 1)
				icon.x = targetX;

			icon.y = txt.y + (txt.height * txt.scale.y - icon.height * scale) / 2;
		}

		for (i in 0...grpSongs.members.length)
			cast(grpSongs.members[i], DesingText).updateShaderFade(curSelected, i);

		if (lastSelectedSong != -1 && scaleIcon != null)
			scaleIcon.scale.set(
				FlxMath.lerp(scaleIcon.scale.x, scaleIcon.startSize, elapsed * 9),
				FlxMath.lerp(scaleIcon.scale.y, scaleIcon.startSize, elapsed * 9)
			);

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.3));
		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		scoreText.text = (lerpScore == 0 ? "N/A" : Std.string(lerpScore));

		curSpeed = Math.max(0.25, FlxMath.roundDecimal(curSpeed, 2));
		speedText.text = "< " + Std.string(curSpeed) + " >";


		var showArrows = (curDiffArray.length > 1);
		diffText.text = (showArrows ? "< " + curDiffString + " >" : curDiffString);
		// Controles
		var leftP = controls.LEFT_P;
		var rightP = controls.RIGHT_P;
		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var shift = FlxG.keys.pressed.SHIFT;

		if (songsReady) {
			if (songs.length > 1) {
				var wheel = -1 * Math.floor(FlxG.mouse.wheel);
				if (wheel != 0 && !shift)
					changeSelection(wheel);
				else if ((wheel / 10) != 0 && shift)
					curSpeed += -(wheel / 10);

				if (upP) changeSelection(-1);
				if (downP) changeSelection(1);
			}

			if (leftP) shift ? curSpeed -= 0.05 : changeDiff(-1);
			if (rightP) shift ? curSpeed += 0.05 : changeDiff(1);
			if (FlxG.keys.justPressed.R && shift) curSpeed = 1;

			if (controls.BACK) {
				if (colorTween != null) colorTween.cancel();
				if (vocals.active && vocals.playing) destroyFreeplayVocals(false);
				if (FlxG.sound.music.active && FlxG.sound.music.playing)
					FlxG.sound.music.pitch = 1;

				#if (target.threaded)
				stop_loading_songs = true;
				#end

				FlxG.switchState(() -> new GroupSelectState(
					MainMenuState.keysArray,
					MainMenuState.namesArray,
					function(selectedGroup:Int) {
						FlxG.switchState(() -> new FreeplayState(selectedGroup));
					},
					FreeplayState.lastGroup
				));

			}

			var curSong:FreeplaySong = songs[curSelected];
			if (curSong != null) {
				// Fondos
				if (curSong.bgs != null && !ports.exists(curSong.bgs) && Options.getData("renderBGs")) {
					var newPort = loadPort(curSong.bgs);
					newPort.alpha = 0;
					ports.set(curSong.bgs, newPort);
				}

				if (curSong.render != null && !renders.exists(curSong.render) && Options.getData("renders")) {
					var newRender = loadRender(curSong.render);
					newRender.alpha = 0;
					renders.set(curSong.render, newRender);
				}

				for (portName in ports.keys()) {
					var port = ports.get(portName);
					var targetAlpha = (curSong.bgs == portName) ? 1 : 0;
					port.alpha = FlxMath.lerp(port.alpha, targetAlpha, elapsed * 8);
				}

				for (renderName in renders.keys()) {
					var r = renders.get(renderName);
					var isCurrent = (curSong.render == renderName);

					var targetAlpha = isCurrent ? 1 : 0;
					var targetZ = isCurrent ? 0 : -200;
					var targetY = isCurrent ? 0 : 250;
					var targetAngleX = isCurrent ? 0 : -90;

					r.alpha = FlxMath.lerp(r.alpha, targetAlpha, elapsed * 8);
					r.y = FlxMath.lerp(r.y, targetY, elapsed * 8);
					r.z = FlxMath.lerp(r.z, targetZ, elapsed * 8);
					r.angleX = FlxMath.lerp(r.angleX, targetAngleX, elapsed * 8);

					if (isCurrent && r.alpha < 0.1) r.angleX = 90;
					if (!isCurrent && r.alpha > 0.9) r.angleX = 0;
				}
			}
		#if PRELOAD_ALL
		if (FlxG.keys.justPressed.SPACE) {
			destroyFreeplayVocals();

			if (Assets.exists(SongLoader.getPath(curDiffString, curSong.name.toLowerCase(), mix)))
				PlayState.SONG = SongLoader.loadFromJson(curDiffString, curSong.name.toLowerCase(), mix);

			if (PlayState.SONG != null)
				Conductor.changeBPM(PlayState.SONG.bpm, curSpeed);


			vocals = new FlxSound();
			var voicesDiff = (PlayState.SONG != null ? (PlayState.SONG.specialAudioName ?? curDiffString.toLowerCase()) : curDiffString.toLowerCase());
			var voicesPath = Paths.voices(curSong.name.toLowerCase(), voicesDiff, mix ?? '');

			if (Assets.exists(voicesPath))
				vocals.loadEmbedded(voicesPath);

			vocals.persist = false;
			vocals.looped = true;
			vocals.volume = 0.7;
			FlxG.sound.list.add(vocals);

			FlxG.sound.music = new FlxSound().loadEmbedded(Paths.inst(curSong.name.toLowerCase(), curDiffString.toLowerCase(), mix));
			FlxG.sound.music.persist = true;
			FlxG.sound.music.looped = true;
			FlxG.sound.music.volume = 0.7;
			FlxG.sound.list.add(FlxG.sound.music);

			FlxG.sound.music.play();
			vocals.play();
			var startTime:Float = FlxG.sound.music.length / 2; 
			FlxG.sound.music.time = startTime;
			vocals.time = startTime;
			Conductor.songPosition = startTime;

			lastSelectedSong = curSelected;
			scaleIcon = iconArray[lastSelectedSong];
		}
		#end


			if (FlxG.sound.music.active && FlxG.sound.music.playing && !FlxG.keys.justPressed.ENTER)
				FlxG.sound.music.pitch = curSpeed;

			if (vocals != null && vocals.active && vocals.playing && !FlxG.keys.justPressed.ENTER)
				vocals.pitch = curSpeed;

			if (controls.RESET && !shift) {
				openSubState(new ResetScoreSubstate(curSong.name, curDiffString));
				changeSelection();
			}

			if (FlxG.keys.justPressed.ENTER && canEnterSong)
				playSong(curSong.name, curDiffString);
		}

		// === Movimiento GOD MODE ===
		if (godTargetOffset > 0)
		{
			godOffset = FlxMath.lerp(godOffset, godTargetOffset, elapsed * godMoveSpeed);
			if (Math.abs(godOffset - godTargetOffset) < 5)
			{
				if (changeGodIconAfter && pendingGodSong != "")
				{
					var curSong = songs[curSelected];
					var icon = iconArray[curSelected];

					var iconName = pendingGodIconIsGod ? curSong.icon + "-god" : curSong.icon;
					if (!Assets.exists(Paths.image("icons/" + iconName)))
						iconName = curSong.icon;

					icon.setupIcon(iconName);
					changeGodIconAfter = false;
					pendingGodSong = "";
				}
				godTargetOffset = 0;
			}
		}
		else
		{
			godOffset = FlxMath.lerp(godOffset, 0, elapsed * (godMoveSpeed * 0.5));
		}

		if (curSelected < grpSongs.length && curSelected < iconArray.length)
		{
			var txt:DesingText = cast grpSongs.members[curSelected];
			var icon = iconArray[curSelected];
			txt.x = txt.targetX + godOffset;
			icon.x = txt.x - icon.width - 10;

		}
		if (cutShader != null) {
			cutShader.brightness = FlxMath.lerp(cutShader.brightness, targetBrightness, 0.15);
		}


		call("updatePost", [elapsed]);
	}

	// TODO: Make less nested

	/**
		 * Plays a specific song
		 * @param songName
		 * @param diff
		 */
		public function playSong(songName:String, diff:String) {
			if (!canEnterSong) {
				return;
			}

			if (!CoolUtil.songExists(songName, diff, mix)) {
				if (!Options.getData("autoOpenCharter")) {
					openSubState(new BlockedAndErrorSubState(
						songName.toLowerCase() + " doesn't seem to exist!\nTry fixing its name in freeplay.json",
						"Leather Engine's No Crash, We Help Fix Stuff Tool"
					));
				} else {
					if (Options.getData("developer")) {
						#if MODDING_ALLOWED
						var modPath:String = 'mods/${Options.getData('curMod')}';
						if (!FileSystem.exists('$modPath/data')) {
							FileSystem.createDirectory('$modPath/data');
						}
						if (!FileSystem.exists('$modPath/data/song data')) {
							FileSystem.createDirectory('$modPath/data/song data');
						}
						if (!FileSystem.exists('$modPath/data/song data/${songName.toLowerCase()}')) {
							FileSystem.createDirectory('$modPath/data/song data/${songName.toLowerCase()}');
						}
						File.saveContent('$modPath/data/song data/${songName.toLowerCase()}/${songName.toLowerCase()}-${diff.toLowerCase()}.json', Json.stringify({
							song: {
								validScore: true,
								keyCount: 4,
								playerKeyCount: 4,
								chartOffset: 0.0,
								timescale: [4, 4],
								needsVoices: true,
								song: songName,
								bpm: 100,
								player1: 'bf',
								player2: 'dad',
								gf: 'gf',
								stage: 'stage',
								speed: 1,
								ui_Skin: 'default',
								notes: [{
									sectionNotes: [],
									lengthInSteps: 16,
									mustHitSection: true,
									bpm: 0.0,
									changeBPM: false,
									altAnim: false,
									timeScale: [0, 0],
									changeTimeScale: false
								}],
								specialAudioName: null,
								player3: null,
								modchartingTools: false,
								modchartPath: null,
								mania: null,
								gfVersion: null,
								events: [],
								endCutscene: '',
								cutscene: '',
								moveCamera: false,
								chartType: LEGACY
							}
						}, '\t'));
						PlayState.SONG = SongLoader.loadFromJson(diff, songName.toLowerCase(), mix);
						PlayState.isStoryMode = false;
						PlayState.songMultiplier = curSpeed;
						PlayState.storyDifficultyStr = diff.toUpperCase();
						PlayState.storyWeek = songs[curSelected].week;

						#if (target.threaded)
						stop_loading_songs = true;
						#end

						colorTween?.cancel();
						PlayState.loadChartEvents = true;
						destroyFreeplayVocals();

						FlxG.switchState(() -> new ChartingState());
						#end
					}
				}
				return;
			}

			PlayState.SONG = SongLoader.loadFromJson(diff, songName.toLowerCase(), mix);
			if (!Assets.exists(Paths.inst(PlayState.SONG.song, diff.toLowerCase(), mix))) {
				if (Assets.exists(Paths.inst(songName.toLowerCase(), diff.toLowerCase(), mix))) {
					openSubState(new BlockedAndErrorSubState(
						PlayState.SONG.song.toLowerCase() + " (JSON) does not match " + songName + " (FREEPLAY)\nTry making them the same.",
						"Leather Engine's No Crash, We Help Fix Stuff Tool"
					));
				} else {
					openSubState(new BlockedAndErrorSubState(
						"Your song seems to not have an Inst.ogg, check the folder name in 'songs'!",
						"Leather Engine's No Crash, We Help Fix Stuff Tool"
					));
				}
				return;
			}

			PlayState.isStoryMode = false;
			PlayState.songMultiplier = curSpeed;
			PlayState.storyDifficultyStr = diff.toUpperCase();
			PlayState.storyWeek = songs[curSelected].week;

			#if (target.threaded)
			stop_loading_songs = true;
			#end

			colorTween?.cancel();
			PlayState.loadChartEvents = true;
			destroyFreeplayVocals();
			LoadingState.loadAndSwitchState(() -> new PlayState());
		}


	override function closeSubState() {
		changeSelection();
		FlxG.mouse.visible = false;
		super.closeSubState();
	}

	function updateRankDisplay():Void {
		if (rankText != null) {
			var fcDisplay = (curMisses == 0 && curRank != "N/A") ? " - FC" : "";
			rankText.text = curRank.toUpperCase() + fcDisplay;
			rankText.color = (curMisses == 0 && curRank != "N/A") ? 0xFFFFD700 : 0xFF00FFC8;
		}
	}
	function changeDiff(change:Int = 0)
		{
			call("changeDiff", [change]);
			curDifficulty = FlxMath.wrap(curDifficulty + change, 0, curDiffArray.length - 1);
			curDiffString = curDiffArray[curDifficulty].toUpperCase();

			if (songs.length != 0)
			{
				var curSong = songs[curSelected];
				intendedScore = Highscore.getScore(curSong.name, curDiffString);
				curRank = Highscore.getSongRank(curSong.name, curDiffString);
				curMisses = Highscore.getMisses(curSong.name, curDiffString);

				var txt:DesingText = cast grpSongs.members[curSelected];
				var icon = iconArray[curSelected];
				var songDir = curSong.name;

				// GOD DETECTION
				var isGod = ~/god/i.match(curDiffString);
				var key = curSelected + ":" + songDir;
				var wasGod:Bool = godEffectDone.exists(key) ? godEffectDone.get(key) : false;

				if (isGod != wasGod && curSelected >= 0 && curSelected < grpSongs.length)
				{
					var txt:DesingText = cast grpSongs.members[curSelected];
					var icon = iconArray[curSelected];

					if (isGod && !wasGod)
					{
						FlxG.sound.play(Paths.sound("ssj_burst"), 0.6);
						FlxG.camera.flash(FlxColor.WHITE, 0.4);
						FlxG.camera.shake(0.008, 0.22);
					}

					var stylePath = 'assets/data/song data/' + songDir + '/style' + (isGod ? '-god' : '') + '.json';
					if (Assets.exists(stylePath)) {
						var data:Dynamic = Json.parse(Assets.getText(stylePath));
						txt.applyStyleData(data);
					}


					godTargetOffset = 2000;
					changeGodIconAfter = true;
					pendingGodIconIsGod = isGod;
					pendingGodSong = songDir;
					if (cutShader != null) {
						var targetBrightness = isGod ? 0.5 : 1.2;
						cutShader.brightness = FlxMath.lerp(cutShader.brightness, targetBrightness, 0.1);
					}

					
				}

				if (isGod != isCurrentlyGod) {
						isCurrentlyGod = isGod;
						targetBrightness = isGod ? 0.5 : 1.2;
					}
									
				godEffectDone.set(key, isGod);
			} 

			var showArrows = (curDiffArray.length > 1);
			diffText.text = (showArrows ? "< " + curDiffString + " >" : curDiffString);
			updateRankDisplay();
			call("changeDiffPost", [change]);
		}

	function changeSelection(change:Int = 0) {
		call("changeSelection", [change]);

		if (grpSongs.length <= 0) {
			return;
		}

		curSelected = FlxMath.wrap(curSelected + change, 0, grpSongs.length - 1);
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		var curSong:FreeplaySong = songs[curSelected];
		scoreText.visible = diffText.visible = speedText.visible = (curSong?.menuConfig?.showStats) ?? true;

		if (Options.getData("freeplayMusic") && curSelected >= 0) {
			FlxG.sound.playMusic(Paths.inst(curSong.name, curDiffString.toLowerCase()), 0.7);

			if (vocals != null && vocals.active && vocals.playing)
				destroyFreeplayVocals(false);
		}

		if (songs.length != 0) {
			intendedScore = Highscore.getScore(curSong.name, curDiffString);
			curRank = Highscore.getSongRank(curSong.name, curDiffString);
			curMisses = Highscore.getMisses(curSong.name, curDiffString);
		}

		if (songs.length != 0) {
			curDiffArray = curSong.difficulties;
			changeDiff();
		}

		var bullShit:Int = 0;

		if (iconArray.length > 0) {
			for (icon in iconArray) {
				if (icon.animation.curAnim != null)
					icon.animation.play("neutral");
			}

			if (iconArray != null && curSelected >= 0 && (curSelected <= iconArray.length) && iconArray.length != 0) {
				var selectedIcon:HealthIcon = iconArray[curSelected];
				selectedIcon.animation.play("win");
			}
		}

		for (item in grpSongs.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;
		}

		updateRankDisplay();

		canEnterSong = (curSong?.menuConfig?.canBeEntered) ?? true;
		call("changeSelectionPost", [change]);
	}


	public function destroyFreeplayVocals(?destroyInst:Bool = true) {
		call("destroyFreeplayVocals", [destroyInst]);
		if (vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
		if (!destroyInst)
			return;
		if (FlxG.sound.music != null) {
			FlxG.sound.music.stop();
			FlxG.sound.music.destroy();
		}
		FlxG.sound.music = null;
		call("destroyFreeplayVocalsPost", [destroyInst]);
	}

	var scaleIcon:HealthIcon;

	override function beatHit() {
		call("beatHit");
		super.beatHit();
		if (lastSelectedSong >= 0 && scaleIcon != null)
			scaleIcon.scale.add(0.2 * scaleIcon.startSize, 0.2 * scaleIcon.startSize);
		call("beatHitPost");
	}
}