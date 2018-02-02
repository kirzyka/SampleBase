package framework.core.view
{
	import flash.events.Event;
	import framework.model.AppModelLocator;
	import framework.module.CommonModule;
	
	import mx.containers.BoxDirection;
	
	public class HSubWindow extends SubWindow
	{
		// ================================================================= //
		//                          COMMON METHODS                           //
		// ================================================================= //
		/**
		 *  BaseWindow. Constructor.
		 */
		public function HSubWindow()
		{
			super();
			
			super.direction = BoxDirection.HORIZONTAL;
		}
		
		[Inspectable(environment="none")]
		/**
		 *  @private
		 *  Don't allow user to change the direction
		 */
		override public function set direction(value:String):void
		{
		}
	}
}