using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Application.Storage;

class SettingsDelegate extends WatchUi.BehaviorDelegate {

    var view;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onPreviousPage() {
        if (view.selectedIndex > 0) {
            view.selectedIndex -= 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onNextPage() {
        if (view.selectedIndex < view.settingItems.size() - 1) {
            view.selectedIndex += 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() {
        var index = view.selectedIndex;
        
        if (index == 0) {
            WatchUi.pushView(new NotifyView(), new NotifyDelegate(), WatchUi.SLIDE_LEFT);
        } else if (index == 1) {
            WatchUi.pushView(new LanguageView(), new LanguageDelegate(), WatchUi.SLIDE_LEFT);
        } else if (index == 2) {
            var resetView = new ResetProgressView();
            WatchUi.pushView(resetView, new ResetProgressDelegate(resetView), WatchUi.SLIDE_LEFT);
        } else if (index == 3) {
            WatchUi.pushView(new VersionsView(), new VersionsDelegate(), WatchUi.SLIDE_LEFT);
        }
        return true;
    }
}