package services.events.inHouse
{
	import services.cairngorm.BaseEvent;

	public class GetConferenceRoomStatusEvent extends BaseEvent
	{
		public var confRoomId:Number;
		public var hotelId:Number;
		
		public function GetConferenceRoomStatusEvent(type:String)
		{
			super(type);
		}
	}
}