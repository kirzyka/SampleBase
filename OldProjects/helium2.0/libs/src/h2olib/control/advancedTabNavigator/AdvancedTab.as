package h2olib.control.advancedTabNavigator
{
	import h2olib.control.advancedTabNavigator.skin.PositionedTabSkin;
	
	import mx.controls.ButtonLabelPlacement;
	import mx.controls.tabBarClasses.Tab;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	public class AdvancedTab extends Tab
	{
		/**
		 *  PositionedTab. Constructor.
		 */
		public function AdvancedTab()
		{
			super();
			
			setDefaultStyles();
		}
		
		/**
		 *  Setup default styles.
		 */
		private function setDefaultStyles():void
		{
			var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("AdvancedTab");
			
			if(!style)
			{
				style = new CSSStyleDeclaration();
				StyleManager.setStyleDeclaration("AdvancedTab", style, true);
			}
			
			if(style.defaultFactory == null)
			{
				style.defaultFactory = function():void
				{
					this.position = "top";
					this.labelPlacement = ButtonLabelPlacement.LEFT;
					this.skin = PositionedTabSkin;
				};
			}
		}
	}
}