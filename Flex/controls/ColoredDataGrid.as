package framework.view.components.controls
{
	import flash.display.Sprite;
	
	import mx.controls.DataGrid;

	public class ColoredDataGrid extends DataGrid
	{
		public var rowColorFunction:Function;
		
		public function ColoredDataGrid()
		{
			super();
		}
		
		/**
		 *  @override
		 */
		override protected function drawRowBackground(s:Sprite,
			rowIndex:int, y:Number, height:Number, color:uint, dataIndex:int):void
		{
			if(rowColorFunction != null && dataProvider)
			{
				var item:Object;
				if(dataIndex < dataProvider.length)
				{
					item = dataProvider[dataIndex];
				}
				if(item)
				{
					color = rowColorFunction(item, rowIndex, dataIndex, color);
				}
			}
			
			super.drawRowBackground(s, rowIndex, y, height, color, dataIndex);
		}
	}
}