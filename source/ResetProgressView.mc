using Toybox.WatchUi;
using Toybox.Graphics;
import Toybox.Lang;

class ResetProgressView extends WatchUi.View {    

    var progress as Number = 0;

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, centerY - 40, Graphics.FONT_SMALL, "Limpar Progresso", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(centerX, centerY + 60, Graphics.FONT_XTINY, "Segure START para limpar", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // --- Borda de progresso ---
        var radius = (width / 2) - 10;
        var startAngle = 90;
        var endAngle = 90 + ((progress * 360) / 100);

        if (progress > 0) {
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
            
            var segments = 60;
            var prevX = 0;
            var prevY = 0;
            for (var i = 0; i <= segments; i++) {
                var angleDeg = startAngle + ((endAngle - startAngle) * i / segments);
                var angleRad = angleDeg * Math.PI / 180;
                var px = centerX + (radius * Math.cos(angleRad));
                var py = centerY - (radius * Math.sin(angleRad));
                if (i > 0) {
                    dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
                    dc.drawLine(prevX, prevY, px, py);
                }
                prevX = px;
                prevY = py;
            }
        }
    }
}