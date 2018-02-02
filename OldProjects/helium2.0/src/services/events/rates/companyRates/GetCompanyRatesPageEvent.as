package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;
	import services.vo.rates.companyRates.CompanyRatesRequestVO;

	public class GetCompanyRatesPageEvent extends BaseEvent
	{
		public var requestCompany:CompanyRatesRequestVO = new CompanyRatesRequestVO();
		public var page:int = 0;
		public var count:int=10;
		
		
		public function GetCompanyRatesPageEvent(type:String)
		{
			super(type);
		}
		
	}
}