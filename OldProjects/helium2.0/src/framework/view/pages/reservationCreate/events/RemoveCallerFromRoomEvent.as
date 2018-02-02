package framework.view.pages.reservationCreate.events
{
	import flash.events.Event;
	
	import services.vo.profiles.ProfilePersonalVO;

	public class RemoveCallerFromRoomEvent extends Event
	{
		public static var REMOVE_CALLER:String = "removeCaller";
		
		public var profile:ProfilePersonalVO = new ProfilePersonalVO();
		
		public function RemoveCallerFromRoomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}