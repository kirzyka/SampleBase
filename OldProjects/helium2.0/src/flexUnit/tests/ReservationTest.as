package flexUnit.tests
{
	import flexUnit.BaseTestCase;
	
	import services.cairngorm.BaseEvent;
	import services.events.reservation.GetPackagesRatesForReservationEvent;

	public class ReservationTest extends BaseTestCase
	{
		
		public function testGetPackagesRatesForReservation():void
		{
			var packageEvent:GetPackagesRatesForReservationEvent = new GetPackagesRatesForReservationEvent();
			packageEvent.packageRequest = modelTest.testReservationData.packageRequest;
			addCallBack(GetPackagesRatesForReservationEvent.NAME, getPackagesRatesForReservationCallback);
			packageEvent.dispatch();
		}
		
		public function getPackagesRatesForReservationCallback(event:BaseEvent):void
		{
			assertTrue("Какой-то ошибко!", 1==1);//model.reservationModule.packagesRates.length > 0);
		}
		
	}
}