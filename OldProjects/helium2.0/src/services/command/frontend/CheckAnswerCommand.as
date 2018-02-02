package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.CheckAnswerDelegate;
	import services.events.frontend.CheckAnswerEvent;
	import framework.model.AppModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class CheckAnswerCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var evt:CheckAnswerEvent = CheckAnswerEvent( event );
			var delegate:CheckAnswerDelegate = new CheckAnswerDelegate( this );
			
			delegate.checkAnswer( evt );
		}
		
		public function result(data:Object):void
		{
			
			model.loginPage.forgotPasswordModule.currentPage = 2;
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			model.appEnabled--;
		}
		
	}
}