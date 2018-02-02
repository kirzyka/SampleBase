package h2olib.control.treeGrid
{
	import flash.events.Event;

	public class TreeGirdDataProviderEvent extends Event
	{
		/** Static constant for sort event */
		public static const SORT:String = "treeGridDataProbviderSort";

		/**
		 * Create a TreeGirdDataProviderEvent of the given type.
		 */
		public function TreeGirdDataProviderEvent(eventType:String):void 
		{
			super(eventType);
		}
	}
}