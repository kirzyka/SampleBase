package services.events.profiles.company
{
	import services.cairngorm.BaseEvent;

	public class GetMarketGroupListEvent extends BaseEvent
	{
		public function GetMarketGroupListEvent(type:String)
		{
			super(type);
		}
		
	}
}