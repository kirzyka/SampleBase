package services.events.rates.bar
{
	import services.cairngorm.BaseEvent;

	public class GetBarItemsInfoEvent extends BaseEvent
	{		
		public function GetBarItemsInfoEvent(type:String)
		{
			super(type);
		}	
	}
}