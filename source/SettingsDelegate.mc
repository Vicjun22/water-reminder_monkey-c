using Toybox.WatchUi;

class SettingsDelegate extends WatchUi.BehaviorDelegate {

    var view as SettingsView;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onPreviousPage() {
        if (view.selectedIndex > 0) {
            view.selectedIndex -= 1;
            WatchUi.requestUpdate();
        } else {
            view.selectedIndex = view.getMenuCount() - 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onNextPage() {
        if (view.selectedIndex < view.getMenuCount() - 1) {
            view.selectedIndex += 1;
            WatchUi.requestUpdate();
        } else {
            view.selectedIndex = 0;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() {
        view.menus[view.selectedIndex]
            .actionCallback
            .invoke();

        return true;
    }
}