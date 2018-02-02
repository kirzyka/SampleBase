package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.GetRoomListByOrderEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetRoomListByOrderDelegate extends BaseDelegate
	{
		public function GetRoomListByOrderDelegate( responder:IResponder )
		{
			super( responder ); 
		}
		  
		public function getRoomList(evt:GetRoomListByOrderEvent):void
		{
			service.getRemoteObject(Services.SERVICE_CHECK_IN).getOperation("executeUpdateGrid").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_CHECK_IN).getOperation("executeUpdateGrid").send(CommonModule.userOptions,
																											model.hotelsModule.hotelTotalInfo.iHotelId,
																											evt.startDate,
																											evt.endDate,
																											evt.aRoomSettings,
																											evt.iRoomType,
																											evt.idStage);
		}

	}
}