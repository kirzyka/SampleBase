package services.business.BDC
{
	import services.cairngorm.BaseDelegate;
	import services.events.BDC.CheckDepartureEvent;
	import services.events.BDC.CheckProfilesEvent;
	import services.events.BDC.CheckShiftsEvent;
	import services.events.BDC.GetAnnomalyPersonEvent;
	import services.events.BDC.PostTransactionsEvent;
	import services.events.BDC.RollBusinessDayEvent;
	import services.events.BDC.TotalLogoutEvent;
	import services.events.BDC.UpdateRoomStatesEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The PackageDelegate class is
	*
	* @author Viktor Potapov / Ramada
	* @version $Revision 1.1 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class BDCDelegate extends BaseDelegate
	{
		public function BDCDelegate(responder:IResponder)
		{
			super(responder);
		}

		public function checkProfiles(event:CheckProfilesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkProfiles").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkProfiles").send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}
		
		public function checkShifts(event:CheckShiftsEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkShifts").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkShifts").send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}

		public function postTransactions(event:PostTransactionsEvent ):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("postTransactions").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("postTransactions").send(CommonModule.userOptions);
		}

		public function rollBusinessDay(event:RollBusinessDayEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("rollBusinessDay").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("rollBusinessDay").send(CommonModule.userOptions);
		}
		
		public function getAnnomalyPerson(event:GetAnnomalyPersonEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("getAnnomalies").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("getAnnomalies").send(CommonModule.userOptions, event.sDate );
		}
		
		public function totalLogout(event:TotalLogoutEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("totalLogout").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("totalLogout").send(CommonModule.userOptions);
		}
		
		public function checkDeparture(event:CheckDepartureEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkDeparture").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("checkDeparture").send(CommonModule.userOptions);
		}
		
		public function updateRoomStates(event:UpdateRoomStatesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("updateRoomStates").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_BUSINESS_DAY).getOperation("updateRoomStates").send(CommonModule.userOptions);
		}
	}
}