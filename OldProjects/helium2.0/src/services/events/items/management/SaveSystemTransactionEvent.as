package services.events.items.management
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.HotelItemVO;

	public class SaveSystemTransactionEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
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
		private var _sysGroupId:Number;
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
		public function SaveSystemTransactionEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
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
		public function get sysGroupId():Number
		{
			return _sysGroupId;
		}
		/**
		 *  @private
		 */
		public function set sysGroupId(value:Number):void
		{
			_sysGroupId = value;
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