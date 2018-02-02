package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.GetBedTypesListEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;

	public class GetBedTypesListCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = GetBedTypesListEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );			
			delegate.getBedTypesList(_event as GetBedTypesListEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.roomTypesModule.roomBedTypes.removeAll();
			var items:ArrayCollection = new ArrayCollection( data as Array );
			
			for(var i:int=0;i<items.length;i++)
				model.roomTypesModule.roomBedTypes.addItem(items[i]); 
			
			model.roomTypesModule.roomBedTypes.dispatchEvent(new CollectionEvent(CollectionEvent.COLLECTION_CHANGE));
			super.result( data );
		}
		
	}
}