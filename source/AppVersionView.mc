using Toybox.WatchUi;
using Toybox.Graphics;

class AppVersionView extends WatchUi.View {    

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

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, centerY - 40, Graphics.FONT_MEDIUM, "Versão 1.0", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);


        var font = Graphics.FONT_XTINY;
        var areaWidth = dc.getWidth() - 20;
        var areaHeight = 100;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        var textToDraw = Graphics.fitTextToArea("Aplicação com funcionalidades básicas", font, areaWidth, areaHeight, false);
        dc.drawText(centerX, centerY + 60, font, textToDraw, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}