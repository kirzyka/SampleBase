package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.CloseShiftEvent;

	public class CloseShiftCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = CloseShiftEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.closeShift(_event as CloseShiftEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}
	}
}