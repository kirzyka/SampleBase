package services.events.profiles.individual
{
	import services.cairngorm.BaseEvent;

	public class GetWishesListEvent extends BaseEvent
	{
		public function GetWishesListEvent(type:String)
		{
			super(type);
		}
	}
}