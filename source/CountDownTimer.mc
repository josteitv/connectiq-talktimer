
module TalkTimer {

	class CountDownTimer {
	
	    private var timer;
	    private var duration;
	    private var warnTime;
	
	    //! Initialize the TalkTimer class
	    //! @param [Toybox::Lang::Number] Start time
	    //! @param [Toybox::Lang::Number] Time to warn
	    public function initialize(startTime, wTime) {
	        duration = new Time.Duration(startTime);
	        warnTime = wTime;
	        timer = new Timer.Timer();
	    }
	
	    public function start() {
	        timer.start(method(:callback), 1000, true);
	    }
	    
	    public function stop() {
	        timer.stop();
	    }
	    
	    private function callback() {
	        if (duration.value() > 0) {
		        duration = duration.subtract(new Time.Duration(1));    	
	        }
	        WatchUi.requestUpdate(); // TODO: Move to View
	    }
	
	    public function getStatus() {
			if (duration.value() <= 0) {
			    return Status.TimesUp;
			} else if (duration.value() <= warnTime) {
			    return Status.Warn;
			} else {
			    return Status.Ok;
			}
	    }
	
	
	    //! Output the remaining time as a formatted string
	    //! @return [Toybox::Lang::String] Formatted time
	    public function toString() {
	        var total = duration.value();
	    
		    var sign = "";
		    if (total < 0) {
		        sign = "-";
		        total *= -1;
		    }
		    var hours = total / 60 / 60;
		    var hoursString = hours == 0 ? "" : hours.format("%01d:");
		    var mins = (total / 60) % 60;
		    var minutesString = (hours == 0 && mins == 0) ? "" : mins.format("%02d")  + ":";
		    var secs = total % 60;
		    var timeString = Lang.format("$1$$2$$3$$4$", [sign, hoursString, minutesString, secs.format("%02d")]);
	
	        return timeString;
	    }
	
	}

}