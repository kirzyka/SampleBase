package services.events.roomSettings
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.RoomSettingObjectVO;

	public class EditRoomSettingEvent extends BaseEvent
	{
		public var index:int;
		public var roomSetting:RoomSettingObjectVO = new RoomSettingObjectVO();
		
		public function EditRoomSettingEvent(type:String)
		{
			super(type);
		}
		
	}
}