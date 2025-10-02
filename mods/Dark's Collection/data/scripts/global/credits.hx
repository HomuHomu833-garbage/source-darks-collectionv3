import flixel.text.FlxText.FlxTextBorderStyle;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import states.FreeplayState;
import flixel.FlxCamera;
import shaders.ColorSwapHSV;
var popupCam:FlxCamera;
var songTable:Array<Array<Dynamic>> = [
    // 1. song 2.composers 3.carter 4.modcarter 5.og composer/song 6.timesteps (en el cart editor) 7.color de 0 a 1 osea 0.1,0.2 etc
    ["Rejected VIP", "LordVoiid, NK, Invalid, Paper, Rev", "G_Zuck(Matt) & NotPX (BF,Pico)", "Darkroft","CrazyCake", 10380,0.2],
    ["Defamation of Reality", "LordVoiid and AngryRacc", "G_Zuck (9k)", "None","",0],
    ["Final Timeout", "LordVoiid", "Spikemaster (God 8k) - Darkroft (Double God 8k)", "None","",0],
    ["Radical Showdown", "LordVoiid and Singularcurtains", "Bob (9k)", "Bob","",0],
    ["TKO vip", "LordVoiid , NobodyKnows and AngryRacc", "Spikemaster (4k & 6k)","Darkroft", "HamillUn and Shteque", 20790],
    ["VC Rejected", "LordVoiid", "Spikemaster (Godly 6k & 9k)", "None","inchiro133",0],
    ["VC Galactic Storm", "LordVoiid and NobodyKnows", "Nash (4k) - G_Zuck (9k) - Spikemaster (12k)", "Darkroft & EsoRandin","LordVoiid", 9610],
    ["Rev Sporting", "Revilo", "Spikemaster (Standard & God)", "Biddle3", 12820],
    ["Fight It Up", "Revilo", "Spikemaster (9k) - Darkroft (God)", "",0],
    ["Rev Ballin", "Revilo", "Spikemaster (Standard)", "AngryRacc",0],
    ["SXM Target Practice", "TheViDuelty", "Spikemaster (Standard , God & Double God)", "TheOnlyVolume",0],
    ["Multiverse Destination", "TheViDuelty", "Spikemaster (Godly) - Darkroft (Double Godly)","", "Srperez,Ronezkj15 & LordVoiid",0],
    ["Colsfoot Catastrophe", "Tbzzile and Friends!", "Spikemaster (7k , 12k , 13k & Canon)", "",0],
    ["Final Mashup Destination", "Tbzzile and Friends!", "Spikemaster (9k)", "Srperez and 15 Others",0],
    ["Hyper Destination 3", "Tbzzile and Friends!", "Spikemaster (9k & God)","Darkroft", "", 9640],
    ["Hyper Destination X", "Tbzzile and Friends!", "Spikemaster (Canon)", "Darkroft","", 75900],
    ["Immortaly Hatred", "Tbzzile and Friends!", "Spikemaster (9k)", "","",0],
    ["Mighty Gods", "Tbzzile and Friends!", "Spikemaster (9k) - Darkroft (God & Double God) ", "","",0],
    ["Universe Invaders", "Tbzzile and Friends!", "Spikemaster (9k , 12k , Canon , 12k God & 16k God) - Darkroft (9k God) ", "",0],
    ["Spiral Dismay", "ShaggyFan23", "Spikemaster (God & Double God)", "","",0],
    ["AK and WR FD", "ImPaper", "Spikemaster (God & Double God)", "None" ,"Srperez",0],
    ["Old VC Sporting", "Im Paper And Revilo", "Spikemaster (7k)", "None","Biddle3", 12820],
    ["Final Destination PS", "Im Paper", "G_Zuck (NoGod) , Spikemaster & Bloxyforever (God)","Darkroft", "Srperez", 14610],
    ["Evolved Destination END Mix", "LumiOff", "Spikemaster (WTF)", "None","Srperez",0],
    ["Godified Destruction Double God", "LumiOff", "Spikemaster (9k & God)", "","Viniciusvmorwtf",0],
    ["Andromeda Devourer", "LumiOff", "Spikemaster (Canon , God & Infinite)", "Darkroft", "",9620],
     ["Galactic Conqueror", "Nerdy", "Spikemaster (9k & 12k)", "None","",0],
     ["Mystery Terrors", "Nerdy", "Spikemaster (Standard)", "None","",0],
     ["Super Saiyan 3", "Leader", "Spikemaster (4k Mania & Canon)", "None", "Srperez",8620],
     ["Hell Usurper", "Aura-_-", "Spikemaster (9k & 12k) - Bloxyforever (9k God) ", "","",12190],
     ["Unleashed", "ScratchRZL", "Spikemaster (Standard & God)", "","",0],
     ["SEDATE", "Simpie", "Spikemaster (5k , 9k , 18k , God 5k & God 18k) - Darkroft (God 9k)", "","",13770],
     ["Above and Beyond", "Simpie", "Spikemaster (8k & 16k) - Darkroft (8k God)", "","",11350],
     ["Limitless Remake", "Dex_", "Spikemaster (Standard)", "None","",0],
    ["Final Stand Remix", "Dex_", "Spikemaster (4k)","Darkroft", "Spurk" , 15660],
     ["Divine Paradox", "Feak", "Spikemaster (God & Double God)", "None", "",0],
     ["Game Over", "Tomz", "Spikemaster (6k)", "","",0],
    ["Trip", "Feak", "Spikemaster (Standard) - Darkroft (God & Double God)", "Darkroft", "" ,16720],
    ["Haven", "Feak", "Spikemaster", "Darkroft", "","", 13740],
    ["ayuda no puedo parar de escuchar esta parte", "Rev & LordVoiid", "Spikemaster", "","Srperez",0],
    ["purgatory imposible", "BoxOfRocks", "Spikemaster (Triple God & Triple God No Modchart)", "","",0],
    ["VC Cosmic Memories", "LordVoiid", "Bob", "Darkroft","LordVoiid", 9640],
    ["Warriors", "Im Paper", "Spikemaster", "Darkroft","LordVoiid", 14290],
    ["God fury", "Armando The Anima", "LumiOff", "Darkroft","", 9640],
    ["VC Ultra Instinct Tomz", "LumiOff", "LumiOff","Darkroft", "Tomz", 7260],
    ["SxM Synergy", "TheViDuelty", "Spikemaster (Standard & Old)", "TheOnlyVolume","","",0],
    //secret ["Iridescence", "Cryptic Crimson", "Spikemaster (Standard)", "",""],
    ["VC Total Bravery", "LordVoiid", "Bloxyforever", "Darkroft", 13570],
    ["Veteran", "ImPaper & LordVoiid", "Bob","Darkroft", "IvanoDrako", 9640],
    ["Final Round", "NK", "Spikemaster","Darkroft", "", 1000000000],
    ["Cheater Suffering", "LumiOff", "Lumioff", "Darkroft","",0],
     ["Galaxy Demons", "bruhitscc", "Spikemaster", "Darkroft","",10720],
    ["Final boss", "NobodyKnows", "Spikemaster","Darkroft", "", 19220],
    //["GOD MODE INSTINCT", "Omarjotaro", "Spikemaster (Easier & Standard) & LumiOff (100)", "Tomz" , 100000000],
    ["VC Showdown", "Revilo", "Bloxyforever","Darkroft","", 4820],
    ["VC Intervention", "dre's productions", "spikemaster","Darkroft", "", 6900],
    ["Pandemonium", "LordVoiid", "DogXD", "Je(sus)","", 9160],
    ["Reimagined Final Destination", "Tbizzle and Friends!", "Foxy", "","",0],
    ["King Hit PS", "ImPaper & mineformer_", "Bob","Bob", "TheOnlyVolumen", 6660],
    ["Alter Ego PS", "ImPaper & Delta", "LumiOff","Darkroft", "LordVoiid & Revilo", 12420],
    ["VS Final Destination", "LumiOff (Voices)", "LumiOff","Darkroft", "LordVoiid", 6420],
    ["Old Enemies", "NobodyKnows", "LumiOff", "Darkroft", 10410],
    ["DS Final Destination", "GoofyGoobert", "Spikemaster", "Darkroft","",6400],
    ["VC Last Combat", "LordVoiid & NobodyKnows", "DogXD", "Darkroft","BoxOfRocks", 9640],
    ["Dance Party", "Invalid Bruh", "G_zuck", "Darkroft","Anm & hippo0824", 11640],
    ["Irreverence", "Aura-_-", "Spikemaster", "Darkroft","", 12840],
    //["Boxing Match 3NB", "Dex_", "DogXD", "TheOnlyVolume", 5440],
    ["Alter Ego VIP", "LordVoiid,NobodyKnows & ImPaper", "LumiOff","Darkroft", "LordVoiid & Revilo", 23300],
    ["VC Blast", "Real_Dodo", "Bloxyforever & Sarko","Darkroft","Srperez", 14770],
    ["VC Cosmic Truth", "Simpie", "DogXD (Voiid) & BloxyForever (4k)","Darkroft", "AngryRacc", 19760],
    ["VC Disadvantage", "LordVoiid", "Saratoc","Darkroft & Franklolx", "Revilo", 14780],
    ["Zagreus", "LordVoiid (Inst) & IvanoDrako (Voices)", "DogXD", "Darkroft","", 13740],
    ["VC Champion", "LordVoiid (Voices) & NobodyKnows (Inst)", "Spikemaster","Darkroft", "Box of Rocks", 11180],
    ["VC Eruption", "Real_Dodo", "Foxy","Darkroft", "Srperez", 9860],
    ["VC Kaio Ken", "Real_Dodo", "Foxy","Darkroft", "Srperez", 4390],
    ["Mattpurgation", "Invalid and DeltaMoai", "DogXD","Darkroft", "JADS", 20020,0.3],
    ["VC Astral Calamity", "Real_Dodo(Voices) & Rigthnow (Inst)", "Spikemaster", "Darkroft","Srperez", 10120],
    ["Wind Up", "NobodyKnows", "Spikemaster", "Darkroft","VS Matt Wiik", 4500],
    ["VC AHP", "Real_Dodo", "Spikemaster (Voiid) - Notpx (4k)","Darkroft", "Spurk", 8200],
    ["VC Veteran", "IvanoDrako", "G_Zuck", "Darkroft & Franklolx", "", 10130],
    ["Harsh Reality", "Antarhk", "Invis", "Darkroft","",13180],
    ["Reconciled", "FerX", "JJTurbo", "Darkroft","",15410],
    ["Final Destination", "Srperez , LumiOff(God 2.0)", "LumiOff(Hard & God) & Spikemaster (God 2.0)", "None","",0],
    ["Frenetic", "Real_Dodo", "Spikemaster", "Darkroft","", 25640],
    ["VC Mild Mania", "Real_Dodo", "Foxy", "Ultra Damian 64","Darkroft", 9610],
    ["Rejected PS", "ImPaper,Dex_,LordVoiid,IvanoDrako,Glox,NobodyKnows & Invalid Bruh(Inst)","DogXD","Darkroft","CrazyCake", 16470],
    ["Haxchi", "NobodyKnows", "Spikemaster", "Darkroft","", 39630],
    ["Alarmiing", "Invalid Bruh", "DogXD", "Darkroft","", 12820],
    ["FS Rejected", "IvanoDrako (Inst & Voices) , ImPaper,LordVoiid (Voices)", "DogXD", "Darkroft", "CrazyCake", 22760],
    ["IDR Rejected", "IvanoDrako (Inst & Voices) , ImPaper,LordVoiid, (Voices)", "Spikemaster", "Darkroft", "CrazyCake", 22680],
    ["Gunpowder", "Real_Dodo", "Spikemaster", "Darkroft", "", 11900],
    ["VC Haven", "dre's productions", "Saratoc - Nash (4k)","Darkroft", "Feak", 12840],
    ["Wastelands", "LordVoiid", "Darkroft ","Darkroft & Franklolx", "", 13780],
    ["Cleverness", "Real_Dodo", "JJTurbo","Darkroft & Franklolx", "LordVoiid", 12030],
    ["Unlimited Instinct", "LumiOff", "Spikemaster","Darkroft", "NobodyKnows", 22020],
    ["VC Harsh Reality", "Real_Dodo", "Spikemaster (Voiid) - LuigiKirbo902; (4k)","Darkroft", "Antarhk", 13280],
    ["VC Dojo", "Real_Dodo", "JJTurbo","Darkroft", "mojito_bro", 11000],
    ["Last Resort", "Delta", "JJTurbo","Darkroft", "", 18570],
    ["Hatarii", "Delta & Mlom", "JJTurbo","Darkroft", "", 24020],
    ["Calamiity", "Revilo", "JJTurbo","Darkroft", "", 9420],
    ["Priimunus", "Invalid", "JJTurbo","Darkroft", "", 18360],
    ["Zeniith", "Simpie & Cow", "JJTurbo","Darkroft", "", 10160],
    ["Your Personal Hell", "Delta", "JJTurbo","Darkroft & LuigiKirbo", "LordVoiid", 35920],
    ["VC Final Destination", "TheOnlyVolume (Inst) , Wolfinu & ImSilv4 (Voices)", "Kaep(4k) & Spikemaster (9k)","Darkroft & Franklolx", "Srperez", 0,0.5]
];

