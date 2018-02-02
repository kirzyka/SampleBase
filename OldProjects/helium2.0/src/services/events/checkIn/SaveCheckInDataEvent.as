package services.events.checkIn
{
	import services.cairngorm.BaseEvent;

	public class SaveCheckInDataEvent extends BaseEvent
	{
		public var orderId:int;
		public var roomId:int;
		public var profileId:int;
		public var isYieldMode:Boolean = false;
		
		public function SaveCheckInDataEvent(type:String)
		{
			super(type);
		} 
		
	}
}