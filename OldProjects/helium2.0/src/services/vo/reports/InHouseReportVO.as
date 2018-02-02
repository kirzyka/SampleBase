package services.vo.reports
{
	[RemoteClass(alias="MapGuestINHSearch")]
	public class InHouseReportVO
	{
		public var iId:int = 0;
		/**
		 * Array room types
		 * @var Array
		 */ 
		public var aRoomType:Array = new Array();
		public var aPaymentMethod:Array = new Array();
		public var aMembershipType:Array = new Array();
		public var iVip:int = 0;
		/*
	   * 1 - Departure only
	   * 2 - Stayover only
	   * 3 - All
	   */
	  	public var iCheckStatus:int = 3;
	}
}
