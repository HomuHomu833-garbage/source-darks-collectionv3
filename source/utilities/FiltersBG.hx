package utilities;

import flixel.FlxSprite;

/**
 * Helper class for loading filter backgrounds.
 */
class FiltersBG {
    /**
     * Creates a new filter background.
     * @param enabled Si es true, carga el filtro; si es false, retorna null.
     * @param filterName Nombre del filtro
     * @return FlxSprite o null
     */
    public static function makeBackground(enabled:Bool, filterName:String = "Filter1"):FlxSprite {
        if (!enabled) return null; //no aplica el filtro
        var filter = new FlxSprite().loadGraphic(Paths.gpuBitmap('general/$filterName'));
        filter.setGraphicSize(Std.int(1280));
        filter.updateHitbox();
        filter.screenCenter();
        filter.antialiasing = true;
        filter.scrollFactor.set();
        return filter;
    }
}
