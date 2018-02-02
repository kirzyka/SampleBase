package services.command.items.management
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.management.SaveSystemTransactionEvent;
	import services.events.items.management.SaveVatPeriodEvent;
	import services.vo.items.HotelItemVO;
	
	import mx.collections.ArrayCollection;

	public class SaveVatPeriodCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveVatPeriodEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.saveVatPeriods(_event as SaveVatPeriodEvent);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			//var temp:int = (_event as SaveVatPeriodEvent).oVatPeriod;
			var item:HotelItemVO = data as HotelItemVO;
			/* var provider:ArrayCollection = model.transactionModule.transactionList;
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
			model.transactionModule.transactionList = provider; */
			
			super.result(data);
		}
	}
}