using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;

class WaterView extends WatchUi.View {

    var selectedIndex = 0;
    var defaultView = new DefaultView();
    var menus as Lang.Array<MenuItem>;

    function initialize() {

        View.initialize();

        menus = [
            new MenuItem(
                TranslationManager.get(:menuAddWater),
                WatchUi.loadResource(Rez.Drawables.img_add_water),
                method(:menuAddWater),
                method(:openAddWater)
            ),

            new MenuItem(
                TranslationManager.get(:menuGoal),
                WatchUi.loadResource(Rez.Drawables.img_goal),
                method(:menuGoal),
                method(:openGoal)
            ),

            new MenuItem(
                TranslationManager.get(:menuCalc),
                WatchUi.loadResource(Rez.Drawables.img_calculator),
                method(:menuCalc),
                method(:openCalc)
            ),

            new MenuItem(
                TranslationManager.get(:menuSettings),
                WatchUi.loadResource(Rez.Drawables.img_settings),
                method(:menuSettings),
                method(:openSettings)
            ),

            new MenuItem(
                TranslationManager.get(:menuExit),
                WatchUi.loadResource(Rez.Drawables.img_exit),
                method(:menuExit),
                method(:exitApp)
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
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:appName), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var menu = menus[selectedIndex];
        menu.drawCallback.invoke(dc, centerX, centerY, menu);

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function openAddWater() {
        var v = new AddWaterView();
        WatchUi.pushView(v, new AddWaterDelegate(v), WatchUi.SLIDE_LEFT);
    }

    function openGoal() {
        var v = new GoalView();
        WatchUi.pushView(v, new GoalDelegate(), WatchUi.SLIDE_LEFT);
    }

    function openCalc() {
        var v = new CalcView();
        WatchUi.pushView(v, new CalcDelegate(), WatchUi.SLIDE_LEFT);
    }

    function openSettings() {
        var v = new SettingsView();
        WatchUi.pushView(v, new SettingsDelegate(v), WatchUi.SLIDE_LEFT);
    }

    function exitApp() {
        System.exit();
    }

    function menuAddWater(dc, centerX, centerY, menu) {
        var pct = DataManager.getPercent();

        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), menu.icon);

        if (pct < 60) {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        } else {
            dc.setColor(0x22B14C, Graphics.COLOR_TRANSPARENT);
        }
        
        dc.drawText(centerX - 50, centerY - 70, Graphics.FONT_TINY, Lang.format("$1$%", [pct]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX - 50, centerY - 25, Graphics.FONT_XTINY, Lang.format(TranslationManager.get(:progressFormat), [DataManager.getCurrent(), DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(centerX - 50, centerY + 10, Graphics.FONT_XTINY, TranslationManager.get(:daysStreak), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }


    function menuGoal(dc, centerX, centerY, menu) {
        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), menu.icon);

        dc.drawText(centerX - 50, centerY - 25, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:goal), [DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuCalc(dc, centerX, centerY, menu) {
        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(50, centerY - (iconHeight / 2), menu.icon);

        dc.drawText(centerX - 50, centerY - 50, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:goal), [DataManager.getGoal()]), Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(centerX - 50, centerY - 5, Graphics.FONT_TINY, Lang.format(TranslationManager.get(:weight), [DataManager.getWeight()]), Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuSettings(dc, centerX, centerY, menu) {
        var iconWidth = menu.icon.getWidth();
        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(centerX - (iconWidth / 2) - 20, centerY - (iconHeight / 2), menu.icon);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function menuExit(dc, centerX, centerY, menu) {
        var iconWidth = menu.icon.getWidth();
        var iconHeight = menu.icon.getHeight();
        dc.drawBitmap(centerX - (iconWidth / 2) - 20, centerY - (iconHeight / 2), menu.icon);

        dc.drawText(centerX, 280, Graphics.FONT_SMALL, menu.title, Graphics.TEXT_JUSTIFY_CENTER);
    }
}