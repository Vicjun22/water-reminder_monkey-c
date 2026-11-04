using Toybox.Application;

class WaterApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
        DataManager.checkNewDay();
    }

    function onStop(state) {
    }

    function getInitialView() {
        var view = new WaterView();
        var delegate = new WaterDelegate(view);
        return [view, delegate];
    }
}