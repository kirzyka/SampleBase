package services.events.hotels
{
	import services.cairngorm.BaseEvent;
	import services.vo.hotels.HotelStageObjectVO;

	public class SetHotelFloorNameEvent extends BaseEvent
	{
		public var stage:HotelStageObjectVO = new HotelStageObjectVO();
		
		public function SetHotelFloorNameEvent(type:String)
		{
			super(type);
		}
		
	}
}