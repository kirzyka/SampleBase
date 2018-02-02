package services.events.common
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetDataListByTypeCodeEvent extends CairngormEvent
	{
		public var sListTypeCode:String; //RHYTHM
		
		public function GetDataListByTypeCodeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}