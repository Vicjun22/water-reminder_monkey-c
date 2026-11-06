using Toybox.WatchUi;
import Toybox.Lang;

class LanguageDelegate extends WatchUi.BehaviorDelegate {

    var view as LanguageView;

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
        if (view.selectedIndex < view.languages.size() - 1) {
            view.selectedIndex += 1;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() {
        var chosen = view.languages[view.selectedIndex].get(:code);
        DataManager.setSavedLanguage(chosen);
        
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }
}