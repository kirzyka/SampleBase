package services.business.search
{
	import services.cairngorm.BaseDelegate;
	import services.events.search.CancelOrderEvent;
	import services.events.search.CancelReservationEvent;
	import services.events.search.ExecuteSearchEvent;
	import services.events.search.GetCancelationReasonsEvent;
	import services.events.search.GetReservationByIdEvent;
	import framework.module.CommonModule;
	import services.Services;

	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The PackageDelegate class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SearchDelegate extends BaseDelegate
	{
		public function SearchDelegate(responder:IResponder)
		{
			super(responder);
		}


		public function executeSearch(event:ExecuteSearchEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("executeSearch").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("executeSearch").send(CommonModule.userOptions,event.rsvSearchReqest);
		}

		public function getReservationById(event:GetReservationByIdEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getReservationById").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION).getOperation("getReservationById").send(CommonModule.userOptions,event.reservationId);
		}

		public function getCancelationReasons(event:GetCancelationReasonsEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("getCnlReasons").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("getCnlReasons").send(CommonModule.userOptions);
		}

		public function cancelOrder(event:CancelOrderEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("cancel").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("cancel").send(CommonModule.userOptions,event.orderId, event.reason);
		}

		public function cancelReservation(event:CancelReservationEvent):void
		{
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("cancelReservation").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_RESERVATION_SEARCH).getOperation("cancelReservation").send(CommonModule.userOptions,event.reservationId, event.reason);
		}


	}
}