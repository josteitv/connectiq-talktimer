using Toybox.Test;

module TalkTimer {

    module Test {
    
		(:test)
		function TalkTimer_toString_should_return_01_00_when_initialized_with_60_seconds(logger) {
		    var talkTimer = new TalkTimer(60, 0);
		    Test.assertEqual(talkTimer.toString(), "01:00");
		    return true;
		}
		
		(:test)
		function TalkTimer_toString_should_return_10_00_when_initialized_with_600_seconds(logger) {
		    var talkTimer = new TalkTimer(600, 0);
		    Test.assertEqual(talkTimer.toString(), "10:00");
		    return true;
		}
		
		(:test)
		function TalkTimer_toString_should_return_00_when_initialized_with_0_seconds(logger) {
		    var talkTimer = new TalkTimer(0, 0);
		    Test.assertEqual(talkTimer.toString(), "00");
		    return true;
		}
		
		(:test)
		function TalkTimer_toString_should_return_59_when_initialized_with_59_seconds(logger) {
		    var talkTimer = new TalkTimer(59, 0);
		    Test.assertEqual(talkTimer.toString(), "59");
		    return true;
		}
		
	}
}