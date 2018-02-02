package framework.module
{
	import services.vo.rates.companyRates.CompanyRateGroupVO;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class RatesModule
	{
		public var barModule:BARModule = new BARModule();
		
		public var currPage:int = 0;		
		
		public var countCompanyRates:int = 0;
		
		public var currentRate:CompanyRateGroupVO = new CompanyRateGroupVO();

		public var ratesData:ArrayCollection = new ArrayCollection();
		
		public var transactionListforAdd: ArrayCollection = new ArrayCollection(); // list of CompanyRateSysItemVO
		
		public var currentTransactionList:ArrayCollection = new ArrayCollection(); // list of CompanyRateItemVO

	}
}