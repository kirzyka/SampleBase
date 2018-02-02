package framework.view.pages.inHouse.events
{
	import flash.events.Event;

	public class AssignProfileEvent extends Event
	{
		public static const PROFILE_SELECTED:String = "profileSelected";
		
		public var profileId:Number;
		public var isCompany:Boolean;
		
		public function AssignProfileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}