package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class OpenNextShiftEvent extends BaseEvent
	{
		public var hotelId:int;
		public function OpenNextShiftEvent()
		{
			super(AppController.CASHSHIFT_OPEN_NEXT_SHIFT);
		}

	}
}