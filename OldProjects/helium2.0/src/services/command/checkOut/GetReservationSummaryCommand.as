package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.GetReservationSummaryEvent;
	import services.vo.checkOut.itemRouting.ReservationSummaryCheckOutVO;

	public class GetReservationSummaryCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetReservationSummaryEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.getReservationSummary(_event as GetReservationSummaryEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.checkOutModule.reservationSummary = (data as ReservationSummaryCheckOutVO);
			
			super.result(data);
		}
	}
}