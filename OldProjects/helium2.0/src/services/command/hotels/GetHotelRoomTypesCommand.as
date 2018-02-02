package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.GetHotelRoomTypesEvent;
	
	import mx.collections.ArrayCollection;

	public class GetHotelRoomTypesCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			
			_event = event as GetHotelRoomTypesEvent;
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			delegate.getHotelRoomTypes(event as GetHotelRoomTypesEvent );
			model.ratesModule.barModule.isBarEnabled = true;
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			var items:ArrayCollection = new ArrayCollection( data as Array );
			model.hotelsModule.maxHotelRoomTypes = items.length;

			model.hotelsModule.hotelRoomTypes = items;

			super.result(data);
		}


	}
}