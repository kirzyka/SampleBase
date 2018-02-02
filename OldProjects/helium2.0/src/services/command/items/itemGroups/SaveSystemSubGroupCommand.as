package services.command.items.itemGroups
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.itemGroups.SaveSystemSubGroupEvent;
	import services.vo.items.ItemsGroupVO;

	public class SaveSystemSubGroupCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveSystemSubGroupEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.saveSystemSubGroup(_event as SaveSystemSubGroupEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var item:ItemsGroupVO = data as ItemsGroupVO;
			var groupId:int = (_event as SaveSystemSubGroupEvent).groupId;
			var systemGroupsList:ArrayCollection = model.transactionModule.systemGroupsList;
			
			for each(var group:ItemsGroupVO in systemGroupsList)
			{
				if (groupId == group.lId)
				{
					// check possible create empty sub groups
					if (null == group.aSubGroups)
					{
						group.aSubGroups = [];
					}
					// find sub item into main item
					var isNew:Boolean = true;
					for each(var subgroup:ItemsGroupVO in group.aSubGroups)
					{
						if (item.lId == subgroup.lId)
						{
							// update statement of saving mode
							isNew = false;
							// update item by edit mode
							var index:int = group.aSubGroups.indexOf(subgroup);
							group.aSubGroups[index] = item;
							break;
						}
					}
					// check update item by add mode
					if (true == isNew)
					{
						group.aSubGroups.push(item);
					}
					break;
				}
			}
			
//			systemGroupsList.setItemAt(group, (_event as SaveSystemSubGroupEvent).groupIndex);
			systemGroupsList.refresh();
			
			super.result(data);
		}
	}
}