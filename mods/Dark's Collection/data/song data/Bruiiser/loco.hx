/*var game:PlayState = PlayState.instance;

var camDad:FlxCamera;
var camBF:FlxCamera;
function createPost() {
    camDad = new FlxCamera(0, 0, FlxG.width / 2, FlxG.height).copyFrom(game.camGame);
    camBF = new FlxCamera(FlxG.width / 2, 0, FlxG.width / 2, FlxG.height).copyFrom(game.camGame);

    FlxG.cameras.remove(game.camHUD, false);
    for (cam in [camDad, camBF]) {
        FlxG.camera.add(cam);
        cam.zoom = 0.7;
        cam.target = null;
    }
    FlxG.cameras.add(game.camHUD, false);
    camDad.scroll.set(game.dad.x, game.dad.y); camBF.scroll.set(game.boyfriend.x, game.boyfriend.y);
    camDad.followLerp = 0.1;
    camBF.followLerp = 0.1;

}
function stepHit()
{
    if (curStep == 12) 
    {
        FlxTween.tween(camDad, {x: camDad.x - 300}, 1, {ease: FlxEase.quadOut});
        FlxTween.tween(camBF, {x: camBF.x + 300}, 1, {ease: FlxEase.quadOut});
    }
}*/

// function updatePost() for (cam in [camDad, camBF]) cam.zoom = game.camGame.zoom; // Remove the dashes if you want the zoom to follow camGame's.