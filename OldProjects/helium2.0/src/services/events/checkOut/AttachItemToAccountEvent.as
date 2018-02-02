package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class AttachItemToAccountEvent extends BaseEvent
	{
		// ===================================================================== //
		//                        VARIABLES AND CONSTANTS                        //
		// ===================================================================== //
		/**
		 *  This property is id of account.
		 */
		private var _accountId:Number;
		/**
		 *  This property is type of account.
		 */
		private var _accountType:int;
		/**
		 *  This property is id of payment line.
		 */
		private var _paymentLineId:Number;
		/**
		 *  This property is id of attaching item.
		 */
		private var _itemIds:Array = [];
		
		// ===================================================================== //
		//                      COMMON METHODS AND HANDLERS                      //
		// ===================================================================== //
		/**
		 *  AttachItemToAccountEvent. Constructor.
		 *
		 *  @param type:String — The type of the event, accessible as BaseEvent
		 */
		public function AttachItemToAccountEvent(type:String)
		{
			super(type);
		}
		
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  Id of account.
		 */
		public function get accountId():Number
		{
			return _accountId;
		}
		/**
		 *  @private
		 */
		public function set accountId(value:Number):void
		{
			_accountId = value;
		}
		
		/**
		 *  Type of account.
		 */
		public function get accountType():int
		{
			return _accountType;
		}
		/**
		 *  @private
		 */
		public function set accountType(value:int):void
		{
			_accountType = value;
		}
		
		/**
		 *  Id of payment line.
		 */
		public function get paymentLineId():Number
		{
			return _paymentLineId;
		}
		/**
		 *  @private
		 */
		public function set paymentLineId(value:Number):void
		{
			_paymentLineId = value;
		}
		
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