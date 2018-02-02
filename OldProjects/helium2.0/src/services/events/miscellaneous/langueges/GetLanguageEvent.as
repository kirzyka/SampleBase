package services.events.miscellaneous.langueges
{
	import services.cairngorm.BaseEvent;

	public class GetLanguageEvent extends BaseEvent
	{
		public function GetLanguageEvent(type:String)
		{
			super(type);
		}
		
	}
}