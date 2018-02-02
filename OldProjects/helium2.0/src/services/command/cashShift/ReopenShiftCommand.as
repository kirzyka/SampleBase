package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.OpenNextShiftEvent;
	import services.events.cashShift.ReopenShiftEvent;

	public class ReopenShiftCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = ReopenShiftEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.reopenShift(_event as ReopenShiftEvent);
			
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