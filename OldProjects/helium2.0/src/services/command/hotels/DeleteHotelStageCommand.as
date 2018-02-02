package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.DeleteHotelStageEvent;

	public class DeleteHotelStageCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteHotelStageEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			
			delegate.deleteHotelStage( _event as  DeleteHotelStageEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.stageDP.removeItemAt( ( _event as  DeleteHotelStageEvent).stageIndex );
			model.hotelsModule.currStageRoomsDP.removeAll();
			
			super.result( data );
		}
		
		
	}
}