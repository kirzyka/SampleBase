package framework.module
{
	import mx.collections.ArrayCollection;
	
	import services.vo.inHouse.ConferenceRoomStateVO;
	
	[Bindable]
	public class InHouseModule
	{
		// ================================================================= //
		//                           VARIABLES                               //
		// ================================================================= //
		/**
		 *  This property contain current active page (tab).
		 *  
		 *  @default 0
		 */
		public var currPage:int = 0;
		
		public var inHouseGuestsCount:int = 0;
		
		public var deliverDateTime:String;
		
		public var availableRooms:/* AvailableRoomsVO */ArrayCollection = new ArrayCollection();
		
		public var isCheckOut:Boolean = false;
		
		/**
		 *  This property is list of hotel guests lived in the hotel now.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see framework.vo.inHouse.InHouseViewVO
		 */
		private var _inHouseGuests:/* InHouseViewVO */ArrayCollection = new ArrayCollection();
		/**
		 *  This property is state of conference room.
		 *  
		 *  @default new ConferenceRoomStateVO()
		 *  
		 *  @see framework.vo.inHouse.ConferenceRoomStateVO
		 */
		private var _conferenceRoomState:ConferenceRoomStateVO = new ConferenceRoomStateVO();
		
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  The list of hotel guests lived in the hotel now.
		 */
		public function get inHouseGuests():ArrayCollection
		{
			return _inHouseGuests;
		}
		/**
		 *  @private
		 */
		public function set inHouseGuests(value:ArrayCollection):void
		{
			_inHouseGuests = value;
		}
		
		/**
		 *  The state of conference room.
		 */
		public function get conferenceRoomState():ConferenceRoomStateVO
		{
			return _conferenceRoomState;
		}
		/**
		 *  @private
		 */
		public function set conferenceRoomState(value:ConferenceRoomStateVO):void
		{
			_conferenceRoomState = value;
		}
		
		public var roomId:Number;
	}
}