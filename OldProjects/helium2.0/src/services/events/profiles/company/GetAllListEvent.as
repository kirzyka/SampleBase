package services.events.profiles.company
{
	import services.cairngorm.BaseEvent;

	public class GetAllListEvent extends BaseEvent
	{
		public var page:int;
		public var count:int;
		public var pattern:String = "";
		
		public function GetAllListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}