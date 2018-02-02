package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.PrintActualReportEvent;

	public class PrintActualReportCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = PrintActualReportEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.printActualReport(_event as PrintActualReportEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.checkOutModule.invoiceURL = String(data);
			
			super.result(data);
		}
	}
}