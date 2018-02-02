package services.events.miscellaneous.nationalities
{
	import services.cairngorm.BaseEvent;

	public class GetNationalityEvent extends BaseEvent
	{
		public function GetNationalityEvent(type:String)
		{
			super(type);
		}
		
	}
}