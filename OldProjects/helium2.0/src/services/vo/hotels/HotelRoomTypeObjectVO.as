package services.vo.hotels
{
	import services.vo.backend.RoomTypesObjectVO;
	
	[Bindable]
	[RemoteClass(alias="MapRoomTypeHtl")]
	public class HotelRoomTypeObjectVO
	{
		public var iId:Number;
  		public var iHotelId:Number;
  		public var iRoomTypeId:Number;
  		public var iRoomCapacity:Number;
  		public var iLocaleId:Number = 0;
  		public var sLocale:String = '';
  		public var bDefaultRoomType:Boolean = false;
  		public var oRoomType:RoomTypesObjectVO = new RoomTypesObjectVO();
	}
}