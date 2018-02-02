package services.vo.rates.packages
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="MapPackagePrices")]
	[Bindable]
	public class PackagePricesVO
	{
	  public var iRoomQualityId:int;
	  public var fPriceOneAdult:Number = 0;
	  public var fPriceTwoAdults:Number = 0;
	  public var fPriceExtraAdult:Number = 0;
	  public var fPriceChildAbove:Number = 0;
	  public var fPriceChildMiddle:Number = 0;
	  public var fPriceChildBelow:Number = 0;
	  public var bInclude:Boolean = false;
	}
	
}