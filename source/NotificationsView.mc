using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class NotificationsView extends WatchUi.View {

    var defaultView = new DefaultView();

    var selectedIndex = 0;

    var notificationsEnabled = true;
    var customizedEnabled = false;

    var startHour = "08:00";
    var endHour = "22:00";
    var interval = "30 min";

    function initialize() {
        View.initialize();
    }

    function getRows() {

        var rows = [];

        rows.add({
            :title => TranslationManager.get(:notifications),
            :value => notificationsEnabled ? "ON" : "OFF"
        });

        if (notificationsEnabled) {
            rows.add({
                :title => TranslationManager.get(:customized),
                :value => customizedEnabled ? "ON" : "OFF",
                :blocked => false
            });

            rows.add({
                :title => TranslationManager.get(:start),
                :value => startHour,
                :blocked => !customizedEnabled
            });

            rows.add({
                :title => TranslationManager.get(:end),
                :value => endHour,
                :blocked => !customizedEnabled
            });

            rows.add({
                :title => TranslationManager.get(:interval),
                :value => interval,
                :blocked => !customizedEnabled
            });
        }

        return rows;
    }

    function getMenuCount() {
        return getRows().size();
    }

    function getFirstVisibleIndex() {
        var menuCount = getMenuCount();

        if (menuCount <= 3) {
            return 0;
        }

        if (selectedIndex <= 1) {
            return 0;
        }

        if (selectedIndex >= menuCount - 1) {
            return menuCount - 3;
        }

        return selectedIndex - 1;
    }

    function onUpdate(dc) {

        var width = dc.getWidth();
        var centerX = width / 2;

        defaultView.drawDefaultBackground(dc, null, null);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 90, Graphics.FONT_SMALL, TranslationManager.get(:notifications), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        var rows = getRows();
        var firstVisible = getFirstVisibleIndex();
        var lastVisible = firstVisible + 3;

        if (lastVisible > rows.size()) {
            lastVisible = rows.size();
        }

        var y = 125;

        for (var i = firstVisible; i < lastVisible; i++) {
            var row = (rows as Array<Dictionary>)[i];
            var title = row[:title];
            var value = row[:value];
            var blocked = row[:blocked];
            defaultView.drawRow(dc, y, title, value, selectedIndex == i, blocked);
  
            y += 48;
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, 350, Graphics.FONT_XTINY, TranslationManager.get(:useUpDown), Graphics.TEXT_JUSTIFY_CENTER);
    }
}