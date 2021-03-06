using Toybox.Time;
using Toybox.Timer;

module TalkTimer {

    class CountDownTimer {

        private var _settings;

        private var timer;
        private var duration;
        private var _isRunning = false;

        public function initialize(settings) {
            _settings = settings;
            refresh();
        }

        public function refresh() {
            duration = new Time.Duration(_settings.getTimeLeft());
            timer = new Timer.Timer();
        }

        public function reset() {
            _settings.reset();
        }

        public function save() {
            duration = new Time.Duration(_settings.getTimeLeft());
            timer = new Timer.Timer();
        }

        public function isRunning() {
            return _isRunning;
        }

        public function start() {
            timer.start(method(:timerCallback), 1000, true);
            _isRunning = true;
        }

        public function stop() {
            timer.stop();
            _isRunning = false;
        }

        function timerCallback() {
            if (duration.value() > 0) {
                duration = duration.subtract(new Time.Duration(1));
                _settings.setTimeLeft(duration.value());
            }
            WatchUi.requestUpdate(); // TODO: Move to View
        }

        public function getStatus() {
            if (duration.value() <= 0) {
                return Status.TimesUp;
            } else if (duration.value() <= _settings.getWarnTime()) {
                return Status.Warn;
            } else {
                return Status.Ok;
            }
        }

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