package services.vo.rates.companyRates
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="MapCompanyRate")]//////////////////AAAAAAAAAAAAAAAAAAAAAAAAAAA ZAMENA
	[Bindable]
	public class CompanyRateObjectVO
	{
	  public var iRateId:int = 0; // id quality
	  public var iCompanyId:int;
	  public var aHotelIds:Array;
	  public var iRoomQualityId:int;
	  public var sDateFrom:String = "1985-10-22";
	  public var sDateTo:String = "1985-10-22";
	  public var sName:String;
	  public var fPriceOneAdult:Number;
	  public var fPriceTwoAdults:Number;
	  public var fPriceExtraAdult:Number; 
	  //public var aPricesForRoomTypes:Array = []; //include arrays of fPriceOneAdult, fPriceTwoAdults, fPriceExtraAdult for each room type
	  public var bBreakfastIncluded:Boolean;
	  public var fBreakfastPrice:Number;
	  public var sCompanyName:String;
	  [Transient]
	  public var bIsSelected:Boolean = false;
	  
	 
	  
	}
	
}