package services.events.security
{
	import services.cairngorm.BaseEvent;
	
	/**
	* The DeleteUserHotelRoleEvent class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class DeleteUserHotelRoleEvent extends BaseEvent
	{
		public static const NAME:String = "securityDeleteUserHotelRoleEvent";
		
		public var iUserId:int;
		public var iHotelId:int;
		public var iRoleId:int;
		
		public function DeleteUserHotelRoleEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}		
	}
}