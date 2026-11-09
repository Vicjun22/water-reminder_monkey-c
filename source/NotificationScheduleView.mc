using Toybox.WatchUi;
using Toybox.Graphics;

class NotificationScheduleView extends WatchUi.View {

    var selectedIndex = 0;

    var startHour = 8;
    var startMinute = 0;

    var endHour = 22;
    var endMinute = 0;

    var interval = 30;

    var defaultView = new DefaultView();

    function initialize() {

        View.initialize();
    }

    function getMenuCount() {
        return 3;
    }

    function onUpdate(dc) {

        var width = dc.getWidth();
        var centerX = width / 2;

        defaultView.drawDefaultBackground(dc, selectedIndex, getMenuCount());

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            90,
            Graphics.FONT_SMALL,
            TranslationManager.get(:customized),
            Graphics.TEXT_JUSTIFY_CENTER
        );

        if (selectedIndex == 0) {

            dc.drawText(
                centerX,
                170,
                Graphics.FONT_SMALL,
                TranslationManager.get(:startTime),
                Graphics.TEXT_JUSTIFY_CENTER
            );

            dc.drawText(
                centerX,
                220,
                Graphics.FONT_MEDIUM,
                formatTime(startHour, startMinute),
                Graphics.TEXT_JUSTIFY_CENTER
            );

        } else if (selectedIndex == 1) {

            dc.drawText(
                centerX,
                170,
                Graphics.FONT_SMALL,
                TranslationManager.get(:endTime),
                Graphics.TEXT_JUSTIFY_CENTER
            );

            dc.drawText(
                centerX,
                220,
                Graphics.FONT_MEDIUM,
                formatTime(endHour, endMinute),
                Graphics.TEXT_JUSTIFY_CENTER
            );

        } else {

            dc.drawText(
                centerX,
                170,
                Graphics.FONT_SMALL,
                TranslationManager.get(:interval),
                Graphics.TEXT_JUSTIFY_CENTER
            );

            dc.drawText(
                centerX,
                220,
                Graphics.FONT_MEDIUM,
                interval.format("%d") + " min",
                Graphics.TEXT_JUSTIFY_CENTER
            );

        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            350,
            Graphics.FONT_XTINY,
            TranslationManager.get(:useUpDown),
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    function formatTime(hour, minute) {

        var h = hour.format("%02d");
        var m = minute.format("%02d");

        return h + ":" + m;
    }
}