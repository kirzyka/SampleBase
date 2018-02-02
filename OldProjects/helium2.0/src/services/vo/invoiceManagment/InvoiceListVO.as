package services.vo.invoiceManagment
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapInvoiceList")]
	[Bindable]
	public class InvoiceListVO implements IValueObject
	{
		public var sArrivalDate:String = "";
		public var sDepartureDate:String = "";
		public var sConfirmationCode:String = "";
		public var sGuestName:String = "";
		public var sCompanyName:String = "";
		public var aInvoiceNumbers:Array;
		//public var aDebitorNumber:Array;
		//public var aDebitorShowNumber:Array;
		public var sUrl:String = "";
		
		//public var iPlnNumber:int = 0;
		public var iPrsId:int = 0;
	}
}