package services.command.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.GetPageOfStartDelegate;
	import services.business.backend.GetPageOfStartHotelDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.backend.GetPageOfStartEvent;
	import services.events.backend.GetPageOfStartHotelEvent;
	import services.vo.GlobalStorage;
	import services.vo.common.CountryVO;
	
	import mx.collections.ArrayCollection;

	public class GetPageOfStartHotelCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetPageOfStartHotelEvent( event );
			var delegate:GetPageOfStartHotelDelegate = new GetPageOfStartHotelDelegate( this );
			 
			delegate.GetPageOfStartHotel( _event as GetPageOfStartHotelEvent );
			super.execute( event );
		}
		
 		override public function result(data:Object):void
		{
			var test:Array = data['VIP_HOTEL_LIST'];// it's hack
			
			   /*  $this->aMethods = array(
                            'VIP_HOTEL_LIST'       => 'GetVipHotelList',
                            'ROOM_TYPE_LIST'       => 'GetHotelRoomTypeList',
                            'ROOM_SETTING_LIST'    => 'GetRoomSettingsList', 
                            'HOTEL_STAGE_LIST'     => 'GetHotelStageList', */
			
			GlobalStorage.vipHotel = new ArrayCollection( data['VIP_HOTEL_LIST'] as Array );
				
			model.hotelsModule.hotelRoomSettings = new ArrayCollection( data['ROOM_SETTING_LIST'] as Array );
			
			model.hotelsModule.hotelRoomTypes = new ArrayCollection( data['ROOM_HOTEL_TYPE_LIST'] as Array );
			model.hotelsModule.maxHotelRoomTypes = model.hotelsModule.hotelRoomTypes.length;
			
			model.hotelsModule.stageDP = new ArrayCollection( data['HOTEL_STAGE_LIST'] as Array );			
						 
			super.result( data );
		}		
	}
}