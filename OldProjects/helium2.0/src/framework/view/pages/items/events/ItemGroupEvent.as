package framework.view.pages.items.events
{
	import flash.events.Event;

	public class ItemGroupEvent extends Event
	{
		public static var ITEM_GROUP_SELECTED:String = "itemGroupEvent";
		/**
		 *  Thsi property contain selected state of item.
		 */
		public var isSelected:Boolean;
		
		public function ItemGroupEvent(type:String, selected:Boolean = false)
		{
			super(type, bubbles, cancelable);
			isSelected = selected;
		}
		/**
		 *  @override Event.clone()
		 *  Duplicates an instance of an ItemGroupEvent subclass.
		 */
		public override function clone():Event 
		{ 
			return new ItemGroupEvent(type, isSelected);
		}
		/**
		 *  Returns a string containing all the properties of the
		 *  ItemGroupEvent object.
		 */
		public override function toString():String 
		{ 
			return formatToString("ItemGroupEvent", "type", "isSelected", "eventPhase"); 
		}
	}
}