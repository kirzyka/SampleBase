package services.vo.inHouse
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapCheckOutReports")]
	public class CheckOutReportsVO extends MapValueObject
	{
		/**
		 *  This proeprty is id of account.
		 *  
		 *  @default 0
		 */
		public var lAccountId:Number = 0;
		/**
		 *  This property is URL to report.
		 */
		public var sReportName:String = "";
	}
}