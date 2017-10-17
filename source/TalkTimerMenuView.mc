using Toybox.WatchUi;
using Toybox.Graphics;

class TalkTimerMenuView extends WatchUi.View {

    function initialize() {
        WatchUi.View.initialize();
    }

    function onLayout(dc) {
        dc.clear();    
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
    }

    function onUpdate(dc) {
        dc.clear();    
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
    }

}
