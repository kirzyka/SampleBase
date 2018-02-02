package services.events.backend
{
	import services.cairngorm.BaseEvent;

	public class GetHotelDictionariesEvent extends BaseEvent
	{
		public var hotelId:int;
		
		public function GetHotelDictionariesEvent(type:String)
		{
			super(type);
		}
	}
}