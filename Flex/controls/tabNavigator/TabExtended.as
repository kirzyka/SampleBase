package com.controls.tabNavigator
{
    import flash.events.Event;
    import flash.events.MouseEvent;
    import mx.controls.tabBarClasses.*;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import mx.states.SetStyle;
    import spark.components.Button;
    import spark.skins.spark.TitleWindowCloseButtonSkin;

    use namespace mx_internal;

    public class TabExtended extends Tab
    {

        public static const CLOSE_TAB_EVENT:String = "closeTab";

        private var _closeButton:Button;

        private var _closeEnabled:Boolean;


        public function TabExtended()
        {
            super();
            this.mouseChildren = true;
        }

        public function get closeEnabled():Boolean
        {
            return this._closeEnabled;
        }

        public function set closeEnabled(value:Boolean):void
        {
            this._closeEnabled = value;

            if (value)
            {
                this.setStyle("paddingLeft", -10);
            }
            this.invalidateDisplayList();
        }

        override protected function createChildren():void
        {
            super.createChildren();

            this._closeButton = new Button();
            this._closeButton.width = 16;
            this._closeButton.height = 16;
            this._closeButton.setStyle("skinClass", Class(spark.skins.spark.TitleWindowCloseButtonSkin));

            this._closeButton.addEventListener(MouseEvent.CLICK, closeClickHandler, false, 0, true);

            addChild(this._closeButton);
        }

        override protected function measure():void
        {
            super.measure();

            if (this._closeEnabled)
            {
                measuredMinWidth += 50;
                measuredWidth += 50;
            }
        }

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);

            setChildIndex(this._closeButton, numChildren - 1);

            this._closeButton.visible = this._closeEnabled;
            this._closeButton.enabled = this._closeEnabled;

            if (this._closeEnabled)
            {
                this._closeButton.move(width - 21, textField.y);
            }
        }

        /**
         * The click handler for the close button.
         */
        private function closeClickHandler(event:MouseEvent):void
        {
            dispatchEvent(new Event(CLOSE_TAB_EVENT));
            event.stopImmediatePropagation();
        }
    }
}
