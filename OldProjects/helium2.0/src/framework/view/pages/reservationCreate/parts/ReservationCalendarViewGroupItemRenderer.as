package framework.view.pages.reservationCreate.parts
{
    import flash.events.Event;
    
    import framework.view.pages.reservationCreate.component.dataGrid.ReservationCalendar;
    
    import mx.controls.advancedDataGridClasses.AdvancedDataGridGroupItemRenderer;
    import mx.formatters.NumberFormatter;

    public class ReservationCalendarViewGroupItemRenderer extends AdvancedDataGridGroupItemRenderer
    {
        protected var _oParentTable:ReservationCalendar;
        protected var _sDataField:String;
        protected var _oFormatter:NumberFormatter;

        public function ReservationCalendarViewGroupItemRenderer()
        {
            super();

            addEventListener(Event.ADDED, isAdded);

            this.setStyle("backgroundAlpha", "0.5");
        }

        override protected function commitProperties():void
        {
            super.commitProperties();
        }

        private function isAdded(event:Event):void
        {
            _oParentTable = findParentTable(this.parent);
            _sDataField = styleName.dataField;
            _oFormatter = styleName.formatter;
        }

        private function findParentTable(parentContainer:Object):ReservationCalendar
        {
            if (parentContainer == null)
            {
                return null;
            }

            if (parentContainer is ReservationCalendar)
            {
                return (parentContainer as ReservationCalendar);
            }
            else
            {
                return findParentTable(parentContainer.parent);
            }
        }

        override public function set data(value:Object):void
        {
            super.data = value;
            if(value)
            {
	            label.text = "";
	            if (data.hasOwnProperty(_sDataField))
	            {
	                label.text = data[_sDataField];
	            }
            }
        }
    }
}