package services.command.backend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.GetStatusListDelegate;
	import framework.model.AppModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	/**
	* The GetStatusListCommand class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetStatusListCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();

		
		public function execute(event:CairngormEvent):void
		{
			var delegate:GetStatusListDelegate = new GetStatusListDelegate( this );			
			delegate.getStatusList(event);
		}
		
		public function result(data:Object):void
		{
			model.houseKeeperModule.roomStatuses = data as Array;//HotelRoomStatusVO
			model.appEnabled--;	
		}
		
		public function fault(info:Object):void
		{			
			Alert.show("Error");			 
			model.appEnabled--;
		}
		
	}
}