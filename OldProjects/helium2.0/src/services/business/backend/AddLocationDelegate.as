package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.AddLocationEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class AddLocationDelegate extends BaseDelegate
	{
		/**
		 *  AddLocationDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function AddLocationDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call for add new location.
		 *  
		 *  @param evt:GetHotelChainEvent
		 */
		public function addLocation(evt:AddLocationEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_HELPER).getOperation("addLocation");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, evt.location);
		}
	}
}