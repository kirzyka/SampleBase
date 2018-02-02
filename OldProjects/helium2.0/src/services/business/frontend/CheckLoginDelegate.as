package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.CheckLoginEvent;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class CheckLoginDelegate extends BaseDelegate
	{
		public function CheckLoginDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function checkLogin(evt:CheckLoginEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("GetForgottenQuestion");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(evt.login);
		}
	}
}