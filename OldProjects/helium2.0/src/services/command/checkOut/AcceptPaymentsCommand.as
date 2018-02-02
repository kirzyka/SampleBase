package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.AcceptPaymentsEvent;
	import services.vo.inHouse.CheckOutReportsListVO;

	public class AcceptPaymentsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = AcceptPaymentsEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.acceptPayments(_event as AcceptPaymentsEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.checkOutModule.acceptPaymentData = (data as CheckOutReportsListVO);
			
			super.result(data);
		}
	}
}