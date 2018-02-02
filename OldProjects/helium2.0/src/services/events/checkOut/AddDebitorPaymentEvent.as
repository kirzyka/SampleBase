package services.events.checkOut
{
	import services.cairngorm.BaseEvent;
	import services.vo.checkOut.itemRouting.PaymentVO;

	public class AddDebitorPaymentEvent extends BaseEvent
	{
		public var mapPayment:PaymentVO;
		public var hotelId:Number;
		public var cashierShiftId:Number;
		public var paymentToAttach:Number;
		
		public function AddDebitorPaymentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}