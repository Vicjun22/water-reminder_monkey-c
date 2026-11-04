using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class WaterView extends WatchUi.View {
    
    var selectedIndex = 0;
    
    var menuItems as Array<String> = ["Adicionar Água", "Ajustar Meta", "Cálculo por Peso", "Configurações", "Sair"];

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
        var headerHeight = (height * 35) / 100; 
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
        dc.fillRectangle(0, 0, width, headerHeight);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_DK_BLUE);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, "Lembrete de\nÁgua", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // --- Barra de Progresso ---
        var barWidth = width;
        var barHeight = 8;
        var barY = headerHeight;

        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, barY, barWidth, barHeight);

        var goal = DataManager.getGoal();
        var current = DataManager.getCurrent();
        var fillWidth = 0;
        if (goal > 0) {
            fillWidth = (barWidth * current) / goal;
            if (fillWidth >= barWidth) { fillWidth = barWidth; }
        }
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, barY, fillWidth, barHeight);

        // --- Menu ---
        var startY = headerHeight + barHeight + 40;
        var spacing = 55;
        var maxVisibleItems = 3;

        var startIndex = 0;
        if (selectedIndex >= maxVisibleItems) {
            startIndex = selectedIndex - maxVisibleItems + 1;
        }
        var maxStartIndex = menuItems.size() - maxVisibleItems;
        if (startIndex > maxStartIndex) { startIndex = maxStartIndex; }

        for (var i = 0; i < maxVisibleItems; i++) {
            var itemIndex = startIndex + i;
            if (itemIndex >= menuItems.size()) { break; }

            var y = startY + (i * spacing);
            if (itemIndex == selectedIndex) {
                dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_DK_BLUE);
                dc.fillRectangle(0, y - 25, width, 50);

                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(centerX, y, Graphics.FONT_SMALL, menuItems[itemIndex], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            } else {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
                dc.drawText(centerX, y, Graphics.FONT_XTINY, menuItems[itemIndex], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            }
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
}