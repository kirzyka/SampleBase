package services.command.items.itemGroups
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.itemGroups.DeleteSystemGroupEvent;

	public class DeleteSystemGroupCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteSystemGroupEvent(event);
			
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.deleteSystemMainGroup(_event as DeleteSystemGroupEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if (Boolean(data))
			{
				model.transactionModule.systemGroupsList.removeItemAt((_event as DeleteSystemGroupEvent).groupIndex);
			}
			
			super.result(data);
		}
	}
}