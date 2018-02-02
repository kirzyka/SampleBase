package services.business.reservation
{
	import services.cairngorm.BaseDelegate;
	import services.events.reservation.GetCompanyRatesForReservationEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetCompanyRatesForReservationDelegate extends BaseDelegate
	{
		public function GetCompanyRatesForReservationDelegate(_responder:IResponder)
		{
			super(_responder);
		}
		
		public function getCompanyRatesForReservation(event:GetCompanyRatesForReservationEvent):void {
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesForRsv").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesForRsv").send(CommonModule.userOptions,event.companyRequest);
		}
	}
}