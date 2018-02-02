package services.business.common
{
	import services.cairngorm.BaseDelegate;
	import services.events.common.GetVipHotelListEvent;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetVipHotelListDelegate extends BaseDelegate
	{
		/**
		 *  GetVipHotelListDelegate. Constructor.
		 *  
		 *  @param _responder:IResponder - contact provider for any service
		 */
		public function GetVipHotelListDelegate(_responder:IResponder)
		{
			super(_responder);
		}
		/**
		 *  Remote call for get list of total VIPs.
		 *  
		 *  @param evt:GetVipTotalListEvent
		 */
		public function getVIPHotelList(evt:GetVipHotelListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation("GetVipHotelList");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(GlobalStorage.userOptions);
		}
	}
}