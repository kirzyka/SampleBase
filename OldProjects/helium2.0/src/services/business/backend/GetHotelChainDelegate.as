package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.GetHotelChainEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetHotelChainDelegate extends BaseDelegate
	{
		/**
		 *  GetHotelChain. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function GetHotelChainDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		/**
		 *  Remote call for get chains for system hotels.
		 *  
		 *  @param evt:GetHotelChainEvent
		 */
		public function getHotelChains(evt:GetHotelChainEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelChainList");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
	}
}