using Toybox.WatchUi;
using Toybox.Time;

module TalkTimer {

    class MenuDelegate extends WatchUi.MenuInputDelegate {

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
                WatchUi.pushView(picker, new SetTimeDelegate(_settings), WatchUi.SLIDE_IMMEDIATE);
            } else if (item == :MenuItem_SetWarnTime) {
                var picker = new WatchUi.NumberPicker(WatchUi.NUMBER_PICKER_TIME_MIN_SEC, new Time.Duration(_settings.getWarnTime));
                WatchUi.pushView(picker, new SetWarnTimeDelegate(_settings), WatchUi.SLIDE_IMMEDIATE);
            }
        }

    }
}