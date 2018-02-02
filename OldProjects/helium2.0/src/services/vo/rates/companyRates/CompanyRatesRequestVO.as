package services.vo.rates.companyRates
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="MapCompanyRatesRequest")]
	[Bindable]
	public class CompanyRatesRequestVO
	{
		public var iCompanyId:Number;
  		public var iRoomQualityId:Number;
  		public var aHotelIds:Array = [];

  		public var sDateFrom:String = '';
  		public var sDateTo:String = '';
	}

}