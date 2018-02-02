package services.events.invoiceManagment
{
	import services.cairngorm.BaseEvent;
	import services.vo.invoiceManagment.InvoiceSearchVO;

	public class GetInvoiceListEvent extends BaseEvent
	{
		public static const NAME:String = "GetInvoiceListEvent";
		
		public function GetInvoiceListEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
		public var invoiceSearch:InvoiceSearchVO = new InvoiceSearchVO();
		
	}
}