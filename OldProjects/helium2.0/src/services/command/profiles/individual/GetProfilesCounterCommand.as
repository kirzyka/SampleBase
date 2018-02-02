package services.command.profiles.individual
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.individual.GetProfilesCounterDelegate;
	import services.events.profiles.individual.GetProfilesCounterEvent;
	import framework.model.AppModelLocator;
	
	import mx.rpc.IResponder;
	/**
	 *  Command for get count of profiles.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 */
	public class GetProfilesCounterCommand implements ICommand, IResponder
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
		private var evt:GetProfilesCounterEvent;
		
		/**
		 *  Interface method. 
		 *  <p>Execute for forwarding the event to the method
		 *  <code>getProfileCount()</code>.
		 *  
		 *  @param event:CairngormEvent
		 *  
		 *  @see services.events.frontend.GetHotelProfilesCounterEvent
		 *  @see services.business.frontend.GetHotelProfilesCounterDelegate
		 */
		public function execute(event:CairngormEvent):void
		{
			evt = GetProfilesCounterEvent(event);
			var delegate:GetProfilesCounterDelegate = new GetProfilesCounterDelegate(this);
			
			delegate.getProfileCount(evt);
		}
		/**
		 *  The handler to get result of the execution by remote call for
		 *  <code>getProfileCount()</code>.
		 *  <p>This method is called by a service when the return value
		 *  has been received.</p>
		 *   
		 *  @param data:Object - result of the remote call.
		 */
		public function result(data:Object):void
		{
			model.profilesModule.profilesCount = Number(data);
			
			if (evt.callBack is Function)
				evt.callBack();
			
			model.appEnabled--;
		}
		/**
		 *  The handler of faulting the execution by remote call for
		 *  <code>getProfileCount()</code>.
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