package services.command.items.management
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.management.GetHotelTransactionsEvent;
	import services.vo.common.PagerVO;
	
	import mx.collections.ArrayCollection;

	public class GetHotelTransactionsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetHotelTransactionsEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.getHotelTransactions(_event as GetHotelTransactionsEvent);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var context:PagerVO = data as PagerVO;
			model.transactionModule.transactionCount = context.lCount;
			model.transactionModule.transactionList = new ArrayCollection(context.aObjects);
			
			super.result(data);
		}
	}
}