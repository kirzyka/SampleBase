package services.vo.hotels
{
	import services.vo.MapValueObject;
	
	[Bindable]
	[RemoteClass(alias="MapHotel")]
	public class HotelInfoTotalVO extends MapValueObject
	{
		/**
		 *  This property is id of the hotel.
		 *  
		 *  @default 0
		 */
		public var iHotelId:int = 0;
		/**
		 *  This property is hotel's region by country.
		 *  
		 *  @default 0
		 */
		public var iHotelRegionId:int = 0;
		/**
		 *  This property is status of the hotel.
		 *  
		 *  @default 0
		 */
		public var iHotelStatusId:int = 0;
		/**
		 *  This property is id of the chain which included
		 *  the hotel.
		 *  
		 *  @default 0
		 */
		public var iHotelHChainId:int = 0;
		/**
		 *  This property is id of description for hotel.
		 *  
		 *  @default 0
		 */
		public var iHotelDescriptionLocaleId:int = 0;
		/**
		 *  This property is time when last be updated.
		 *  
		 *  @default ""
		 */
		public var sHotelLastUpdateTime:String = "";
		/**
		 *  This property is the number of rooms into the
		 *  hotel.
		 *  
		 *  @default 0
		 */
		public var iHotelRoomCount:int = 0;
		/**
		 *  This property is unique code of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelCode:String = "";
		/**
		 *  This property is id of zip code for the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelZip:String = "";
		/**
		 *  This property is name of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelName:String = "";
		/**
		 *  This property is country where placed hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelCountry:String = "";
		/**
		 *  This property is region where placed hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelRegion:String = "";
		/**
		 *  This property is hotel's city by region.
		 *  
		 *  @default ""
		 */
		public var sHotelCity:String = "";
		/**
		 *  This property is hotel's city by region.
		 *  
		 *  @default 0
		 */
		public var iHotelCityId:int = 0;
		/**
		 *  This property is hotel's street by city.
		 *  
		 *  @default ""
		 */
		public var sHotelStreet:String = "";
		/**
		 *  This property is phone of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelPhone:String = "";
		/**
		 *  This property is fax of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelFax:String = "";
		/**
		 *  This property is e-mail of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelEMail:String = "";
		/**
		 *  This property is web site of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelWeb:String = "";
		/**
		 *  This property is manager's name of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelGMName:String = "";
		/**
		 *  This property is some description of the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelDescription:String = "";
		/**
		 *  This property is name of the chain which included
		 *  the hotel.
		 *  
		 *  @default ""
		 */
		public var sHotelHChainName:String = "";
		/**
		 *  This property is name who last make update.
		 *  
		 *  @default ""
		 */
		public var sHotelLastUpdaterName:String = "";
		/**
		 *  This property is id of detailed location.
		 *  
		 *  @default 0
		 */
		public var iLocDetailId:int = 0;
		/**
		 *  Child types (before/middle/after).
		 *  
		 *  @default 0
		 */
		public var iChildAge1:int = 0;
		public var iChildAge2:int = 0;
		public var iChildAge3:int = 0;
		
		[Transient]
		/**
		 *  This property is true if item's state is check and
		 *  false  - if not.
		 *  <p><b>Note:</b> it needs for check state of item by update.
		 *  <p><b>Note:</b> this info doesn't receive from server.
		 */
		public var bIsSelected:Boolean = false;
	}
}