package services.business.reservation
{
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.GetGuestListForReservationEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetGuestListDelegate extends BaseDelegate
	{
		public function GetGuestListDelegate(_responder:IResponder)
		{
			super(_responder);
		}



		public function getGuestList(event:GetGuestListForReservationEvent):void {
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getGuestList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getGuestList").send(CommonModule.userOptions,event.rsvId);
		}
		
	}
}