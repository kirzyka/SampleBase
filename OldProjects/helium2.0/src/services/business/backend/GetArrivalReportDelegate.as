package services.business.backend
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import framework.module.CommonModule;
	import services.vo.GlobalSettings;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetArrivalReportDelegate
	{
		private var responder:IResponder;
		private var service:ServiceLocator = ServiceLocator.getInstance();;
		
		public function GetArrivalReportDelegate( _responder:IResponder )
		{
			responder = _responder;
		}
		
		public function getArrivalReport(evt:GetArrivalReportEvent):void
		{
			service.getRemoteObject(GlobalSettings.SERVICE_REPORTS).getOperation("executeCreate").addEventListener(ResultEvent.RESULT, handleGetArrivalReportResult);
			service.getRemoteObject(GlobalSettings.SERVICE_REPORTS).getOperation("executeCreate").send(CommonModule.userOptions, evt.report);
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