using Toybox.Test;

module TalkTimer {

    module Test {

        (:test)
        function toString_should_return_01_00_when_initialized_with_60_seconds(logger) {
            var timer = new CountDownTimer(60, 0);
            Test.assertEqual(timer.toString(), "01:00");
            return true;
        }

        (:test)
        function toString_should_return_10_00_when_initialized_with_600_seconds(logger) {
            var timer = new CountDownTimer(600, 0);
            Test.assertEqual(timer.toString(), "10:00");
            return true;
        }

        (:test)
        function toString_should_return_00_when_initialized_with_0_seconds(logger) {
            var timer = new CountDownTimer(0, 0);
            Test.assertEqual(timer.toString(), "00");
            return true;
        }

        (:test)
        function toString_should_return_59_when_initialized_with_59_seconds(logger) {
            var timer = new CountDownTimer(59, 0);
            Test.assertEqual(timer.toString(), "59");
            return true;
        }

    }
}