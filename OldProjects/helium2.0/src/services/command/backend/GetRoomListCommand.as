package services.command.backend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.GetRoomListDelegate;
	import services.events.backend.GetRoomListEvent;
	import framework.model.AppModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	/**
	* The GetRoomListCommand class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetRoomListCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();

		
		public function execute(event:CairngormEvent):void
		{
			var delegate:GetRoomListDelegate = new GetRoomListDelegate( this );			
			delegate.getRoomList(event as GetRoomListEvent);
		}
		
		public function result(data:Object):void
		{
			model.hotelsModule.roomDP = new ArrayCollection(data as Array);
			model.appEnabled--;	
		}
		
		public function fault(info:Object):void
		{			
			Alert.show("Error");			 
			model.appEnabled--;
		}
		
	}
}