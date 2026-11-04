using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class SettingsView extends WatchUi.View {

    var selectedIndex = 0;

    var settingItems as Array<String> = ["Notificar", "Idioma", "Limpar Progresso", "Versão do App"];

    function initialize() {
        View.initialize();
    }
    
    function onUpdate(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        // --- Cabeçalho ---
        var headerPositionY = 110;
        dc.drawText(centerX, headerPositionY, Graphics.FONT_SMALL, "Configurações", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);


        // --- Menu ---
        var headerHeight = (height * 35) / 100;
        var startY = headerHeight + 48;
        var spacing = 55;
        var maxVisibleItems = 3;

        var startIndex = 0;
        if (selectedIndex >= maxVisibleItems) {
            startIndex = selectedIndex - maxVisibleItems + 1;
        }
        var maxStartIndex = settingItems.size() - maxVisibleItems;
        if (startIndex > maxStartIndex) { startIndex = maxStartIndex; }

        for (var i = 0; i < maxVisibleItems; i++) {
            var itemIndex = startIndex + i;
            if (itemIndex >= settingItems.size()) { break; }

            var y = startY + (i * spacing);
            if (itemIndex == selectedIndex) {
                dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
                dc.fillRectangle(0, y - 25, width, 50);

                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(centerX, y, Graphics.FONT_SMALL, settingItems[itemIndex], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            } else {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
                dc.drawText(centerX, y, Graphics.FONT_XTINY, settingItems[itemIndex], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            }
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
}