package framework.view.pages.reservationCreate.events
{
	import flash.events.Event;

	public class ShowProfilesFinder extends Event
	{
		public static const SHOW_PROFILES_FINDER_EVENT:String = "showProfilesFinder";
		public var searchFiled:String="";
		
		public function ShowProfilesFinder(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}