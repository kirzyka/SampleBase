package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class DeleteHotelEvent extends BaseEvent
	{
		public function DeleteHotelEvent(type:String)
		{
			super(type);
		}
	}
}