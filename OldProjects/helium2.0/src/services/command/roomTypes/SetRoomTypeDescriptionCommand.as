package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.SetRoomTypeDescriptionEvent;

	public class SetRoomTypeDescriptionCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = SetRoomTypeDescriptionEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );			
			delegate.setRoomTypeDescription(_event as SetRoomTypeDescriptionEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}
		
	}
}