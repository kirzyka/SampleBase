package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.Dictionary;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.MergeItemsEvent;
	import framework.view.pages.checkOut.control.AttachedItemsToAccountView;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;
	
	import mx.collections.ArrayCollection;

	public class MergeItemsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = MergeItemsEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.mergeItems(_event as MergeItemsEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var i:int = 0;
			var item:ItemCheckOutVO;
			var indeces:Array = (_event as MergeItemsEvent).selectedIndexes;
			var items:Array = (_event as MergeItemsEvent).selectedItems;
			var attachedItemsView:Dictionary = model.checkOutModule.attachedItemsView;
				
			// Check place where the function was called. If the function
			// is called from the collection of all routing items, simply
			// replace it in the collection, but if one of attached view
			// with the items attached to the account, have to make the
			// replace this item in the main and in the attached collections.
			if ((_event as MergeItemsEvent).isAttached)
			{
				var attachedView:AttachedItemsToAccountView = attachedItemsView[(_event as MergeItemsEvent).attachedId] as AttachedItemsToAccountView;
				if (attachedView)
				{
					var len:int = attachedView.dataProvider.length;
					for each(var mergeItem:ItemCheckOutVO in items)
					{
						for(i = 0; i < len; i++)
						{
							item = attachedView.dataProvider.getItemAt(i) as ItemCheckOutVO;
							if (item.lId == mergeItem.lId)
							{
								attachedView.dataProvider.removeItemAt(i);
								i--; len--;
							}
						}
					}
					attachedView.dataProvider.addItem(data as ItemCheckOutVO);
					attachedView.dataProvider.refresh();
				}
				// find item in the main collection of routing items.
				var oldItem:ItemCheckOutVO;
				var routingItems:ArrayCollection = model.checkOutModule.routingItems;
				for(i = 0; i < routingItems.length; i++)
				{
					item = routingItems.getItemAt(i) as ItemCheckOutVO;
					for each(var mergedItem:ItemCheckOutVO in items)
					{
						if (item.lId == mergedItem.lId)
						{
							routingItems.removeItemAt(i);
							oldItem = item.clone() as ItemCheckOutVO;
							oldItem.bIsChecked = item.bIsChecked;
							oldItem.bIsSelected = item.bIsSelected;
							i--;
							break;
						}
					}
				}
				
				var newItem:ItemCheckOutVO = data as ItemCheckOutVO; 
				newItem.bIsChecked = oldItem.bIsChecked;
				newItem.bIsSelected = oldItem.bIsSelected;
				routingItems.addItem(newItem);
			}
			else
			{
				for each(item in items)
				{
					for(i = 0; i < model.checkOutModule.routingItems.length; i++)
					{
						var routedItem:ItemCheckOutVO = model.checkOutModule.routingItems.getItemAt(i) as ItemCheckOutVO;
						if (item.lId == routedItem.lId)
						{
							model.checkOutModule.routingItems.removeItemAt(i);
							break;
						}
					}
				}
				
				model.checkOutModule.routingItems.addItem(data as ItemCheckOutVO);
			}
			
			model.checkOutModule.routingItems.refresh();
			
			super.result(data);
		}
	}
}