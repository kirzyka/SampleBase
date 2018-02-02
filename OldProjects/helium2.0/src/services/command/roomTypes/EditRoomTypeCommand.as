package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.EditRoomTypeEvent;
	
	import mx.collections.ArrayCollection;

	public class EditRoomTypeCommand extends BaseCommand
	{
				
		override public function execute(event:CairngormEvent):void
		{
			_event = EditRoomTypeEvent( event );
			if (!(_event as EditRoomTypeEvent).roomType.aRoomWithBedTypes)
			{
				(_event as EditRoomTypeEvent).roomType.aRoomWithBedTypes = [];
				(_event as EditRoomTypeEvent).roomType.aRoomWithBedTypes.push((_event as EditRoomTypeEvent).roomType.flx_oRoomStandalone);
			}
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.editRoomType(_event as EditRoomTypeEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			var items:ArrayCollection = new ArrayCollection( data as Array );
			model.roomTypesModule.maxRoomTypesItems = items.length;			
			model.roomTypesModule.roomTypesDP = items;
			model.roomTypesModule.roomTypesDP.refresh();
			super.result( data );
		}
	}
}