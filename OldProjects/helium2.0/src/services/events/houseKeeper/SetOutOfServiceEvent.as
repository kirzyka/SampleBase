package services.events.houseKeeper
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class SetOutOfServiceEvent extends BaseEvent
	{
		public var aRoomList:Array = [];
		public var sDateFrom:String;
		public var sDateTo:String;

		public function SetOutOfServiceEvent( )
		{
			super(AppController.HOUSEKEEPING_SET_OUT_OF_SERVICE_EVENT);
		}

	}
}
