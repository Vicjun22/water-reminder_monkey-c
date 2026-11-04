using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class AddWaterView extends WatchUi.View {

    var selectedIndex = 0;

    var options as Array<Number> = [500, 250, 100, 50, 35];

    function initialize() {
        View.initialize();
    }

    function getAmount() as Number {
        return options[selectedIndex];
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        // --- Cabeçalho ---
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, "Adicionar Água", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // --- Progresso atual ---
        var current = DataManager.getCurrent();
        var goal = DataManager.getGoal();
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 150, Graphics.FONT_SMALL, Lang.format("$1$ / $2$ ml", [current, goal]), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var startY = 220;
        var spacing = 44;
        var maxVisibleItems = 3;

        var startIndex = 0;
        if (selectedIndex >= maxVisibleItems) {
            startIndex = selectedIndex - maxVisibleItems + 1;
        }
        var maxStartIndex = options.size() - maxVisibleItems;
        if (startIndex > maxStartIndex) { startIndex = maxStartIndex; }

        for (var i = 0; i < maxVisibleItems; i++) {
            var itemIndex = startIndex + i;
            if (itemIndex >= options.size()) { break; }

            var y = startY + (i * spacing);
            var label = Lang.format("+ $1$ ml", [options[itemIndex]]);

            if (itemIndex == selectedIndex) {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
                dc.drawText(centerX, y, Graphics.FONT_SMALL, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            } else {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
                dc.drawText(centerX, y, Graphics.FONT_XTINY, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            }
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
}