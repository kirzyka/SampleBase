package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.AddRoomTypeEvent;
	
	import mx.collections.ArrayCollection;

	public class AddRoomTypeCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			
			_event = AddRoomTypeEvent( event );
			if (!(_event as AddRoomTypeEvent).roomType.aRoomWithBedTypes)
			{
				(_event as AddRoomTypeEvent).roomType.aRoomWithBedTypes = [];
				(_event as AddRoomTypeEvent).roomType.aRoomWithBedTypes.push((_event as AddRoomTypeEvent).roomType.flx_oRoomStandalone);
			}
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.addRoomType(_event as AddRoomTypeEvent);
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