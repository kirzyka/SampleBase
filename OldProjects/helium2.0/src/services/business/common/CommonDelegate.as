package services.business.common
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.GetCommonDictionariesEvent;
	import services.events.common.GetSystemDateEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class CommonDelegate extends BaseDelegate
	{
		public static const GET_SYSTEM_DATE:String = "GetSystemDate";
		public static const GET_COMMON_DICTIONARY:String = "getCommonDictionaries";
		
		public function CommonDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to get system day (business day).
		 *  
		 *  @param event:GetSystemDateEvent
		 */
		public function getSystemDate(event:GetSystemDateEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_LOGIN).getOperation(GET_SYSTEM_DATE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, model.hotelsModule.hotelTotalInfo.iHotelId);
		}
		/**
		 *  Remote call to get system information for system.
		 *  
		 *  @param event:GetCommonDictionariesEvent
		 */
		public function getCommonDictionaries(event:GetCommonDictionariesEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_COMMON).getOperation(GET_COMMON_DICTIONARY);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
	}
}