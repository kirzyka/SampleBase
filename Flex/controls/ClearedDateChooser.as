package com.controls
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateChooser;
	import mx.core.mx_internal;
	import mx.events.CalendarLayoutChangeEvent;
	
	import spark.components.Button;
	
	use namespace mx_internal;
	
	public class ClearedDateChooser extends DateChooser
	{
		public var clearButtonLabel:String = "";
		
		private var _clearButton:Button;		

		public function ClearedDateChooser()
		{
			super();
		}

		override protected function createChildren():void
		{
			super.createChildren();

			if (!_clearButton)
			{
				_clearButton = new Button();
				_clearButton.width = 60;
				_clearButton.height = 18;
				_clearButton.label = clearButtonLabel;//StringConstants.BTN_CLEAR;
				//_clearButton.setStyle("icon", AllImages.CLEAR_ICON);
				_clearButton.setStyle("paddingLeft", 0);
				_clearButton.setStyle("paddingRight", 0);
				_clearButton.setStyle("paddingTop", 0);
				_clearButton.setStyle("paddingBottom", 0);
				_clearButton.toolTip = "Clear date";
				addChild(_clearButton);

				_clearButton.addEventListener(MouseEvent.CLICK, onClearButtonClick);
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);


			if (_clearButton)
			{
				var borderThickness:Number = getStyle("borderThickness");
				var pr:Number = dateGrid.getStyle("paddingRight");
				var cw:Number = _clearButton.width;
				var ch:Number = _clearButton.height;
				_clearButton.setActualSize(cw, ch);

				_clearButton.x = unscaledWidth - cw - borderThickness - pr;
				_clearButton.y = unscaledHeight - ch - borderThickness - 5;
			}
		}
		
		protected function onClearButtonClick(event:MouseEvent):void
		{
			clear();
		}
		
		public function clear():void 
		{
			selectedDate = null;
			var e:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
			e.newDate = null;
			dispatchEvent(e);
		}
	}
}
