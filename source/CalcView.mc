using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class CalcView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var weight = DataManager.getWeight();
        if (weight == null) { weight = 70; }
        var needMl = weight * 35;

        var headerPositionY = 110;
        dc.drawText(centerX, headerPositionY, Graphics.FONT_SMALL, "Cálculo por Peso", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);


        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 50, Graphics.FONT_MEDIUM, Lang.format("$1$ kg", [weight]), Graphics.TEXT_JUSTIFY_CENTER);
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 125, Graphics.FONT_SMALL, Lang.format("$1$ ml/dia", [needMl]), Graphics.TEXT_JUSTIFY_CENTER);

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 240, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
}
