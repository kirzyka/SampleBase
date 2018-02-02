package services.events.common
{
	import services.cairngorm.BaseEvent;

	public class GetVipTotalListEvent extends BaseEvent
	{
		public function GetVipTotalListEvent(type:String)
		{
			super(type);
		}
	}
}