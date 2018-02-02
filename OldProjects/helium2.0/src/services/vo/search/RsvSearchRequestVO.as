package services.vo.search
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapRsvSearchRequest")]
	[Bindable]
	public class RsvSearchRequestVO implements IValueObject
	{
		public  static const SEARCH_TYPE_ALL:int = 1;
		public  static const SEARCH_TYPE_INDIVIDUAL:int = 2;
		public  static const SEARCH_TYPE_GROUP:int = 3;		
		
		public var iHotelId:int;
		public var sStartDate:String;
		public var sEndDate:String;
		public var sConfirmationCode:String;
		public var sCallerName:String;
		public var sCompanyName:String;
		public var sTravelAgencyName:String;
		public var sRoomName:String;
		public var sGuestName:String;
		public var sCity:String;
		public var sZip:String;
		public var sStreet:String;
		public var iReservationType:int = 1;
		
		public var iCurrentPage:int    		= 1;
  		public var iResultsPerPage:int		= 25;
	}
}