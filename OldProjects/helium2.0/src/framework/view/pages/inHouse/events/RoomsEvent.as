package framework.view.pages.inHouse.events
{
	import flash.events.Event;

	public class RoomsEvent extends Event
	{
		public static const ROOM_ASSIGN:String = "roomAssign";
		
		public var id:Number;
		public var room:String;
		
		public function RoomsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}