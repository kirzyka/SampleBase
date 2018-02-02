package services.vo.reports
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapReportCorrectionsOfTheDay")]
	public class CorrectionsOfTheDayReportVO implements IValueObject
	{
		public var sDateFrom:String = '';
		public var aTransaction:Array = [];
		public var aCashier:Array = [];  
		public var aRoomType:Array = [];
		public var aRoom:Array = [];
		public var aTransactionGroup:Array = [];
		public var aTransactionSubGroup:Array = [];
		public var bNet:Boolean = false;
	}
}
