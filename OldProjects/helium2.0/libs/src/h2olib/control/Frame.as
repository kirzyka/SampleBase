package h2olib.control
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.VBox;
	import mx.controls.Label;

	/*
	 * $Id: Frame.as,v 1.0 2009/06/16
	 *
	 * Copyright (c) 2009 Anton Kirzyk
	 * All rights reserved.
	 */
	public class Frame extends Canvas
	{
		
		private var _headerLabel:Label = new Label();
		private var _contentBox:VBox = new VBox();
		private var _headerBackGround:Box = new Box();
		
		public function Frame()
		{
			super();
			super.addChild(_contentBox);
			super.addChild(_headerBackGround);
			super.addChild(_headerLabel);
			
			_contentBox.y = 10;			
			_contentBox.percentWidth = 100;
			_contentBox.percentHeight = 100;
			_contentBox.setStyle("borderStyle", "solid");	
			_contentBox.setStyle("borderThickness", 1);		
			_contentBox.setStyle("borderColor", 0xd9d9d9);
			_contentBox.setStyle("paddingTop", 10);
            _contentBox.setStyle("paddingBottom", 0);
			_contentBox.setStyle("paddingRight", 0);
            _contentBox.setStyle("paddingLeft", 0);
            _contentBox.setStyle("verticalAlign", "top");            
		    
			_headerLabel.x = 10;
			_headerLabel.y = 0;
			_headerLabel.setStyle("fontWeight", "bold");
			_headerBackGround.x = _headerLabel.x - 2;
			_headerBackGround.y = _headerLabel.y;	
			_headerBackGround.setStyle("paddingLeft", 0);	
			_headerBackGround.setStyle("paddingRight", 0);		
			//_headerBackGround.setStyle("borderStyle","outset");		
			_headerBackGround.setStyle("backgroundColor",_headerColor);//Application.application.getStyle("backgroundColor"));
			
			addEventListener("labelChanged",setHeaderLabel);
			
		}
		
		//---------------------------------------------
        //  Properties
        //---------------------------------------------
		private var _headerColor:String = "0xFFFFFF";
		
		[Inspectable(category="Common", defaultValue="0xFFFFFF")]
		public function get headerColor():String 
		{
			return _headerColor;
		}
		public function set headerColor(value:String):void 
		{
			_headerColor = value;
			_headerBackGround.setStyle("backgroundColor",_headerColor);//Application.application.getStyle("backgroundColor"));			
		}
		
		//---------------------------------------------
        //  Methods
        //---------------------------------------------		
		
		private function setHeaderLabel(event:Event):void 
		{
			_headerLabel.text = this.label;
		}
		
		//---------------------------------------------
        //  Override Methods
        //---------------------------------------------
        
		override public function addChild(child:DisplayObject):DisplayObject 
		{
			_contentBox.addChild(child);	
			return child;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			_headerBackGround.width = _headerLabel.width + 4;
			_headerBackGround.height = _headerLabel.height;					
		}
		
	}
}