package services.events.cashShift
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class StartNewBusinessDayEvent extends BaseEvent
	{
		public var hotelId:int;
		
		public function StartNewBusinessDayEvent( )
		{
			super(AppController.CASHSHIFT_START_NEW_BUSINESS_DAY);
		}
	}
}