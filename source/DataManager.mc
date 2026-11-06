using Toybox.Application.Storage;
using Toybox.Time;
import Toybox.Lang;

class DataManager {
    
    static var KEY_GOAL = "goalMl";
    static var KEY_CURRENT = "currentMl";
    static var KEY_LAST_DATE = "lastDate";
    static var KEY_ADD_STEP = "addStepMl";
    static var KEY_NOTIFY_HOUR = "notifyHour";
    static var KEY_LANGUAGE = "appLanguage";
    static var KEY_WEIGHT = "weight";

    static var DEFAULT_GOAL = 2000;
    static var DEFAULT_ADD_STEP = 250;
    static var DEFAULT_NOTIFY_HOUR = 22;
    static var DEFAULT_WEIGHT = 70;

    static function getTodayValue() {
        return Time.today().value();
    }

    static function checkNewDay() {
        var storedDate = Storage.getValue(KEY_LAST_DATE);
        var today = getTodayValue();
        if (storedDate == null || storedDate != today) {
            Storage.setValue(KEY_CURRENT, 0);
            Storage.setValue(KEY_LAST_DATE, today);
        }
    }

    static function getGoal() {
        var v = Storage.getValue(KEY_GOAL);
        return (v != null) ? v : DEFAULT_GOAL;
    }

    static function setGoal(ml) {
        Storage.setValue(KEY_GOAL, ml);
    }

    static function resetWater() {
        Storage.setValue(KEY_CURRENT, 0);
    }

    static function getCurrent() {
        var v = Storage.getValue(KEY_CURRENT);
        return (v != null) ? v : 0;
    }

    static function addWater(ml) {
        checkNewDay();
        var cur = getCurrent() + ml;
        Storage.setValue(KEY_CURRENT, cur);
    }

    static function getAddStep() {
        var v = Storage.getValue(KEY_ADD_STEP);
        return (v != null) ? v : DEFAULT_ADD_STEP;
    }

    static function setAddStep(ml) {
        Storage.setValue(KEY_ADD_STEP, ml);
    }

    static function getNotifyHour() {
        var v = Storage.getValue(KEY_NOTIFY_HOUR);
        return (v != null) ? v : DEFAULT_NOTIFY_HOUR;
    }

    static function setNotifyHour(h) {
        Storage.setValue(KEY_NOTIFY_HOUR, h);
    }

    static function getPercent() {
        var goal = getGoal();
        if (goal <= 0) { return 0; }
        var pct = (getCurrent() * 100) / goal;
        return (pct > 100) ? 100 : pct;
    }

    static function getWeight() {
        var w = Storage.getValue(KEY_WEIGHT);
        return (w != null) ? w : DEFAULT_WEIGHT;
    }

    static function setWeight(w) {
        Storage.setValue(KEY_WEIGHT, w);
    }

    static function getSavedLanguage() {
        return Storage.getValue(KEY_LANGUAGE);
    }

    static function setSavedLanguage(lang) {
        Storage.setValue(KEY_LANGUAGE, lang);
    }
}