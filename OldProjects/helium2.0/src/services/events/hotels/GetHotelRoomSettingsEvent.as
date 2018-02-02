package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class GetHotelRoomSettingsEvent extends BaseEvent
	{
		public function GetHotelRoomSettingsEvent(type:String)
		{
			super(type);
		}
		
	}
}