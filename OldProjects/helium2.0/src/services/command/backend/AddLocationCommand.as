package services.command.backend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.AddLocationDelegate;
	import services.events.backend.AddLocationEvent;
	import framework.model.AppModelLocator;
	import services.vo.backend.LocationVO;
	
	import mx.rpc.IResponder;

	public class AddLocationCommand implements IResponder, ICommand
	{
		/**
		 *  This property contains the model with all data.
		 *  
		 *  @see framework.model.RModel
		 */
		private var model:AppModelLocator = AppModelLocator.getInstance();
		/**
		 *  This property contains the event for making the request
		 *  to add new location.
		 *  
		 *  @see services.events.backend.AddLocationEvent
		 */
		private var evt:AddLocationEvent;
		
		/**
		 *  Interface method. 
		 *  <p>Execute for forwarding the event to the method
		 *  <code>addLocation()</code>.
		 *  
		 *  @param event:CairngormEvent
		 *  
		 *  @see services.events.backend.AddLocationEvent
		 *  @see services.business.backend.AddLocationDelegate
		 */
		 public function execute(event:CairngormEvent):void
		{
			evt = AddLocationEvent(event);
			var delegate:AddLocationDelegate = new AddLocationDelegate(this);
			
			delegate.addLocation(evt);
		}
		/**
		 *  The handler for result of execution of request for
		 *  <code>addLocation()</code>.
		 *  <p>This method is called by a service when the return value
		 *  has been received.</p>
		 *  
		 *  @param data:Object - result of remote call.
		 */
		public function result(data:Object):void
		{
			evt.callBack(0,(data as LocationVO).oDetail.lId);			
			model.appEnabled--;
		}
		/**
		 *  The handler of faulting the execution by remote call for
		 *  <code>addLocation()</code>.
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