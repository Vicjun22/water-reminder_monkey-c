using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Application.Storage;

class NotifyDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onNextPage() {
        var h = DataManager.getNotifyHour() + 1;
        if (h > 23) { h = 0; }
        DataManager.setNotifyHour(h);
        WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() {
        var h = DataManager.getNotifyHour() - 1;
        if (h < 0) { h = 23; }
        DataManager.setNotifyHour(h);
        WatchUi.requestUpdate();
        return true;
    }

    function onMenu() {
        var profiles = [new Attention.VibeProfile(50, 500)];
        Attention.vibrate(profiles);
        return true;
    }
}