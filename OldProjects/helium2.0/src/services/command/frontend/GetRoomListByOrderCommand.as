package services.command.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.GetRoomListByOrderDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.frontend.GetRoomListByOrderEvent;
	
	import mx.collections.ArrayCollection;
 
	public class GetRoomListByOrderCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = GetRoomListByOrderEvent( event );
			var delegate:GetRoomListByOrderDelegate = new GetRoomListByOrderDelegate( this );
			
			delegate.getRoomList( _event as GetRoomListByOrderEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			//model.checkInModule.floorsData = new ArrayCollection( data as Array );
			
			model.checkInModule.checkInData = new ArrayCollection( (data as Array)[0] );
			model.checkInModule.floorsData = new ArrayCollection( (data as Array)[1] );
			 
			( _event as GetRoomListByOrderEvent ).callBack();

			super.result( data );
		}
	}
}