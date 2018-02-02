package services.events.roomSettings
{
	import services.cairngorm.BaseEvent;

	public class GetRoomSettingsDataEvent extends BaseEvent
	{
		public var isMandatory:Boolean = false;
		
		public function GetRoomSettingsDataEvent(type:String)
		{
			super(type);
		}
		
	}
}