package services.events.inHouse
{
	import services.cairngorm.BaseEvent;
	import services.vo.inHouse.InHouseSearchVO;

	public class GetInHouseStateEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is id of hotel.
		 */
		private var _hotelId:Number;
		/**
		 *  This property is search pattern for in house state.
		 */
		private var _searchPattern:InHouseSearchVO;
		/**
		 *  This property is number of current active in system page.
		 */
		private var _page:int;
		/**
		 *  This property is count of items onto current active page.
		 */
		private var _count:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetInHouseStateEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetInHouseStateEvent(type:String)
		{
			super(type);
		}
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of hotel.
		 */
		public function get hotelId():Number
		{
			return _hotelId;
		}
		/**
		 *  @private
		 */
		public function set hotelId(value:Number):void
		{
			_hotelId = value;
		}
		
		/**
		 *  Search pattern for in house state.
		 */
		public function get searchPattern():InHouseSearchVO
		{
			return _searchPattern;
		}
		/**
		 *  @private
		 */
		public function set searchPattern(value:InHouseSearchVO):void
		{
			_searchPattern = value;
		}
		
		/**
		 *  Number of current active in system page.
		 */
		public function get page():int
		{
			return _page;
		}
		/**
		 *  @private
		 */
		public function set page(value:int):void
		{
			_page = value;
		}
		
		/**
		 *  Count of items onto current active page.
		 */
		public function get count():int
		{
			return _count;
		}
		/**
		 *  @private
		 */
		public function set count(value:int):void
		{
			_count = value;
		}
	}
}