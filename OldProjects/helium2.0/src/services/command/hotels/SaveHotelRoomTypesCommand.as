package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.SaveHotelRoomTypesEvent;
	import services.vo.hotels.HotelRoomWithBedTypesObjectVO;

	public class SaveHotelRoomTypesCommand extends BaseCommand
	{
		private var rtitems:Array = new Array();
		
		override public function execute(event:CairngormEvent):void
		{
			 _event = SaveHotelRoomTypesEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			
			var rtIds:Array = new Array();
			
			for(var i:int = 0; i < model.hotelsModule.hotelRoomTypes.length;i++)
			{
				var roomType:HotelRoomWithBedTypesObjectVO = model.hotelsModule.hotelRoomTypes.getItemAt(i) as HotelRoomWithBedTypesObjectVO;
				/* var roomTypeId:Number = roomType.oRoomQuality.lQualityId;
				
				if(rtIds.length > 0)
					if(roomTypeId == rtIds[rtIds.length-1]) continue;
				
				rtIds.push( roomTypeId ); */
				
				if (!roomType.aRoomWithBedTypes)
				{
					roomType.aRoomWithBedTypes = [];
					roomType.aRoomWithBedTypes.push(roomType.flx_oRoomStandalone);
				}
				
				rtitems.push( roomType );
			}			
			delegate.saveHotelRoomTypes( (_event as SaveHotelRoomTypesEvent), rtitems ); 
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.hotelRoomTypes.removeAll();
			
			for(var i:int = 0;i<rtitems.length;i++)
			{
				model.hotelsModule.hotelRoomTypes.addItem( rtitems[i] );
			}
			super.result( data );
		}
		
	}
}