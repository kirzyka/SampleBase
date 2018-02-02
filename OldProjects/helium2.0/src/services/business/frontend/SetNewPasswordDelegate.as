package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.SetNewPasswordEvent;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class SetNewPasswordDelegate extends BaseDelegate
	{
		public function SetNewPasswordDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function setNewPassword(evt:SetNewPasswordEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("SetNewUserPassword");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(evt.login, evt.question, evt.answer, evt.password);
		}
	}
}