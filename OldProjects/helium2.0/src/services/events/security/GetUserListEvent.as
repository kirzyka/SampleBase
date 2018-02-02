package services.events.security
{
	import services.cairngorm.BaseEvent;

	public class GetUserListEvent extends BaseEvent
	{
		public static const NAME:String = "securityGetUserListEvent";
		
		
		public function GetUserListEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}