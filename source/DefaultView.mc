using Toybox.WatchUi;

class DefaultView {

    var gradientBG = WatchUi.loadResource(Rez.Drawables.bg_gradient);

    function drawDefaultBackground(dc, selectedIndex, totalMenus) {

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        drawBackground(dc, width, height);
        drawArc(dc, width, centerX, centerY);
        if (totalMenus != null) {
            drawMenuIndicator(dc, selectedIndex, totalMenus);
        }
    }


    function drawBackground(dc, width, height) {
        var bgWidth = gradientBG.getWidth();
        var bgHeight = gradientBG.getHeight();
        var centerXOffset = (width - bgWidth) / 2;
        var centerYOffset = (height - bgHeight) / 2;

        dc.drawBitmap(centerXOffset, centerYOffset, gradientBG);
    }

    function drawArc(dc, width, centerX, centerY) {
        var arcRadius = (width / 2) - 10;

        dc.setPenWidth(5);
        dc.setColor(0x38E8F7, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(centerX, centerY, arcRadius, Graphics.ARC_CLOCKWISE, -325, 23);
        dc.setPenWidth(1);
    }

    function drawMenuIndicator(dc, selectedIndex, totalMenus) {
        var x = 28;
        var spacing = 15;

        var totalHeight = (totalMenus - 1) * spacing;
        var startY = (dc.getHeight() / 2) - (totalHeight / 2);

        for (var i = 0; i < totalMenus; i++) {

            if (i == selectedIndex) {

                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.fillCircle(x, startY + (i * spacing), 5);

            } else {

                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
                dc.fillCircle(x, startY + (i * spacing), 2);

            }
        }
    }

    function drawRow(dc, y, text, value, selected, blocked) {
        var width = dc.getWidth();
        var rowHeight = 46;

        if (selected) {
            dc.setColor(0x38E8F7, 0x38E8F7);
            dc.fillRectangle(0, y + 8, width, rowHeight);

            dc.setColor(0x123259, 0x123259);
            dc.fillRectangle(0, y + 11, width, rowHeight - 6);
        }

        if (blocked) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        } else {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        }
        
        dc.drawText(35, y + 11, Graphics.FONT_TINY, text, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(width - 35, y + 11, Graphics.FONT_TINY, value, Graphics.TEXT_JUSTIFY_RIGHT);
    }
}