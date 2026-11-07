using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class SettingsView extends WatchUi.View {

    var selectedIndex = 0;
    var defaultView = new DefaultView();

    function getMenuCount() {
        return 5;
    }

    function initialize() {
        View.initialize();
    }
    
    function onUpdate(dc) {
        var menuItems = [
            TranslationManager.get(:notifications),
            TranslationManager.get(:language),
            TranslationManager.get(:resetProgress),
            TranslationManager.get(:appVersion),
            TranslationManager.get(:background)
        ];

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        defaultView.drawBackground(dc);

        // --- Cabeçalho ---
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:appName), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // Item selecionado do menu
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        switch (selectedIndex) {
            case 0:
                menuNotifications(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 1:
                menuLanguage(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 2:
                menuResetProgress(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 3:
                menuAppVersion(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
            case 4:
                menuBackground(dc, centerX, centerY, menuItems[selectedIndex]);
                break;
        }

        // Texto de navegação
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }


    function menuNotifications(dc, centerX, centerY, itemText) {
        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuLanguage(dc, centerX, centerY, itemText) {
        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuResetProgress(dc, centerX, centerY, itemText) {
        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuAppVersion(dc, centerX, centerY, itemText) {
        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuBackground(dc, centerX, centerY, itemText) {
        dc.drawText(centerX, 280, Graphics.FONT_SMALL, itemText, Graphics.TEXT_JUSTIFY_CENTER);
    }
}