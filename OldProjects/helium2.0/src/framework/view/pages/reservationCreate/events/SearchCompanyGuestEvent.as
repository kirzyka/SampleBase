package framework.view.pages.reservationCreate.events
{
	import flash.events.Event;
	
	public class SearchCompanyGuestEvent extends Event
	{
		public static const SEARCH_COMPANY_EVENT:String = "searchCompany";
		public var searchFiled:String="";
		
		public function SearchCompanyGuestEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

	}
}