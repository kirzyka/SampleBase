package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class SaveHotelRoomTypesEvent extends BaseEvent
	{
		public function SaveHotelRoomTypesEvent(type:String)
		{
			super(type);
		}
		
	}
}