package shaders;

import flixel.FlxCamera;
import openfl.display.BitmapData;
import game.Character;
import flixel.math.FlxPoint;
import utilities.CoolUtil;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.FlxG;
import flixel.system.FlxAssets;
import flixel.graphics.frames.FlxFrame;
import flixel.graphics.FlxGraphic;

using StringTools;

class Shaders {
	public static function newEffect(?name:String = "3d"):Dynamic {
		switch (name.toLowerCase()) {
			case "3d":
				return new ThreeDEffect();
		}

		return new ThreeDEffect();
	}
}

class ShaderEffect {
	public function update(elapsed:Float) {
		// nothing yet
	}
}
class RTXEffect extends ShaderEffect
{
    public var shader(default,null):RTXShader = new RTXShader();
    public var overlayColor(default, set):FlxColor = 0x00000000;
    public var satinColor(default, set):FlxColor = 0x000000FF;
    public var innerShadowColor(default, set):FlxColor = 0x00000000;
    public var innerShadowDistance:Float = 10;
    public var innerShadowAngle:Float = 270;
    public var parentSprite:ReflectedSprite = null;

    public var pointLight:Bool = false;
    public var lightX:Float = 0;
    public var lightY:Float = 0;

    public var hue(default, set):Float = 0.0;
    public var sat:Float = 0.0;
    public var brt:Float = 1.0;

    var shiftedOverlayColor:FlxColor = 0x00000000;
    var shiftedSatinColor:FlxColor = 0x000000FF;
    var shiftedInnerColor:FlxColor = 0x00000000;


    public var CFred:Float = 0.0;
    public var CFgreen:Float = 0.0;
    public var CFblue:Float = 0.0;
    public var CFfade:Float = 1.0;

    public var flipX:Bool = false;


    public function updateColorShift()
    {
        shiftedOverlayColor = CoolUtil.getShiftedColor(overlayColor, hue, sat, brt);
        shiftedSatinColor = CoolUtil.getShiftedColor(satinColor, hue, sat, brt);
        shiftedInnerColor = CoolUtil.getShiftedColor(innerShadowColor, hue, sat, brt);

        shader.overlayColor.value = [shiftedOverlayColor.redFloat, shiftedOverlayColor.greenFloat, shiftedOverlayColor.blueFloat];
        shader.overlayAlpha.value = [overlayColor.alphaFloat];

        shader.satinColor.value = [shiftedSatinColor.redFloat, shiftedSatinColor.greenFloat, shiftedSatinColor.blueFloat];
        shader.satinAlpha.value = [satinColor.alphaFloat];

        shader.innerShadowColor.value = [shiftedInnerColor.redFloat, shiftedInnerColor.greenFloat, shiftedInnerColor.blueFloat];
        shader.innerShadowAlpha.value = [innerShadowColor.alphaFloat];
    }

	public function new():Void
    {
        shader.frameBounds.value = [0, 0, 1, 1];
        update(0.0);
        updateColorShift();
    }
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        /*
        var overlay = CoolUtil.getShiftedColor(overlayColor, hue, sat, brt); //get hue shifted color
        shader.overlayColor.value = [overlay.redFloat, overlay.greenFloat, overlay.blueFloat];
        shader.overlayAlpha.value = [overlayColor.alphaFloat];

        var satin = CoolUtil.getShiftedColor(satinColor, hue, sat, brt);
        shader.satinColor.value = [satin.redFloat, satin.greenFloat, satin.blueFloat];
        shader.satinAlpha.value = [satinColor.alphaFloat];

        var inner = CoolUtil.getShiftedColor(innerShadowColor, hue, sat, brt);
        shader.innerShadowColor.value = [inner.redFloat, inner.greenFloat, inner.blueFloat];
        shader.innerShadowAlpha.value = [innerShadowColor.alphaFloat];
        */

        shader.innerShadowDistance.value = [innerShadowDistance];

        if (pointLight && parentSprite != null)
        {
            var pos = parentSprite.getGraphicMidpoint();
            pos.x = lightX-pos.x;
            pos.y = lightY-pos.y;
            if (parentSprite.drawFlipped)
            {
                pos.x = -pos.x;
            }
             shader.innerShadowAngle.value = [Math.atan2(pos.y, pos.x)];

        }
        else 
        {
            var ang = innerShadowAngle*FlxAngle.TO_RAD;
            var pos = FlxPoint.weak(Math.cos(ang), Math.sin(ang));
            if (flipX)
                pos.x = -pos.x; //flip
            shader.innerShadowAngle.value = [ang];

        }
        
