using Toybox.WatchUi;

module TalkTimer {

    class TalkTimerDelegate extends WatchUi.BehaviorDelegate {

        private var _timer;
        private var _settings;

        function initialize(timer, settings) {
            WatchUi.BehaviorDelegate.initialize();
            _timer = timer;
            _settings = settings;
        }

        public function onMenu() {
            _timer.stop();
            WatchUi.pushView(new Rez.Menus.MainMenu(), new MenuDelegate(_timer, _settings), WatchUi.SLIDE_UP);
            return true;
        }

        public function onSelect() {
            if (_timer.isRunning()) {
                _timer.stop();
            } else {
                _timer.start();
            }
            return true;
        }

    }
}