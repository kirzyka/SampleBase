package services.events.BDC
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class CheckShiftsEvent extends BaseEvent
	{
		
		public function CheckShiftsEvent( )
		{
			super(AppController.BDC_CHECK_SHIFTS);
		}
	}
}