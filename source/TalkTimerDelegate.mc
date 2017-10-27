using Toybox.WatchUi;

module TalkTimer {

	class TalkTimerDelegate extends WatchUi.BehaviorDelegate {
	   
	   private var timer;
	
	    function initialize(t) {
	        timer = t;
	        WatchUi.BehaviorDelegate.initialize();
	    }
	
	    public function onMenu() {
	        timer.stop();	        
	        WatchUi.pushView(new MenuView(), new MenuDelegate(timer), WatchUi.SLIDE_UP);
	        return true;
	    }

        public function onSelect() {
            if (timer.isRunning()) {
                timer.stop();
            } else {
                timer.start();
            }
            return true;
        }
	    
	}
}