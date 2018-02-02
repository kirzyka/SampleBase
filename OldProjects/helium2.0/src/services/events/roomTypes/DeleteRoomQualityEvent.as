package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.RoomQualityObjectVO;

	public class DeleteRoomQualityEvent extends BaseEvent
	{
		public var roomQuality:RoomQualityObjectVO = new RoomQualityObjectVO();
		
		public function DeleteRoomQualityEvent(type:String)
		{
			super(type);
		}		
	}
}