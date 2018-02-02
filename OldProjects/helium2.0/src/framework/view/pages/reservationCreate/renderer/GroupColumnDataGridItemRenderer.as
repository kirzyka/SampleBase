package framework.view.pages.reservationCreate.renderer
{
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Label;

	public class GroupColumnDataGridItemRenderer extends HBox
	{		
		public var dataFields:Array = new Array(); //String
		private var cellLabels:Array = new Array(); //Label	
		
		public function GroupColumnDataGridItemRenderer()
		{
			super();
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			for (var i:int = dataFields.length-1; i>-1; i--)
			{
				if(i > 0)
				{
					var cellSep:VBox = new VBox();
					cellSep.percentHeight = 100;
					this.addChild(cellSep);
				}
				var cell:Label = new Label();
				cell.percentWidth = 100;
				cellLabels.push(cell);
				this.addChild(cell);
			}
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			for(var i:int = 0; i<dataFields.length; i++)
			{
				(cellLabels[i] as Label).text = data[dataFields[i]];
			}
		}
	}
}