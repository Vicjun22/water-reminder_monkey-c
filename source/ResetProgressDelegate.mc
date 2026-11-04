using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Attention;
import Toybox.Lang;

class ResetProgressDelegate extends WatchUi.BehaviorDelegate {

    var view;
    hidden var timer as Timer.Timer? = null;
    hidden var elapsed as Number = 0;
    hidden var holding as Boolean = false;

    const TOTAL_MS = 2000;
    const STEP_MS = 50;
    const STEP_PERCENT = 100 * STEP_MS / TOTAL_MS;

    function initialize(v) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onSelect() {
        startHold();
        return true;
    }

    function onRelease(clickEvent as WatchUi.ClickEvent) {
        if (holding) {
            cancelHold();
        }
        return true;
    }

    function onBack() {
        if (holding) {
            cancelHold();
        } else {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
        return true;
    }

    hidden function startHold() {
        if (holding) { return; }
        holding = true;
        elapsed = 0;
        view.progress = 0;

        timer = new Timer.Timer();
        timer.start(method(:onTick), STEP_MS, true);
        WatchUi.requestUpdate();
    }

    hidden function cancelHold() {
        holding = false;
        if (timer != null) {
            timer.stop();
            timer = null;
        }
        view.progress = 0;
        WatchUi.requestUpdate();
    }

    hidden function completeHold() {
        holding = false;
        if (timer != null) {
            timer.stop();
            timer = null;
        }
        view.progress = 100;
        WatchUi.requestUpdate();

        var profiles = [ new Attention.VibeProfile(50, 400) ];
        Attention.vibrate(profiles);

        DataManager.resetWater();
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    function onTick() as Void {
        if (!holding) { return; }

        elapsed += STEP_MS;
        view.progress = (elapsed * 100) / TOTAL_MS;
        if (view.progress > 100) { view.progress = 100; }

        WatchUi.requestUpdate();

        if (elapsed >= TOTAL_MS) {
            completeHold();
        }
    }
}