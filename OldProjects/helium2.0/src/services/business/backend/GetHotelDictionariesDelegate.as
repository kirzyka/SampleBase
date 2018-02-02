package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.GetHotelDictionariesEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetHotelDictionariesDelegate extends BaseDelegate
	{
		
		public function GetHotelDictionariesDelegate(responder:IResponder)
		{
			super(responder);
		}		
		
		public function getHotelDictionaries(evt:GetHotelDictionariesEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getHotelDictionaries");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, evt.hotelId);
		}
	}
}