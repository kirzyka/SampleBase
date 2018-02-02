package services.events.reservation
{
	import services.cairngorm.BaseEvent;

	public class GetOrderFutureInfoEvent extends BaseEvent
	{
		public static const NAME:String = "reservationGetOrderFutureInfoEvent";
		
		public var hotelId:int;
		public var orderId:int;
		public var sDateStart:String;
		public var sDateEnd:String;
		
		public function GetOrderFutureInfoEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
	}
}