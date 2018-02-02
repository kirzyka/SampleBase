package services.vo.invoiceManagment
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapInvoiceFileSearch")]
	[Bindable]
	public class InvoiceFileSearchVO implements IValueObject
	{
	    public var iHotelId:int = 0;
	    public var aInvoiceNumbers:Array;
	    //public var aDebitorNumber:Array;
	    //public var aDebitorShowNumber:Array;
	    public var sUrlDate:String = "";
	    //public var iPlnNumber:int = 0;
    
	}
}