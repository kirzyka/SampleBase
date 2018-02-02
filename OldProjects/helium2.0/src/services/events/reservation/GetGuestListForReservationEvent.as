package services.events.reservation
{
	/**
	* The GetGuestListForReservationEvent class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2010/02/08 $
	*
	*/

	import services.cairngorm.BaseEvent;

	public class GetGuestListForReservationEvent extends BaseEvent
	{
		public static const NAME:String = "reservationGetGuestListForRsrvEvent";
		
		public var rsvId:int;
		
		public function GetGuestListForReservationEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}