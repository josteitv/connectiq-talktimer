using Toybox.WatchUi;
using Toybox.Graphics;

module TalkTimer {

	class MenuView extends WatchUi.View {
	
	    public function initialize() {
	        WatchUi.View.initialize();
	    }
	
	    public function onLayout(dc) {
	        dc.clear();    
	        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
	    }
	
	    public function onUpdate(dc) {
	        dc.clear();
	        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
	    }
	
	}
}