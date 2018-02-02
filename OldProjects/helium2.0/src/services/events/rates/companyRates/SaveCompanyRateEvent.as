package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;
	import services.vo.rates.companyRates.CompanyRateGroupVO;

	public class SaveCompanyRateEvent extends BaseEvent
	{
		public var companyRate:CompanyRateGroupVO = new CompanyRateGroupVO();
		
		public function SaveCompanyRateEvent(type:String)
		{
			super(type);
		}
		
	}
}