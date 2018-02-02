package services.events.search
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetReservationByIdEvent extends BaseEvent
	{
		public var reservationId:int;

		public function GetReservationByIdEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.GET_RESERVATION_BY_ID, bubbles, cancelable);
		}

	}
}