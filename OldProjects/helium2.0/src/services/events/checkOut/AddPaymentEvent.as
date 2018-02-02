package services.events.checkOut
{
	import services.cairngorm.BaseEvent;
	import services.vo.checkOut.itemRouting.PaymentVO;

	public class AddPaymentEvent extends BaseEvent
	{
		public var payment:PaymentVO;
		
		public function AddPaymentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}