package services.events.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class AddHotelMainGroupsEvent extends CairngormEvent
	{
		public var group:Array = [];
		public var groupIndex:int;
		public var callBack:Function;
		
		public function AddHotelMainGroupsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}