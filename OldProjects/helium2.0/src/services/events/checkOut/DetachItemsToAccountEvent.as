package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class DetachItemsToAccountEvent extends BaseEvent
	{
		// ===================================================================== //
		//                        VARIABLES AND CONSTANTS                        //
		// ===================================================================== //
		/**
		 *  This property is id of attaching item.
		 */
		private var _itemIds:Array = [];
		
		// ===================================================================== //
		//                      COMMON METHODS AND HANDLERS                      //
		// ===================================================================== //
		/**
		 *  DetachItemToAccountEvent. Constructor.
		 *
		 *  @param type:String — The type of the event, accessible as BaseEvent
		 */
		public function DetachItemsToAccountEvent(type:String)
		{
			super(type);
		}
		
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  Id of attaching items.
		 */
		public function get itemIds():Array
		{
			return _itemIds;
		}
		/**
		 *  @private
		 */
		public function set itemIds(value:Array):void
		{
			_itemIds = value;
		}
	}
}