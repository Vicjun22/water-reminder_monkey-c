using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class WaterView extends WatchUi.View {
    
    var selectedIndex = 0;
    var gradientBG = WatchUi.loadResource(Rez.Drawables.bg_gradient);
    var addWaterIcon = WatchUi.loadResource(Rez.Drawables.img_add_water);
    var goalIcon = WatchUi.loadResource(Rez.Drawables.img_goal);
    var calculatorIcon = WatchUi.loadResource(Rez.Drawables.img_calculator);
    var settingsIcon = WatchUi.loadResource(Rez.Drawables.img_settings);
    var exitIcon = WatchUi.loadResource(Rez.Drawables.img_exit);

    function getMenuCount() {
        return 5;
    }

    function initialize() {
        View.initialize();
    }

    function onShow() {
        View.onShow();
        WatchUi.requestUpdate();
    }

    function onUpdate(dc) {
        var menuItems = [
            TranslationManager.get(:menuAddWater),
            TranslationManager.get(:menuGoal),
            TranslationManager.get(:menuCalc),
            TranslationManager.get(:menuSettings),
            TranslationManager.get(:menuExit)
        ];

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        // --- Background ---
        var bgWidth = gradientBG.getWidth();
        var bgHeight = gradientBG.getHeight();
        var centerXOffset = (width - bgWidth) / 2;
        var centerYOffset = (height - bgHeight) / 2;
        dc.drawBitmap(centerXOffset, centerYOffset, gradientBG);

        // --- Arco lateral ---
        var arcRadius = (width / 2) - 10;
        dc.setPenWidth(5);
        dc.setColor(0x38E8F7, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(centerX, centerY, arcRadius, Graphics.ARC_CLOCKWISE, -325, 23);
        dc.setPenWidth(1);

        // --- Cabeçalho ---
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:appName), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // Item selecionado do menu
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        switch (selectedIndex) {
            case 0:
                menuAddWater(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 1:
                menuGoal(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 2:
                menuCalc(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 3:
                menuSettings(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 4:
                menuExit(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
        }

        // Texto de navegação
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuAddWater(dc, centerX, centerY, itemText) {
        var pct = DataManager.getPercent();

        var iconHeight = addWaterIcon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), addWaterIcon);

        if (pct < 60) {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        } else {
            dc.setColor(0x22B14C, Graphics.COLOR_TRANSPARENT);
        }
        
        dc.drawText(centerX - 50, centerY - 70, Graphics.FONT_TINY, Lang.format("$1$%", [pct]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX - 50, centerY - 25, Graphics.FONT_XTINY, Lang.format(TranslationManager.get(:progressFormat), [DataManager.getCurrent(), DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(centerX - 50, centerY + 10, Graphics.FONT_XTINY, TranslationManager.get(:daysStreak), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuGoal(dc, centerX, centerY, itemText) {
        var iconHeight = goalIcon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), goalIcon);

        dc.drawText(centerX - 50, centerY - 25, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:goal), [DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuCalc(dc, centerX, centerY, itemText) {
        var iconHeight = calculatorIcon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), calculatorIcon);

        dc.drawText(centerX - 50, centerY - 50, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:goal), [DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(centerX - 50, centerY - 5, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:weight), [DataManager.getWeight()]), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuSettings(dc, centerX, centerY, itemText) {
        var iconWidth = addWaterIcon.getWidth();
        var iconHeight = settingsIcon.getHeight();
        dc.drawBitmap(centerX - (iconWidth / 2) - 20, centerY - (iconHeight / 2), settingsIcon);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuExit(dc, centerX, centerY, itemText) {
        var iconWidth = addWaterIcon.getWidth();
        var iconHeight = exitIcon.getHeight();
        dc.drawBitmap(centerX - (iconWidth / 2) - 20, centerY - (iconHeight / 2), exitIcon);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }
}
