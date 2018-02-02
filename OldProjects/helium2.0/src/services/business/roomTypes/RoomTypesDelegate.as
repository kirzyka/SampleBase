package services.business.roomTypes
{
	import services.cairngorm.BaseDelegate;
	import services.events.roomTypes.AddBedTypeEvent;
	import services.events.roomTypes.AddRoomTypeEvent;
	import services.events.roomTypes.DeleteBedTypeEvent;
	import services.events.roomTypes.DeleteRoomQualityEvent;
	import services.events.roomTypes.DeleteRoomTypeEvent;
	import services.events.roomTypes.EditRoomTypeEvent;
	import services.events.roomTypes.GetBedTypesListEvent;
	import services.events.roomTypes.SetRoomTypeCapacityEvent;
	import services.events.roomTypes.SetRoomTypeDescriptionEvent;
	import services.events.roomTypes.SetRoomTypeShortNameEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The RoomTypesDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 2.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class RoomTypesDelegate extends BaseDelegate
	{
		public function RoomTypesDelegate(responder:IResponder)
		{
			super(responder);
		}

		public function addBedType(evt:AddBedTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("AddBedType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("AddBedType").send(CommonModule.userOptions, evt.bedType);
		}
		
		public function addRoomType(evt:AddRoomTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("AddRoomType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("AddRoomType").send(CommonModule.userOptions, evt.roomType);
		}
		
		public function deleteRoomType(evt:DeleteRoomTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteRoomType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteRoomType").send(CommonModule.userOptions, evt.roomType);
		}
		
		public function deleteBedType(evt:DeleteBedTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteBedType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteBedType").send(CommonModule.userOptions, evt.bedTypes);
		}
		
		public function deleteRoomQuality(evt:DeleteRoomQualityEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteRoomQuality").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("DeleteRoomQuality").send(CommonModule.userOptions, evt.roomQuality);
		}
		
		public function setRoomTypeCapacity(evt:SetRoomTypeCapacityEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeCapacity").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeCapacity").send(CommonModule.userOptions, evt.roomTypeId, evt.capacity);
		}
		
		public function setRoomTypeDescription(evt:SetRoomTypeDescriptionEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeDescription").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeDescription").send(CommonModule.userOptions, evt.roomTypeId, evt.description);
		}
		
		public function setRoomTypeShortName(evt:SetRoomTypeShortNameEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeShortName").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("SetRoomTypeShortName").send(CommonModule.userOptions, evt.roomTypeId, evt.shortName);
		}
		
		public function editRoomType(evt:EditRoomTypeEvent):void
		{			
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("EditRoomType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("EditRoomType").send(CommonModule.userOptions, evt.roomType);
		}
		
		public function getBedTypesList(evt:GetBedTypesListEvent):void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("GetBedTypesList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("GetBedTypesList").send(CommonModule.userOptions);
		}	
		
		public function getRoomTypesData():void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("GetRoomTypesList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("GetRoomTypesList").send(CommonModule.userOptions);
		}
		
		public function getPage():void
		{
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("getPage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_ROOM_TYPES).getOperation("getPage").send(CommonModule.userOptions);
		}
	}
}