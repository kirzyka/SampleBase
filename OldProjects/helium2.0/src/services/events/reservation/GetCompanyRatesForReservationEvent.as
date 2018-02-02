package services.events.reservation
{
	/**
	* The GetCompanyRatesForReservationEvent class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2010/02/08 $
	*
	*/	
	
	import services.cairngorm.BaseEvent;
	import services.vo.rates.companyRates.CompanyRatesRequestVO;
	
	public class GetCompanyRatesForReservationEvent extends BaseEvent
	{
		public static const NAME:String = "reservationGetCompanyRatesForReservationEvent";
		
		public var companyRequest:CompanyRatesRequestVO = new CompanyRatesRequestVO();
		
		public function GetCompanyRatesForReservationEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME,bubbles,cancelable);
		}

	}
}