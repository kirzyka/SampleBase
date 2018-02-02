package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;

	public class GetItemCountCompanyRatesEvent extends BaseEvent
	{
		public var groupId:int;
		
		public var itemName:String;
		
		public var rateId:int;
		
		public function GetItemCountCompanyRatesEvent(type:String)
		{
			super(type);
		}
		
	}
}