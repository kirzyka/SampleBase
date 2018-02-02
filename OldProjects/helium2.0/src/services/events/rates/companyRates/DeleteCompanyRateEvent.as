package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;

	public class DeleteCompanyRateEvent extends BaseEvent
	{
		public var idCompanyRate:int;
		
		
		public function DeleteCompanyRateEvent(type:String)
		{
			super(type);
		}
		
	}
}