using Toybox.WatchUi;
using Toybox.Timer;

class SuccessDelegate extends WatchUi.BehaviorDelegate {
    hidden var timer;

    function initialize() {
        BehaviorDelegate.initialize();
        timer = new Timer.Timer();
        timer.start(method(:onTimer), 2000, false);
    }

    function onTimer() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}