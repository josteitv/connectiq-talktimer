using Toybox.WatchUi;

module TalkTimer {

	class TalkTimerDelegate extends WatchUi.BehaviorDelegate {
	
	    function initialize() {
	        WatchUi.BehaviorDelegate.initialize();
	    }
	
	    function onMenu() {
	        //timer.stop();
	        
	        // TODO fix Menu
	        //WatchUi.pushView(new TalkTimerMenuView(), new TalkTimerMenuDelegate(), WatchUi.SLIDE_UP);
	        
	        return true;
	    }
	}
}