using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application.Storage;
import Toybox.Lang;

class CalcDelegate extends WatchUi.BehaviorDelegate {


    function initialize() {
        BehaviorDelegate.initialize();
        DataManager.setWeight(DataManager.getWeight());
        Storage.setValue("initialValue", Storage.getValue("calcWeight"));
    }

    function onNextPage() {
        var w = DataManager.getWeight();
        if (w == null) { w = 70; }
        w = w - 1;
        if (w < 30) { w = 30; }
        
        DataManager.setWeight(w);
        WatchUi.requestUpdate();
        return true;

    }

    function onPreviousPage() {
        var w = DataManager.getWeight();
        if (w == null) { w = 70; }
        w = w + 1;
        if (w > 150) { w = 150; }

        DataManager.setWeight(w);
        WatchUi.requestUpdate();
        return true;
    }

    function onSelect() {
        var w = DataManager.getWeight();
        DataManager.setWeight(w);
        if (w == null) { w = 70; }
        DataManager.setGoal(w * 35);
        
        WatchUi.pushView(new SuccessView(), new SuccessDelegate(), WatchUi.SLIDE_LEFT);
        return true;
    }
}