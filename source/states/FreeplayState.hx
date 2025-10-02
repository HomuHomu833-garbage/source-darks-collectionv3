package states;

import toolbox.ChartingState;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
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
//import ui.Alphabet;
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
import utilities.AudioAnalyzer;
using StringTools;
class FreeplayState extends MusicBeatState {
	public static var songs:Array<FreeplaySong> = [];
	public var mostrarGrupo:FlxSprite;
	public var selector:FlxText;
	public static var curSelected:Int = 0;
	public static var curDifficulty:Int = 1;
	public static var curSpeed:Float = 1;

	public var scoreText:FlxText;
	public var diffText:FlxText;
	public var speedText:FlxText;
	public var lerpScore:Int = 0;
	public var intendedScore:Int = 0;
		public var audioBarsActive:Bool = true;
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
		public var audioAnalyzer:AudioAnalyzer;
	public var audioBars = [];
	#if (target.threaded)
	public var loading_songs:Thread;
	public var stop_loading_songs:Bool = false;
	#end
	public var lastSelectedSong:Int = -1;

	public var ports:Map<String, FlxSprite> = new Map();

	public var renders:Map<String, PerspectiveSprite> = new Map();

	public var cutShader = new CutBitmapEffect();
	 public var lastPort:FlxSprite;      // referencia al último port agregado
    public var currentPort:FlxSprite;   // port activo de la canción actual
    public var currentRender:PerspectiveSprite; // render activo de la canción actual
	/**
		Current instance of `FreeplayState`.
	**/
	public static var instance:FreeplayState = null;
	var preloadedStyles:Array<Dynamic> = [];
	public var curSong:FreeplaySong = songs[curSelected];

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

