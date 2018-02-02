package services.events.backend
{
	import services.cairngorm.BaseEvent;

	public class GetPageOfStartHotelEvent extends BaseEvent
	{
		public var hotelId:int;
		
		public function GetPageOfStartHotelEvent(type:String)
		{
			super(type);
		}
	}
}