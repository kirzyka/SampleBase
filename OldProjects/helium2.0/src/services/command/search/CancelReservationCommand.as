package services.command.search
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.search.SearchDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.search.CancelReservationEvent;

	public class CancelReservationCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = event as CancelReservationEvent;
			var delegate:SearchDelegate = new SearchDelegate( this );
			delegate.cancelReservation(event as CancelReservationEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			super.result(data);
		}

	}
}