package framework.view.pages.rates.companyRates.events
{
	import flash.events.Event;

	public class SelectHotelClickEvent extends Event
	{
		public static var HOTEL_SELECT:String = "hotelSelectEvent";
		
	//	public var idHotel:int;
		
		public function SelectHotelClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}