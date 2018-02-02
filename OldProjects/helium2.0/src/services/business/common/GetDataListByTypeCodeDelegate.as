package services.business.common
{
	import services.cairngorm.BaseDelegate;
	import services.events.common.GetDataListByTypeCodeEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	/**
	* The GetDataListByTypeCodeDelegate class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetDataListByTypeCodeDelegate extends BaseDelegate
	{
		public function GetDataListByTypeCodeDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function getDataListByTypeCode(event:GetDataListByTypeCodeEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getDataListByTypeCode").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMMON).getOperation("getDataListByTypeCode").send(CommonModule.userOptions,event.sListTypeCode);
		}
		
	}
}