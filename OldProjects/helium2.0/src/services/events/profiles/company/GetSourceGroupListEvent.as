package services.events.profiles.company
{
	import services.cairngorm.BaseEvent;

	public class GetSourceGroupListEvent extends BaseEvent
	{
		public function GetSourceGroupListEvent(type:String)
		{
			super(type);
		}
	}
}