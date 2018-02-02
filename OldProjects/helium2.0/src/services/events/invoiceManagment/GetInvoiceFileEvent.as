package services.events.invoiceManagment
{
	import services.cairngorm.BaseEvent;
	import services.vo.invoiceManagment.InvoiceFileSearchVO;

	public class GetInvoiceFileEvent extends BaseEvent
	{
		public static const NAME:String = "GetInvoiceFileEvent";
		
		public function GetInvoiceFileEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}
		
		public var invoiceFileSearch:InvoiceFileSearchVO = new InvoiceFileSearchVO();
	}
}