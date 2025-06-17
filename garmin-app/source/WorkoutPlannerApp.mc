using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Lang as Lang;

class WorkoutPlannerView extends Ui.View {

    var goal;
    var level;
    var days;
    var plan = "";

    function onLayout(dc) {
        setLayout({
            :view => "layout.xml"
        });
    }

    function onShow() {}

    function onSelect() {
        goal = "Strength";
        level = "Intermediate";
        days = "4";
        requestPlan();
    }

    function requestPlan() {
        var url = "https://your-railway-app-url/generate_workout"; // <-- REPLACE
        var request = { "goal": goal, "level": level, "days": days };

        Comm.makeWebRequest(url, request, {"Content-Type":"application/json"}, method(:onResponse));
    }

    function onResponse(responseCode, data) {
        if (responseCode == 200) {
            var json = Lang.fromJson(data);
            plan = json["plan"];
            showPlan();
        } else {
            plan = "Error loading plan.";
            showPlan();
        }
    }

    function showPlan() {
        Ui.requestUpdate();
    }

    function onUpdate(dc) {
        dc.clear();
        dc.drawText(50, 50, Graphics.FONT_SMALL, plan);
    }
}
