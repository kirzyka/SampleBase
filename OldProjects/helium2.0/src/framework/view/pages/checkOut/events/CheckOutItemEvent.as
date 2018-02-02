package framework.view.pages.checkOut.events
{
	import services.cairngorm.BaseEvent;

	public class CheckOutItemEvent extends BaseEvent
	{
		// ===================================================================== //
		//                         VARIABLES AND CONSTANTS                       //
		// ===================================================================== //
		/**
		 *  This proeprty is id of attached view by account.
		 *  
		 *  @default -1
		 */
		private var _attachedId:Number = -1;
		/**
		 *  This property is <code>true</code> if item will be adjusted
		 *  from attached view.
		 *  
		 *  @default false
		 */
		private var _bAttached:Boolean = false;
		
		// ===================================================================== //
		//                      COMMON HANDLERS AND METHODS                      //
		// ===================================================================== //
		/**
		 *  CheckOutEvent. Constructor.
		 *  
		 *  @param type:String — The type of the event, accessible as BaseEvent.
		 *  
		 *  @see services.events.BaseEvent
		 */
		public function CheckOutItemEvent(type:String)
		{
			super(type);
		}
		
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  State of request from (main or attached view).
		 */
		public function get isAttached():Boolean
		{
			return _bAttached;
		}
		/**
		 *  @private
		 */
		public function set isAttached(value:Boolean):void
		{
			_bAttached = value;
		}
		
		/**
		 *  Id of attached view by account.
		 */
		public function get attachedId():Number
		{
			return _attachedId;
		}
		/**
		 *  @private
		 */
		public function set attachedId(value:Number):void
		{
			_attachedId = value;
		}
	}
}