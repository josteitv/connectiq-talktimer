using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Timer;
using Toybox.Time;
using TalkTimer;

module TalkTimer {

	class TalkTimerView extends WatchUi.View {
	
	    private var backgroundColor = Graphics.COLOR_GREEN;
	    private var talkTimer;
	
	    public function initialize() {
	        WatchUi.View.initialize();
	    }
	
	    // Load your resources here
	    public function onLayout(dc) {
	        talkTimer = new TalkTimer.TalkTimer(60 * 10, 10);
	        talkTimer.start();
	    }
	
	    public function onUpdate(dc) {
	        View.onUpdate(dc);
	        
	        var status = talkTimer.getStatus();
	        var timeString = talkTimer.toString();
	        
			if (status == Status.TimesUp) {
				backgroundColor = (backgroundColor == Graphics.COLOR_RED) ? Graphics.COLOR_DK_RED : Graphics.COLOR_RED;
			} else if (status == Status.Warn) {
				backgroundColor = Graphics.COLOR_YELLOW;
			} else {
			    backgroundColor = Graphics.COLOR_GREEN;		
			}
	
			dc.setColor(backgroundColor, backgroundColor);
	        dc.clear();
	        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
	        
	        // TODO: Not always centered on all devices... Fenix3 and Fenix5X
	        dc.drawText(dc.getWidth() / 2, (dc.getHeight() / 2) - 30, Graphics.FONT_SYSTEM_NUMBER_THAI_HOT, timeString, Graphics.TEXT_JUSTIFY_CENTER);        
	    }
	    
	    // Called when this View is brought to the foreground. Restore
	    // the state of this View and prepare it to be shown. This includes
	    // loading resources into memory.
	    public function onShow() {
	    
	    }
	
	    // Called when this View is removed from the screen. Save the
	    // state of this View here. This includes freeing resources from
	    // memory.
	    public function onHide() {
	    
	    }
	
	}
}