package services.events.hotels
{
	import services.cairngorm.BaseEvent;
	import services.vo.hotels.HotelInfoTotalVO;

	public class UpdateHotelInfoEvent extends BaseEvent
	{
		
		//public var hotelTotalInfo:HotelInfoTotalVO = new HotelInfoTotalVO();
		
		public var isEdit:Boolean = false;
		public var hotelIndex:int = 0;
		public var pageIndex:int = 0;
		public var hotelTotalInfo:HotelInfoTotalVO;
		
		public function UpdateHotelInfoEvent(type:String)
		{
			super(type);
		}
		
	}
}