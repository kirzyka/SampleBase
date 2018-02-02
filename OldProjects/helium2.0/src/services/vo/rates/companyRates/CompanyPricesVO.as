package services.vo.rates.companyRates
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="MapCompanyPrices")]
	[Bindable]
	public class CompanyPricesVO
	{
	  public var iRoomQualityId:int;
	  public var fPriceOneAdult:Number = 0;
	  public var fPriceTwoAdults:Number = 0;
	  public var fPriceExtraAdult:Number = 0;
	  public var bInclude:Boolean = false;
	}
	
}