package services.command.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.GetHotelDictionariesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.backend.GetHotelDictionariesEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetHotelDictionariesCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetHotelDictionariesEvent( event );
			var delegate:GetHotelDictionariesDelegate = new GetHotelDictionariesDelegate( this );
			 
			delegate.getHotelDictionaries( _event as GetHotelDictionariesEvent );
			super.execute( event );
		}
		
 		override public function result(data:Object):void
		{
			var test:Array = data['VIP_HOTEL_LIST'];// it's hack
								
			GlobalStorage.vipHotel = new ArrayCollection( data['HOTEL_VIP_LIST'] as Array );
				
			model.hotelsModule.hotelRoomSettings = new ArrayCollection( data['HOTEL_ROOM_SETTING_LIST'] as Array );
			
			model.hotelsModule.hotelRoomTypes = new ArrayCollection( data['HOTEL_ROOM_TYPE_LIST'] as Array );
			model.hotelsModule.maxHotelRoomTypes = model.hotelsModule.hotelRoomTypes.length;
			
			model.hotelsModule.stageDP = new ArrayCollection( data['HOTEL_STAGE_LIST'] as Array );	
			
			var items:Array = data['VAT_LIST'] as Array;
			model.vatModule.vatDP.removeAll();
			model.vatModule.maxVATItems = items.length;
			for(var i:int = 0; i<items.length; i++)
			{
				model.vatModule.vatDP.addItem( items[i] );
			}		
						 
			super.result( data );
		}		
	}
}