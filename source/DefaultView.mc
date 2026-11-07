using Toybox.WatchUi;

class DefaultView {

    var gradientBG = WatchUi.loadResource(Rez.Drawables.bg_gradient);

    function drawBackground(dc) {

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        // --- Background ---
        var bgWidth = gradientBG.getWidth();
        var bgHeight = gradientBG.getHeight();
        var centerXOffset = (width - bgWidth) / 2;
        var centerYOffset = (height - bgHeight) / 2;
        dc.drawBitmap(centerXOffset, centerYOffset, gradientBG);

        // --- Arco lateral ---
        var arcRadius = (width / 2) - 10;
        dc.setPenWidth(5);
        dc.setColor(0x38E8F7, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(centerX, centerY, arcRadius, Graphics.ARC_CLOCKWISE, -325, 23);
        dc.setPenWidth(1);
    }
}