package services.business.frontend
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import services.events.frontend.GetCardOfEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetCardOfDelegate
	{
		private var responder:IResponder;
		private var service:ServiceLocator = ServiceLocator.getInstance();
		
		public function GetCardOfDelegate( _responder:IResponder )
		{
			responder = _responder;
		}
		
		public function getCardOf(evt:GetCardOfEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardCategoryList").addEventListener(ResultEvent.RESULT, handleGetCardOfResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardCategoryList").send(CommonModule.userOptions); // GlobalStorage скорее всего Reservation
		}
		
		private function handleGetCardOfResult(evt:ResultEvent):void
		{
			if(evt.result == null) this.responder.fault({});
			else this.responder.result(evt.result);
			
			service.getRemoteObject(Services.SERVICE_SYSTEM_CONSTANT).getOperation("GetCardCategoryList").removeEventListener(ResultEvent.RESULT, handleGetCardOfResult);
		} 

	}
}