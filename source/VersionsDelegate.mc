using Toybox.WatchUi;
using Toybox.Timer;

class VersionsDelegate extends WatchUi.BehaviorDelegate {
    hidden var timer;

    function initialize() {
        BehaviorDelegate.initialize();
    }
}