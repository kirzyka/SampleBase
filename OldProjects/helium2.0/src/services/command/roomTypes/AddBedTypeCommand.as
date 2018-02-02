package services.command.roomTypes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomTypes.RoomTypesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomTypes.AddBedTypeEvent;
	import services.vo.backend.BedTypeObjectVO;
	
	import mx.collections.ArrayCollection;

	public class AddBedTypeCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddBedTypeEvent( event );
			var delegate:RoomTypesDelegate = new RoomTypesDelegate( this );
			
			delegate.addBedType(_event as AddBedTypeEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			if (data is BedTypeObjectVO)
			{
			var item:BedTypeObjectVO = data as BedTypeObjectVO;
			var flagUpdate:Boolean = false;
			
			for (var i:int=0; i<model.roomTypesModule.roomBedTypes.length; i++)
			{
				if ((model.roomTypesModule.roomBedTypes.getItemAt(i) as BedTypeObjectVO).iTypeId == item.iTypeId)
				{
				model.roomTypesModule.roomBedTypes.setItemAt( item, i );
				flagUpdate = true;
				}
			}
			if (!flagUpdate)
			model.roomTypesModule.roomBedTypes.addItem( item );
			}
			
			if (data is ArrayCollection)
			{
			var items:ArrayCollection = data as ArrayCollection;
			model.roomTypesModule.roomBedTypes.removeAll();
			
			for(i = 0;i<items.length;i++)
				{
					model.roomTypesModule.roomBedTypes.addItem( items[i] );
				}
			}			
			super.result( data );
		}
		
	
	}
}