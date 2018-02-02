package services.events.backend
{
	import services.cairngorm.BaseEvent;

	public class GetPageOfStartEvent extends BaseEvent
	{
		
		public function GetPageOfStartEvent(type:String)
		{
			super(type);
		}
	}
}