package services.events.common
{
	import services.cairngorm.BaseEvent;

	public class GetMarketCodesEvent extends BaseEvent
	{
		public function GetMarketCodesEvent(type:String)
		{
			super(type);
		}
	}
}