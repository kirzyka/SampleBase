package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class ReopenShiftEvent extends BaseEvent
	{
		public var hotelId:int;
		public var shiftNumber:int;
		public function ReopenShiftEvent()
		{
			super(AppController.CASHSHIFT_REOPEN_SHIFT);
		}
	}
}