	public function new(selectedGroup:Int = 0, groupSongs:Array<FreeplaySong> = null) {
		super();
		this.selectedGroup = selectedGroup;
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
		var black:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		#if MODDING_ALLOWED
		CoolUtil.convertFromFreeplaySongList();
		#end
		#if NO_PRELOAD_ALL
		if (!songsReady) {
			Assets.loadLibrary("songs").onComplete(function(_) {
				FlxTween.tween(black, {alpha: 0}, 0.5, {
					ease: FlxEase.quadOut,
					onComplete: function(twn:FlxTween) {
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
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Freeplay", null);
		#end

		

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		bg.shader = cutShader.shader;
		if (groupVisuals.exists(selectedGroup)) {
			var visual = groupVisuals.get(selectedGroup);
			cutShader.hue = visual.hue;
		} else {
			cutShader.hue = 0.0;
		}
		cutShader.brightness = 1.2;
		cutShader.borderWidth = 10;
		cutShader.topX = 0.45;
		cutShader.bottomX = 0.55;
		cutShader.side = 1;

		var filter = FiltersBG.makeBackground(true, "Filter1"); 
		if (filter != null) insert(0, filter);
		insert(members.indexOf(filter), bg);
		
        scoreText = new FlxText(FlxG.width, 5, 0, "", 32);
		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 1, FlxColor.BLACK);
		scoreBG.alpha = 0.6;
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		diffText = new FlxText(FlxG.width, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		diffText.alignment = RIGHT;
		speedText = new FlxText(FlxG.width, diffText.y + 36, 0, "", 24);
		speedText.font = scoreText.font;
		speedText.alignment = RIGHT;

		var texto:String = (selectedGroup >= 0 && selectedGroup < GroupSelectState.groupNames.length) 
			? GroupSelectState.groupNames[selectedGroup] 
			: Std.string(selectedGroup);

		var fontName = "vcr.ttf";
		if (GroupSelectState.groupFonts.exists(selectedGroup)) {
			fontName = GroupSelectState.groupFonts.get(selectedGroup);
		}
		var grupoText = new FlxText(150, 40, FlxG.width - 140, texto);
		grupoText.setFormat(Paths.font(fontName), 50, FlxColor.WHITE, "left");
		grupoText.scrollFactor.set(0, 0);


		// layering
		add(scoreBG);
		add(scoreText);
		add(diffText);
		add(speedText);
		
		add(grupoText);
		audioBars = [];
		var numBars = 25;
		var barWidth = 24;     
		var barSpacing = 28;   
		var barColor = FlxColor.WHITE; 

		for (i in 0...numBars) {
			// X desde la derecha
			var xPos = FlxG.width - (i * barSpacing);
			var spr = new FlxSprite(xPos, FlxG.height); 
			spr.makeGraphic(barWidth, 1, barColor);
			spr.origin.set(0, spr.height); 
			spr.scale.y = 0; 
			
				insert(members.indexOf(scoreBG), spr); 
			

			audioBars.push(spr);
		}


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

		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, FlxColor.BLACK);
		textBG.alpha = 0.6;
		add(textBG);

		#if PRELOAD_ALL
		var leText:String = "Press RESET to reset song score and rank ~ Press SPACE to play Song Audio ~ Shift + LEFT and RIGHT to change song speed";
		#else
		var leText:String = "Press RESET to reset song score ~ Shift + LEFT and RIGHT to change song speed";
		#end

		infoText = new FlxText(textBG.x - 1, textBG.y + 4, FlxG.width, leText, 18);
		infoText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, CENTER);
		infoText.scrollFactor.set();
		infoText.screenCenter(X);
		add(infoText);

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
		insert(members.indexOf(bg), port); // si bg es tu fondo general
		return port;
	}
	function loadRender(renderName:String):PerspectiveSprite {
		var render:PerspectiveSprite = cast new PerspectiveSprite().loadGraphic(
			Paths.gpuBitmap('freeplay/Renders/' + renderName)
		);
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

		if (iconArray == null) iconArray = [];
		iconArray = [];
		preloadedStyles = [];
		for (song in groupSongs) {
				var songDir = song.name;
				#if MODDING_ALLOWED
				var modPath = 'mods/${Options.getData("curMod")}/data/song data/' + songDir;
				var modVipStylePath = modPath + '/style-vip.json';
				var modStylePath = modPath + '/style.json';
				#end
				var assetPath = 'assets/data/song data/' + songDir;
				var assetVipStylePath = assetPath + '/style-vip.json';
				var assetStylePath = assetPath + '/style.json';

				var styleData:Dynamic = null;
				#if MODDING_ALLOWED
				if (FileSystem.exists(modVipStylePath)) {
					styleData = Json.parse(File.getContent(modVipStylePath));
				} else if (FileSystem.exists(modStylePath)) {
					styleData = Json.parse(File.getContent(modStylePath));
				}
				#end
				if (styleData == null) {
					if (Assets.exists(assetVipStylePath)) {
						styleData = Json.parse(Assets.getText(assetVipStylePath));
					} else if (Assets.exists(assetStylePath)) {
						styleData = Json.parse(Assets.getText(assetStylePath));
					}
				}
				preloadedStyles.push(styleData);
			}

		#if (target.threaded)
		if (!Options.getData("loadAsynchronously") || !Options.getData("healthIcons")) {
		#end
			for (i in 0...groupSongs.length) {
				var song = groupSongs[i];
				var data = preloadedStyles[i];
				var spacing = (data != null && data.letterSpacing != null) ? data.letterSpacing : 0;

				var songText:DesingText = DesingText.createSongText(0, 60 * i, song.name, 80, spacing, data, 1);
				songText.isMenuItem = true;
				songText.targetY = i;

				var fontName = "freeplayTxt.ttf";
				if (GroupSelectState.groupFonts.exists(selectedGroup)) {
					fontName = GroupSelectState.groupFonts.get(selectedGroup);
				}
				songText.font = Paths.font(fontName);
				songText.alignment = "right";

				var padding:Int = 100;
				var textWidth:Float = songText.textField.textWidth * songText.scale.x;
				songText.targetX = FlxG.width - textWidth - padding;
				songText.scrollFactor.set(0, 0);
				songText.origin.x = songText.width;
				songText.origin.y = songText.height / 2;

				grpSongs.add(songText);


				if (Options.getData("healthIcons")) {
					var icon:HealthIcon = new HealthIcon(song.icon);
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

	public var infoText:FlxText;

	/*public function addSong(songName:String, weekNum:Int, songCharacter:String) {
			call("addSong", [songName, weekNum, songCharacter]);
			songs.push(new FreeplaySong(songName, weekNum, songCharacter));
			call("addSongPost", [songName, weekNum, songCharacter]);
		}*/
	var time:Float = 0;
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

		for (i in 0...iconArray.length) {
			if (i == lastSelectedSong)
				continue;

			var _icon:HealthIcon = iconArray[i];

			_icon.scale.set(_icon.startSize, _icon.startSize);

		}
			for (i in 0...iconArray.length) {
				var icon = iconArray[i];
				if (icon.sprTracker == null) continue;

				var distance:Int = Std.int(Math.abs(i - curSelected));
				var scale = Math.max(0.5, Math.min(1, 1 - 0.2 * distance));
				icon.scale.set(scale, scale);

				var opacityValues = [1.0, 0.5, 0.25];
				icon.alpha = (distance < opacityValues.length) ? opacityValues[distance] : 0.0;

				var txt:DesingText = cast icon.sprTracker;
				var textWidth = txt.textField.textWidth * txt.scale.x;
				var targetX = FlxG.width - textWidth - 100 - icon.width * scale - 10;

				if (Math.abs(icon.x - targetX) > 1) icon.x = targetX;
				icon.y = txt.y + (txt.height * txt.scale.y - icon.height * scale) / 2;
			}

		for (i in 0...grpSongs.members.length) {
			var item:DesingText = grpSongs.members[i];
			item.updateShaderFade(curSelected, i);
		}

		if (lastSelectedSong != -1 && scaleIcon != null)
			scaleIcon.scale.set(FlxMath.lerp(scaleIcon.scale.x, scaleIcon.startSize, elapsed * 9),
				FlxMath.lerp(scaleIcon.scale.y, scaleIcon.startSize, elapsed * 9));

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		var funnyObject:FlxText = scoreText;

		if (speedText.width >= scoreText.width && speedText.width >= diffText.width)
			funnyObject = speedText;

		if (diffText.width >= scoreText.width && diffText.width >= speedText.width)
			funnyObject = diffText;

		scoreBG.x = funnyObject.x - 6;

		if (Std.int(scoreBG.width) != Std.int(funnyObject.width + 6))
			scoreBG.makeGraphic(Std.int(funnyObject.width + 6), 108, FlxColor.BLACK);

		scoreText.x = FlxG.width - scoreText.width;
		scoreText.text = "PERSONAL BEST:" + lerpScore;

		diffText.x = FlxG.width - diffText.width;

		curSpeed = FlxMath.roundDecimal(curSpeed, 2);

		if (curSpeed < 0.25)
			curSpeed = 0.25;

		speedText.text = "Speed: " + curSpeed + " (R+SHIFT)";
		speedText.x = FlxG.width - speedText.width;

		var leftP = controls.LEFT_P;
		var rightP = controls.RIGHT_P;
		var shift = FlxG.keys.pressed.SHIFT;

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;

		if (songsReady) {
			if (songs.length > 1) {
				if (-1 * Math.floor(FlxG.mouse.wheel) != 0 && !shift)
					changeSelection(-1 * Math.floor(FlxG.mouse.wheel));
				else if (-1 * (Math.floor(FlxG.mouse.wheel) / 10) != 0 && shift)
					curSpeed += -1 * (Math.floor(FlxG.mouse.wheel) / 10);

				if (upP)
					changeSelection(-1);
				if (downP)
					changeSelection(1);
			}

			if (leftP && !shift)
				changeDiff(-1);
			else if (leftP && shift)
				curSpeed -= 0.05;

			if (rightP && !shift)
				changeDiff(1);
			else if (rightP && shift)
				curSpeed += 0.05;

			if (FlxG.keys.justPressed.R && shift)
				curSpeed = 1;

			if (controls.BACK) {
				if (colorTween != null)
					colorTween.cancel();

				if (vocals.active && vocals.playing)
					destroyFreeplayVocals(false);
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
					selectedGroup 
				));
			}

		
	
			var curSong:FreeplaySong = songs[curSelected];

			if (curSong != null) {

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
					var targetAlpha = 0;
					if (curSong.bgs != null && curSong.bgs == portName) {
						targetAlpha = 1; 
					}
					port.alpha = FlxMath.lerp(port.alpha, targetAlpha, elapsed * 8);
				}

				for (renderName in renders.keys()) {
					var r = renders.get(renderName);
					var targetAlpha = 0;
					var targetZ = -200;
					var targetY = 250;
					var targetAngleX = -90; 
					if (curSong.render != null && curSong.render == renderName) {
						targetAlpha = 1;
						targetZ = 0;
						targetY = 0;
						targetAngleX = 0;
					}

					r.alpha = FlxMath.lerp(r.alpha, targetAlpha, elapsed * 8);
					r.y = FlxMath.lerp(r.y, targetY, elapsed * 8);
					r.z = FlxMath.lerp(r.z, targetZ, elapsed * 8);

				
					if (targetAlpha == 1) {
						
						r.angleX = FlxMath.lerp(r.angleX, 0, elapsed * 8);
						if (r.alpha < 0.1) r.angleX = 90; 
					} else {
						r.angleX = FlxMath.lerp(r.angleX, -90, elapsed * 8);
						if (r.alpha > 0.9) r.angleX = 0; 
					}
				}


			}







			#if PRELOAD_ALL
			if (FlxG.keys.justPressed.SPACE) {
				destroyFreeplayVocals();

				// TODO: maybe change this idrc actually it seems ok now
				if (Assets.exists(SongLoader.getPath(curDiffString, curSong.name.toLowerCase(), mix))) {
					PlayState.SONG = SongLoader.loadFromJson(curDiffString, curSong.name.toLowerCase(), mix);
					Conductor.changeBPM(PlayState.SONG.bpm, curSpeed);
				}

				vocals = new FlxSound();

				var voicesDiff:String = (PlayState.SONG != null ? (PlayState.SONG.specialAudioName ?? curDiffString.toLowerCase()) : curDiffString.toLowerCase());
				var voicesPath:String = Paths.voices(curSong.name.toLowerCase(), voicesDiff, mix ?? '');

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

		if (FlxG.keys.justPressed.ENTER && canEnterSong) {
				playSong(curSong.name, curDiffString);
				audioBarsActive = false; // Previene el chaseo
				audioAnalyzer = null;
			}

			if (FlxG.sound.music != null && FlxG.sound.music.playing) {
				audioAnalyzer = new AudioAnalyzer(FlxG.sound.music);
				FlxG.sound.music.pitch = curSpeed;
		    }


			var l:Float = 0;
			var n:Float = 0;
			if (audioBarsActive) {
				var time = Math.floor(FlxG.sound.music.time/10)*10;
				for (i in 0...audioBars.length) {
					var spr = audioBars[i];
					
					n += 10 / audioBars.length;
					var v = audioAnalyzer != null ? audioAnalyzer.analyze(time + l, time + n) : 0;
					spr.scale.y = FlxMath.lerp(spr.scale.y, v*250, 0.15);
					spr.y = FlxG.height-spr.scale.y;
					spr.updateHitbox();
					l = n;
				}
			}
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
				CoolUtil.coolError(songName.toLowerCase() + " doesn't seem to exist!\nTry fixing it's name in freeplay.json",
					"Leather Engine's No Crash, We Help Fix Stuff Tool");
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
							notes: [
								{
									sectionNotes: [],
									lengthInSteps: 16,
									mustHitSection: true,
									bpm: 0.0,
									changeBPM: false,
									altAnim: false,
									timeScale: [0, 0],
									changeTimeScale: false
								}
							],
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
			if (Assets.exists(Paths.inst(songName.toLowerCase(), diff.toLowerCase(), mix)))
				CoolUtil.coolError(PlayState.SONG.song.toLowerCase() + " (JSON) does not match " + songName + " (FREEPLAY)\nTry making them the same.",
					"Leather Engine's No Crash, We Help Fix Stuff Tool");
			else
				CoolUtil.coolError("Your song seems to not have an Inst.ogg, check the folder name in 'songs'!",
					"Leather Engine's No Crash, We Help Fix Stuff Tool");
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

	function changeDiff(change:Int = 0) {
		call("changeDiff", [change]);
		curDifficulty = FlxMath.wrap(curDifficulty + change, 0, curDiffArray.length - 1);
		curDiffString = curDiffArray[curDifficulty].toUpperCase();

		if (songs.length != 0) {
			var curSong:FreeplaySong = songs[curSelected];
			intendedScore = Highscore.getScore(curSong.name, curDiffString);
			curRank = Highscore.getSongRank(curSong.name, curDiffString);
		}

		if (curDiffArray.length > 1)
			diffText.text = "< " + curDiffString + " ~ " + curRank + " >";
		else
			diffText.text = curDiffString + " ~ " + curRank + "  ";
		call("changeDiffPost", [change]);
	}

	function changeSelection(change:Int = 0) {
		call("changeSelection", [change]);

		if (grpSongs.length <= 0) {
			return;
		}

		curSelected = FlxMath.wrap(curSelected + change, 0, grpSongs.length - 1);
		
		// Sounds
		
		// Scroll Sound
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		var curSong:FreeplaySong = songs[curSelected];
		scoreBG.visible = scoreText.visible = diffText.visible = speedText.visible = (curSong?.menuConfig?.showStats) ?? true;

		// Song Inst
		if (Options.getData("freeplayMusic") && curSelected >= 0) {
			FlxG.sound.playMusic(Paths.inst(curSong.name, curDiffString.toLowerCase()), 0.7);

			if (vocals != null && vocals.active && vocals.playing)
				destroyFreeplayVocals(false);
		}

		if (songs.length != 0) {
			intendedScore = Highscore.getScore(curSong.name, curDiffString);
			curRank = Highscore.getSongRank(curSong.name, curDiffString);
		}

		if (songs.length != 0) {
			curDiffArray = curSong.difficulties;
			changeDiff();
		}

		var bullShit:Int = 0;

		if (iconArray.length > 0) {
			for (icon in iconArray) {
				//icon.alpha = 0.6;

				if (icon.animation.curAnim != null)
					icon.animation.play("neutral");
			}

			if (iconArray != null && curSelected >= 0 && (curSelected <= iconArray.length) && iconArray.length != 0) {
				var selectedIcon:HealthIcon = iconArray[curSelected];
				//selectedIcon.alpha = 1;
				selectedIcon.animation.play("win");
			}
		}

		for (item in grpSongs.members) {
			item.targetY = bullShit - curSelected;

			bullShit++;
		}



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