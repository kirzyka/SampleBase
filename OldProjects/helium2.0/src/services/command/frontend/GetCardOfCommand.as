package services.command.frontend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.GetCardOfDelegate;
	import services.events.frontend.GetCardOfEvent;
	import framework.model.AppModelLocator;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class GetCardOfCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var evt:GetCardOfEvent = GetCardOfEvent( event );
			var delegate:GetCardOfDelegate = new GetCardOfDelegate( this );
			
			delegate.getCardOf( evt );
		}
		
		public function result(data:Object):void
		{
			GlobalStorage.cardOf = new ArrayCollection( data.oResponse as Array );
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Get Card of failed");
			
			model.appEnabled--;
		}
		
	}
}