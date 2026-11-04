using Toybox.WatchUi;
using Toybox.Graphics;

class NotifyView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var headerPositionY = 110;
        dc.drawText(centerX, headerPositionY, Graphics.FONT_SMALL, "Notificar", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 50, Graphics.FONT_MEDIUM, "Em Breve", Graphics.TEXT_JUSTIFY_CENTER);
    }
}