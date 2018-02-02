package framework.view.pages.hotels.events
{
	import flash.events.Event;

	public class HotelBaseClickEvent extends Event
	{
		public static var BASE_CLICK:String = "baseClickEvent";
		
		public var qualityId:int = 0;
		
		public function HotelBaseClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}