package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class SaveHotelRoomSettingsEvent extends BaseEvent
	{
		public var ids:Array = new Array();
		
		public function SaveHotelRoomSettingsEvent(type:String)
		{
			super(type);
		}
		
	}
}