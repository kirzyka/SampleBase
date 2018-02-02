package services.business.invoiceManagment
{
	import services.cairngorm.BaseDelegate;
	import services.events.invoiceManagment.GetInvoiceFileEvent;
	import services.events.invoiceManagment.GetInvoiceListEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class InvoiceManagmentDelegate extends BaseDelegate
	{
		public function InvoiceManagmentDelegate(responder:IResponder)
		{
			super(responder);
		}

		public function getInvoiceList(event:GetInvoiceListEvent):void
		{
			service.getRemoteObject(Services.SERVICE_INVOICE_MANAGMENT).getOperation("getInvoiceList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_INVOICE_MANAGMENT).getOperation("getInvoiceList").send(CommonModule.userOptions,event.invoiceSearch);
		}
		
		public function getInvoiceFile(event:GetInvoiceFileEvent):void
		{
			service.getRemoteObject(Services.SERVICE_INVOICE_MANAGMENT).getOperation("getInvoiceFile").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_INVOICE_MANAGMENT).getOperation("getInvoiceFile").send(CommonModule.userOptions,event.invoiceFileSearch);
		}		
		
	}
}