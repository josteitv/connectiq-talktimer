using Toybox.Application;
using TalkTimer;

module TalkTimer {

	class TalkTimerApp extends Application.AppBase {
	
	    public function initialize() {
	        Application.AppBase.initialize();
	    }
	
	    public function onStart(state) {
	    
	    }
	
	    public function onStop(state) {
	    
	    }
	
	    public function getInitialView() {
	        return [ new TalkTimerView(), new TalkTimerDelegate() ];
	    }
	
	}
}