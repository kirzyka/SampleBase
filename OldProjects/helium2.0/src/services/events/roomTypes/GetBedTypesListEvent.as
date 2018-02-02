package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;

	public class GetBedTypesListEvent extends BaseEvent
	{
		public function GetBedTypesListEvent(type:String)
		{
			super(type);
		}
		
	}
}