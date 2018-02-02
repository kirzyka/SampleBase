package services.command.search
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.search.SearchDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.search.CancelOrderEvent;

	public class CancelOrderCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = event as CancelOrderEvent;
			var delegate:SearchDelegate = new SearchDelegate( this );
			delegate.cancelOrder(event as CancelOrderEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{

			super.result(data);
		}

	}
}