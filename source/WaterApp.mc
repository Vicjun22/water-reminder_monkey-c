using Toybox.Application;
using Toybox.System;
using Toybox.Lang;

class WaterApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
        DataManager.checkNewDay();
        loadLanguage();
    }

    function onStop(state) {
    }

    hidden function loadLanguage() {
        var lang = DataManager.getSavedLanguage();

        if (lang == null) {
            var deviceSettings = System.getDeviceSettings();
            if (deviceSettings has :systemLanguage) {
                var sysLang = deviceSettings.systemLanguage;
                if (sysLang.equals("por")) {
                    lang = "por";
                } else {
                    lang = "eng";
                }
            } else {
                lang = "eng";
            }
            DataManager.setSavedLanguage(lang);
        }
    }

    function getInitialView() {
        var view = new WaterView();
        var delegate = new WaterDelegate(view);
        return [view, delegate];
    }
}