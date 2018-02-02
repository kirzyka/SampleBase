package framework.view.pages.reservationCreate.data
{
	import mx.controls.DateField;
	
	import services.vo.GlobalSettings;
	
	[Bindable]
	public class GroupBasketItem
	{
		public function GroupBasketItem()
		{
		}
		
  		public var sStartDate:String;
 		public var sEndDate:String;
  		public var iRateType:int;
  		public var iRoomTypeId:int;
		public var iRateId:int;
		public var iBarId:int;
		public var iCompanyRateId:int;
		public var iPackageRateId:int;
		public var sRoomTypeFullName:String;
  		public var nPrice:Number;
		
		public var iRoomCount:int;
		public var iAdults:int;
		public var iChildAbove:int;
		public var iChildMiddle:int;
		public var iChildBefore:int;

  		public function get sStartDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sStartDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}
  		public function get sEndDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sEndDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}		
	}
}