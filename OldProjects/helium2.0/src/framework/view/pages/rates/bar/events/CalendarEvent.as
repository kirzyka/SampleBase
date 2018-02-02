package framework.view.pages.rates.bar.events
{
	import flash.events.Event;
	
	import framework.view.pages.rates.bar.subview.BARCalendarItemView;

	public class CalendarEvent extends Event
	{
		public static var CREATION_COMPLETE:String = "creationCompleteEvent";
		public static var ITEM_SELECT:String = "itemSelect";
		/**
		 *  This property contain selected cell.
		 */
		protected var _cell:BARCalendarItemView;
		
		public function CalendarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		/**
		 *  The selected cell.
		 */
		public function get cell():BARCalendarItemView
		{
			return _cell;
		}
		/**
		 *  @private
		 */
		public function set cell(value:BARCalendarItemView):void
		{
			_cell = value;
		}
		
	}
}