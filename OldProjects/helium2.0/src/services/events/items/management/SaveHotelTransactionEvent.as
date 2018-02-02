package services.events.items.management
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.HotelItemVO;

	public class SaveHotelTransactionEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of the hotel.
		 */
		private var _hotelId:Number;
		/**
		 *  This property contain item as transaction.
		 *  
		 *  @default new HotelItemVO()
		 *  
		 *  @see services.vo.backend.HotelItemVO
		 */
		private var _item:HotelItemVO = new HotelItemVO();
		/**
		 *  This property contain id of sub group for which transaction will be
		 *  stored.
		 */
		private var _groupId:Number;
		/**
		 *  This property contain index of the item in transaction list.
		 */
		private var _index:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteSystemArticleEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function SaveHotelTransactionEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of the hotel.
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
		 *  Iitem as transaction.
		 */
		public function get item():HotelItemVO
		{
			return _item;
		}
		/**
		 *  @private
		 */
		public function set item(value:HotelItemVO):void
		{
			_item = value;
		}
		
		/**
		 *  Id of sub group for which transaction will be stored.
		 */
		public function get groupId():Number
		{
			return _groupId;
		}
		/**
		 *  @private
		 */
		public function set groupId(value:Number):void
		{
			_groupId = value;
		}
		
		/**
		 *  The index of the item in transaction list.
		 */
		public function get index():int
		{
			return _index;
		}
		/**
		 *  @private
		 */
		public function set index(value:int):void
		{
			_index = value;
		}
	}
}