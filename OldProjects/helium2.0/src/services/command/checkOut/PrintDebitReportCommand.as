package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.PrintDebitReportEvent;

	public class PrintDebitReportCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = PrintDebitReportEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.printDebitReport(_event as PrintDebitReportEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.checkOutModule.invoiceURL = data as String;
			
			super.result(data);
		}
	}
}