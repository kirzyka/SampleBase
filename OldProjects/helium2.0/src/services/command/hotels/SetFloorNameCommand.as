package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.SetHotelFloorNameEvent;

	public class SetFloorNameCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = SetHotelFloorNameEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			
			delegate.setFloorName(_event as SetHotelFloorNameEvent);
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}
		
		
	}
}