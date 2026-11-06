using Toybox.WatchUi;
using Toybox.System;

class WaterDelegate extends WatchUi.BehaviorDelegate {

    var view as WaterView;

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
        if (view.selectedIndex < view.getMenuCount() - 1) {
            view.selectedIndex += 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() {
        var index = view.selectedIndex;
        
        if (index == 0) {
            var addView = new AddWaterView();
            WatchUi.pushView(addView, new AddWaterDelegate(addView), WatchUi.SLIDE_LEFT);
        } else if (index == 1) {
            WatchUi.pushView(new GoalView(), new GoalDelegate(), WatchUi.SLIDE_LEFT);
        } else if (index == 2) {
            WatchUi.pushView(new CalcView(), new CalcDelegate(), WatchUi.SLIDE_LEFT);
        } else if (index == 3) {
            var settingsView = new SettingsView();
            WatchUi.pushView(settingsView, new SettingsDelegate(settingsView), WatchUi.SLIDE_LEFT);
        } else if (index == 4) {
            System.exit();
        }
        return true;
    }
}