package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.SetRoomTypeShortNameEvent;
	
	import mx.controls.Alert;

	public class SetRoomTypeShortNameCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = SetRoomTypeShortNameEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.setRoomTypeShortName( _event as  SetRoomTypeShortNameEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}
		
		
	}
}