var song:Array<Dynamic> = ["pon bien pto", "", "", "", "", null];
var lineTexts:Array<FlxText> = [];
var songBG:FlxSprite;
var songText:FlxText;
var extraText:FlxText;

var showedPopups = false;
var hiddenPopups = false;
var killedPopups = false;
var currentIndex:Int = 0;
var isAnimating:Bool = false;
var animationTimer:Float = 0;
var transitionSpeed:Float = 1.5; // segundos
function createPost() {
    for (entry in songTable) {
        if (entry[0].toLowerCase() == PlayState.SONG.song.toLowerCase()) {
            song = entry;
            break;
        }
    }

    popupCam = new FlxCamera();
    popupCam.bgColor = 0x00000000;
    FlxG.cameras.add(popupCam, false);

    songBG = new FlxSprite().loadGraphic(Paths.image("Credits"));
    songBG.scrollFactor.set(0, 0);
    songBG.y = 1200;
    songBG.x = 30;
    songBG.cameras = [popupCam];
    var colorSwapShader:ColorSwapHSV = new ColorSwapHSV();
    if (song.length > 6 && song[6] != null) {
        colorSwapShader.hue = Std.parseFloat(song[6]);
    }
    songBG.shader = colorSwapShader.shader;


    add(songBG);

    songText = new FlxText(0, 0, 400, song[0]);
    songText.setFormat(Paths.font("EurostileExtendedBlack.ttf"), 65, FlxColor.BLACK, "center");
    songText.scrollFactor.set(0, 0);
    songText.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xFFFFFFFF, 2);
    songText.cameras = [popupCam];

   

    add(songText);
    
    songText.y = FlxG.height / 2 + 550;

    var lines:Array<String> = ["* Composer *\n " + song[1], "* Charter *\n " + song[2]];
    if (song[3] != "") lines.push("* Modcharter * \n" + song[3]);
    if (song[4] != "") lines.push("* Original Song * \n" + song[4]);

    lineTexts = [];
    for (i in 0...lines.length) {
        var line = new FlxText(0, 300, 400, lines[i]);
        line.setFormat(Paths.font("Contb___.ttf"), 32, FlxColor.BLACK, "center");
        line.scrollFactor.set(0, 0);
        line.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xFFFFFFFF, 1.5);
        line.cameras = [popupCam]; 
        line.visible = false;
        add(line);
        line.y = songText.y + songText.height + 150 + (i * 80);
        lineTexts.push(line);
    }

    if (lineTexts.length > 0) lineTexts[0].visible = true;
}

