package services.command.items.itemGroups
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.itemGroups.SaveSystemGroupEvent;
	import services.vo.items.ItemsGroupVO;
	
	import mx.collections.ArrayCollection;

	public class SaveSystemGroupCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveSystemGroupEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.saveSystemMainGroups(_event as SaveSystemGroupEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var item:ItemsGroupVO = data as ItemsGroupVO;
			var provider:ArrayCollection = model.transactionModule.systemGroupsList;
			
			var isNew:Boolean = true;
			// try search equal item for edit mode
			item.bIsGroup = true;
			for each(var itemGroup:ItemsGroupVO in provider)
			{
				if (item.lId == itemGroup.lId)
				{
					var index:int = provider.getItemIndex(itemGroup);
					provider.setItemAt(item, index);
					isNew = false;
					break;
				}
			}
			// add mode
			if (true == isNew)
			{
				provider.addItem(item);
			}
			
			super.result(data);
		}
	}
}