package framework.view.pages.reservationCreate.parts
{
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    import framework.view.pages.reservationCreate.data.ReservationCalendarModel;
    
    import mx.binding.utils.ChangeWatcher;
    import mx.controls.Image;
    import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderRenderer;
    
    import services.vo.GlobalImageAssets;

    public class ReservationCalendarViewColumnHeaderRenderer extends AdvancedDataGridHeaderRenderer
    {
    	
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='BellIcon')]
		public var bellIcon:Class;
		
        protected var _adgColumn:ReservationCalendarViewColumn;

        private var _overInitialX:Number;
        private var _changeWatcher:ChangeWatcher;
        private var eventIcon:Image;

        public function ReservationCalendarViewColumnHeaderRenderer()
        {
            super();

            addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);

            _changeWatcher = ChangeWatcher.watch(ReservationCalendarModel.instance, "enableColumnSelection", handleColumnSelectionChange);
        }



        public function set eventDescription(value:String):void
        {
        	eventIcon = new Image();
        	eventIcon.toolTip = value;
        	eventIcon.width = 16;
        	eventIcon.height = 16;

        	eventIcon.source = bellIcon;
        	addChild(eventIcon);
        }

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);

            graphics.clear();

            if (adgColumn.bIsSelected)
            {
                graphics.beginFill(ReservationCalendarViewItemRenderer.RCVIR_COLOR_COLUMN_SELECTED, 0.3);
                graphics.drawRect(0, 0, width, height);
                graphics.endFill();
            }
            if(eventIcon != null)
            {
	            eventIcon.x = width - 20;
	        	eventIcon.y = 14;	
            }           

        }

        private function handleColumnSelectionChange(event:Event):void
        {
            if (ReservationCalendarModel.instance.enableColumnSelection)
            {
                addEventListener(MouseEvent.ROLL_OVER, handleMouseRollOver);
            }
            else
            {
                removeEventListener(MouseEvent.ROLL_OVER, handleMouseRollOver);
            }
        }

        private function handleMouseDown(event:MouseEvent):void
        {
        	if(listData.columnIndex == 0) return;

        	if(!event.ctrlKey)
        	{
	            selectCurrentColumn(listData.columnIndex);
	        }
	        else
	        {
	        	if(listData.columnIndex - 1 == ReservationCalendarModel.instance.lastSelectedColumnIndex)
	        	{
	        		ReservationCalendarModel.instance.lastSelectedColumnIndex = listData.columnIndex;
	        		adgColumn.bIsSelected = true;
          		}
          		else if(listData.columnIndex + 1 == ReservationCalendarModel.instance.firstSelectedColumnIndex)
          		{
          			ReservationCalendarModel.instance.firstSelectedColumnIndex = listData.columnIndex;
          			adgColumn.bIsSelected = true;
          		}
          		else if(listData.columnIndex == ReservationCalendarModel.instance.firstSelectedColumnIndex)
          		{
          			ReservationCalendarModel.instance.firstSelectedColumnIndex++;
          			adgColumn.bIsSelected = false;
          		}
          		else if(listData.columnIndex == ReservationCalendarModel.instance.lastSelectedColumnIndex)
          		{
          			ReservationCalendarModel.instance.lastSelectedColumnIndex--;
          			adgColumn.bIsSelected = false;
          		}
          		else selectCurrentColumn(listData.columnIndex);

            	ReservationCalendarModel.instance.calendarIsUpdated = false;
	        }
        }

        private function selectCurrentColumn(columnIndex:int):void
        {
        	ReservationCalendarModel.instance.selectedColumnDataFieldList.removeAll();
            ReservationCalendarModel.instance.firstSelectedColumnIndex = columnIndex;
            ReservationCalendarModel.instance.lastSelectedColumnIndex = columnIndex;
            ReservationCalendarModel.instance.calendarIsUpdated = false;
            ReservationCalendarModel.instance.enableColumnSelection = true;

            stage.addEventListener(MouseEvent.MOUSE_UP, handleStageMouseUp);
            adgColumn.bIsSelected = true;
        }

        private function handleStageMouseUp(event:MouseEvent):void
        {
            ReservationCalendarModel.instance.enableColumnSelection = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, handleStageMouseUp);
        }

        private function handleMouseRollOver(event:MouseEvent):void
        {
            ReservationCalendarModel.instance.lastSelectedColumnIndex = listData.columnIndex;
            ReservationCalendarModel.instance.calendarIsUpdated = false;
        }

        protected function get adgColumn():ReservationCalendarViewColumn
        {
            if (_adgColumn == null)
                _adgColumn = data as ReservationCalendarViewColumn;

            return _adgColumn;
        }
    }
}