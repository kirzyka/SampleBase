package services.business.common
{
	import services.cairngorm.BaseDelegate;
	import services.events.common.GetSourceCodesEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetSourceCodesDelegate extends BaseDelegate
	{
		public function GetSourceCodesDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function getSourceCode(evt:GetSourceCodesEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getSourceCodeList")
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
	}
}