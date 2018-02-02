package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class DeletePaymentEvent extends BaseEvent
	{
		public var paymentId:Number;
		public var index:int;
		
		public function DeletePaymentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}