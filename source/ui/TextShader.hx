package ui;

import flixel.system.FlxAssets.FlxShader;

/**
 * Shader para texto con efecto sobel y mezcla de colores.
 *
 * Este wrapper expone:
 *  - outerColorTop, outerColorBot, midColorTop, midColorBot, innerColorTop, innerColorBot
 *  - strength, intensity, mixGap
 *
 * IMPORTANTE: Al asignar a un sprite, hay que pasarle la propiedad interna `shader`
 * del wrapper (es decir, `yourSprite.shader = textShader.shader;`)
 */
 class TextShader {
	// Propiedades para los colores (arrays de 3 floats, normalizados entre 0 y 1)
	public var outerColorTop(default, set):Array<Float> = [1, 1, 1];
	public var outerColorBot(default, set):Array<Float> = [1, 1, 1];
	public var midColorTop(default, set):Array<Float> = [1, 1, 1];
	public var midColorBot(default, set):Array<Float> = [1, 1, 1];
	public var innerColorTop(default, set):Array<Float> = [1, 1, 1];
	public var innerColorBot(default, set):Array<Float> = [1, 1, 1];

	// Otros parámetros
	public var strength:Float = 0.0;
	public var intensity:Float = 0.0;
	public var mixGap:Float = 2.0;
	public var opacity:Float = 1.0;
	public var textIndex:Int = 0;
	public var selectedIndex:Int = 0;

	// El shader interno (FlxShader) que se asignará al sprite
	public var shader(default, null):TextShaderSEXO = new TextShaderSEXO();

	public function new():Void {
		// Inicializamos los uniforms de color y los otros parámetros
		set_outerColorTop(outerColorTop);
		set_outerColorBot(outerColorBot);
		set_midColorTop(midColorTop);
		set_midColorBot(midColorBot);
		set_innerColorTop(innerColorTop);
		set_innerColorBot(innerColorBot);
		shader.strength.value = [strength];
		shader.intensity.value = [intensity];
		shader.mixGap.value = [mixGap];
		shader.opacity.value = [opacity];
		shader.textIndex.value = [textIndex];
		shader.selectedIndex.value = [selectedIndex];
	}

	// Actualiza todos los uniforms (llamar cada frame si varían dinámicamente)
	public function update(elapsed:Float):Void {
		set_outerColorTop(outerColorTop);
		set_outerColorBot(outerColorBot);
		set_midColorTop(midColorTop);
		set_midColorBot(midColorBot);
		set_innerColorTop(innerColorTop);
		set_innerColorBot(innerColorBot);
		shader.strength.value = [strength];
		shader.intensity.value = [intensity];
		shader.mixGap.value = [mixGap];
		shader.opacity.value = [opacity];
		shader.textIndex.value = [textIndex];
		shader.selectedIndex.value = [selectedIndex];
	}

	private function set_outerColorTop(v:Array<Float>):Array<Float> {
		shader.outerColorTop.value = v;
		return outerColorTop = v;
	}
	private function set_outerColorBot(v:Array<Float>):Array<Float> {
		shader.outerColorBot.value = v;
		return outerColorBot = v;
	}
	private function set_midColorTop(v:Array<Float>):Array<Float> {
		shader.midColorTop.value = v;
		return midColorTop = v;
	}
	private function set_midColorBot(v:Array<Float>):Array<Float> {
		shader.midColorBot.value = v;
		return midColorBot = v;
	}
	private function set_innerColorTop(v:Array<Float>):Array<Float> {
		shader.innerColorTop.value = v;
		return innerColorTop = v;
	}
	private function set_innerColorBot(v:Array<Float>):Array<Float> {
		shader.innerColorBot.value = v;
		return innerColorBot = v;
	}

}

class TextShaderSEXO extends FlxShader {
	@:glFragmentSource('
		#pragma header
					
		uniform vec3 outerColorTop;
		uniform vec3 outerColorBot;
		uniform vec3 midColorTop;
		uniform vec3 midColorBot;
		uniform vec3 innerColorTop;
		uniform vec3 innerColorBot;

		uniform float strength;
		uniform float intensity;
		uniform float opacity;
		uniform float textIndex;
		uniform float selectedIndex;

		uniform float mixGap;

		vec4 getSample(vec2 uv)
{
    vec4 col = texture(bitmap, uv);
    float m = ((uv.y-0.5)*mixGap)+0.5;

    vec3 gradMid   = mix(midColorTop, midColorBot, m);
    vec3 gradInner = mix(innerColorTop, innerColorBot, m);
    vec3 gradOuter = mix(outerColorTop, outerColorBot, m);

    vec3 finalRGB = vec3(0.0);

    finalRGB += col.r * gradMid;
    finalRGB += col.g * gradInner;
    finalRGB += col.b * gradOuter;

    finalRGB = mix(col.rgb, finalRGB, 1.0);

    return vec4(finalRGB, col.a);
}


		void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 col = getSample(uv);

    if (strength <= 0.0)
    {
        col.rgb *= opacity;
        col.a *= opacity;
        gl_FragColor = col;
        return;
    }

    vec2 resFactor = (1.0/openfl_TextureSize.xy)*intensity;

    vec4 topLeft = getSample(vec2(uv.x-resFactor.x, uv.y-resFactor.y));
    vec4 topMiddle = getSample(vec2(uv.x, uv.y-resFactor.y));
    vec4 topRight = getSample(vec2(uv.x+resFactor.x, uv.y-resFactor.y));

    vec4 midLeft = getSample(vec2(uv.x-resFactor.x, uv.y));
    vec4 midRight = getSample(vec2(uv.x+resFactor.x, uv.y));

    vec4 bottomLeft = getSample(vec2(uv.x-resFactor.x, uv.y+resFactor.y));
    vec4 bottomMiddle = getSample(vec2(uv.x, uv.y+resFactor.y));
    vec4 bottomRight = getSample(vec2(uv.x+resFactor.x, uv.y+resFactor.y));

    vec4 Gx = (topLeft) + (2.0*midLeft) + (bottomLeft) - (topRight) - (2.0*midRight) - (bottomRight);
    vec4 Gy = (topLeft) + (2.0*topMiddle) + (topRight) - (bottomLeft) - (2.0*bottomMiddle) - (bottomRight);
    vec4 G = sqrt((Gx*Gx) + (Gy*Gy));

    G = col + G;
    G.a = col.a;

    vec4 finalCol = mix(col, G, strength);
    finalCol.rgb *= opacity;
    finalCol.a *= opacity;
    gl_FragColor = finalCol;
}
	')
	public function new() {
		super();
	}
}