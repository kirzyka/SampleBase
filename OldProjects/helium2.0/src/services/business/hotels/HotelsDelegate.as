package services.business.hotels
{
	import services.cairngorm.BaseDelegate;
	import services.events.hotels.AddFloorEvent;
	import services.events.hotels.AddRoomEvent;
	import services.events.hotels.AddRoomListEvent;
	import services.events.hotels.DeleteHotelEvent;
	import services.events.hotels.DeleteHotelRoomEvent;
	import services.events.hotels.DeleteHotelStageEvent;
	import services.events.hotels.GetHotelRoomSettingsEvent;
	import services.events.hotels.GetHotelRoomTypesEvent;
	import services.events.hotels.GetHotelStageListEvent;
	import services.events.hotels.GetHotelsListEvent;
	import services.events.hotels.GetRealRoomTypeListEvent;
	import services.events.hotels.SaveHotelRoomSettingsEvent;
	import services.events.hotels.SaveHotelRoomTypesEvent;
	import services.events.hotels.SetHotelFloorNameEvent;
	import services.events.hotels.UpdateHotelInfoEvent;
	import framework.module.CommonModule;
	import services.Services;

	import mx.rpc.AbstractOperation;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The HotelsDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 2.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class HotelsDelegate extends BaseDelegate
	{
		public static const GET_HOTELS_LIST:String = "getHotelList";
		public static const REMOVE_HOTEL:String = "deleteHotel";
		
		public function HotelsDelegate(responder:IResponder)
		{
			super(responder);
		}

		public function addFloor(evt:AddFloorEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelStage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelStage").send(CommonModule.userOptions, evt.stage);
		}


		public function addRoom(evt:AddRoomEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoom").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoom").send(CommonModule.userOptions, evt.room);
		}

		public function addRoomList(evt:AddRoomListEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomList").send(CommonModule.userOptions, evt.room, evt.firstNumber, evt.lastNumber, evt.increment);
		}

		public function deleteHotel(evt:DeleteHotelEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation(REMOVE_HOTEL);

			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}

		public function deleteHotelRoom(evt:DeleteHotelRoomEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("deleteHotelRoom").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("deleteHotelRoom").send(CommonModule.userOptions, evt.room);
		}

		public function deleteHotelStage(evt:DeleteHotelStageEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("deleteHotelStage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("deleteHotelStage").send(CommonModule.userOptions, model.hotelsModule.currStage.iStageId);
		}

		private function handleGetHotelRoomListResult(evt:ResultEvent):void
		{
			if(evt.result == null) this.responder.fault({});
			else this.responder.result(evt.result);

			(evt.target as AbstractOperation).removeEventListener(ResultEvent.RESULT, handleGetHotelRoomListResult);
			//service.getRemoteObject(GlobalStorage.SERVICE_SYSTEM_HOTEL).getOperation("getHotelList").removeEventListener(ResultEvent.RESULT, handleGetHotelRoomListResult);
		}
		
		public function getHotelRoomSettings(evt:GetHotelRoomSettingsEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelRoomSettingList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelRoomSettingList").send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}

		public function getHotelRoomTypes(evt:GetHotelRoomTypesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelRoomTypeList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelRoomTypeList").send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}

		public function getHotelsList(evt:GetHotelsListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation(GET_HOTELS_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}

		public function getHotelStageList(evt:GetHotelStageListEvent):void
		{
			if(model.hotelsModule.hotelTotalInfo.iHotelId > 0)
			{
				service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelStageList").addEventListener(ResultEvent.RESULT, handleResult);
				service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getHotelStageList").send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
			}
		}

		public function saveHotelRoomSettings(evt:SaveHotelRoomSettingsEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomSettingList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomSettingList").send(CommonModule.userOptions,
																												    model.hotelsModule.hotelTotalInfo.iHotelId,
																												    evt.ids);
		}

		public function saveHotelRoomTypes(evt:SaveHotelRoomTypesEvent, rtIds:Array):void
		{
		service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomTypeList").addEventListener(ResultEvent.RESULT, handleResult);
		service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelRoomTypeList").send(CommonModule.userOptions,
																												    model.hotelsModule.hotelTotalInfo.iHotelId,
																												    rtIds);
		}

		public function setFloorName(evt:SetHotelFloorNameEvent):void
		{
			evt.stage.aMapHotelRooms = new Array();
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelStage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotelStage").send(CommonModule.userOptions, evt.stage);
		}

		public function updateHotelInfo(evt:UpdateHotelInfoEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("saveHotel");
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, evt.hotelTotalInfo);
		}

		public function getRealRoomTypeList(evt:GetRealRoomTypeListEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getRealRoomTypeList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_HOTEL).getOperation("getRealRoomTypeList").send(CommonModule.userOptions, evt.iHotelId);
		}

	}
}