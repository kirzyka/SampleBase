package services.command.items.management
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.management.GetVatPeriodsEvent;
	import services.vo.common.PagerVO;
	
	import mx.collections.ArrayCollection;

	public class GetVatPeriodsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetVatPeriodsEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			delegate.getVatPeriods(_event as GetVatPeriodsEvent);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.transactionModule.vatPeriods = new ArrayCollection(data as Array);
			super.result(data);
		}
	}
}