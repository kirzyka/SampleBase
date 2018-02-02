package services.events.items.management
{
	import services.cairngorm.BaseEvent;

	public class DeleteSystemTransactionEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of sub group for which transaction will be
		 *  removed.
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
		public function DeleteSystemTransactionEvent(type:String)
		{
			super(type);
		}
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of sub group for which transaction will be removed.
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
		 *  This property contain index of the item in transaction list.
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