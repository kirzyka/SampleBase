package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.GetCreditTypeDelegate;
	import services.events.frontend.GetCreditTypeEvent;
	import framework.model.AppModelLocator;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class GetCreditTypeCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var evt:GetCreditTypeEvent = GetCreditTypeEvent( event );
			var delegate:GetCreditTypeDelegate = new GetCreditTypeDelegate( this );
			
			delegate.getCrediteType( evt );
		}
		
		public function result(data:Object):void
		{
			GlobalStorage.creditType = new ArrayCollection( data.oResponse as Array );
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Get Credit Type failed");
			
			model.appEnabled--;
		}
		
	}
}