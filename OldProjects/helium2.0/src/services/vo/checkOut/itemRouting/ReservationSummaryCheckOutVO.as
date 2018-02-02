package services.vo.checkOut.itemRouting
{
	[RemoteClass(alias="MapReservationSummaryCheckOut")]
	[Bindable]
	public class ReservationSummaryCheckOutVO
	{
		/**
		 *  This property is id of room by guest.
		 *  
		 *  @default 0
		 */
		public var lRoomId:Number = 0;
		/**
		 *  This property is name of guest.
		 */
		public var sGuestName:String;
		/**
		 *  This property is name of company.
		 */
		public var sCompanyName:String;
		/**
		 *  This property is name of travel agency.
		 */
		public var sTravelAgency:String;
		/**
		 *  This property is number of room.
		 */
		public var sRoomNumber:String;
		/**
		 *  This property is count of adults.
		 *  
		 *  @default 0
		 */
		public var iAdultsCount:int = 0;
		/**
		 *  This property is count of children < X.
		 *  
		 *  @default 0
		 */
		public var iChildrenAbove:int = 0;
		/**
		 *  This property is count of children < Y.
		 *  
		 *  @default 0
		 */
		public var iChildrenMiddle:int = 0;
		/**
		 *  This property is count of children > Y.
		 *  
		 *  @default 0
		 */
		public var iChildrenBefore:int = 0;
		/**
		 *  This property is room type.
		 */
		public var sRoomType:String;
		/**
		 *  This property is arrival date.
		 */
		public var dArrivalDate:String;
		/**
		 *  This property is departure date.
		 */
		public var dDepartureDate:String;
		/**
		 *  This property is name o rate.
		 */
		public var sRateName:String;
		/**
		 *  This property is id of confirmation.
		 *  <p><b>Note:</b>it heed for server side.
		 *  
		 *  @default 0
		 */
		public var lConfirmationId:Number = 0;
		/**
		 *  This property is id of salutation.
		 *  
		 *  @default 0
		 */
		public var lSalutationNameId:Number = 0;
		/**
		 *  This property is id of language.
		 *  
		 *  @default 0
		 */
		public var lLanguageId:Number = 0;
	}
}