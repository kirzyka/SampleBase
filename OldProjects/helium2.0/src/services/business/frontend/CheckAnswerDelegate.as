package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.CheckAnswerEvent;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class CheckAnswerDelegate extends BaseDelegate
	{
		public function CheckAnswerDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function checkAnswer(evt:CheckAnswerEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("CheckForgottenAnswer");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(evt.login, evt.question, evt.answer);
		}
	}
}