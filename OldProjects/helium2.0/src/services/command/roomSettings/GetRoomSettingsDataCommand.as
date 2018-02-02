package services.command.roomSettings
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomSettings.RoomSettingsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomSettings.GetRoomSettingsDataEvent;

	public class GetRoomSettingsDataCommand  extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetRoomSettingsDataEvent( event );
			var delegate:RoomSettingsDelegate = new RoomSettingsDelegate( this );
			
			delegate.getRoomSettingsData(_event as GetRoomSettingsDataEvent);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.roomSettingsModule.roomSettingsDP.removeAll();
			
			var items:Array = data as Array;
			
			model.roomSettingsModule.maxRoomSettingsItems = items.length;
			
			for(var i:int = 0;i<items.length;i++)
			{
				model.roomSettingsModule.roomSettingsDP.addItem( items[i] );
			}
			
			super.result(data);
		}
		
		
	}
}