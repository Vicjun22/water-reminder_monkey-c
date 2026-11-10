using Toybox.WatchUi;

class NotificationsDelegate extends WatchUi.BehaviorDelegate {

    var view as NotificationsView;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onPreviousPage() {
        if (view.selectedIndex > 0) {
            view.selectedIndex -= 1;
        } else {
            view.selectedIndex = view.getMenuCount() - 1;
        }

        WatchUi.requestUpdate();
        return true;
    }

    function onNextPage() {
        if (view.selectedIndex < view.getMenuCount() - 1) {
            view.selectedIndex += 1;
        } else {
            view.selectedIndex = 0;
        }

        WatchUi.requestUpdate();
        return true;
    }

    function onSelect() {
        switch(view.selectedIndex) {

            case 0:
                view.notificationsEnabled = !view.notificationsEnabled;

                if (!view.notificationsEnabled) {
                    view.customizedEnabled = false;
                    view.selectedIndex = 0;
                }
                break;

            case 1:
                view.customizedEnabled = !view.customizedEnabled;
                break;

            case 2:
            case 3:
            case 4:

                var scheduleView = new NotificationScheduleView();

                WatchUi.pushView(
                    scheduleView,
                    new NotificationScheduleDelegate(scheduleView),
                    WatchUi.SLIDE_LEFT
                );
                break;
        }

        WatchUi.requestUpdate();
        return true;
    }
}