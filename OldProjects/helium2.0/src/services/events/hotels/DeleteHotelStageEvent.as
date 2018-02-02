package services.events.hotels
{
	import services.cairngorm.BaseEvent;

	public class DeleteHotelStageEvent extends BaseEvent
	{
		public var stageIndex:int;
		
		public function DeleteHotelStageEvent(type:String)
		{
			super(type);
		}
		
	}
}