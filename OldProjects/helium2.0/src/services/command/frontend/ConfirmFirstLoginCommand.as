package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.ConfirmFirstLoginDelegate;
	import framework.model.AppModelLocator;
	
	import mx.rpc.IResponder;

	public class ConfirmFirstLoginCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
				
		public function execute(event:CairngormEvent):void
		{
			var delegate:ConfirmFirstLoginDelegate = new ConfirmFirstLoginDelegate( this );
			delegate.confirmFirstLogin();
		}
		
		public function result(data:Object):void
		{
			if(data)
			{
				model.loginPage.currentPage = 0;
			}
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			model.appEnabled--;
		}
		
	}
}