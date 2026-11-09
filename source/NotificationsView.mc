using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class NotificationsView extends WatchUi.View {

    var defaultView = new DefaultView();

    var notificationsEnabled = true;
    var customizedEnabled = false;

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {

        var width = dc.getWidth();
        var height = dc.getHeight();

        var centerX = width / 2;
        var centerY = height / 2;

        defaultView.drawDefaultBackground(dc, 0, null);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:notifications), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.drawText(50, centerY - 70, Graphics.FONT_TINY, TranslationManager.get(:notifications), Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(width - 50, centerY - (notificationsEnabled ? "ON".length() : "OFF".length()) - 70, Graphics.FONT_TINY, notificationsEnabled ? "ON" : "OFF", Graphics.TEXT_JUSTIFY_RIGHT);
        
        if (notificationsEnabled) {
            dc.drawText(50, centerY - 20, Graphics.FONT_TINY, TranslationManager.get(:customized), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(width - 50, centerY - (customizedEnabled ? "ON".length() : "OFF".length()) - 20, Graphics.FONT_TINY, customizedEnabled ? "ON" : "OFF", Graphics.TEXT_JUSTIFY_RIGHT);



            dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);

            if (!customizedEnabled) {

                dc.drawText(
                    centerX,
                    315,
                    Graphics.FONT_XTINY,
                    "08:00 - 22:00",
                    Graphics.TEXT_JUSTIFY_CENTER
                );

                dc.drawText(
                    centerX,
                    335,
                    Graphics.FONT_XTINY,
                    "30 min",
                    Graphics.TEXT_JUSTIFY_CENTER
                );

            } else {

                dc.drawText(
                    centerX,
                    315,
                    Graphics.FONT_XTINY,
                    TranslationManager.get(:pressSelect),
                    Graphics.TEXT_JUSTIFY_CENTER
                );

            }
        }
    }
}