package states;

import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import ui.FreeplayTxt;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import shaders.Shaders.GreyscaleEffect;
import shaders.Shaders.ChesslolEffect;
import flixel.math.FlxMath;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import game.FreeplaySong;
import utilities.FiltersBG;

class GroupSelectState extends MusicBeatState {
    public var groupList:Array<Int>;
    public var onGroupSelected:Int->Void;
    public static var groupID:Int = 0;
    public static var groupSongs:Array<FreeplaySong> = [];
    
    var vortexEffect:ChesslolEffect;
    var vortexSprite:FlxSprite;
    var grpTexts:FlxTypedGroup<FreeplayTxt>;
    var blockArray:Array<FlxSprite>;
    var shadersArray:Array<GreyscaleEffect>;
    var curSelected:Int = 0;
    var visibleStart:Int = 0;
    inline static var VISIBLE_COUNT:Int = 3;

    var leftArrow:FlxText;
    var rightArrow:FlxText;
	public var selectedGroup:Int;

    public static var groupImages:Map<Int, String> = new Map();
    public static var groupFonts:Map<Int, String> = new Map();
    public static var groupTextSizes:Map<Int, Int> = new Map();

	public static var groupNames:Array<String>;
	public var songs:Array<FreeplaySong>;
    public function new(groups:Array<Int>, names:Array<String>, onSelect:Int->Void, selectedGroup:Int = 0) {
        super();
        groupList = groups;
        groupNames = names;
        onGroupSelected = onSelect;
        this.selectedGroup = selectedGroup;
        visibleStart = Math.floor(selectedGroup / VISIBLE_COUNT) * VISIBLE_COUNT;
        curSelected = selectedGroup;
        if (curSelected < 0 || curSelected >= groupList.length)
            curSelected = 0;
    }
	override function create() {
		super.create();
        
		
		var path:String = #if MODDING_ALLOWED 'mods/${Options.getData("curMod")}/data/freeplay.json'; #else 'assets/data/freeplay.json'; #end

		if (FileSystem.exists(path)) {
			var rawData:Dynamic = Json.parse(File.getContent(path));
			songs = cast rawData.songs; 
			groupNames = rawData.groups;
			groupList = [];
			for (i in 0...groupNames.length) groupList.push(i);
		} else {
			songs = [];
			groupNames = [];
			groupList = [];
		}


		var groupSongs:Array<FreeplaySong> = [];
		for (song in songs) {
			var gID = (song.group != null ? song.group : 0);
			if (gID == selectedGroup) groupSongs.push(song);
		}


        visibleStart = Std.int(Math.min(visibleStart, Math.max(0, groupList.length - VISIBLE_COUNT)));
        curSelected = selectedGroup % VISIBLE_COUNT;

		vortexSprite = new FlxSprite(0, 0);//buenvortex
		vortexSprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		vortexEffect = new ChesslolEffect();
		vortexSprite.shader = vortexEffect.shader;
		add(vortexSprite);

        var filter = FiltersBG.makeBackground(true, "Filter1"); 
		if (filter != null) insert(3, filter);

		blockArray = [];
		shadersArray = [];
		grpTexts = new FlxTypedGroup<FreeplayTxt>();
		add(grpTexts);

		groupImages = new Map();
		loadGroupImages();

		createVisibleGroups();

		leftArrow = new FlxText(20, FlxG.height / 2 - 20, 0, "<", 40);
		rightArrow = new FlxText(FlxG.width - 40, FlxG.height / 2 - 20, 0, ">", 40);
		add(leftArrow);
		add(rightArrow);
		updateArrows();
	}

    function loadGroupImages() {
        var filePath = "assets/images/groupimages/groupimages.txt";
        if (sys.FileSystem.exists(filePath)) {
            for (line in sys.io.File.getContent(filePath).split("\n")) {
                var parts = line.split(":");
                if (parts.length >= 1) {
                    var id = Std.parseInt(parts[0].trim());
                    if (id == null) continue;
                    if (parts.length > 1 && parts[1].trim() != "")
                        groupImages.set(id, parts[1].trim());
                    if (parts.length > 2 && parts[2].trim() != "")
                        groupFonts.set(id, parts[2].trim());
                    if (parts.length > 3 && parts[3].trim() != "") {
                        var size = Std.parseInt(parts[3].trim());
                        if (size != null) groupTextSizes.set(id, size);
                    }
                }
            }
        }
    }



