package framework.view.pages.checkOut.events
{
	import flash.events.Event;

	public class ItemRoutingEvent extends Event
	{
		public static const ITEM_SELECTED:String = "itemSelected";
		public static const ADDED_PRICE:String = "addedPrice";
		
		public var item:Object;
		public var isSelected:Boolean = false;
		public var price:Number = 0; 
		public var isAdjust:Boolean = false;
		public var comment:String;
		
		public function ItemRoutingEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var clone:ItemRoutingEvent = new ItemRoutingEvent(type);
			clone.isSelected = isSelected;
			return clone;
		}
	}
}