package kitaec.controller {

import flash.events.EventDispatcher;

public class Controller extends EventDispatcher {

    /* Event Name List */
    public static const LOGIN_SUCCESS_EVENT:String = "loginSuccessEvent";

    //---------------------------------------------------------------------
    private static var _instance:Controller;
    private static var _initByProperty:Boolean = false;

    public function AppModel()
    {
        if(!_initByProperty)
        {
            _initByProperty = false;
            throw new Error("Invalid initialization.");
        }
    }

    public static function getInstance():Controller
    {
        if(!_instance)
        {
            _initByProperty = true;
            _instance = new Controller();
        }
        return _instance;
    }

}
}
