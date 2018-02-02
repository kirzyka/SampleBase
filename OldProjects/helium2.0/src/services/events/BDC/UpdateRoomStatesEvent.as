package services.events.BDC
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class UpdateRoomStatesEvent extends BaseEvent
	{
		
		public function UpdateRoomStatesEvent( )
		{
			super(AppController.BDC_UPDATE_ROOM_STATES);
		}
	}
}