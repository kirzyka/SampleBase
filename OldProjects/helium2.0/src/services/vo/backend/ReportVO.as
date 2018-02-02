package services.vo.backend
{
	[RemoteClass(alias="MapReport")]
	public class ReportVO
	{
		//public $iId = 0;
		public var iHotelId:int = 0;
		public var sDateReport:String = '';
		public var iReportType:int = 0;
		public var oReportParameters:Object = null;  

	}
}
