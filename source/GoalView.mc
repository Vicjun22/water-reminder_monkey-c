using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application.Storage;

class GoalView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var goal = Storage.getValue("initialValue");
        if (goal == null) { goal = 1000; }
        else if (goal > 5250) { goal = 5250; }

        var headerPositionY = 110;
        dc.drawText(centerX, headerPositionY, Graphics.FONT_SMALL, "Ajustar Meta", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 50, Graphics.FONT_MEDIUM, Lang.format("$1$ ml", [goal]), Graphics.TEXT_JUSTIFY_CENTER);
        
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
        dc.drawText(centerX, headerPositionY + 240, Graphics.FONT_XTINY, "Use UP/DOWN", Graphics.TEXT_JUSTIFY_CENTER);
    }
  }