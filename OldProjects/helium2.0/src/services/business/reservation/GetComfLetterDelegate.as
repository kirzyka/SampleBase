package services.business.reservation
{
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.GetComfLetterEvent;
	import services.events.reservation.GetPdfUrlFromHtmlEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetComfLetterDelegate extends BaseDelegate
	{
		public function GetComfLetterDelegate(_responder:IResponder)
		{
			super(_responder);
		}

		public function getComfLetter(event:GetComfLetterEvent):void {
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getComfLetter").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getComfLetter").send(CommonModule.userOptions,event.rsvId, event.prsId);
		}	
		
		public function getPdfUrlFromHtml(event:GetPdfUrlFromHtmlEvent):void {
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getPdfUrlFromHtml").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getPdfUrlFromHtml").send(CommonModule.userOptions, event.html, event.rsvId);			
		}	
	}
}