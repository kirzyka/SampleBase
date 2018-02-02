package services.business.reservation
{
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.SaveReservationEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class SaveReservationDelegate extends BaseDelegate
	{
				
		public function SaveReservationDelegate( _responder:IResponder )
		{
			super( _responder);
		}
		  
		public function saveReservation(evt:SaveReservationEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("executeCreate").addEventListener(ResultEvent.RESULT,handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("executeCreate").send(CommonModule.userOptions, evt.reservation);
		}
	}
}