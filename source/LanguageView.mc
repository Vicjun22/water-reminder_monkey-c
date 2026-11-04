using Toybox.WatchUi;
using Toybox.Graphics;

class LanguageView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var headerPositionY = 110;
        dc.drawText(centerX, headerPositionY, Graphics.FONT_SMALL, "Idioma", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, centerY, Graphics.FONT_TINY, "Português - Brasil", Graphics.TEXT_JUSTIFY_CENTER);
    }
}