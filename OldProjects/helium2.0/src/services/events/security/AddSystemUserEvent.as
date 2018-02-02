package services.events.security
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class AddSystemUserEvent extends BaseEvent
	{
		public static const NAME:String = "securityAddSystemUserEvent";
		
		public var sLogin:String;
		public var iRoleId:int;
		public var iUserId:int = 0;
		
		public function AddSystemUserEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}