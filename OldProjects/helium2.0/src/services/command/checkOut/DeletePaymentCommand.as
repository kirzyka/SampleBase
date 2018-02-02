package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.DeletePaymentEvent;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;
	import services.vo.checkOut.payment.CheckoutPaymentVO;
	
	import mx.collections.ArrayCollection;

	public class DeletePaymentCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeletePaymentEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.removePayment(_event as DeletePaymentEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var routingItems:ArrayCollection = model.checkOutModule.routingItems;
			var payment:ItemCheckOutVO = routingItems.getItemAt((_event as DeletePaymentEvent).index) as ItemCheckOutVO;
			routingItems.removeItemAt((_event as DeletePaymentEvent).index);
			// find deleted payment in the routed payment. If payment is found, remove it
			for(var i:int = 0; i < model.checkOutModule.routedPaymentItems.length; i++)
			{
				var item:CheckoutPaymentVO = model.checkOutModule.routedPaymentItems.getItemAt(i) as CheckoutPaymentVO;
				if (item.lId == payment.lId)
				{
					model.checkOutModule.routedPaymentItems.removeItemAt(i);
				}
			}
			
			super.result(data);
		}
	}
}