        shader.CFred.value = [CFred];
        shader.CFgreen.value = [CFgreen];
        shader.CFblue.value = [CFblue];
        shader.CFfade.value = [CFfade];

        
        if (parentSprite != null)
        {
            var parentSprite:FlxFrame = parentSprite.frame; 
            if (parentSprite.frame != null)
            shader.frameBounds.value = [ parentSprite.frame.x, parentSprite.frame.y, parentSprite.frame.width, parentSprite.frame.height ];
        }
    }

    public function copy()
    {
        var rtx = new RTXEffect();

        rtx.overlayColor = overlayColor;
        rtx.satinColor = satinColor;
        rtx.innerShadowColor = innerShadowColor;
        rtx.hue = hue;
        rtx.innerShadowDistance = innerShadowDistance;
        rtx.innerShadowAngle = innerShadowAngle;
        rtx.parentSprite = parentSprite;
        rtx.pointLight = pointLight;
        rtx.lightX = lightX;
        rtx.lightY = lightY;
        rtx.flipX = flipX;
        rtx.CFred = CFred;
        rtx.CFgreen = CFgreen;
        rtx.CFblue = CFblue;
        rtx.CFfade = CFfade;
        rtx.updateColorShift();
        rtx.update(0);
        return rtx;
    }

    function set_innerShadowColor(value:FlxColor):FlxColor {
        if (innerShadowColor != value)
            updateColorShift();
        return innerShadowColor = value;
    }
    function set_overlayColor(value:FlxColor):FlxColor {
        if (overlayColor != value)
            updateColorShift();
        return overlayColor = value;
    }
    function set_satinColor(value:FlxColor):FlxColor {
        if (satinColor != value)
            updateColorShift();
        return satinColor = value;
    }
    function set_hue(value:Float):Float {

        if (hue != value)
        {
            hue = value;
            updateColorShift();
        }
            
        return value;
    }
}

