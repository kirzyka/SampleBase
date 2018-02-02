package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class AcceptPaymentsEvent extends BaseEvent
	{
		public var hotelId:Number;
		public var paymentLineId:Number;
		public var paymentsIds:Array = [];
		public var isTryToCloseLine:Boolean;
		public var roomId:Number;
		public var departureDate:String;
		public var bIsConference:Boolean = false;
		
		public function AcceptPaymentsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}