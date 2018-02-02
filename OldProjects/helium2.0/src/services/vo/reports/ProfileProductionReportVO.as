package services.vo.reports
{
	[RemoteClass(alias="MapProductionProfile")]
	public class ProfileProductionReportVO
	{
		public var bIsShowDetail:Boolean = false;
	    public var sGuestName:String = "";
	    public var sGuestSurName:String = "";

		public var sArrivalFrom:String = '';
		public var sArrivalTo:String = '';
		
		public var bIsShowCompany:Boolean = false; // company or individual
  		public var sCompanyName:String  = "";
	}
}