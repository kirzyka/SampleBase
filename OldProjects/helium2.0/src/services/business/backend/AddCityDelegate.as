package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.AddCityEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class AddCityDelegate extends BaseDelegate
	{
		/**
		 *  AddCityDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function AddCityDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call for add new city.
		 *  
		 *  @param evt:
		 */
		public function addCity(event:AddCityEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_HELPER).getOperation("SaveCity");
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.city);
		}
	}
}