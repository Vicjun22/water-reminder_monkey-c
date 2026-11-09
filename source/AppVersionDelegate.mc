using Toybox.WatchUi;
using Toybox.Timer;

class AppVersionDelegate extends WatchUi.BehaviorDelegate {
    hidden var timer;

    function initialize() {
        BehaviorDelegate.initialize();
    }
}