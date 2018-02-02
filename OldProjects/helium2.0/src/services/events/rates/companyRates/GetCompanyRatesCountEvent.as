package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;
	import services.vo.rates.companyRates.CompanyRatesRequestVO;

	public class GetCompanyRatesCountEvent extends BaseEvent
	{
		
		public var requestCompany:CompanyRatesRequestVO = new CompanyRatesRequestVO();

		
		public function GetCompanyRatesCountEvent(type:String)
		{
			super(type);
		}
		
	}
}