package services.events.security
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetSystemRoleListEvent extends BaseEvent
	{
		public static const NAME:String = "securityGetSystemRoleListEvent";
		
		public function GetSystemRoleListEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}