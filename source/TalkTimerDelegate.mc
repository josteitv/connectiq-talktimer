using Toybox.WatchUi;

module TalkTimer {

	class TalkTimerDelegate extends WatchUi.BehaviorDelegate {
	
	    function initialize() {
	        WatchUi.BehaviorDelegate.initialize();
	    }
	
	    function onMenu() {
	        timer.stop();
	        
	        WatchUi.pushView(new MenuView(), new MenuDelegate(), WatchUi.SLIDE_UP);
	        
	        return true;
	    }
	}
}