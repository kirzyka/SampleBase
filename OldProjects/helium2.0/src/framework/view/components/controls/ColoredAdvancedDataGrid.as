package framework.view.components.controls
{
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.HierarchicalData;
	import mx.controls.AdvancedDataGrid;
	import mx.managers.ToolTipManager;

	public class ColoredAdvancedDataGrid extends AdvancedDataGrid
	{
		public var rowColorFunction:Function;
		
		public function ColoredAdvancedDataGrid()
		{
			
			super();
		}
		
		/* override public function setSt
		{
			showDataTips
		} */
		
		
		/**
		 *  @override
		 */
		 
		override protected function drawRowBackground(s:Sprite,
			rowIndex:int, y:Number, height:Number, color:uint, dataIndex:int):void
		{
			if(rowColorFunction != null && dataProvider)
			{
				var item:Object;
				 if (dataProvider is ArrayCollection)
				{
					if(dataIndex < dataProvider.length)
					{
						item = dataProvider[dataIndex];
					}
				}
				
				if (dataProvider is HierarchicalData)
				{
					if(dataIndex < (dataProvider as HierarchicalData).source.length)
					{
						item = dataProvider.source[dataIndex];
					}
				}
				
				if (dataProvider is HierarchicalCollectionView)
				{
					if(dataIndex < (dataProvider as HierarchicalCollectionView).length)
					{
						item = dataProvider.source.source[dataIndex];
					}
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