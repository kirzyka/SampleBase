package services.events.hotels
{
	import services.cairngorm.BaseEvent;
	import services.vo.hotels.HotelRoomObjectVO;

	public class AddRoomEvent extends BaseEvent
	{
		public var room:HotelRoomObjectVO = new HotelRoomObjectVO();
		
		public function AddRoomEvent(type:String)
		{
			super(type);
		}
		
	}
}