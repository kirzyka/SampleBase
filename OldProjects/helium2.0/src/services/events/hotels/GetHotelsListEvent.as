package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class GetHotelsListEvent extends BaseEvent
	{
		
		/**
		 *  GetHotelsListEvent. Constructor.
		 */
		public function GetHotelsListEvent(type:String)
		{
			super(type);
		}
	}
}