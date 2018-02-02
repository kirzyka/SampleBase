package services.events.reservation
{
	import services.cairngorm.BaseEvent;
	import services.vo.reservation.ReservationVO;

	public class SaveReservationEvent extends BaseEvent
	{
		public var reservation:ReservationVO;
		
		public function SaveReservationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}