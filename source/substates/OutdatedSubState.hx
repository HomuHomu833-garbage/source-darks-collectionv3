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

class OutdatedSubState extends MusicBeatState {
	private var version:String = 'vnull';
	private var changelog:String = "No changelog available.";

	public function new(?version:String = 'vnull') {
		this.version = version;
		super();
	}

	override function create() {
		super.create();

		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK));

		var txt:FlxText = new FlxText(0, 20, FlxG.width,
			"Nueva actualización encontrada para Darks Collection!\n" +
			"Versión actual: " + CoolUtil.getCurrentVersion() +
			"\nÚltima versión: " + version +
			"\n\nRevisa los cambios abajo:",
			24);
		txt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER);
		txt.screenCenter(X);
		add(txt);

		loadChangelog();

		var changelogTxt:FlxText = new FlxText(50, 150, FlxG.width - 100, changelog, 18);
		changelogTxt.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.LIME, LEFT);
		add(changelogTxt);

		var btnUpdate:FlxButton = new FlxButton(FlxG.width / 2 - 150, FlxG.height - 100, "Actualizar", () -> {
			trace("Usuario eligió actualizar.");
			updateFromGit("assets", "assets");
			updateFromGit("mods", "mods");
		});
		btnUpdate.scale.set(2, 2);
		add(btnUpdate);

		var btnMenu:FlxButton = new FlxButton(FlxG.width / 2 + 50, FlxG.height - 100, "Menú Principal", () -> {
			trace("Usuario decidió ignorar la actualización.");
			FlxG.switchState(() -> new MainMenuState());
		});
		btnMenu.scale.set(2, 2);
		add(btnMenu);

		FlxG.mouse.visible = true;
	}

	function loadChangelog() {
		var http:Http = new Http("https://raw.githubusercontent.com/darkroft123/source-darks-collectionv3/main/changelog.txt");
		http.setHeader("User-Agent", "darkroft123-game");
		http.onData = (data:String) -> {
			trace("Changelog cargado correctamente.");
			changelog = data;
		}
		http.onError = (error:String) -> {
			trace("No se pudo cargar el changelog: " + error);
		}
		http.request();
	}

	function updateFromGit(remotePath:String, localBase:String) {
		trace("Revisando carpeta remota: " + remotePath);
		var http:Http = new Http("https://api.github.com/repos/darkroft123/source-darks-collectionv3/contents/" + remotePath);
		http.setHeader("User-Agent", "darkroft123-game");
		http.onData = (data:String) -> {
			var files:Array<Dynamic> = (haxe.Json.parse(data) : Array<Dynamic>);
			for (file in files) {
				var localPath = localBase + "/" + file.path.split("/").slice(1).join("/");
				if (file.type == "file") {
					if (!FileSystem.exists(localPath)) {
						trace("Nuevo archivo encontrado: " + localPath);
						downloadFile(file.download_url, localPath);
					}
				} else if (file.type == "dir") {
					updateFromGit(file.path, localBase);
				}
			}
		}
		http.onError = (error:String) -> trace("Error fetching " + remotePath + ": " + error);
		http.request();
	}

	function downloadFile(url:String, savePath:String) {
		var http:Http = new Http(url);
		http.setHeader("User-Agent", "darkroft123-game");
		http.onData = (data:String) -> {
			var parts = savePath.split("/");
			if (parts.length > 1) {
				var path = "";
				for (i in 0...parts.length-1) {
					path += parts[i] + "/";
					if (!FileSystem.exists(path)) FileSystem.createDirectory(path);
				}
			}
			File.saveContent(savePath, data);
			trace("Archivo descargado: " + savePath);
		}
		http.onError = (error:String) -> trace("Error descargando " + savePath + ": " + error);
		http.request();
	}
}
