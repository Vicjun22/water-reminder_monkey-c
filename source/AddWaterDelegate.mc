using Toybox.WatchUi;
import Toybox.Lang;

class AddWaterDelegate extends WatchUi.BehaviorDelegate {

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
        if (view.selectedIndex < view.options.size() - 1) {
            view.selectedIndex += 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() {
        var amount = view.getAmount();
        DataManager.addWater(amount);
        WatchUi.requestUpdate();
        return true;
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }
}