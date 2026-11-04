using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Application.Storage;

class GoalDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
        Storage.setValue("initialValue", DataManager.getGoal());
    }

    function onNextPage() {
        var g = Storage.getValue("initialValue") - 100;
        if (g > 5000) { g = 5000; }

        Storage.setValue("initialValue", g);
        WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() {
        var g = Storage.getValue("initialValue") + 100;
        if (g > 5000) { g = 5000; }
        
        Storage.setValue("initialValue", g);
        WatchUi.requestUpdate();
        return true;
    }

    function onSelect() {
        var g = Storage.getValue("initialValue");
        if (g > 5000) { g = 5000; }
        DataManager.setGoal(g);
        
        WatchUi.pushView(new SuccessView(), new SuccessDelegate(), WatchUi.SLIDE_LEFT);
        return true;
    }
}