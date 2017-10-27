using Toybox.Application;
using TalkTimer;

module TalkTimer {

	class TalkTimerApp extends Application.AppBase {

        private var startTime;
        private var warnTime;
        private var timeLeft;
	
	    public function initialize() {
	        AppBase.initialize();
	    }
	
	    public function onStart(state) {
            var app = Application.getApp();
            startTime = app.getProperty("startTime");
            warnTime = app.getProperty("warnTime");
            timeLeft = app.getProperty("timeLeft");	    
            
            if (startTime == null) {
                startTime = 10 * 60;
            }
            
            if (warnTime == null) {
                warnTime = 30;
            }
            
            if (timeLeft == null) {
                timeLeft = startTime;
            }            
	    }
	
	    public function onStop(state) {
    	    var app = Application.getApp();
    	    app.setProperty("startTime", startTime);
            app.setProperty("warnTime", warnTime);
            app.setProperty("timeLeft", timeLeft);
	    }
	
	    public function getInitialView() {
	        var timer = new TalkTimer.CountDownTimer(timeLeft, warnTime);
	       
	        return [ new TalkTimerView(timer), new TalkTimerDelegate(timer) ];
	    }
	
	}
}