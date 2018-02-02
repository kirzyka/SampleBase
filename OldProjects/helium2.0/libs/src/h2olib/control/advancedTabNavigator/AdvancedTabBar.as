package h2olib.control.advancedTabNavigator
{
	import mx.controls.TabBar;
	import mx.core.ClassFactory;
	import mx.core.mx_internal;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	use namespace mx_internal;
	
	[Style(name="position", type="String", enumeration="top,bottom,left,right", inherit="no")]
	
	public class AdvancedTabBar extends TabBar
	{
		/**
		 *  PositionedTabBar. Constructor.
		 */
		public function AdvancedTabBar()
		{
			super();
			
			navItemFactory = new ClassFactory(AdvancedTab);
			
			setDefaultStyles();
		}
		
		override public function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			
			if ((!styleProp) || (styleProp == "position"))
			{
				var pos:String = getStyle("position");
				direction = ((pos == "left") || (pos == "right")) ? "vertical" : "horizontal";
				
				var b:AdvancedTab;
				for(var i:int = 0; i < numChildren; i++)
				{
					(getChildAt(i) as AdvancedTab).setStyle("position", pos);
				}
			}
		}
		
		// ===================================================================== //
		//                           SETUP DEFAULT STYLES                        //
		// ===================================================================== //
		private function setDefaultStyles():void
		{
			var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("AdvancedTabBar");
			
			if (!style)
			{
				style = new CSSStyleDeclaration();
				StyleManager.setStyleDeclaration("AdvancedTabBar", style, true);
			}
			
			if (style.defaultFactory == null)
			{
				style.defaultFactory = function():void
				{
					this.position = "top";
				};
			}
		}
	}
}