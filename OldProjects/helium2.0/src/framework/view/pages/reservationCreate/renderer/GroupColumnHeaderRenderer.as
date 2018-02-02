package framework.view.pages.reservationCreate.renderer
{
	import framework.view.pages.reservationCreate.data.GroupColumnDataGridColumn;
	
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.HRule;
	import mx.controls.Label;

	public class GroupColumnHeaderRenderer extends VBox
	{
		private var groupHeaderLabel:Label = new Label();
		private var separator:HRule = new HRule();
		private var groupBox:HBox = new HBox();
		private var columnHeaders:Array = new Array(); //String
		
		public function GroupColumnHeaderRenderer()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			this.setStyle("horizontalAlign", "center");
			this.setStyle("horizontalGap", "0");
			
			this.setStyle("verticalGap", "0");
			this.setStyle("paddingLeft", "0");
			this.setStyle("paddingRight", "0");
			this.setStyle("paddingTop", "0");
			this.setStyle("paddingBottom", "0");
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			//groupHeaderLabel.percentWidth = 100;			
			this.addChild(groupHeaderLabel);
			
			separator.percentWidth = 100;
			this.addChild(separator);
			
			groupBox.percentWidth = 100;
			this.addChild(groupBox);
			
			/*for (var i:int = columnHeaders.length-1; i>-1; i--)
			{
				if(i > 0)
				{
					var columnSep:VBox = new VBox();
					columnSep.percentHeight = 100;
					groupBox.addChild(columnSep);
				}
				var columnHeaderLabel:Label = new Label();
				columnHeaderLabel.percentWidth = 100;
				columnHeaderLabel.text = columnHeaders[i].toString();
				groupBox.addChild(columnHeaderLabel);
			}*/
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			columnHeaders = (data as GroupColumnDataGridColumn).headers;
		}
		
		override protected function measure():void
		{
			super.measure();
		}
		
	}
}