package framework.core.view
{
	import flash.events.Event;

	import framework.model.AppModelLocator;
	import framework.module.CommonModule;
	
	import mx.containers.TitleWindow;
	import mx.events.FlexEvent;
	/**
	 * The BaseWindow class is
	 *
	 * @author Anton Kirzyk / Ramada
	 *
	 * @version $Revision 1.0 $ $Date: 2009-10-09 13:17:05 +0300 (Fri, 09 Oct 2009) $
	 *
	 */
	// ===================================================================== //
	//                           EXCLUDED API                                //
	// ===================================================================== //
	[Exclude(name="showCloseButton", kind="property")]
	[Exclude(name="layout", kind="property")]
	[Exclude(name="percentWidth", kind="property")]
	[Exclude(name="percentHeight", kind="property")]
	
	[Exclude(name="close", kind="event")]
	
	public class BaseWindow extends TitleWindow //implements IWindow
	{
		// ================================================================= //
		//                             VARIABLES                             //
		// ================================================================= //
		[Bindable]
		/**
		 *  This property contain the model with all data.
		 *  
		 *  @default AppModelLocator.getInstance()
		 *  
		 *  @see framework.model.AppModelLocator
		 */
		/* protected */public var model:AppModelLocator = AppModelLocator.getInstance();
		
		[Bindable]
		/**
		 *  This property is common module. This module is storage for all
		 *  common variables in the system.
		 *  
		 *  @default model.commonModule
		 *  
		 *  @see framework.module.CommonModule
		 */
		protected var storage:CommonModule = model.commonModule;

		/**
		 *  This proeprty is <code>true</code> if window is created.
		 *  
		 *  @default false
		 */
		public var isCreated:Boolean = false;
		
		public function show():void
		{
			// override this method for your Page
		}

		public function update():void
		{
			// override this method for your Page
		}

		// ================================================================= //
		//                          COMMON METHODS                           //
		// ================================================================= //
		/**
		 *  BaseWindow. Constructor.
		 */
		public function BaseWindow()
		{
			super();
			layout = "vertical";
			addEventListener(FlexEvent.CREATION_COMPLETE, createdHandler);
			percentWidth = 100;
			percentHeight = 100;
		}
		
		private function createdHandler(event:FlexEvent):void
		{
			isCreated = true;
		}


		public static const VIEW_BOTHEND:int = 0;
		public static const VIEW_FRONTEND:int = 1;
		public static const VIEW_BACKEND:int = 2;
		public var viewType:int;
	}
}