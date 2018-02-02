package h2olib.control
{
	import mx.controls.TabBar;
	import mx.controls.Button;
	import mx.core.IFlexDisplayObject;
	
	/**
	* The TabBarEx class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009/06/23 $
	*
	*/
	
	public class TabBarEx extends TabBar
	{
		
		public function TabBarEx()
		{
			super();
		}
		
		override protected function createNavItem(label:String, icon:Class=null):IFlexDisplayObject
		{
			var navItem:IFlexDisplayObject = super.createNavItem(label, icon);
			
			(navItem as Button).labelPlacement = "bottom";
			
			return navItem;
		}
	}
}