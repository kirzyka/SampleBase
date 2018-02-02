package services.events.common
{
	import services.cairngorm.BaseEvent;

	public class PageEvent extends BaseEvent
	{
		public static const NAME:String = "openPageEvent";
		
		public var index:int;
		
		public function PageEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
	}
}