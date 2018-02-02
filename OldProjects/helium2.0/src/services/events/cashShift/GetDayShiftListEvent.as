package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetDayShiftListEvent extends BaseEvent
	{
		public var hotelId:Number;
		public var sDate:String;
		
		public function GetDayShiftListEvent()
		{
			super(AppController.CASHSHIFT_GET_DAY_SHIFT_LIST);
		}
	}
}