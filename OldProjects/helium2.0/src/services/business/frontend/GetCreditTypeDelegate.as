package services.business.frontend
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import services.events.frontend.GetCreditTypeEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetCreditTypeDelegate
	{
		private var responder:IResponder;
		private var service:ServiceLocator = ServiceLocator.getInstance();
		
		public function GetCreditTypeDelegate( _responder:IResponder )
		{
			responder = _responder;
		}
		
		public function getCrediteType(evt:GetCreditTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardList").addEventListener(ResultEvent.RESULT, handleGetCreditTypeResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardList").send(CommonModule.userOptions); // GlobalStorage скорее всего Reservation
		}
		
		private function handleGetCreditTypeResult(evt:ResultEvent):void
		{
			if(evt.result == null) this.responder.fault({});
			else this.responder.result(evt.result);
			
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardList").removeEventListener(ResultEvent.RESULT, handleGetCreditTypeResult);
		} 

	}
}