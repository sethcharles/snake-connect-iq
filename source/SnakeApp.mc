using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class SnakeApp extends App.AppBase {

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new SnakeView(), new SnakeDelegate() ];
    }

}