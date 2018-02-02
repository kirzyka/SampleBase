package services.events.BDC
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class CheckDepartureEvent extends BaseEvent
	{
		
		public function CheckDepartureEvent( )
		{
			super(AppController.BDC_CHECK_DEPARTURE);
		}
	}
}