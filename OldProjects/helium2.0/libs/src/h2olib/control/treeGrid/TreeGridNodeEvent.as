package h2olib.control.treeGrid 
{
	
	import flash.events.Event;

	/**
	 * Events that
	 */
	public class TreeGridNodeEvent extends Event 
	{
		
		/** Static constant for node open event */
		public static const NODE_OPEN:String = "treeGridNodeOpen";
		
		/** Static constant for node close event */
		public static const NODE_CLOSE:String = "treeGridNodeClose";
		
		/** Node event refers to */
		public var node:ITreeGridNode;
		
		/**
		 * Create a TreeGridNodeEvent of the given type.
		 */
		public function TreeGridNodeEvent(eventType:String, node:ITreeGridNode):void 
		{
			super(eventType);
			this.node = node;
		}
	}
}