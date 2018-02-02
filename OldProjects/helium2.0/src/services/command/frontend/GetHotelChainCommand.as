package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.GetHotelChainDelegate;
	import services.events.backend.GetHotelChainEvent;
	import framework.model.AppModelLocator;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	/**
	 *  Command for get list of chains for system hotels.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 */
	public class GetHotelChainCommand implements ICommand, IResponder
	{
		/**
		 *  This property contains the model with all data.
		 *  
		 *  @see framework.model.RModel
		 */
		private var model:AppModelLocator = AppModelLocator.getInstance();
		/**
		 *  This property contain event for remote function call.
		 */
		private var evt:GetHotelChainEvent;
		
		/**
		 *  Interface method. 
		 *  <p>Execute for forwarding the event to the method
		 *  <code>getHotelChains()</code>.
		 *  
		 *  @param event:CairngormEvent
		 *  
		 *  @see services.events.frontend.GetHotelChainEvent
		 *  @see services.business.frontend.GetHotelChainDelegate
		 */
		public function execute(event:CairngormEvent):void
		{
			evt = GetHotelChainEvent(event);
			var delegate:GetHotelChainDelegate = new GetHotelChainDelegate(this);
			
			delegate.getHotelChains(evt);
		}
		/**
		 *  The handler to get result of the execution by remote call for
		 *  <code>getHotelChains()</code>.
		 *  <p>This method is called by a service when the return value
		 *  has been received.</p>
		 *   
		 *  @param data:Object - result of the remote call.
		 */
		public function result(data:Object):void
		{
			GlobalStorage.hotelChain = new ArrayCollection(data as Array);
			
			if (evt.callBack is Function)
				evt.callBack();
			
			model.appEnabled--;
		}
		/**
		 *  The handler of faulting the execution by remote call for
		 *  <code>getHotelChains()</code>.
		 *  <p>This method is called by a service when an error has been
		 *  received.
		 *  
		 *  @param info:Object - info about fault message
		 */
		public function fault(info:Object):void
		{
			model.appEnabled--;
		}
	}
}