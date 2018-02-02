package services.vo.reports
{
	[RemoteClass(alias="MapTransactionCodeSearch")]
	public class TransactionCodeReportVO
	{
		public var bShowLastYear:Boolean;
		public var aGroup:Array = new Array(); // list of ItemsGroupVO
		public var aSubGroup:Array = [];
		public var aTransactionCode:Array = [];
		public var bVAT:Boolean = false;// Net or Gross filter
	}
}
