package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.OpenNextShiftEvent;

	public class OpenNextShiftCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = OpenNextShiftEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.openNextShift(_event as OpenNextShiftEvent);
			
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