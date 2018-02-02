package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class SetNewPasswordEvent extends CairngormEvent
	{
		public var login:String;
		public var question:String;
		public var answer:String; 
		public var password:String;
		
		public function SetNewPasswordEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}