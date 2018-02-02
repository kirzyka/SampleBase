package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.controller.AppController;
	import services.events.roomTypes.DeleteRoomQualityEvent;
	import services.events.roomTypes.GetRoomTypesDataEvent;

	public class DeleteRoomQualityCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteRoomQualityEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.deleteRoomQuality(_event as DeleteRoomQualityEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.roomTypesModule.roomTypesDP.removeAll();
			//model.roomTypesModule.roomTypesDP.removeItemAt(deleteEvt.index);
			CairngormEventDispatcher.getInstance().dispatchEvent( new GetRoomTypesDataEvent( AppController.GET_ROOM_TYPES_DATA_EVENT ) );
			
			super.result(data);
		}
		
		
		
	}
}