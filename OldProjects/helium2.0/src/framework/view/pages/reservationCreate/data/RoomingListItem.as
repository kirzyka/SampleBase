package framework.view.pages.reservationCreate.data
{
	import mx.controls.DateField;
	
	import services.vo.GlobalSettings;
	import services.vo.hotels.HotelRoomObjectVO;
	import services.vo.profiles.CompanyProfileVO;
	import services.vo.profiles.ProfilePersonalVO;
	
	[Bindable]
	public class RoomingListItem
	{
		public var iId:int;
		public var iOrderId:int;
		public var oHotelRoom:HotelRoomObjectVO;// room entity
		public var oProfile:ProfilePersonalVO = new ProfilePersonalVO(); 
		public var sArrivalDate:String;										
		public var sDepartureDate:String;									
		public var iRoomType:int;
		public var iAdultsTotal:int;
		public var iChildBefore:int;
		public var iChildMiddle:int;
		public var iChildAbove:int;
		public var oCompany:CompanyProfileVO = new CompanyProfileVO();
		public var sConfirmNumber:String;
		
		public var parentId:int;
		public var children:Array;
		
		private var _label:String = "";
		[Transient]
		public function get label():String
		{
			var result:String = _label;
			if(oProfile != null && _label == "")
			{
				result = oProfile.sSurname + " " + oProfile.sName;
			}
			
			return result;
		}
		public function set label(value:String):void
		{
			_label = value;
		}
		
		[Transient]
		public var bIsSelected:Boolean;
		
  		[Transient]
  		public function get sStartDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sArrivalDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}
  		[Transient]
  		public function get sEndDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sDepartureDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}		
	}
}