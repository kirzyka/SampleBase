package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetLastOpenShiftEvent extends BaseEvent
	{

		public var hotelId:int;

		public function GetLastOpenShiftEvent()
		{
			super(AppController.CASHSHIFT_GET_LAST_OPEN_SHIFT);
		}

	}
}