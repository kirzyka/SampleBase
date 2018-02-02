package services.business.backend
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import services.events.backend.GetReportEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetReportDelegate
	{
		private var responder:IResponder;
		private var service:ServiceLocator = ServiceLocator.getInstance();;
		
		public function GetReportDelegate( _responder:IResponder )
		{
			responder = _responder; 
		}
		
		public function getArrivalReport(evt:GetReportEvent):void
		{
			service.getRemoteObject(Services.SERVICE_REPORTS).getOperation("executeCreate").addEventListener(ResultEvent.RESULT, handleGetArrivalReportResult);
			service.getRemoteObject(Services.SERVICE_REPORTS).getOperation("executeCreate").send(CommonModule.userOptions, evt.report);
		}
		
		private function handleGetArrivalReportResult(evt:ResultEvent):void
		{
			if(evt.result == null) this.responder.fault({});
			else this.responder.result(evt.result);
			
			(evt.target as AbstractOperation).removeEventListener(ResultEvent.RESULT, handleGetArrivalReportResult);
			//service.getRemoteObject(GlobalSettings.SERVICE_REPORTS).getOperation("executeCreate").removeEventListener(ResultEvent.RESULT, handleGetArrivalReportResult);
		}

	}
}