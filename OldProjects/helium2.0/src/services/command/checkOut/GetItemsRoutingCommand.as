package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.GetItemsRoutingEvent;
	import services.vo.checkOut.itemRouting.AppliedItemsVO;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;
	import services.vo.checkOut.itemRouting.ItemsRoutingVO;
	
	import mx.collections.ArrayCollection;

	public class GetItemsRoutingCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetItemsRoutingEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.getItemsRouting(_event as GetItemsRoutingEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var itemRoutingData:ItemsRoutingVO = (data as ItemsRoutingVO);
			model.checkOutModule.paymentLineId = itemRoutingData.lPaymentLineId;
			// accounts to apply items from guest to some each of this account
			model.checkOutModule.accounts = new ArrayCollection(itemRoutingData.aMapAccounts);
			//
			var addedItems:Array = itemRoutingData.aNotRoutedItems;
			var appliedItems:Array = itemRoutingData.aAppliedItems;
			
			var routingItems:Array = addedItems.slice();
			for each(var appliedItem:AppliedItemsVO in appliedItems)
			{
				// set applied state state
				for each(var item:ItemCheckOutVO in appliedItem.aItems)
				{
					item.bIsChecked = true;
				}
				// grab all items to applied to guest (routed and not routed)
				routingItems = routingItems.concat(appliedItem.aItems);
			}
			
			model.checkOutModule.routingItems = new ArrayCollection(routingItems);
			model.checkOutModule.addedItems = new ArrayCollection(addedItems);
			model.checkOutModule.appliedItems = new ArrayCollection(appliedItems);
			
			super.result(data);
		}
	}
}