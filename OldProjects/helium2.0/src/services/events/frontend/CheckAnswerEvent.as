package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class CheckAnswerEvent extends CairngormEvent
	{
		public var login:String;
		public var question:String;
		public var answer:String;
		
		public function CheckAnswerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}