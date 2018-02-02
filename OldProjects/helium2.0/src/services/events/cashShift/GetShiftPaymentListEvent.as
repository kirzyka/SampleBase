package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetShiftPaymentListEvent extends BaseEvent // get data for data grid
	{
		public var hotelId:Number;
		public var sDate:String;
		public var iShiftNumber:Number;
		
		public function GetShiftPaymentListEvent()
		{
			super(AppController.CASHSHIFT_GET_SHIFT_PAYMENT_LIST);
		}
	}
}