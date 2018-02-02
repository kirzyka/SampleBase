package services.events.checkIn
{
	import services.cairngorm.BaseEvent;

	public class SetAssignCheckInDataEvent extends BaseEvent
	{
		public var profileId:int;
		public var orderId:int;
		public var roomId:int;
		public var yieldMode:Boolean = false;
		
		public function SetAssignCheckInDataEvent(type:String)
		{
			super(type);
		}
		
	}
}