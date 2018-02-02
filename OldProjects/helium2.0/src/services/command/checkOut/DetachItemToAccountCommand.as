package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.DetachItemsToAccountEvent;

	public class DetachItemToAccountCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DetachItemsToAccountEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.detachItemsToAccount(_event as DetachItemsToAccountEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}
	}
}