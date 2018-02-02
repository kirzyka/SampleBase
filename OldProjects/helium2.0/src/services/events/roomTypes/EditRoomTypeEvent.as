package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.RoomWithBedTypesObjectVO;

	public class EditRoomTypeEvent extends BaseEvent
	{
		public var index:int;
		public var roomType:RoomWithBedTypesObjectVO = new RoomWithBedTypesObjectVO();
		
		public function EditRoomTypeEvent(type:String)
		{
			super(type);
		}
		
	}
}