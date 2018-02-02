package services.events.common
{
	import services.cairngorm.BaseEvent;

	public class GetVipHotelListEvent extends BaseEvent
	{
		public function GetVipHotelListEvent(type:String)
		{
			super(type);
		}
	}
}