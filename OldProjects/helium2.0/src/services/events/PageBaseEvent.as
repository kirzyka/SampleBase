package services.events
{
	import services.cairngorm.BaseEvent;
	
	public class PageBaseEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is pattern for search. If pattern is "",  get
		 *  all records.
		 *  
		 *  @default ""
		 */
		private var _pattern:String = "";
		/**
		 *  This property is index of the page.
		 */
		private var _page:int;
		/**
		 *  This property is the number of records onto the page.
		 */
		private var _count:int;
		
		/**
		 *  PagerEvent. Constructor.
		 *
		 *  @param type:String — The type of the event, accessible as PagerEvent
		 */
		public function PageBaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  The pattern for search.
		 */
		public function get pattern():String
		{
			return _pattern;
		}
		/**
		 *  @private
		 */
		public function set pattern(value:String):void
		{
			_pattern = value;
		}
		
		/**
		 *  The index of the page.
		 */
		public function get page():int
		{
			return _page;
		}
		/**
		 *  @private
		 */
		public function set page(value:int):void
		{
			_page = value;
		}
		
		/**
		 *  The number of records onto the page.
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