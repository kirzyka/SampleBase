package services.vo.common
{
	[RemoteClass(alias="MapMarketCode")]
	public class MarketCodesVO
	{
		public var iId:Number;
		public var sName:String;
		public var iMarketGroupId:Number;
		public var iDescription:Number;
		public var sDescription:String;
		
		public var oMarketGroup:MarketCodesGroupVO = new MarketCodesGroupVO();
		
		[Transient] //for interface
		public var bIsSelected:Boolean = false;
	}
}
