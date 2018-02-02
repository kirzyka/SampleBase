package services.events.search
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	import services.vo.search.CancelationReason;

	public class CancelOrderEvent extends BaseEvent
	{
		public var orderId:int;
		public var reason:CancelationReason;

		public function CancelOrderEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.CANCEL_ORDER, bubbles, cancelable);
		}

	}
}