package services.command.search
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.search.SearchDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.search.GetCancelationReasonsEvent;

	import mx.collections.ArrayCollection;

	public class GetCancelationReasonsCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = event as GetCancelationReasonsEvent;
			var delegate:SearchDelegate = new SearchDelegate( this );
			delegate.getCancelationReasons(event as GetCancelationReasonsEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.reservationEditModule.reservationCanceletionReasons = new ArrayCollection(data as Array);//CancelationReason
			super.result(data);
		}
	}
}