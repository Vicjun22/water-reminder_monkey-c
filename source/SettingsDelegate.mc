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
        var index = view.selectedIndex;
        
        if (index == 0) {
            WatchUi.pushView(new NotifyView(), new NotifyDelegate(), WatchUi.SLIDE_LEFT);
        } else if (index == 1) {
            var langView = new LanguageView();
            WatchUi.pushView(langView, new LanguageDelegate(langView), WatchUi.SLIDE_LEFT);
        } else if (index == 2) {
            var resetView = new ResetProgressView();
            WatchUi.pushView(resetView, new ResetProgressDelegate(resetView), WatchUi.SLIDE_LEFT);
        } else if (index == 3) {
            WatchUi.pushView(new VersionsView(), new VersionsDelegate(), WatchUi.SLIDE_LEFT);
        }
        return true;
    }
}