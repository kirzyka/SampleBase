package services.events.rates.bar
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetHotelBarPriceEvent extends BaseEvent
	{
		public var iHotelId:int;
		public var iRoomQualityId:int;
		public var sStartDate:String;
		public var sEndDate:String;

		public function GetHotelBarPriceEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.GET_HOTEL_BAR_PRICE_EVENT, bubbles, cancelable);
		}

	}
}