package services.command.roomSettings
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.roomSettings.RoomSettingsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.roomSettings.EditRoomSettingEvent;

	public class EditRoomSettingCommand extends BaseCommand
	{		
		override public function execute(event:CairngormEvent):void
		{
			_event = EditRoomSettingEvent( event );
			var delegate:RoomSettingsDelegate = new RoomSettingsDelegate( this );
			
			delegate.editRoomSetting( _event as EditRoomSettingEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{			
			var items:Array = data as Array;
			
			model.roomSettingsModule.roomSettingsDP.removeAll();
			
			model.roomSettingsModule.maxRoomSettingsItems = items.length;
			
			for(var i:int = 0;i<items.length;i++)
			{
				model.roomSettingsModule.roomSettingsDP.addItem( items[i] );
			}
			super.result( data );

		}
		
		
	}
}