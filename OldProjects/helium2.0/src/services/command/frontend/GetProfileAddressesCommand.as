package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.GetProfileAddressesDelegate;
	import services.events.frontend.GetProfileAddressesEvent;
	import framework.model.AppModelLocator;
	
	import mx.rpc.IResponder;

	public class GetProfileAddressesCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var evt:GetProfileAddressesEvent = GetProfileAddressesEvent( event );
			var delegate:GetProfileAddressesDelegate = new GetProfileAddressesDelegate( this );
			
			delegate.getProfileAddresses( evt );
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}