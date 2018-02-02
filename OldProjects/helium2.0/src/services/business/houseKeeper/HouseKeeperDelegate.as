package services.business.houseKeeper
{
	import services.cairngorm.BaseDelegate;
	import services.events.houseKeeper.SetOutOfServiceEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The PackageDelegate class is
	*
	* @author Viktor Potapov / Ramada
	* @version $Revision 1.2 $ $Date: 2009-10-29 16:54:43 +0200 (Чт, 29 окт 2009) $
	*
	*/
	public class HouseKeeperDelegate extends BaseDelegate
	{
		public function HouseKeeperDelegate(responder:IResponder)
		{
			super(responder);
		}

		public function setOutOfService(event:SetOutOfServiceEvent):void
		{
			service.getRemoteObject(Services.SERVICE_HOUSEKEEPING).getOperation("setOutOfServiceStatusList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_HOUSEKEEPING).getOperation("setOutOfServiceStatusList").send(CommonModule.userOptions,event.aRoomList, event.sDateFrom, event.sDateTo);
		}
	}
}