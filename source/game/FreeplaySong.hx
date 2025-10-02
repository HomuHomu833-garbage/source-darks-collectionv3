package game;

typedef FreeplaySong = {
    var name:String;
    var icon:String;
    var difficulties:Array<String>;
    var color:String;
    var week:Int;
	@:optional var bgs:String;
	@:optional var render:String;
    @:optional var group:Int;
    @:optional var metadata:FreeplayMetadata;
    @:optional var menuConfig:FreeplayMenuConfig;
    @:optional var extraData:Dynamic;
}


typedef FreeplayMetadata = {
	@:optional
	var composer:String;
	@:optional
	var charter:String;
	@:optional
	var modcharter:String;
}

typedef FreeplayMenuConfig = {
	@:optional
	var canBeEntered:Bool;

	@:optional
	var showStats:Bool;
}
typedef SongTextExtraData = {
	@:optional var letterSpacing:Int;
	@:optional var borderColor:Int;
	@:optional var borderSize:Float;
	@:optional var font:String;
	@:optional var opacity:Float;


	@:optional var outerBorderSize:Float;
	@:optional var midBorderSize:Float;
	@:optional var innerBorderSize:Float;

	
	@:optional var songFont:String;

	
	@:optional var outerBorderTop:String;
	@:optional var outerBorderBot:String;
	@:optional var midBorderTop:String;
	@:optional var midBorderBot:String;
	@:optional var innerBorderTop:String;
	@:optional var innerBorderBot:String;

	
	@:optional var outerBorderTopVIP:String;
	@:optional var outerBorderBotVIP:String;
	@:optional var midBorderTopVIP:String;
	@:optional var midBorderBotVIP:String;
	@:optional var innerBorderTopVIP:String;
	@:optional var innerBorderBotVIP:String;

	
	@:optional var mixGap:Float;
	@:optional var sobelStrength:Float;
	@:optional var sobelIntensity:Float;
}
