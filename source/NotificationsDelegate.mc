using Toybox.WatchUi;

class NotificationsDelegate extends WatchUi.BehaviorDelegate {

    var view as NotificationsView;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onPreviousPage() {
        view.notificationsEnabled = !view.notificationsEnabled;

        if (!view.notificationsEnabled) {
            view.notificationsEnabled = !view.notificationsEnabled;
        }

        WatchUi.requestUpdate();
        return true;
    }

    function onNextPage() {
        if (view.notificationsEnabled) {
            view.notificationsEnabled = !view.notificationsEnabled;
        }
        WatchUi.requestUpdate();

        return true;
    }

    function onSelect() {
        if (view.notificationsEnabled && view.customizedEnabled) {

            var scheduleView = new NotificationScheduleView();

            WatchUi.pushView(
                scheduleView,
                new NotificationScheduleDelegate(scheduleView),
                WatchUi.SLIDE_LEFT
            );
        }

        return true;
    }
}