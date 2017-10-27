using Toybox.Application;
using TalkTimer;

module TalkTimer {

	class TalkTimerApp extends Application.AppBase {

        private var settings = new Settings();
	
	    public function initialize() {
	        AppBase.initialize();
	    }
	
	    public function onStart(state) {
            var app = Application.getApp();
            settings.setStartTime(app.getProperty("startTime"));
            settings.setWarnTime(app.getProperty("warnTime"));
            settings.setTimeLeft(app.getProperty("timeLeft"));            
	    }
	
	    public function onStop(state) {
    	    var app = Application.getApp();
    	    app.setProperty("startTime", settings.getStartTime());
            app.setProperty("warnTime", settings.getWarnTime());
            app.setProperty("timeLeft", settings.getTimeLeft());
	    }
	
	    public function getInitialView() {
	        var timer = new TalkTimer.CountDownTimer(settings);
	       
	        return [ new TalkTimerView(timer), new TalkTimerDelegate(timer, settings) ];
	    }
	
	}
}