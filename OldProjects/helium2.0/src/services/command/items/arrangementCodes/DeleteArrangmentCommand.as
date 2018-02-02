package services.command.items.arrangementCodes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.arrangementCodes.DeleteArrangementEvent;

	public class DeleteArrangmentCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteArrangementEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			
			delegate.removeArrangement(_event as DeleteArrangementEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if (Boolean(data))
			{
				model.transactionModule.arrangementCodesList.removeItemAt((_event as DeleteArrangementEvent).codeIndex);
			} 
			
			super.result(data);
		}
	}
}