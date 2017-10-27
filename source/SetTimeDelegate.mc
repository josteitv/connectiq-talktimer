using Toybox.WatchUi;
using Toybox.System;

module TalkTimer {

	class SetWarnTimeDelegate extends WatchUi.NumberPickerDelegate {
	
	   private var _settings;
	
	    function initialize(settings) {
	        NumberPickerDelegate.initialize();
	        _settings = settings;
	    }
	
	    function onNumberPicked(value) {
	       _settings.setWarnTime(value.value());
	    }
	}

}