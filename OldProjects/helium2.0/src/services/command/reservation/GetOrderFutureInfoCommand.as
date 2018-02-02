package services.command.reservation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.reservation.ReservationDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.reservation.GetOrderFutureInfoEvent;
	
	public class GetOrderFutureInfoCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetOrderFutureInfoEvent(event);
			var delegate:ReservationDelegate = new ReservationDelegate(this);
			delegate.getOrderFutureInfo(_event as GetOrderFutureInfoEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			super.result(data);
		}
	}
}