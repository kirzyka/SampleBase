package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetCreditTypeEvent extends CairngormEvent
	{
		public function GetCreditTypeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}