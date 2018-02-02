package services.business.frontend
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.GetProfileAddressesEvent;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetProfileAddressesDelegate extends BaseDelegate
	{
		public function GetProfileAddressesDelegate(_responder:IResponder)
		{
			super(_responder);
		}
		
		public function getProfileAddresses(evt:GetProfileAddressesEvent):void
		{
			operation = service.getRemoteObject(GlobalStorage.SERVICE_PERSONAL).getOperation("GetProfileAddresses");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(GlobalStorage.userOptions, evt.profileId);
		}
	}
}