package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.DeleteHotelRoomEvent;

	public class DeleteHotelRoomCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteHotelRoomEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );			
			delegate.deleteHotelRoom( _event as DeleteHotelRoomEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.currStageRoomsDP.removeItemAt(( _event as DeleteHotelRoomEvent ).roomIndex);
			model.hotelsModule.currStageRoomsDP.refresh();
			
			super.result( data );
		}
		
		
		
	}
}