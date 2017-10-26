using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

module TalkTimer {

	class MenuDelegate extends Ui.BehaviorDelegate {
	
	    function initialize() {
	        BehaviorDelegate.initialize();
	    }

        public function onMenu() {
            return back();
        }

        public function onBack() {
            return back();
        }

        private function back() {
            timer.start();            
            Ui.popView(Ui.SLIDE_DOWN);            
            return true;
        }

	}
}