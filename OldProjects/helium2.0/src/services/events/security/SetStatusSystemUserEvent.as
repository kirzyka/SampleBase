package services.events.security
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class SetStatusSystemUserEvent extends BaseEvent
	{
		public static const NAME:String = "securitySetStatusSystemUserEvent";
		
		public var iUserId:int;
		public var bStatus:Boolean;
		
		public function SetStatusSystemUserEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}