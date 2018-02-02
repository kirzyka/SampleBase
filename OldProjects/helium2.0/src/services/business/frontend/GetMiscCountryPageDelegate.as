package services.business.frontend
{
	import services.cairngorm.BaseDelegate;
	import services.events.frontend.GetMiscCountryPageEvent;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	/**
	 *  Delegate to get list of countries.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 */
	public class GetMiscCountryPageDelegate extends BaseDelegate
	{
		/**
		 *  GetCountryDelegate. Constructor.
		 *  
		 *  @param _responder:IResponder - contact provider for any service
		 */
		public function getMiscCountryPage(_responder:IResponder)
		{
			super(_responder);
		}
		/**
		 *  Remote call for get list of all countries.
		 *  
		 *  @param evt:GetCountryEvent
		 */
		public function getPage(evt:GetMiscCountryPageEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_HELPER).getOperation("GetPage");
			
			var aParams:Array = new Array();
			aParams['REGION_LIST'] = evt.countryId;
			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(GlobalStorage.userOptions, aParams);
		}
	}
}