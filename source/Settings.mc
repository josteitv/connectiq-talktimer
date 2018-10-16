module TalkTimer {

    class Settings {

        private const defaultStartTime = 60 * 10;
        private const defaultWarnTime = 30;

        private var _startTime;
        private var _warnTime;
        private var _timeLeft;

        function initialize() {

        }

        function reset() {
            _timeLeft = _startTime;
        }

        function setStartTime(startTime) {
            if (startTime == null) {
                startTime = defaultStartTime;
            }
            _startTime = startTime;
        }

         function setWarnTime(warnTime) {
            if (warnTime == null) {
                warnTime = defaultWarnTime;
            }
            _warnTime = warnTime;
        }

         function setTimeLeft(timeLeft) {
            if (timeLeft == null) {
                timeLeft = defaultStartTime;
            }
            _timeLeft = timeLeft;
        }

        function getStartTime() {
            return _startTime;
        }
        function getWarnTime() {
            return _warnTime;
        }
        function getTimeLeft() {
            return _timeLeft;
        }

    }

}