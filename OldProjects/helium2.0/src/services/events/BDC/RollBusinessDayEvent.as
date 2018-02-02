package services.events.BDC
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class RollBusinessDayEvent extends BaseEvent
	{
		
		public function RollBusinessDayEvent( )
		{
			super(AppController.BDC_ROLL_BUSINESS_DAY);
		}
	}
}