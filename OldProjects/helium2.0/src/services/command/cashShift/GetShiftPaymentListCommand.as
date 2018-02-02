package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.GetShiftPaymentListEvent;

	public class GetShiftPaymentListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetShiftPaymentListEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.getShiftPaymentList(_event as GetShiftPaymentListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{						
			model.cashShiftModule.cashShiftPaymantList = data as Array;
			
			super.result(data);
		}
	}
}