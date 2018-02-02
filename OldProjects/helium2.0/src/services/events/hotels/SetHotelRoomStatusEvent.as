package services.events.hotels
{
	import services.cairngorm.BaseEvent;
	import services.vo.hotels.HotelRoomStatusVO;
	
	/**
	* The SetHotelRoomStatusEvent class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SetHotelRoomStatusEvent extends BaseEvent
	{
		public var iRoomId:int;
		public var oHotelRoomStatus:HotelRoomStatusVO;
		public var sDate:String;
		
		public function SetHotelRoomStatusEvent(type:String)
		{
			super(type);
		}
		
	}
}