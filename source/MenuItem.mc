using Toybox.Lang;
using Toybox.Graphics;

class MenuItem {

    var title as Lang.String;
    var icon as Graphics.BitmapReference or Null;
    var drawCallback;
    var actionCallback;

    function initialize(
        title as Lang.String,
        icon as Graphics.BitmapReference or Null,
        drawCallback,
        actionCallback
    ) {
        self.title = title;
        self.icon = icon;
        self.drawCallback = drawCallback;
        self.actionCallback = actionCallback;
    }
}