function update(elapsed:Float) {
    if (!showedPopups && Conductor.songPosition > song[5]) {
        showedPopups = true;
        isAnimating = true;
        FlxTween.tween(songBG, {y: 410}, 1, {ease: FlxEase.cubeOut});
        FlxTween.tween(songText, {y: 450}, 1, {ease: FlxEase.cubeOut});
        if (lineTexts.length > 0) {
            var first = lineTexts[0];
            first.visible = true;
            first.alpha = 1;
            FlxTween.tween(first, {y: 580}, 1, {ease: FlxEase.cubeOut});
        }
    }
    if (isAnimating) {
        animationTimer += elapsed;

        if (animationTimer >= transitionSpeed) {
            animationTimer = 0;

            var current = lineTexts[currentIndex];
            var nextIndex = currentIndex + 1;

            if (nextIndex < lineTexts.length) {
                var next = lineTexts[nextIndex];

                FlxTween.tween(current, {x: current.x - 200, alpha: 0}, transitionSpeed, {
                    ease: FlxEase.cubeInOut,
                    onComplete: function(_) { current.visible = false; }
                });

                next.visible = true;
                next.alpha = 0;
                FlxTween.tween(next, {y: songText.y + 130, alpha: 1}, transitionSpeed, {ease: FlxEase.cubeOut});
                currentIndex++;
            } else {
                isAnimating = false;
                FlxTween.tween(songBG, {y: FlxG.height, alpha: 0}, 1.5, {ease: FlxEase.cubeInOut});
                FlxTween.tween(songText, {y: FlxG.height, alpha: 0}, 1.5, {ease: FlxEase.cubeInOut});

                for (line in lineTexts) {
                    FlxTween.tween(line, {y: FlxG.height, alpha: 0}, 1.5, {
                        ease: FlxEase.cubeInOut,
                        onComplete: function(_) {
                            if (line == lineTexts[lineTexts.length - 1]) {
                                FlxG.cameras.remove(popupCam, true);
                                popupCam = null;
                                killedPopups = true;
                            }
                        }
                    });
                }
            }
        }
    }

}
