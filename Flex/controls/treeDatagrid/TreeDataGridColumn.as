package com.controls.treeDatagrid
{
	import com.controls.treeDatagrid.renderer.TreeColumnItemRenderer;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.core.ClassFactory;
	
	public class TreeDataGridColumn extends AdvancedDataGridColumn
	{
		private var _childDataField:String;
		
		public function TreeDataGridColumn(columnName:String=null)
		{
			super(columnName);
			
			//sortable=false;
			draggable=false;
			
			itemRenderer = new ClassFactory(TreeColumnItemRenderer);
		}
		
		public function get childDataField():String
		{
			return _childDataField;
		}

		public function set childDataField(value:String):void
		{
			_childDataField = value;
		}
	}
}