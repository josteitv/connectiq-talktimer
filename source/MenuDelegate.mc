using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

module TalkTimer {

	class MenuDelegate extends Ui.MenuInputDelegate {
	
    	private var _settings;
	    private var _timer;
	
	    function initialize(timer, settings) {
	        MenuInputDelegate.initialize();
            _timer = timer;
	        _settings = settings;
	    }

	    function onMenuItem(item) {
            if (item == :MenuItem_Reset) {
                _timer.reset();
            } else if (item == :MenuItem_SetTime) {
                var picker = new WatchUi.NumberPicker(WatchUi.NUMBER_PICKER_TIME_MIN_SEC, new Time.Duration(_settings.getStartTime()));
                Ui.pushView(picker, new SetTimeDelegate(_settings), Ui.SLIDE_UP);
	        } else if (item == :MenuItem_SetWarnTime) {
                var picker = new WatchUi.NumberPicker(WatchUi.NUMBER_PICKER_TIME_MIN_SEC, new Time.Duration(_settings.getWarnTime));
                Ui.pushView(picker, new SetWarnTimeDelegate(_settings), Ui.SLIDE_UP);
	        }
	    }

	}
}