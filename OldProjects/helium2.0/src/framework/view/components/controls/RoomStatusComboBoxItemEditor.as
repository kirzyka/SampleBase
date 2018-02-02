package framework.view.components.controls
{
	import flash.events.Event;
	
	import framework.model.AppModelLocator;
	
	import mx.controls.ComboBox;
	import mx.events.ListEvent;
	
	import services.vo.backend.RoomWithStatusVO;
	import services.vo.hotels.HotelRoomStatusVO;

	public class RoomStatusComboBoxItemEditor extends ComboBox
	{
		[Bindable]
		public var model:AppModelLocator = AppModelLocator.getInstance();

		public var oHousekeepStatus:HotelRoomStatusVO;
		
		// necessesary for houseKeeperView
		[Bindable]
		public var oldStatus:HotelRoomStatusVO;

		public function RoomStatusComboBoxItemEditor()
		{
			addEventListener(Event.CHANGE, onSelectionChange);
		}
		
		
		private var _data:RoomWithStatusVO;

        override public function set data(value:Object):void
        {
        	if(value is RoomWithStatusVO)
        	{
	        	_data = value as RoomWithStatusVO;
	        	super.data = _data;

	            if(_data){
	            	for each(var roomStatus:HotelRoomStatusVO in dataProvider)
	            	{
	            		if(roomStatus.lId == _data.oHousekeepStatus.lId)
	            		{
	            			super.selectedItem = roomStatus;
	            			oHousekeepStatus = roomStatus;
	            			oldStatus = roomStatus;
	            		}
	            	}
	            }
	           dispatchEvent(new Event("RoomStatusComboboxChange")); 
         	}
        }
		
		[Bindable (event = "RoomStatusComboboxChange")]
        override public function get data():Object
        {
            return _data ;
        }

        override public function setFocus():void
        {
            super.setFocus();
            //TODO
	        //open();
        }

        private function onSelectionChange(e:ListEvent):void
        {
            _data.oHousekeepStatus = selectedItem as HotelRoomStatusVO;
            oHousekeepStatus = _data.oHousekeepStatus;
        }

	}
}