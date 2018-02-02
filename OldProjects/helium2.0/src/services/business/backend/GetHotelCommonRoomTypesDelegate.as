package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.GetHotelCommonRoomTypesEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetHotelCommonRoomTypesDelegate extends BaseDelegate
	{
		public function GetHotelCommonRoomTypesDelegate( _responder:IResponder )
		{
			super(_responder);
		}
		
		public function getHotelCommonRoomTypes(evt:GetHotelCommonRoomTypesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("getCommonRoomQualityList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("getCommonRoomQualityList").send(CommonModule.userOptions, evt.hotelIds);
		}
	}
}