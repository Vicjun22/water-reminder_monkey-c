using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class WaterView extends WatchUi.View {
    
    var selectedIndex = 0;
    
    var menuItems as Array<String> = ["Adicionar água", "Ajustar meta", "Cálculo por peso", "Configurações", "Sair"];

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


        // --- Background ---
        var gradientBitmap = WatchUi.loadResource(Rez.Drawables.bg_gradient);
        var bitmapWidth = gradientBitmap.getWidth();
        var bitmapHeight = gradientBitmap.getHeight();

        var centerXOffset = (width - bitmapWidth) / 2;
        var centerYOffset = (height - bitmapHeight) / 2;

        dc.drawBitmap(centerXOffset, centerYOffset, gradientBitmap);


        // --- Arco lateral (START) ---
        var arcRadius = (width / 2) - 10;
        dc.setPenWidth(5);
        dc.setColor(0x38E8F7, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(centerX, centerY, arcRadius, Graphics.ARC_CLOCKWISE, -325, 23);
        dc.setPenWidth(1);


        // --- Cabeçalho ---
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, "Water Reminder", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);


        // --- Progresso diário ---
        if (selectedIndex == 0) {
            var pct = DataManager.getPercent();

            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            dc.drawText(centerX - 50, centerY - 70, Graphics.FONT_TINY, Lang.format("$1$%", [pct]), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(centerX - 50, centerY - 25, Graphics.FONT_XTINY, Lang.format("$1$ml de $2$ml", [DataManager.getCurrent(), DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(centerX - 50, centerY + 10, Graphics.FONT_XTINY, "0 dias seguidos", Graphics.TEXT_JUSTIFY_LEFT);

            dc.drawText(centerX, 280, Graphics.FONT_SMALL, menuItems[0], Graphics.TEXT_JUSTIFY_CENTER);
        } else if (selectedIndex == 1) {
            dc.drawText(centerX, 280, Graphics.FONT_SMALL, menuItems[1], Graphics.TEXT_JUSTIFY_CENTER);
        } else if (selectedIndex == 2) {
            dc.drawText(centerX, 280, Graphics.FONT_SMALL, menuItems[2], Graphics.TEXT_JUSTIFY_CENTER);
        } else if (selectedIndex == 3) {
            dc.drawText(centerX, 280, Graphics.FONT_SMALL, menuItems[3], Graphics.TEXT_JUSTIFY_CENTER);
        } else if (selectedIndex == 4) {
            dc.drawText(centerX, 280, Graphics.FONT_SMALL, menuItems[4], Graphics.TEXT_JUSTIFY_CENTER);
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
}