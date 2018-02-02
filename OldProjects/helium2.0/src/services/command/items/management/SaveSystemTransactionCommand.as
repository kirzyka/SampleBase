package services.command.items.management
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.management.SaveSystemTransactionEvent;
	import services.vo.items.HotelItemVO;
	
	import mx.collections.ArrayCollection;

	public class SaveSystemTransactionCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveSystemTransactionEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.saveSystemTransaction(_event as SaveSystemTransactionEvent);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var index:int = (_event as SaveSystemTransactionEvent).index;
			var item:HotelItemVO = data as HotelItemVO;
			var provider:ArrayCollection = model.transactionModule.transactionList;
			if (index != provider.length)
			{
				// edit mode
				provider.setItemAt(item, index);
			}
			else 
			{
				// add mode
				provider.addItem(item);
			}
			model.transactionModule.transactionList = provider;
			
			super.result(data);
		}
	}
}