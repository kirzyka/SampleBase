package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.controller.AppController;
	import services.events.roomTypes.DeleteRoomTypeEvent;
	import services.events.roomTypes.GetRoomTypesDataEvent;

	public class DeleteRoomTypeCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteRoomTypeEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.deleteRoomType(_event as DeleteRoomTypeEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.roomTypesModule.roomTypesDP.removeAll();
			CairngormEventDispatcher.getInstance().dispatchEvent( new GetRoomTypesDataEvent( AppController.GET_ROOM_TYPES_DATA_EVENT ) );
			
			super.result(data);
		}
		
		
		
	}
}