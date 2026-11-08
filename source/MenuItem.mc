using Toybox.Lang;
using Toybox.Graphics;

class MenuItem {

    var title as Lang.String;
    var icon as Graphics.BitmapReference;
    var drawCallback;
    var actionCallback;

    function initialize(
        title as Lang.String,
        icon as Graphics.BitmapReference,
        drawCallback,
        actionCallback
    ) {
        self.title = title;
        self.icon = icon;
        self.drawCallback = drawCallback;
        self.actionCallback = actionCallback;
    }
}