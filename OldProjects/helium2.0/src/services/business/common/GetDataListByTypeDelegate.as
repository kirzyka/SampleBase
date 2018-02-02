package services.business.common
{
	import services.cairngorm.BaseDelegate;
	import services.events.common.GetDataListByTypeEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	/**
	* The GetDataListByTypeDelegate class is 
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-30$
	*
	*/
	public class GetDataListByTypeDelegate extends BaseDelegate
	{
		public function GetDataListByTypeDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function getDataListByType(event:GetDataListByTypeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getDataListType").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getDataListType").send(CommonModule.userOptions,event.sDictionaryType);
		}
		
	}
}