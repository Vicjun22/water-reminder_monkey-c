using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;

class SettingsView extends WatchUi.View {

    var selectedIndex = 0;
    var defaultView = new DefaultView();
    var menus as Lang.Array<MenuItem>;

    function initialize() {
        
        View.initialize();

        menus = [
            new MenuItem(
                TranslationManager.get(:notifications),
                WatchUi.loadResource(Rez.Drawables.img_notify),
                method(:drawDefaultMenu),
                method(:openNotifications)
            ),

            new MenuItem(
                TranslationManager.get(:language),
                WatchUi.loadResource(Rez.Drawables.img_language),
                method(:drawDefaultMenu),
                method(:openLanguage)
            ),

            new MenuItem(
                TranslationManager.get(:resetProgress),
                WatchUi.loadResource(Rez.Drawables.img_reset_progress),
                method(:drawDefaultMenu),
                method(:openResetProgress)
            ),

            new MenuItem(
                TranslationManager.get(:appVersion),
                null,
                method(:menuAppVersion),
                method(:openAppVersion)
            ),

            new MenuItem(
                TranslationManager.get(:background),
                WatchUi.loadResource(Rez.Drawables.img_background),
                method(:drawDefaultMenu),
                method(:openBackgroundSelection)
            )
        ];
    }

    function getMenuCount() {
        return menus.size();
    }
    
    function onUpdate(dc) {

        var width = dc.getWidth();
        var height = dc.getHeight();

        var centerX = width / 2;
        var centerY = height / 2;

        defaultView.drawDefaultBackground(dc, selectedIndex, menus.size());

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:settings), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var menu = menus[selectedIndex];
        menu.drawCallback.invoke(dc, centerX, centerY, menu);

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }


    function openNotifications() {
        var v = new NotificationsView();
        WatchUi.pushView(v, new NotificationsDelegate(v), WatchUi.SLIDE_LEFT);
    }

    function openLanguage() {
        var v = new LanguageView();
        WatchUi.pushView(v, new LanguageDelegate(v), WatchUi.SLIDE_LEFT);
    }

    function openResetProgress() {
        var v = new ResetProgressView();
        WatchUi.pushView(v, new ResetProgressDelegate(v), WatchUi.SLIDE_LEFT);
    }

    function openAppVersion() {
        var v = new AppVersionView();
        WatchUi.pushView(v, new AppVersionDelegate(), WatchUi.SLIDE_LEFT);
    }

    function openBackgroundSelection() {
        var v = new BackgroundSelectionView();
        WatchUi.pushView(v, new BackgroundSelectionDelegate(), WatchUi.SLIDE_LEFT);
    }


    function menuAppVersion(dc, centerX, centerY, menu) {
        var version = WatchUi.loadResource(Rez.Strings.appVersion);
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX - (version.length() / 2), centerY - 20, Graphics.FONT_SMALL, version, Graphics.TEXT_JUSTIFY_CENTER);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function drawDefaultMenu(dc, centerX, centerY, menu) {
        var iconWidth = menu.icon.getWidth();
        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(centerX - (iconWidth / 2), centerY - (iconHeight / 2), menu.icon);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }
}