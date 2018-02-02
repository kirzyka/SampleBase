package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;

	public class GetRoomTypesDataEvent extends BaseEvent
	{
		public function GetRoomTypesDataEvent(type:String)
		{
			super(type);
		}
		
	}
}