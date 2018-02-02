package services.vo.frontend
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	import services.vo.hotels.HotelInfoTotalVO;
	
	[RemoteClass(alias="MapUserHotels")]
	[Bindable]
	public class UserHotelsVO implements IValueObject
	{
		public var oHotel:HotelInfoTotalVO;
		public var oRole:RoleVO;
	}
}