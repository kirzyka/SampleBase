package services.events.security
{
	import services.cairngorm.BaseEvent;
	
	/**
	* The GetUserListInHotelEvent class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/	
	public class GetUserListInHotelEvent extends BaseEvent
	{
		public static const NAME:String = "securityGetUserListInHotelEvent";
		
		public var iHotelID:int;
		
		public function GetUserListInHotelEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}