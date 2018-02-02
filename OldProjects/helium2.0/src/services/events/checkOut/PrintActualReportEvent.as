package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class PrintActualReportEvent extends BaseEvent
	{
		public var paymentLineId:Number;
		public var hotelId:Number;
		public var isConference:Boolean;
		public var roomId:Number;
		
		[ArrayElementType("PaymentVO")]
		public var aVirtualPayments:/*PaymentVO*/Array = [];
		
		public function PrintActualReportEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
	}
}