package substates;

import states.MainMenuState;
import states.MusicBeatState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import haxe.Http;
import sys.FileSystem;
import sys.io.File;
import haxe.Json;
import haxe.io.Bytes;

class OutdatedSubState extends MusicBeatState {
	private var version:String = 'vnull';
	private var changelog:String = "No changelog available.";
	private var changelogTxt:FlxText;
	private var btnUpdate:FlxButton;
	private var btnMenu:FlxButton;
	private var downloadQueue:Array<{url:String, path:String}> = [];
	private var token:String = "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"; 

	public function new(?version:String = 'vnull') {
		this.version = version;
		super();
	}

	override function create() {
		super.create();
		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK));

		var txt:FlxText = new FlxText(0, 100, FlxG.width,
			"Nueva actualización encontrada para Darks Collection!\n" +
			"Versión actual: " + CoolUtil.getCurrentVersion() +
			"\nÚltima versión: " + version +
			"\n\nRevisa los cambios abajo:",
			24);
		txt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER);
		txt.screenCenter(X);
		add(txt);

		changelogTxt = new FlxText(50, 250, FlxG.width - 100, changelog, 18);
		changelogTxt.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.LIME, LEFT);
		add(changelogTxt);

		loadChangelog();

		btnUpdate = new FlxButton(FlxG.width / 2 - 150, FlxG.height - 100, "Actualizar", () -> {
			updateFromGit("assets", "assets");
			updateFromGit("mods", "mods");
		});
		btnUpdate.scale.set(2, 2);
		add(btnUpdate);

		btnMenu = new FlxButton(FlxG.width / 2 + 50, FlxG.height - 100, "Menú Principal", () -> {
			FlxG.switchState(() -> new MainMenuState());
		});
		btnMenu.scale.set(2, 2);
		add(btnMenu);

		FlxG.mouse.visible = true;
	}

	function loadChangelog() {
		var http:Http = new Http("https://raw.githubusercontent.com/darkroft123/source-darks-collectionv3/main/changelog.txt");
		http.setHeader("User-Agent", "darkroft123-game");
		http.setHeader("Authorization", "Bearer " + token);
		http.onData = (data:String) -> {
			changelog = data;
			if (changelogTxt != null) changelogTxt.text = changelog;
		}
		http.onError = (error:String) -> trace("No se pudo cargar el changelog: " + error);
		http.request();
	}

	function escapeURL(path:String):String {
		return StringTools.replace(path, " ", "%20");
	}

	function updateFromGit(remotePath:String, localBase:String) {
		var http:Http = new Http("https://api.github.com/repos/darkroft123/source-darks-collectionv3/contents/" + escapeURL(remotePath));
		http.setHeader("User-Agent", "darkroft123-game");
		http.setHeader("Authorization", "Bearer " + token);

		http.onData = (data:String) -> {
			var files:Array<Dynamic> = (Json.parse(data) : Array<Dynamic>);
			var remoteFiles:Array<String> = [];

			for (file in files) {
				var localPath = localBase + "/" + file.path.split("/").slice(1).join("/");

				if (file.type == "file") {
					remoteFiles.push(localPath);
					var needsUpdate = true;
					if (FileSystem.exists(localPath)) {
						try {
							var localData:Bytes = File.getBytes(localPath);
							var localSize = localData.length;
							if (file.size == localSize) needsUpdate = false;
						} catch (_) {}
					}

					if (needsUpdate) {
						if (FileSystem.exists(localPath)) {
							trace("[MODIFICADO] " + localPath);
						} else {
							trace("[NUEVO] " + localPath);
						}
						downloadQueue.push({url: escapeURL(file.download_url), path: localPath});
					}
				} else if (file.type == "dir") {
					updateFromGit(file.path, localBase);
				}
			}

			if (FileSystem.exists(localBase)) {
				for (fileName in FileSystem.readDirectory(localBase)) {
					var fullPath = localBase + "/" + fileName;
					if (!remoteFiles.contains(fullPath) && !FileSystem.isDirectory(fullPath)) {
						trace("[ELIMINADO] " + fullPath);
					}
				}
			}

			if (downloadQueue.length > 0) startNextDownload();
		}

		http.onError = (error:String) -> trace("Error fetching " + remotePath + ": " + error);
		http.request();
	}

	function startNextDownload() {
		if (downloadQueue.length == 0) {
			onUpdateFinished();
			return;
		}
		var next = downloadQueue.shift();
		var http:Http = new Http(next.url);
		http.setHeader("User-Agent", "darkroft123-game");
		http.setHeader("Authorization", "Bearer " + token);
		http.onData = (data:String) -> {
			var parts = next.path.split("/");
			if (parts.length > 1) {
				var path = "";
				for (i in 0...parts.length-1) {
					path += parts[i] + "/";
					if (!FileSystem.exists(path)) FileSystem.createDirectory(path);
				}
			}
			File.saveContent(next.path, data);
			startNextDownload();
		}
		http.onError = (error:String) -> startNextDownload();
		http.request();
	}

	function onUpdateFinished() {
		changelogTxt.text = "¡Juego actualizado correctamente!";
		btnUpdate.visible = false;
		btnMenu.x = FlxG.width / 2 - 100;
	}
}
