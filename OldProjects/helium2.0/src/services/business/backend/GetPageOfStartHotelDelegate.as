package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.GetPageOfStartHotelEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetPageOfStartHotelDelegate extends BaseDelegate
	{
		
		public function GetPageOfStartHotelDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function GetPageOfStartHotel(evt:GetPageOfStartHotelEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getHotelDictionaries");
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, evt.hotelId);
		}
	}
}