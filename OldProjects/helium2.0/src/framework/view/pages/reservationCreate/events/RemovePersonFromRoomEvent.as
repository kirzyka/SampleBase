package framework.view.pages.reservationCreate.events
{
	import flash.events.Event;
	
	import services.vo.profiles.ProfilePersonalVO;

	public class RemovePersonFromRoomEvent extends Event
	{
		public static var REMOVE_PERSON:String = "removePerson";
		
		public var itemData:ProfilePersonalVO;
		
		public function RemovePersonFromRoomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}