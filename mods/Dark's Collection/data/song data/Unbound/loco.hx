import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
import openfl.Assets;

var game:PlayState = PlayState.instance;
var camDad:FlxCamera;
var camBF:FlxCamera;

var camDadTargetX:Float;
var camBFTargetX:Float;

var shaderDadBars:FlxRuntimeShader;
var shaderBFBars:FlxRuntimeShader;
var shaderDadChrom:FlxRuntimeShader;
var shaderBFChrom:FlxRuntimeShader;
var shaderDadAb:FlxRuntimeShader;
var shaderBFAb:FlxRuntimeShader;

function makeShader(name:String, uniform:String, value:Float):FlxRuntimeShader {
	var vert = Assets.exists(Paths.vert(name)) ? Assets.getText(Paths.vert(name)) : null;
	var shader = new FlxRuntimeShader(Assets.getText(Paths.frag(name)), vert);
	shader.setFloat(uniform, value);
	return shader;
}

function createPost() {
	camDad = new FlxCamera(0, 0, FlxG.width / 2, FlxG.height).copyFrom(game.camGame);
	camBF  = new FlxCamera(FlxG.width / 2, 0, FlxG.width / 2, FlxG.height).copyFrom(game.camGame);

	camDadTargetX = camDad.x;
	camBFTargetX = camBF.x;
	camDad.x = -FlxG.height;
	camBF.x = FlxG.height * 2;

	FlxG.cameras.remove(game.camHUD, false);
	for (cam in [camDad, camBF]) {
		FlxG.cameras.add(cam);
		cam.zoom = 0.9;
		cam.target = null;
	}
	FlxG.cameras.add(game.camHUD, false);

	camDad.scroll.set(game.dad.x - 100, game.dad.y - 150);
	camBF.scroll.set(game.boyfriend.x, game.boyfriend.y);
	camDad.followLerp = camBF.followLerp = 0.5;

	shaderDadBars = makeShader("bars", "effect", 0.1);
	shaderBFBars  = makeShader("bars", "effect", 0.1);
		shaderDadAb = makeShader("ChromAbBlueSwapEffect", "strength", 0.015);
	shaderBFAb  = makeShader("ChromAbBlueSwapEffect", "strength", 0.015);
	shaderDadChrom = makeShader("glitchChromatic", "GLITCH", 0.5);
	shaderBFChrom  = makeShader("glitchChromatic", "GLITCH", 0.5);

	camDad.filters = [
		new ShaderFilter(shaderDadBars),
		new ShaderFilter(shaderDadChrom),
		new ShaderFilter(shaderDadAb)
	];

	camBF.filters = [
		new ShaderFilter(shaderBFBars),
		new ShaderFilter(shaderBFChrom),
		new ShaderFilter(shaderBFAb)
	];
}

function cameraBump(cam:FlxCamera, strength:Float = 0.1, speed:Float = 0.2)
{
	var originalZoom = cam.zoom;
	FlxTween.tween(cam, {zoom: originalZoom + strength}, speed, {
		ease: FlxEase.quadOut,
		onComplete: function(_) {
			FlxTween.tween(cam, {zoom: originalZoom}, speed, {ease: FlxEase.quadIn});
		}
	});
}

function stepHit() {
	var dur = (Conductor.crochet * 1) / 1000;
	switch (curStep) {
		case 2752:
			cameraBump(camDad, 0.08, 0.2);
			cameraBump(camBF, 0.08, 0.2);
			FlxTween.tween(camDad, {x: camDadTargetX - 300}, dur, {ease: FlxEase.backOut});
			FlxTween.tween(camBF, {x: camBFTargetX + 300}, dur, {ease: FlxEase.backOut});

		case 2756:
			cameraBump(camDad, 0.1, 0.2);
			cameraBump(camBF, 0.1, 0.2);
			FlxTween.tween(camDad, {x: camDadTargetX - 450}, dur, {ease: FlxEase.cubeIn});
			FlxTween.tween(camBF, {x: camBFTargetX + 450}, dur, {ease: FlxEase.cubeIn});

		case 2760:
			cameraBump(camDad, 0.07, 0.2);
			cameraBump(camBF, 0.07, 0.2);
			FlxTween.tween(camDad, {x: camDadTargetX}, dur, {ease: FlxEase.backOut});
			FlxTween.tween(camBF, {x: camBFTargetX}, dur, {ease: FlxEase.backOut});

		case 2764:
			cameraBump(camDad, 0.05, 0.2);
			cameraBump(camBF, 0.05, 0.2);
			FlxTween.tween(camDad, {x: camDadTargetX - 150}, dur, {ease: FlxEase.cubeIn});
			FlxTween.tween(camBF, {x: camBFTargetX + 150}, dur, {ease: FlxEase.cubeIn});

		case 2768:
			cameraBump(camDad, 0.12, 0.2);
			cameraBump(camBF, 0.12, 0.2);
			var zdur = (Conductor.crochet * 4) / 1000;
			FlxTween.tween(camDad, {x: camDadTargetX}, zdur, {ease: FlxEase.cubeOut});
			FlxTween.tween(camBF, {x: camBFTargetX}, zdur, {ease: FlxEase.cubeOut});

		case 2776:
			FlxTween.num(0.1, 0.55, (Conductor.crochet * 2) / 1000, {ease: FlxEase.cubeIn}, function(v:Float)
			{
				shaderDadBars.setFloat("effect", v);
				shaderBFBars.setFloat("effect", v);
				
			});
			FlxTween.num(0.5, 2, (Conductor.crochet * 2) / 1000, {ease: FlxEase.cubeIn}, function(v:Float)
			{
				shaderDadChrom.setFloat("GLITCH", v);
				shaderBFChrom.setFloat("GLITCH", v);
				
			});
			FlxTween.tween(camDad, {zoom: 1.5}, (Conductor.crochet * 2) / 1000, {ease: FlxEase.cubeIn});
			FlxTween.tween(camBF, {zoom: 1.5}, (Conductor.crochet * 2) / 1000, {ease: FlxEase.cubeIn});

		case 2784:
			FlxTween.num(0.55, 0, (Conductor.crochet * 4) / 1000, {ease: FlxEase.cubeOut}, function(v:Float)
			{
				shaderDadBars.setFloat("effect", v);
				shaderBFBars.setFloat("effect", v);
			});
			FlxTween.tween(camDad, {alpha: 0}, dur, {ease: FlxEase.cubeOut});
			FlxTween.tween(camBF, {alpha: 0}, dur, {ease: FlxEase.cubeOut});
			FlxG.camera.flash(FlxColor.WHITE, 1);
	}
}
var time:Float = 0;
function updatePost(elapsed:Float) {
	time += elapsed;

	if (shaderDadChrom != null)
		shaderDadChrom.setFloat("iTime", time);
	if (shaderBFChrom != null)
		shaderBFChrom.setFloat("iTime", time);
}