class RTXShader extends FlxShader
{
    @:glFragmentSource('
        #pragma header

        //https://github.com/jamieowen/glsl-blend !!!!
        
        float blendOverlay(float base, float blend) {
            return base<0.5?(2.0*base*blend):(1.0-2.0*(1.0-base)*(1.0-blend));
        }
        
        vec3 blendOverlay(vec3 base, vec3 blend) {
            return vec3(blendOverlay(base.r,blend.r),blendOverlay(base.g,blend.g),blendOverlay(base.b,blend.b));
        }
        
        vec3 blendOverlay(vec3 base, vec3 blend, float opacity) {
            return (blendOverlay(base, blend) * opacity + base * (1.0 - opacity));
        }
        
        float blendColorDodge(float base, float blend) {
            return (blend==1.0)?blend:min(base/(1.0-blend),1.0);
        }
        
        vec3 blendColorDodge(vec3 base, vec3 blend) {
            return vec3(blendColorDodge(base.r,blend.r),blendColorDodge(base.g,blend.g),blendColorDodge(base.b,blend.b));
        }
        
        vec3 blendColorDodge(vec3 base, vec3 blend, float opacity) {
            return (blendColorDodge(base, blend) * opacity + base * (1.0 - opacity));
        }
        
        float blendLighten(float base, float blend) {
            return max(blend,base);
        }
        vec3 blendLighten(vec3 base, vec3 blend) {
            return vec3(blendLighten(base.r,blend.r),blendLighten(base.g,blend.g),blendLighten(base.b,blend.b));
        }
        vec3 blendLighten(vec3 base, vec3 blend, float opacity) {
            return (blendLighten(base, blend) * opacity + base * (1.0 - opacity));
        }
        
        vec3 blendMultiply(vec3 base, vec3 blend) {
            return base*blend;
        }
        vec3 blendMultiply(vec3 base, vec3 blend, float opacity) {
            return (blendMultiply(base, blend) * opacity + base * (1.0 - opacity));
        }
        
        float inv(float val)
        {
            return (0.0 - val) + 1.0;
        }

        //color fill stuff for back compat with events
        uniform float CFred;
        uniform float CFgreen;
        uniform float CFblue;
        uniform float CFfade;
        
        
        uniform vec3 overlayColor;
        uniform float overlayAlpha;
        
        uniform vec3 satinColor;
        uniform float satinAlpha;
        
        uniform vec3 innerShadowColor;
        uniform float innerShadowAlpha;
        uniform float innerShadowAngle;
        uniform float innerShadowDistance;

        uniform vec4 frameBounds;
        
        float SAMPLEDIST = 5.0;
                
        void main()
        {	
            vec2 uv = openfl_TextureCoordv.xy;
            vec4 spritecolor = flixel_texture2D(bitmap, uv);    
            vec2 resFactor = 1.0 / openfl_TextureSize.xy;
            
            spritecolor.rgb = blendMultiply(spritecolor.rgb, satinColor, satinAlpha);
        
            //inner shadow
            float offsetX = cos(innerShadowAngle);
            float offsetY = sin(innerShadowAngle);
            vec2 distMult = (innerShadowDistance*resFactor) / SAMPLEDIST;

            for (float i = 0.0; i < SAMPLEDIST; i++) //sample nearby pixels to see if theyre transparent, multiply blend by inverse alpha to brighten the edge pixels
            {
                vec2 offsetUV = uv + vec2(offsetX*(distMult.x*i), offsetY*(distMult.y*i));

                vec4 col = vec4(0.0, 0.0, 0.0, 0.0);
               
                //make sure to use texture2D instead of flixel_texture2D so alpha doesnt effect it
                col = texture2D(bitmap, offsetUV); //sample now

                spritecolor.rgb = blendColorDodge(spritecolor.rgb, innerShadowColor, innerShadowAlpha * inv(col.a)); //mult by the inverse alpha so it blends from the outside
            }

            spritecolor.rgb = blendLighten(spritecolor.rgb, overlayColor, overlayAlpha);
        
            
            gl_FragColor = spritecolor*spritecolor.a;

            vec4 CFcol = vec4(CFred / 255.0, CFgreen / 255.0, CFblue / 255.0, spritecolor.a);
            gl_FragColor = mix(CFcol*spritecolor.a, gl_FragColor, CFfade);
        }
    ')

    public function new()
    {
       super();
    }
}

class VortexEffect extends ShaderEffect
{
	public var shader(default,null):VortexShader = new VortexShader();
	public var iTime:Float = 0;
    public var speed:Float = 3;

    public var red:Float = 2.5;
    public var green:Float = 1.0;
    public var blue:Float = 1.5;

	public function new():Void
	{
        shader.uTime.value = [0, 0, 0];
        red = 2.5*0.7;
        green = 1.0*0.7;
        blue = 1.5*0.7;
        update(0);
	}

	override public function update(elapsed:Float):Void
	{
        iTime += elapsed * speed;
		shader.iTime.value = [iTime];
        shader.spiralColor.value = [red,green,blue];
	}

    public var hue(default, set):Float = 0;
	public var saturation(default, set):Float = 0;
	public var brightness(default, set):Float = 0;

	private function set_hue(value:Float) {
		hue = value;
		shader.uTime.value[0] = hue;
		return hue;
	}

	private function set_saturation(value:Float) {
		saturation = value;
		shader.uTime.value[1] = saturation;
		return saturation;
	}

