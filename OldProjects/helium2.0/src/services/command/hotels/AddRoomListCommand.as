package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.AddRoomListEvent;
	import services.vo.hotels.HotelRoomObjectVO;
	import services.vo.hotels.HotelStageObjectVO;

	public class AddRoomListCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddRoomListEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			delegate.addRoomList(_event as AddRoomListEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.currStageRoomsDP.removeAll();			

			model.hotelsModule.currStage = (data as Array)[0] as HotelStageObjectVO;
			for (var i:int=0; i<model.hotelsModule.currStage.aMapHotelRooms.length; i++)			
				model.hotelsModule.currStageRoomsDP.addItem( model.hotelsModule.currStage.aMapHotelRooms[i] as HotelRoomObjectVO);
			model.hotelsModule.currStageRoomsDP.refresh(); 
			super.result( data );
		}
		
		
	}
}