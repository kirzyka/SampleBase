package services.business.checkIn
{
	import services.cairngorm.BaseDelegate;
	import services.events.checkIn.SetAssignCheckInDataEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class SetAssignCheckInDataDelegate extends BaseDelegate
	{	public function SetAssignCheckInDataDelegate( _responder:IResponder )
		{
			super (_responder);
		}
		  
		public function setAssign(evt:SetAssignCheckInDataEvent):void
		{
			service.getRemoteObject(Services.SERVICE_CHECK_IN).getOperation("executeAssign").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_CHECK_IN).getOperation("executeAssign").send(CommonModule.userOptions, 
																									   model.hotelsModule.hotelTotalInfo.iHotelId,
																									   evt.profileId,
																									   evt.orderId,
																									   evt.roomId,
																									   evt.yieldMode);
		}
		
		
	}
}