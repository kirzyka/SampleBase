package framework.view.pages.roomTypes.events
{
	import flash.events.Event;

	public class BaseClickEvent extends Event
	{
		public static var BASE_CLICK:String = "baseClickEvent";
		
		public var bedTypeId:int = 0;
		
		public function BaseClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}