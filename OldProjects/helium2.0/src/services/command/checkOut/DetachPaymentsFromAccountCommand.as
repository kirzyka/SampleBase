package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.DetachPaymentsFromAccountEvent;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;
	import services.vo.checkOut.payment.CheckoutPaymentVO;
	
	import mx.collections.ArrayCollection;

	public class DetachPaymentsFromAccountCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DetachPaymentsFromAccountEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.detachPaymentFromAccount(_event as DetachPaymentsFromAccountEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var routing:ArrayCollection = model.checkOutModule.routingItems;
			var payments:ArrayCollection = model.checkOutModule.routedPaymentItems;
			var paymentId:Number = (_event as DetachPaymentsFromAccountEvent).parentPaymentId;
			for(var i:int = 0; i < payments.length; i++)
			{
				var payment:CheckoutPaymentVO = payments.getItemAt(i) as CheckoutPaymentVO
				if (paymentId == payment.lAppliedPayment)
				{
					payments.removeItemAt(i);
					i--;
				}
			}
			for each(var pay:ItemCheckOutVO in routing)
			{
				if (paymentId == pay.lAppliedPayment)
				{
					pay.lAppliedPayment = 0;
				}
			}
	
			super.result(data);
		}
	}
}