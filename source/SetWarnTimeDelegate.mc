using Toybox.WatchUi;
using Toybox.System;

module TalkTimer {

	class SetTimeDelegate extends WatchUi.NumberPickerDelegate {
	
	   private var _settings;
	
	    function initialize(settings) {
	        NumberPickerDelegate.initialize();
	        _settings = settings;
	    }
	
	    function onNumberPicked(value) {
	       _settings.setStartTime(value.value());
           _settings.setTimeLeft(value.value());
	    }
	}

}