package services.vo.backend
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	import services.vo.hotels.HotelRoomObjectVO;
	import services.vo.hotels.HotelRoomStatusVO;
	/**
	* The RoomWithStatusVO class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	 
	[RemoteClass(alias="MapRoomWithStatus")]
	[Bindable]
	public class RoomWithStatusVO implements IValueObject
	{
   		public var oRoom:HotelRoomObjectVO;
   		public var oRoomType:RoomTypesObjectVO;
  		public var sRoomStatus:String; 
  		public var oHousekeepStatus:HotelRoomStatusVO;
  		public var oReservationStatus:ReservationRoomStatusVO;
  		public var sGuestName:String;
  		
  		[Transient]
  		public var bEditStatus:Boolean = true;
	}
}