package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.AddPaymentEvent;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;
	import services.vo.checkOut.payment.CheckoutPaymentVO;
	import services.vo.inHouse.CheckOutReportsListVO;

	public class AddPaymentCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = AddPaymentEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.addPayment(_event as AddPaymentEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var payment:CheckoutPaymentVO = (data as CheckOutReportsListVO).oMapPayment;
			var item:ItemCheckOutVO = new ItemCheckOutVO();
			item.lId = payment.lId;
			item.fPrice = payment.fValue;
			item.dDate = payment.dDate;
			item.sTransName = payment.sName;
			item.iPaymentType = payment.iType;
			item.bIsChecked = true;
			item.bIsPayment = true;
			
			model.checkOutModule.routingItems.addItem(item);
			
			super.result(data);
		}
	}
}