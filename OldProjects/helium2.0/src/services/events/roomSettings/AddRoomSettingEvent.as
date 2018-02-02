package services.events.roomSettings
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.RoomSettingObjectVO;

	public class AddRoomSettingEvent extends BaseEvent
	{
		public var roomSetting:RoomSettingObjectVO = new RoomSettingObjectVO();
		
		public function AddRoomSettingEvent(type:String)
		{
			super(type);
		}
		
	}
}