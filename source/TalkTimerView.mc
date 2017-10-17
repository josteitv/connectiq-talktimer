using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Timer;
using Toybox.Time;

var startTime = 10 * 60;
var warnTime = 10;

var timer;
var duration;
var backgroundColor = Graphics.COLOR_GREEN;

class TalkTimerView extends WatchUi.View {

    function initialize() {
        WatchUi.View.initialize();
    }

    function callback() {
    	if (duration.value() > 0) {
	    	duration = duration.subtract(new Time.Duration(1));    	
    	}
        WatchUi.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
        duration = new Time.Duration(startTime);
        timer = new Timer.Timer();

        timer.start(method(:callback), 1000, true);
    }

    function onUpdate(dc) {
        View.onUpdate(dc);

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


		if (duration.value() <= 0) {
			backgroundColor = (backgroundColor == Graphics.COLOR_RED) ? Graphics.COLOR_DK_RED : Graphics.COLOR_RED;
		} else if (duration.value() <= warnTime) {
			backgroundColor = Graphics.COLOR_YELLOW;
		} else {
		    backgroundColor = Graphics.COLOR_GREEN;		
		}

		dc.setColor(backgroundColor, backgroundColor);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        
        // TODO: Not always centered on all devices...
        dc.drawText(dc.getWidth() / 2, (dc.getHeight() / 2) - 30, Graphics.FONT_SYSTEM_NUMBER_THAI_HOT, timeString, Graphics.TEXT_JUSTIFY_CENTER);
    }
    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    

}
