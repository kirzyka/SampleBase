package services.business.reservation
{
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.GetReservationCaledarDataEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetReservationCaledarDataDelegate extends BaseDelegate
	{
		public function GetReservationCaledarDataDelegate( _responder:IResponder )
		{
			super(_responder);
		}
		
		public function getReservationCaledarData(event:GetReservationCaledarDataEvent):void
		{
			service.getRemoteObject(Services.SERVICE_CALENDAR).getOperation("ExecuteExploreCalendar").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_CALENDAR).getOperation("ExecuteExploreCalendar").send(CommonModule.userOptions, event.startDate,model.hotelsModule.hotelTotalInfo.iHotelId);
		}
	}
}