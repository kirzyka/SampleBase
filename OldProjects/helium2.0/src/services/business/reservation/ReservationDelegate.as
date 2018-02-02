package services.business.reservation
{
	import framework.module.CommonModule;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import services.Services;
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.GetOrderFutureInfoEvent;
	import services.events.reservation.SaveGroupReservationEvent;

	public class ReservationDelegate extends BaseDelegate
	{
		
		public static const GET_ORDER_FUTURE_INFO:String = "getOrderFutureInfo";
		public static const SAVE_GROUP_RESERVATION:String = "saveGroupReservation";
		
		public function ReservationDelegate(_responder:IResponder)
		{
			super(_responder);
		}

		public function getOrderFutureInfo(event:GetOrderFutureInfoEvent):void 
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation(GET_ORDER_FUTURE_INFO).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation(GET_ORDER_FUTURE_INFO).send(	CommonModule.userOptions,
																											event.hotelId,
																											event.orderId,
																											event.sDateStart,
																											event.sDateEnd);
		}
		
		public function saveGroupReservation(event:SaveGroupReservationEvent):void 	
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation(SAVE_GROUP_RESERVATION).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation(SAVE_GROUP_RESERVATION).send(CommonModule.userOptions,
																											event.oMapGroupReservation);			
		}
		
	
	}
}