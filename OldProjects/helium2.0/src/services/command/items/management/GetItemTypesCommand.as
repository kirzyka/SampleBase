package services.command.items.management
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.GetDataListByTypeCodeDelegate;
	import services.events.common.GetDataListByTypeCodeEvent;
	import framework.model.AppModelLocator;
	import services.cairngorm.BaseCommand;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class GetItemTypesCommand  implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var delegate:GetDataListByTypeCodeDelegate = new GetDataListByTypeCodeDelegate( this );			
			delegate.getDataListByTypeCode(event as GetDataListByTypeCodeEvent);
		}
		
		public function result(data:Object):void
		{
			model.transactionModule.itemTypes = new ArrayCollection(data as Array);			
			model.appEnabled--;	
		}
		
		public function fault(info:Object):void
		{			
			Alert.show("Error");			 
			model.appEnabled--;
		}
	}
}