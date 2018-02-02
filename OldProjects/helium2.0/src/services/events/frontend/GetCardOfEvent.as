package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetCardOfEvent extends CairngormEvent
	{
		public function GetCardOfEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}