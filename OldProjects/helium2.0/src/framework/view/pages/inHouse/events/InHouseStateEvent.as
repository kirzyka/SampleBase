package framework.view.pages.inHouse.events
{
	import flash.events.Event;

	public class InHouseStateEvent extends Event
	{
		public static const SHOW_GUEST_MESSAGES:String = "showGuestMessages";
		public static const ADD_GUEST_MESSAGE:String = "addGuestMessage";
		public static const SHOW_EDIT_RESERVATION:String = "showEditReservation";
		public static const SHOW_EDIT_GROUP_RESERVATION:String = "showEditGroupReservation";
		public static const SHOW_GUEST_PROFILE:String = "showGuestProfile";
		public static const SHOW_ROOMS_AVAILABLE:String = "showRoomsAvailable";
		
		public function InHouseStateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}