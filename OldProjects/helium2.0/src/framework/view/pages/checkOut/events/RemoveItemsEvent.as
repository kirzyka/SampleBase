package framework.view.pages.checkOut.events
{
	import flash.events.Event;
	import mx.collections.ArrayCollection;

	public class RemoveItemsEvent extends Event
	{
		public static const REMOVE_ITEMS_FROM_ACCOUNT:String = "removeItemsFromAccount";
		public static const SHOW_PACKAGE_ITEMS:String = "showPackageItems";
		
		/**
		 *  This property is id of view with attached items.
		 */
		private var _id:Number;
		/**
		 *  This property is list with removed items from account.
		 */
		private var _items:ArrayCollection;
		/**
		 *  This property is <code>true</code> if view with attached
		 *  items is empty.
		 *  
		 *  @default false
		 */
		private var _isRemoveView:Boolean = false;
		
		public var paymentId:Number;
		
		public function RemoveItemsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var clone:RemoveItemsEvent = new RemoveItemsEvent(type);
			clone.isRemoveView = _isRemoveView;
			clone.items = _items;
			return clone;
		}
		
		/**
		 *  Id of view with attached items.
		 */
		public function get id():Number
		{
			return _id;
		}
		/**
		 *  @private
		 */
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 *  The list with removed items from account.
		 */
		public function get items():ArrayCollection
		{
			return _items;
		}
		/**
		 *  @private
		 */
		public function set items(value:ArrayCollection):void
		{
			_items = value;
		}
		
		/**
		 *  Empty state of view with attached items.
		 */
		public function get isRemoveView():Boolean
		{
			return _isRemoveView;
		}
		/**
		 *  @private
		 */
		public function set isRemoveView(value:Boolean):void
		{
			_isRemoveView = value;
		}
	}
}