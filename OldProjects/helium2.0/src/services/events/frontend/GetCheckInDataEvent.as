package services.events.frontend
{
	import services.cairngorm.BaseEvent;

	public class GetCheckInDataEvent extends BaseEvent
	{
		public var checkDate:Number;
		public var checkStageId:int;
		public var checkYieldMode:Boolean = false;
		
		public function GetCheckInDataEvent(type:String)
		{
			super(type);
		}
		
	}
}