package services.events.checkOut
{
	import services.cairngorm.BaseEvent;
	
	public class DetachPaymentsFromAccountEvent extends BaseEvent
	{
		public var paymentIds:Array = [];
		public var parentPaymentId:Number;
		
		public function DetachPaymentsFromAccountEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
	}
}