package services.events.search
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetCancelationReasonsEvent extends BaseEvent
	{
		public function GetCancelationReasonsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.GET_CANCELATION_REASONS, bubbles, cancelable);
		}

	}
}