    function createVisibleGroups() {
        for (label in grpTexts.members) remove(label, true);
        grpTexts.clear();
        for (block in blockArray) remove(block,true);
        blockArray = [];
        shadersArray = [];

        var spacing = FlxG.width/3.5;
        var centerX = FlxG.width/2;
        var baseWidth = Std.int(FlxG.width/3.5);
        var baseHeight = Std.int(FlxG.height*0.75);
        var yBase = FlxG.height/2 - 150;

        for (i in 0...VISIBLE_COUNT) {
            var realIndex = visibleStart + i;
            if (realIndex >= groupList.length) break;

            var groupID = groupList[realIndex];
            var width = baseWidth;
            var height = baseHeight;
            var trueSpacing = spacing + (baseWidth*0.15);
            var offsetFromCenter = (i - Math.floor(VISIBLE_COUNT/2)) * trueSpacing;
            var x = centerX + offsetFromCenter - (width/2);
            var y = yBase - (height/2);

            var block = new FlxSprite(x, y);
            if (groupImages.exists(groupID)) {
                block.loadGraphic(Paths.image("groupimages/" + groupImages.get(groupID)));
                block.setGraphicSize(baseWidth, baseHeight);
                block.updateHitbox();
            } else {
                block.makeGraphic(width, height, FlxColor.CYAN);
            }

            block.scrollFactor.set();
            block.antialiasing = true;
            block.updateHitbox();

            var shader = new GreyscaleEffect();
            shader.radius = 0.2;
            shader.borderSize = 0.01;
            shader.smoothness = 0.002;
            shader.strength = (i==curSelected)?0:1;
            shader.update(0);
            block.shader = shader.shader;

            add(block);
            blockArray.push(block);
            shadersArray.push(shader);

            var fontName = "freeplayTxt.ttf";
            if (groupFonts.exists(groupID))
                fontName = groupFonts.get(groupID);
            

			var labelText = (groupID >= 0 && groupID < groupNames.length) ? groupNames[groupID] : Std.string(groupID);
			var label = new FreeplayTxt(0, 0, labelText,true,false);
            label.font = Paths.font(fontName);

			label.alignment = "center";
			label.fieldWidth = width;
			label.x = x + width / 2 - label.fieldWidth / 2 - 20;
			label.y = y - 90;
			insert(members.indexOf(block) + 1, label);
			grpTexts.add(label);

        }
    }

    function updateArrows() {
        leftArrow.visible = visibleStart > 0;
        rightArrow.visible = (visibleStart + VISIBLE_COUNT) < groupList.length;
    }
      var delta:Int = 0;
    override function update(elapsed:Float) {
        super.update(elapsed);
        vortexEffect.time += elapsed;

        if (controls.BACK) {
			FlxG.switchState(() -> new MainMenuState());
		}

		if (FlxG.keys.justPressed.RIGHT) delta = 1;
		else if (FlxG.keys.justPressed.LEFT) delta = -1;

		if (delta != 0) {
            var moved:Bool = false;
            var newIndex = curSelected + delta;

            if (newIndex >= 0 && newIndex < VISIBLE_COUNT && visibleStart + newIndex < groupList.length) {
                curSelected = newIndex;
                moved = true;
            } 
            else if (delta > 0 && visibleStart + VISIBLE_COUNT < groupList.length) {
                visibleStart += VISIBLE_COUNT;
                curSelected = 0;
                createVisibleGroups();
                moved = true;
            } 
            else if (delta < 0 && visibleStart > 0) {
                visibleStart = Std.int(Math.max(0, visibleStart - VISIBLE_COUNT));
                curSelected = VISIBLE_COUNT - 1;
                createVisibleGroups();
                moved = true;
            }

            if (moved) {
                FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                updateArrows();
            }
            delta = 0;
        }


        var spacing = FlxG.width/3.5;
        var centerX = FlxG.width/2;
        var baseWidth = Std.int(FlxG.width/3.5);
        var baseHeight = Std.int(FlxG.height*0.75);
        var scaleUp = 1.15;
        var yBase = FlxG.height/2 + 20;

        for (i in 0...blockArray.length) {
            var block = blockArray[i];
            var shader = shadersArray[i];
            var isSelected = (i==curSelected);
            var targetScale = isSelected?scaleUp:1.0;

            block.setGraphicSize(Std.int(FlxMath.lerp(block.width,baseWidth*targetScale,0.05)), Std.int(FlxMath.lerp(block.height,baseHeight*targetScale,0.05)));
            block.updateHitbox();
            var trueSpacing = spacing + (baseWidth*(scaleUp-1));
            var offsetFromCenter = (i-Math.floor(blockArray.length/2))*trueSpacing;
            block.x = centerX+offsetFromCenter-block.width/2;
            block.y = yBase-block.height/2;

            shader.strength = FlxMath.lerp(shader.strength, isSelected?0:1,0.2);
            shader.update(0);

            if (i<grpTexts.length) {
                var label = cast(grpTexts.members[i],FreeplayTxt);
                label.size = Std.int(FlxMath.lerp(label.size, isSelected?64:52,0.2));
                label.fieldWidth = Std.int(baseWidth*targetScale);
                label.x = block.x + block.width/2 - label.fieldWidth/2 - 20;
                label.y = block.y - 50;
            }
        }
        if (FlxG.keys.justPressed.ENTER) {
            var selectedIndex = visibleStart + curSelected;
            if (selectedIndex < groupList.length) {
                groupID = groupList[selectedIndex];      
                groupSongs = [];                         

                for (song in songs) { 
                    var gID = (song.group != null ? song.group : 0);
                    if (gID == groupID) groupSongs.push(song);
                }

                FlxG.switchState(new FreeplayState(groupID, groupSongs));
            }
        }




    }
}
