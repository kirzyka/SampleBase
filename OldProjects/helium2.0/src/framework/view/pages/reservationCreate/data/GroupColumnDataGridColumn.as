package framework.view.pages.reservationCreate.data
{
	import framework.view.pages.reservationCreate.renderer.GroupColumnDataGridItemRenderer;
	
	import mx.controls.dataGridClasses.DataGridColumn;

	public class GroupColumnDataGridColumn extends DataGridColumn
	{
		public var headers:Array = new Array(); //String
		
		public function GroupColumnDataGridColumn(columnName:String=null)
		{
			super(columnName);
			this.sortable = false;
		}

	}
}