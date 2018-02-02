package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;

	public class GetItemPageCompanyRatesEvent extends BaseEvent
	{
		public var groupId:int;
		
		public var itemName:String;
		
		public var rateId:int;
		
		public var page:int = 0;
		
		public var count:int=10;
		
		
		public function GetItemPageCompanyRatesEvent(type:String)
		{
			super(type);
		}
		
	}
}