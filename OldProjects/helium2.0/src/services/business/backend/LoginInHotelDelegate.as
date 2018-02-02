package services.business.backend
{
	import services.cairngorm.BaseDelegate;
	import services.events.backend.LoginInHotelEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	/**
	* The LoginInHotelDelegate class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class LoginInHotelDelegate extends BaseDelegate
	{
		public function LoginInHotelDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		public function loginInHotel(event:LoginInHotelEvent):void
		{
			service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("loginInHotel").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_LOGIN).getOperation("loginInHotel").send(CommonModule.userOptions,event.iHotelId);
		}
		
	}
}