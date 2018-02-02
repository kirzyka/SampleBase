package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.GetCheckoutStateFromInvoiceEvent;
	import services.vo.checkOut.itemRouting.AppliedItemsVO;
	import services.vo.checkOut.itemRouting.CheckoutInfoFullVO;

	public class GetCheckoutStateFromInvoiceCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetCheckoutStateFromInvoiceEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.getCheckoutStateForInvoice(_event as GetCheckoutStateFromInvoiceEvent);

			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var appliedItem:AppliedItemsVO;

			model.checkOutModule.reservationSummary = (data as CheckoutInfoFullVO).oMapReservationSummary;
			model.checkOutModule.updateCheckOutState((data as CheckoutInfoFullVO).oMapItemsRouting);

			super.result(data);
		}
	}
}
