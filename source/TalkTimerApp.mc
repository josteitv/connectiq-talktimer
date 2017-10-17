using Toybox.Application;

class TalkTimerApp extends Application.AppBase {

    function initialize() {
        Application.AppBase.initialize();
    }

    function onStart(state) {
    
    }

    function onStop(state) {
    
    }

    function getInitialView() {
        return [ new TalkTimerView(), new TalkTimerDelegate() ];
    }

}
