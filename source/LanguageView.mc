using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class LanguageView extends WatchUi.View {

    var selectedIndex = 0;
    
    var languages as Array<Dictionary> = [
        { :code => "por", :label => "Português (BR)" },
        { :code => "eng", :label => "English" }
    ];

    function initialize() {
        View.initialize();
    }

    function onShow() {
        View.onShow();
        WatchUi.requestUpdate();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        dc.drawText(centerX, 110, Graphics.FONT_SMALL, TranslationManager.get(:language), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var startY = centerY - 20;
        var spacing = 50;

        for (var i = 0; i < languages.size(); i++) {
            var y = startY + (i * spacing);
            var label = languages[i].get(:label);

            if (i == selectedIndex) {
                dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
                dc.fillRectangle(0, y - 20, width, 40);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(centerX, y, Graphics.FONT_SMALL, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            } else {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
                dc.drawText(centerX, y, Graphics.FONT_XTINY, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            }
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }
}