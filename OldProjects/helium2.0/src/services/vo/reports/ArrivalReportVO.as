package services.vo.reports
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapArrivalsSearch")]
	public class ArrivalReportVO implements IValueObject
	{
		public var iId:int = 0;
		public var sArrivalFrom:String = '';
		public var sArrivalTo:String = '';
		public var aRoomType:Array = new Array();
		public var aRateCode:Array = new Array();  
		public var aMarketCode:Array = new Array();
		public var aSourceCode:Array = new Array();
		public var aMembershipType:Array = new Array();
		public var aPreferences:Array = new Array();
		public var aColors:Array = new Array();
		
		//NEW////////////////////////////////////////
		public var iSortOrder:int;
  		public var bCheckIn:Boolean=false;            // Show checkin guests

	}
}
