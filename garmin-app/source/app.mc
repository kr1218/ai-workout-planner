using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Lang as Lang;

class AIWorkoutApp extends App.AppBase {

    var view;

    function initialize() {
        App.AppBase.initialize();
    }

    function onStart() {
        view = new WorkoutPlannerView();
        Ui.pushView(view, Ui.SLIDE_IMMEDIATE);
    }
}
