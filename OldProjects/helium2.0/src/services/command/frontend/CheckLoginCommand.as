package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.CheckLoginDelegate;
	import services.events.frontend.CheckLoginEvent;
	import framework.model.AppModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class CheckLoginCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var evt:CheckLoginEvent = CheckLoginEvent( event );
			var delegate:CheckLoginDelegate = new CheckLoginDelegate( this );
			
			delegate.checkLogin( evt );
		}
		
		public function result(data:Object):void
		{
			model.loginPage.forgotPasswordModule.currentPage = 1;
			model.loginPage.forgotPasswordModule.forgotPasswordQuestion = data as String;
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			model.appEnabled--;
		}
		
	}
}