package kitaec.controller.event {

import flash.events.Event;

public class NotifyEvent extends Event {

    public static const NAME:String = "notifyEvent"

    public static const TYPE_INFO:int = 0;
    public static const TYPE_WARN:int = 1;
    public static const TYPE_ERROR:int = 2;

    public var notifyType:int;
    public var notifyMSG:String;

    public function NotifyEvent(notifyMSG:String, notifyType:int = TYPE_INFO, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(NAME, bubbles, cancelable);
        this.notifyMSG = notifyMSG;
        this.notifyType = notifyType;
    }
}
}
