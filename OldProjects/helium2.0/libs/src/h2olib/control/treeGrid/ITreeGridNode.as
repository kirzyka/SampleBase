package h2olib.control.treeGrid 
{
	
	import mx.collections.ListCollectionView;
	import mx.collections.ICollectionView;
	
	/**
	 * Interface implemeted by an item that can be displayed in
	 * a TreeGrid.
	 * 
	 * @see flex.custom.TreeGrid
	 * @see flex.custom.TreeGridCellRenderer
	 */
	public interface ITreeGridNode 
	{
		
		/**
		 * Number of levels this node is indented.
		 */
		function get indentLevel():Number;
		
		/**
		 * Set the indent level.
		 */
		function set indentLevel(level:Number):void;
		
		/**
		 * Indicates if the nodes children are shown.
		 */
		function get open():Boolean;
		
		/**
		 * Collection of child nodes.
		 */
		function get children():ICollectionView;
		
		/**
		 * Toggles a node between open and closed.
		 */
		function toggleOpen():void;
	}
}