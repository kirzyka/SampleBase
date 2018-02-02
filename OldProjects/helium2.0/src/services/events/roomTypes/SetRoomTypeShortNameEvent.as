package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;

	public class SetRoomTypeShortNameEvent extends BaseEvent
	{
		public var roomTypeId:int;
		public var shortName:String;
		
		public function SetRoomTypeShortNameEvent(type:String)
		{
			super(type);
		}
		
	}
}