package services.vo.rates.bar
{

	[RemoteClass(alias="MapHotelBARPrice")]
	[Bindable]
	public class BARItemPricesObjectVO
	{
		public var iRQualityId:int = 0;
		public var sRQualityName:String = "";
		public var fPriceOneAdult:Number = 0;
		public var fPriceTwoAdults:Number = 0;
		public var fPriceExtraAdult:Number = 0;
		public var fPriceChildAbove:Number = 0;
		public var fPriceChildMiddle:Number = 0;
		public var fPriceChildBefore:Number = 0;
		public var bIsMarkup:Boolean = false;
		public var iMarkupRQualityId:int = 0;
		public var iMarkupDelta:int = 0;
	}
}
