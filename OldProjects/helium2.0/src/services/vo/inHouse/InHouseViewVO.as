package services.vo.inHouse
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapInHouseView")]
	public class InHouseViewVO extends MapValueObject
	{
		public static const TYPE_NORMAL:int = 1;
		public static const TYPE_VIRTUAL:int = 2;
		public static const TYPE_CONFERENCE:int = 3;
		/**
		 *  This property is type of inhouse state.
		 */
		public var iType:int;
		/**
		 *  This property is id of person profile of guest.
		 *  
		 *  @default 0
		 */
		public var lProfileId:Number = 0;
		/**
		 *  This property is id of company by guest.
		 *  
		 *  @default 0
		 */
		public var lCompanyId:Number = 0;
		/**
		 *  This property is id of room by guest.
		 *  
		 *  @default 0
		 */
		public var lRoomId:Number = 0;
		/**
		 *  This property is id of travel agency by guest.
		 *  
		 *  @default 0
		 */
		public var lTravelAgencyId:Number = 0;
		/**
		 *  This property is id of order.
		 *  
		 *  @default 0
		 */
		public var lOrderId:Number = 0;
		
		/**
		 *  This property is id reservation.
		 *  
		 *  @default 0
		 */
		public var lReservationNumber:Number = 0;
		/**
		 *  This property is <code>true</code> if company is travel
		 *  agency.
		 *  
		 *  @default fasle
		 */
		public var bIsTa:Boolean = false;
		/**
		 *  This property is room number.
		 */
		public var sRoomNumber:String;
		/**
		 *  This property is name of guest.
		 */
		public var sGuestName:String;
		/**
		 *  This property is arrival date by guest.
		 */
		public var dArrivalDate:String;
		/**
		 *  This property is departure date by guest.
		 */
		public var dDepartureDate:String;
		/**
		 *  This property is company name.
		 */
		public var sCompany:String;
		/**
		 *  This property is travel agency.
		 */
		public var sTravelAgency:String;
		/**
		 *  This property is name of group (if reservation is group).
		 */
		public var sGroup:String;
		/**
		 *  This property is list with unread messadges for guset.
		 */
		public var aUnreadMessages:Array = [];
		
		[Transient]
		public var sEmpty:String = "";
	}
}