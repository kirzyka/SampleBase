package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ConfirmFirstLoginDelegate extends BaseDelegate
	{
		public function ConfirmFirstLoginDelegate( _responder:IResponder )
		{
			super(_responder);
		}
		
		public function confirmFirstLogin():void
		{
			operation = service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("FillInUserProfile");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(model.currentUser.cLogInUser, CommonModule.userOptions.sUserCode);
			//operation.send(model.currentUser.cLogInUser, GlobalStorage.sessionToken);
		}
	}
}