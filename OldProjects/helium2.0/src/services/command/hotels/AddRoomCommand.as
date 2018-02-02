package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.AddRoomEvent;
	import services.vo.hotels.HotelRoomObjectVO;

	public class AddRoomCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			_event = AddRoomEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );			
			delegate.addRoom(_event as AddRoomEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			if (data == null) return;
			if(model.hotelsModule.currStage.aMapHotelRooms == null) model.hotelsModule.currStage.aMapHotelRooms = new Array();
			
			for (var i:int = 0; i < model.hotelsModule.currStage.aMapHotelRooms.length; i++)
				if ((model.hotelsModule.currStage.aMapHotelRooms[i] as HotelRoomObjectVO).iRoomId == ( data as HotelRoomObjectVO ).iRoomId)
				model.hotelsModule.currStage.aMapHotelRooms.splice(i, 1);
			
			model.hotelsModule.currStage.aMapHotelRooms.push( data as HotelRoomObjectVO );
	
			model.hotelsModule.currStageRoomsDP.refresh();
			super.result( data );
		}
	
		
	}
}