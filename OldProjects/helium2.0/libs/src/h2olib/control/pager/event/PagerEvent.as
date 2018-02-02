package h2olib.control.pager.event
{
	import flash.events.Event;

	public class PagerEvent extends Event
	{
		public static var PAGE_CHANGE:String = "pageChange";
		/**
		 *  This property contain index of selected page.
		 */
		protected var _index:int;
		/**
		 *  This property contain label of selected page.
		 */
		protected var _label:String;
		/**
		 *  This property contain count of items on the page.
		 */
		protected var _count:int;
		
		/**
		 *  PagerEvent. Constructor.
		 */
		public function PagerEvent(type:String)
		{
			super(type, false, false);
		}
		/**
		 *  @override
		 */
		override public function clone():Event
		{
			return new PagerEvent(type);
		}
		
		/**
		 *  Index of selected page.
		 */
		public function get label():String
		{
			return _label;
		}
		/**
		 *  @private
		 */
		public function set label(value:String):void
		{
			_label = value;
		}
		
		/**
		 *  Index of selected page.
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
		
		/**
		 *  The count of items on the page.
		 */
		public function get count():int
		{
			return _count;
		}
		/**
		 *  @private
		 */
		public function set count(value:int):void
		{
			_count = value;
		}
	}
}