using Toybox.WatchUi;

class NotificationScheduleDelegate extends WatchUi.BehaviorDelegate {

    var view as NotificationScheduleView;

    var intervals = [15, 20, 30, 45, 60];

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

        if (view.selectedIndex == 0) {

            view.startHour += 1;

            if (view.startHour > 23) {
                view.startHour = 0;
            }

        } else if (view.selectedIndex == 1) {

            view.endHour += 1;

            if (view.endHour > 23) {
                view.endHour = 0;
            }

        } else {

            var index = intervals.indexOf(view.interval);

            index += 1;

            if (index >= intervals.size()) {
                index = 0;
            }

            view.interval = intervals[index];
        }

        WatchUi.requestUpdate();

        return true;
    }
}