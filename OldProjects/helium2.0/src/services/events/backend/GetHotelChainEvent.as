package services.events.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetHotelChainEvent extends CairngormEvent
	{
		/**
		 *  This property contain call back function for executing some functions
		 *  if user get result's handler after call remote function from the server.
		 */
		public var callBack:Function;
		
		public function GetHotelChainEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}