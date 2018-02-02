package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.AddFloorEvent;
	import services.vo.hotels.HotelStageObjectVO;

	public class AddFloorCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddFloorEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );			
			delegate.addFloor(_event as AddFloorEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.stageDP.addItem( data as HotelStageObjectVO );	
			super.result( data );		
			
		}
		
		
	}
}