	private function set_brightness(value:Float) {
		brightness = value;
		shader.uTime.value[2] = brightness;
		return brightness;
	}
}

class VortexShader extends FlxShader
{
	@:glFragmentSource('
    #pragma header

    //forked from https://www.shadertoy.com/view/Md3SWH
    
    uniform float iTime;
    uniform vec3 spiralColor;
    float radius = 20.0;
    float radiusInv = 0.05;

    uniform vec3 uTime; //colorswap stuff
    vec3 rgb2hsv(vec3 c)
    {
        vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
        vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
        vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

        float d = q.x - min(q.w, q.y);
        float e = 1.0e-10;
        return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
    }

    vec3 hsv2rgb(vec3 c)
    {
        vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
        vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
        return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
    }
    
    //noise funcs: https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83
    float mod289(float x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
    vec4 mod289(vec4 x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
    vec4 perm(vec4 x){return mod289(((x * 34.0) + 1.0) * x);}
    
    float noise(vec3 p){
        vec3 a = floor(p);
        vec3 d = p - a;
        d = d * d * (3.0 - 2.0 * d);
    
        vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
        vec4 k1 = perm(b.xyxy);
        vec4 k2 = perm(k1.xyxy + b.zzww);
    
        vec4 c = k2 + a.zzzz;
        vec4 k3 = perm(c);
        vec4 k4 = perm(c + 1.0);
    
        vec4 o1 = fract(k3 * (1.0 / 41.0));
        vec4 o2 = fract(k4 * (1.0 / 41.0));
    
        vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
        vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
    
        return o4.y * d.y + o4.x * (1.0 - d.y);
    }
    
    float fbm(vec3 pos)
    {
        vec3 q = pos;
        float f  = 0.5*noise( q ); q = q*2.01;
        f += 0.2500*noise( q ); q = q*2.02;
        f += 0.1250*noise( q ); q = q*2.03;
        f += 0.0625*noise( q ); q = q*2.01;
        return f;
    }
    
    float galaxyNoise(vec2 uv, float angle, float speed)
    {
        float dist = length(uv);    
        float percent = max(0., (radius - dist) * radiusInv);
        float theta = iTime * speed + percent * percent * angle;
        vec2 cs = vec2(cos(theta), sin(theta));
        uv *= mat2(cs.x, -cs.y, cs.y, cs.x);
        
        float n = abs(fbm(vec3(uv, iTime) * 0.2) - 0.5) * 2.5;
        float nSmall = smoothstep(0.2, 0.0, n);
        
        float result = 0.;
        result += nSmall * 0.6;
        result += n;
        result += smoothstep(0.75, 1., percent);
        result *= smoothstep(0.2, 0.7, percent);
        return pow(result, 2.);
    }
    
    vec3 galaxy(vec2 uv)
    {
        float f = 0.;
        f += galaxyNoise(uv * 1.0, 9.0, 0.15) * 0.5;
        f += galaxyNoise(uv * 1.3, 11.0, -0.1) * 0.6;
        f += galaxyNoise(uv * 1.6, 8.0, 0.1) * 0.7;
        f = max(0., f);
        
        vec3 color = mix(spiralColor, vec3(0.0, 0.0, 0.0), length(uv) * radiusInv); 
        color *= f;
        
        return color;
    }
    
    void main()
    {
        vec2 uv = openfl_TextureCoordv.xy-0.5;
    
        //vec2 uv = (fragCoord.xy / iResolution.xy - vec2(0.5)) * vec2(iResolution.x / iResolution.y, 1.);
        uv *= 5. + 0. * cos(iTime * 0.3);
        vec4 color = vec4(galaxy(uv * 3.),1.0);

        vec4 swagColor = vec4(rgb2hsv(vec3(color[0], color[1], color[2])), color[3]);
        swagColor[0] = swagColor[0] + uTime[0];
        swagColor[1] = swagColor[1] + uTime[1];
        swagColor[2] = swagColor[2] * (1.0 + uTime[2]);
        if(swagColor[1] < 0.0)
        {
            swagColor[1] = 0.0;
        }
        else if(swagColor[1] > 1.0)
        {
            swagColor[1] = 1.0;
        }
        gl_FragColor = vec4(hsv2rgb(vec3(swagColor[0], swagColor[1], swagColor[2])), swagColor[3]);
    }

    ')
	public function new()
	{
		super();
	}
}
class GreyscaleEffect extends ShaderEffect
{
	public var shader(default,null):GreyscaleShader = new GreyscaleShader();

	
	public var strength:Float = 0.0;   
	public var radius:Float = 0.0;     
	public var smoothness:Float = 0.0; 
    public var borderSize:Float = 0.0; 
	public function new():Void
	{

		shader.strength.value = [strength];
		shader.radius.value = [radius];
		shader.smoothness.value = [smoothness];
        shader.borderSize.value = [borderSize];
	}

	override public function update(elapsed:Float):Void
	{
	
		shader.strength.value[0] = strength;
		shader.radius.value[0] = radius;
		shader.smoothness.value[0] = smoothness;
        shader.borderSize.value = [borderSize];
	}
}
class GreyscaleShader extends FlxShader
{
	@:glFragmentSource('
		#pragma header

        #define iResolution vec3(openfl_TextureSize, 0.)
        #define iChannel0 bitmap
        #define texture flixel_texture2D

        uniform float radius;
        uniform float smoothness;
        uniform float strength;
        uniform float borderSize;
        uniform float enter;
        uniform float iTime;

        float sdRoundRect(vec2 p, vec2 b, float r){
            vec2 q = abs(p) - b + vec2(r);
            return length(max(q, vec2(0.0))) - r + min(max(q.x, q.y), 0.0);
        }

        void mainImage(out vec4 fragColor, in vec2 fragCoord){
            vec2 uv = openfl_TextureCoordv;
            vec2 centered = uv - 0.5;
            vec2 halfSize = vec2(0.5);
            float dist = sdRoundRect(centered, halfSize, radius);
            float mask = 1.0 - smoothstep(0.0, smoothness, dist);

            float outerW = borderSize * 1.8;
            float innerW = outerW - 0.015;
            float borderOuter = 1.0 - smoothstep(outerW, outerW + 0.002, abs(dist));
            float borderInner = 1.0 - smoothstep(innerW, innerW + 0.002, abs(dist));
            float whiteBorder = clamp(borderOuter - borderInner, 0.0, 1.0) * mask;

            float blackW1 = outerW + 0.01;
            float blackOuter1 = 1.0 - smoothstep(blackW1, blackW1 + 0.002, abs(dist));
            float blackInner1 = 1.0 - smoothstep(outerW, outerW + 0.002, abs(dist));
            float blackBorder1 = clamp(blackOuter1 - blackInner1, 0.0, 1.0) * mask;

            float blackW2 = innerW - 0.008;
            float blackOuter2 = 1.0 - smoothstep(innerW, innerW + 0.002, abs(dist));
            float blackInner2 = 1.0 - smoothstep(blackW2, blackW2 + 0.002, abs(dist));
            float blackBorder2 = clamp(blackOuter2 - blackInner2, 0.0, 1.0) * mask;

            vec4 col = texture(iChannel0, uv);
            float gray = dot(col.rgb, vec3(0.299, 0.587, 0.114));
            vec3 colGray = vec3(gray);
            vec3 finalColor = mix(col.rgb, colGray, strength);

            float flip = enter * (sin(iTime * 8.0) * 0.5 + 0.5);
            vec3 whiteC = mix(vec3(1.0), vec3(0.0), flip);
            vec3 blackC = mix(vec3(0.0), vec3(1.0), flip);

            finalColor = mix(finalColor, whiteC, whiteBorder);
            finalColor = mix(finalColor, blackC, blackBorder1);
            finalColor = mix(finalColor, blackC, blackBorder2);

            fragColor = vec4(finalColor * mask, col.a * mask);
        }

        void main(){
            mainImage(gl_FragColor, gl_FragCoord.xy);
}')
	public function new()
	{
		super();
	}
}


class ChesslolEffect extends ShaderEffect {
	public var shader(default, null):ChesslolShader = new ChesslolShader();

	public var time(default, set):Float = 0;

	private function set_time(value:Float) {
		time = value;
		shader.iTime.value = [time];
		return time;
	}

	public function new() {
		shader.iTime.value = [0];
	}
}


class ChesslolShader extends FlxShader {
	@:glFragmentSource('
    #pragma header

    #define iResolution vec3(openfl_TextureSize, 0.)
    uniform float iTime;
    #define iChannel0 bitmap
    #define texture flixel_texture2D

    // end of ShadertoyToFlixel header

    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        float aspect_ratio = iResolution.y/iResolution.x;
        vec2 uv = fragCoord.xy / iResolution.x;
        uv -= vec2(0.45, 0.4 * aspect_ratio);
        float rot = radians(-30. -iTime); // radians(45.0*sin(iTime));
        mat2 rotation_matrix = mat2(cos(rot), -sin(rot), sin(rot), cos(rot));
        uv = rotation_matrix * uv;
        vec2 scaled_uv = 12.0 * uv; 
        vec2 tile = fract(scaled_uv);
        float tile_dist = min(min(tile.x, 1.0-tile.x), min(tile.y, 1.0-tile.y));
        float square_dist = length(floor(scaled_uv));
        
        float edge = sin(iTime-square_dist*20.);
        edge = mod(edge * edge, 11.0); 



        float value = mix(tile_dist, 1.0-tile_dist, step(1.0, edge));
        edge = pow(abs(1.0-edge), 2.2) * 0.5;
        
        value = smoothstep( edge-0.05, edge, 0.95*value);
        
        
        value += square_dist*.1;
        value *= 1.5 - 0.5;
        
        fragColor = vec4(pow(value, 2.),  pow(value, 1.5),  pow(value, 1.2), texture(iChannel0, fragCoord / iResolution.xy).a);
    }

    void main() {
        mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
    }')
	public function new() {
		super();
	}
}

class CutBitmapEffect extends ShaderEffect {
    public var shader(default,null):CutBitmapShader = new CutBitmapShader();

    public var side(default,set):Float = 1.0;
    public var topX(default,set):Float = 1.0;
    public var bottomX(default,set):Float = 1.0;
    public var borderWidth(default,set):Float = 1.0;

    public var time(default,set):Float = 0.0;
    public var hue(default,set):Float = 0.0;
    public var brightness(default,set):Float = 1.0;

    public var strength(default,set):Float = 0.0;
    public var strengthChrom(default,set):Float = 0.0;

    private function set_time(value:Float):Float {
        time = value;
        shader.iTime.value[0] = time;
        return time;
    }

    private function set_hue(value:Float):Float {
        hue = value;
        shader.hue.value[0] = hue;
        return hue;
    }

    private function set_brightness(value:Float):Float {
        brightness = value;
        shader.brightness.value[0] = brightness;
        return brightness;
    }

    private function set_side(value:Float):Float {
        side = value;
        shader.side.value[0] = side;
        return side;
    }

    private function set_topX(value:Float):Float {
        topX = value;
        shader.topX.value[0] = topX;
        return topX;
    }

    private function set_bottomX(value:Float):Float {
        bottomX = value;
        shader.bottomX.value[0] = bottomX;
        return bottomX;
    }

    private function set_borderWidth(value:Float):Float {
        borderWidth = value;
        shader.borderWidth.value[0] = borderWidth;
        return borderWidth;
    }

    private function set_strength(value:Float):Float {
        strength = value;
        shader.strength.value[0] = strength;
        return strength;
    }

    private function set_strengthChrom(value:Float):Float {
        strengthChrom = value;
        shader.strengthChrom.value[0] = strengthChrom;
        return strengthChrom;
    }

    override public function update(elapsed:Float):Void {
        time += elapsed;
        shader.iTime.value[0] = time;
    }

    public function new() {
        shader.side.value = [0];
        shader.topX.value = [0];
        shader.bottomX.value = [1];
        shader.borderWidth.value = [2];
        shader.iTime.value = [0];
        shader.hue.value = [0];
        shader.brightness.value = [1];
        shader.strength.value = [0];
        shader.strengthChrom.value = [0];
    }
}




class CutBitmapShader extends FlxShader {
	@:glFragmentSource('
       #pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float side;
uniform float topX;
uniform float bottomX;
uniform float borderWidth;

uniform float iTime;
uniform float brightness;
uniform float hue;

uniform float strength;

uniform float strengthChrom;

float hash2(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float hash3(vec2 p, float t)
{
    return fract(sin(dot(p, vec2(269.5, 183.3)) + t * 17.13) * 43758.5453);
}

vec2 mask_coord(vec2 coord, int shift)
{
    float m = exp2(float(shift));
    return floor(coord / m) * m;
}

float get_sample(vec2 coord, int shift)
{
    coord = mask_coord(coord, shift);
    vec2 uv = coord / iResolution.xy;
    uv.y = 1.0 - uv.y;
    float offset = 1.2 * (uv.x + uv.y - 1.0);
    float hxy = hash2(coord);
    float tf = 13.0 * iTime / (6.0 * abs(uv.y - uv.x) + 1.8) + hxy;
    float h1 = hash3(coord, floor(tf));
    float c = 1.2 * h1 + offset;
    return (c - 0.5) * 2.5 / (1.5 + float(shift)) + 0.5;
}

float get_sample_t(vec2 coord, float time)
{
    int shift = 0;
    for (int s = 10; s >= 0; s--) {
        vec2 xy = mask_coord(coord, s) / iResolution.xy;
        xy.y = 1.0 - xy.y;
        if (s < int(6.0 * abs(xy.y - xy.x) + 1.0 + hash3(xy, time))) {
            shift = s;
            break;
        }
    }
    return (get_sample(coord, shift) + get_sample(coord, shift + 1)) * 0.4;
}

vec3 hueToRGB(float h)
{
    float r = abs(h * 6.0 - 3.0) - 1.0;
    float g = 2.0 - abs(h * 6.0 - 2.0);
    float b = 2.0 - abs(h * 6.0 - 4.0);
    return clamp(vec3(r, g, b), 0.0, 1.0);
}

vec4 specialShader(vec2 fragCoord)
{
    float tf = 0.3 * iTime;
    float c = mix(
        get_sample_t(fragCoord, floor(tf)),
        get_sample_t(fragCoord, floor(tf) + 1.0),
        tf - floor(tf)
    );
    vec3 col = hueToRGB(hue) * (c * brightness);
    return vec4(vec3(1.0) * col, 1.0);
}

vec2 barDistFlat(vec2 uv, vec2 pos, float angleRad, float barLen)
{
    vec2 dir = vec2(cos(angleRad), sin(angleRad));
    vec2 pa = uv - pos;
    float t = clamp(dot(pa, dir) / barLen, 0.0, 1.0);
    float d = length(pa - dir * (t * barLen)) * iResolution.x;
    return vec2(d, t);
}

vec2 PincushionDistortion(vec2 uv, float strengthArg)
{
    vec2 st = uv - 0.5;
    float uvD = dot(st, st);
    float uvA = atan(st.x, st.y);
    return 0.5 + vec2(sin(uvA), cos(uvA)) * sqrt(uvD) * (1.0 - strengthArg * uvD);
}

vec3 ChromaticAbberationFull(vec3 col, vec2 uv)
{
    vec3 c;
    c.r = texture(iChannel0, vec2(uv.x + strengthChrom, uv.y)).r;
    c.g = texture(iChannel0, vec2(uv.x - strengthChrom, uv.y)).g;
    c.b = col.b;
    return mix(col, c, strengthChrom);
}

vec4 grayscaleBitmap(vec2 uv)
{
    vec4 c = texture(iChannel0, uv);
    float grey = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    return mix(c, vec4(grey, grey, grey, c.a), strength);
}

void main() {
    vec2 uv = openfl_TextureCoordv.xy;

    vec2 p1 = vec2(topX, 0.0);
    vec2 p2 = vec2(bottomX, 1.0);

    float d = (uv.x - p1.x) * (p2.y - p1.y) - (uv.y - p1.y) * (p2.x - p1.x);
    bool cutSide = side > 0.5 ? (d > 0.0) : (d < 0.0);

    vec2 pa = uv - p1;
    vec2 ba = p2 - p1;
    float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    float dist = length(pa - ba * h) * iResolution.x;

    float bwOuter = borderWidth;
    float bwMiddle = borderWidth * 0.66;
    float bwInner = borderWidth * 0.33;

    vec4 col;

    if (cutSide)
        col = specialShader(openfl_TextureCoordv * openfl_TextureSize);
    else if (dist < bwInner)
        col = vec4(0.0, 0.0, 0.0, 1.0);
    else if (dist < bwMiddle)
        col = vec4(1.0, 1.0, 1.0, 1.0);
    else if (dist < bwOuter)
        col = vec4(0.0, 0.0, 0.0, 1.0);
    else {
        vec4 tex = grayscaleBitmap(uv);

        if (uv.y < 0.08) {
            col = vec4(0.0, 0.0, 0.0, 1.0);
        }
        else if (uv.y > 0.08 && uv.y < 0.1659 && uv.x > 0.108 && uv.x < 0.314) {
            col = vec4(0.0, 0.0, 0.0, 1.0);
        }
        else if (uv.x > 0.0787 && uv.x < 0.108) {
            float yMax = 0.08 + (uv.x - 0.0787) * tan(radians(70.0));
            if (uv.y > 0.08 && uv.y < yMax) {
                col = vec4(0.0, 0.0, 0.0, 1.0);
            } else {
                col = tex;
            }
        }
        else if (uv.x > 0.314 && uv.x < 0.344095) {
            float yMax = 0.1659 - (uv.x - 0.314) * tan(radians(70.0));
            if (uv.y > 0.08 && uv.y < yMax) {
                col = vec4(0.0, 0.0, 0.0, 1.0);
            } else {
                col = tex;
            }
        }
        else {
            col = tex;
        }
    }

    vec4 specialCol = cutSide ? specialShader(openfl_TextureCoordv * openfl_TextureSize) : col;

    if (cutSide && uv.x > 0.44 && uv.x < 1.0 && uv.y > 0.0 && uv.y < 0.17) {
        specialCol = vec4(0.0, 0.0, 0.0, 1.0);
    }

    col = specialCol;

    vec2 d1 = barDistFlat(uv, vec2(0.0, 0.08), radians(0.0), 0.08);
    vec2 d2 = barDistFlat(uv, vec2(0.0787, 0.082), radians(70.0), 0.09);
    vec2 d3 = barDistFlat(uv, vec2(0.344095, 0.08), radians(0.0), 0.1077);
    vec2 d4 = barDistFlat(uv, vec2(0.314, 0.1659), radians(-70.0), 0.09);
    vec2 d5 = barDistFlat(uv, vec2(0.108, 0.161), radians(0.0), 0.208);
    vec2 d6 = barDistFlat(uv, vec2(0.4643, 0.170), radians(0.0), 0.62);

    float factor1 = 1.0;
    float factor2 = 0.5;
    float factor3 = 1.0;
    float factor4 = 0.5;
    float factor5 = 1.0;
    float factor6 = 1.0;

    if (d2.x < bwOuter * factor2 && d2.y > 0.0 && d2.y < 1.0) {
        if (d2.x < bwInner * factor2) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    if (d4.x < bwOuter * factor4 && d4.y > 0.0 && d4.y < 1.0) {
        if (d4.x < bwInner * factor4) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    if (d1.x < bwOuter * factor1 && d1.y > 0.0 && d1.y < 1.0) {
        if (d1.x < bwInner * factor1) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    if (d3.x < bwOuter * factor3 && d3.y > 0.0 && d3.y < 1.0) {
        if (d3.x < bwInner * factor3) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    if (d5.x < bwOuter * factor5 && d5.y > 0.0 && d5.y < 1.0) {
        if (d5.x < bwInner * factor5) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }

    if (d6.x < bwOuter * factor6 && d6.y > 0.0 && d6.y < 1.0) {
        if (d6.x < bwInner * factor6) col = vec4(1.0);
        else col = vec4(0.0, 0.0, 0.0, 1.0);
    }
    
    col.rgb = ChromaticAbberationFull(col.rgb, uv);
    gl_FragColor = col;
}')
	public function new() {
		super();
	}
}

class ThreeDEffect extends ShaderEffect {
	public var shader(default, null):ThreeDShader = new ThreeDShader();

	public var waveSpeed(default, set):Float = 0;
	public var waveFrequency(default, set):Float = 0;
	public var waveAmplitude(default, set):Float = 0;

	public function new():Void {
		shader.uTime.value = [0];
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		shader.uTime.value[0] += elapsed;
	}

	function set_waveSpeed(v:Float):Float {
		waveSpeed = v;
		shader.uSpeed.value = [waveSpeed];
		return v;
	}

	function set_waveFrequency(v:Float):Float {
		waveFrequency = v;
		shader.uFrequency.value = [waveFrequency];
		return v;
	}

	function set_waveAmplitude(v:Float):Float {
		waveAmplitude = v;
		shader.uWaveAmplitude.value = [waveAmplitude];
		return v;
	}
}
/**
 * Class for 3d Shader.
 * This will be softcoded in a .frag file one day.
 */
class ThreeDShader extends FlxShader {
	@:glFragmentSource('
    #pragma header
    //uniform float tx, ty; // x,y waves phase

    //modified version of the wave shader to create weird garbled corruption like messes
    uniform float uTime;
    
    /**
     * How fast the waves move over time
     */
    uniform float uSpeed;
    
    /**
     * Number of waves over time
     */
    uniform float uFrequency;
    
    /**
     * How much the pixels are going to stretch over the waves
     */
    uniform float uWaveAmplitude;

    vec2 sineWave(vec2 pt)
    {
        float x = 0.0;
        float y = 0.0;
        
        float offsetX = sin(pt.y * uFrequency + uTime * uSpeed) * (uWaveAmplitude / pt.x * pt.y);
        float offsetY = sin(pt.x * uFrequency - uTime * uSpeed) * (uWaveAmplitude / pt.y * pt.x);
        pt.x += offsetX; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving
        pt.y += offsetY;

        return vec2(pt.x + x, pt.y + y);
    }

    void main()
    {
        vec2 uv = sineWave(openfl_TextureCoordv);
        gl_FragColor = texture2D(bitmap, uv);
    }')
	public function new() {
		super();
	}
}


