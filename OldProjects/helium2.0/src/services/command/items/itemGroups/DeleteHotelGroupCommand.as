package services.command.items.itemGroups
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.itemGroups.DeleteHotelGroupEvent;

	public class DeleteHotelGroupCommand extends BaseCommand 
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteHotelGroupEvent(event);
			
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.deleteHotelMainGroup(_event as DeleteHotelGroupEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if (Boolean(data))
			{
				model.transactionModule.hotelGroupsList.removeItemAt((_event as DeleteHotelGroupEvent).groupIndex);
			}
			
			super.result(data);
		}
	}
}