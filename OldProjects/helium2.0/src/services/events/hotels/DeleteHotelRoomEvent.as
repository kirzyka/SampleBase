package services.events.hotels
{
	import services.cairngorm.BaseEvent;
	import services.vo.hotels.HotelRoomObjectVO;

	public class DeleteHotelRoomEvent extends BaseEvent
	{
		public var stageIndex:int;
		public var roomIndex:int;
		public var room:HotelRoomObjectVO = new HotelRoomObjectVO;
		
		public function DeleteHotelRoomEvent(type:String)
		{
			super(type);
		}
		
	}
}