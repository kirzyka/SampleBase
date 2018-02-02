package kitaec.view {

import flash.utils.setTimeout;

import kitaec.common.Icon;
import kitaec.controller.event.NotifyEvent;

import mx.events.FlexEvent;
import mx.events.MenuEvent;

import spark.components.HGroup;

public class MainBase extends BaseView {

    public var notifyPanel:HGroup;

    [Bindable]
    protected var notifyIcon:Class;
    [Bindable]
    protected var notifyMSG:String;


    public function MainBase() {
        controller.addEventListener(NotifyEvent.NAME, onNotify);
    }

    override protected function onShow(event:FlexEvent):void {

    }

    protected function onCurrentStateChange():void {

    }

    protected function onSubMenuSelection(event:MenuEvent):void {
        var page:String = event.item.@mnuCode;
        if (page) {
            currentState = page;
        }
    }

    protected function onNotify(event:NotifyEvent):void {
        switch (event.notifyType) {
            case NotifyEvent.TYPE_INFO:
                notifyIcon = Icon.ICON_NOTIFY_INFO;
                break;
            case NotifyEvent.TYPE_WARN:
                notifyIcon = Icon.ICON_NOTIFY_WARN;
                break;
            case NotifyEvent.TYPE_ERROR:
                notifyIcon = Icon.ICON_NOTIFY_ERROR;
                break;
        }
        notifyMSG = event.notifyMSG;

        notifyPanel.visible = true;
        setTimeout(function ():void {
            notifyPanel.visible = false;
        }, 3000)
    }
}
}
