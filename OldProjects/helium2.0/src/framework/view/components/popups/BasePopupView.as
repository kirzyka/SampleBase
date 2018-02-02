package framework.view.components.popups
{
	import flash.events.Event;

	import framework.managers.PopUpManagerExt;
	import framework.model.AppModelLocator;
	import framework.module.CommonModule;
	import framework.view.components.popups.events.PopupEvent;
	
	import mx.containers.TitleWindow;
	import mx.core.Application;
	import mx.core.ScrollPolicy;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.utils.ObjectUtil;
	
	// ===================================================================== //
	//                           EXCLUDED API                                //
	// ===================================================================== //	
	[Exclude(name="showCloseButton", kind="property")]
	[Exclude(name="layout", kind="property")]
	[Exclude(name="horizontalScrollPolicy", kind="property")]
	[Exclude(name="verticalScrollPolicy", kind="property")]
	
	[Exclude(name="close", kind="event")]
	
	public class BasePopupView extends TitleWindow
	{
		// ================================================================= //
		//                             VARIABLES                             //
		// ================================================================= //
		[Bindable]
		/**
		 *  This property is a model with all data.
		 *  
		 *  @see framework.model.AppModelLocator
		 */
		public var model:AppModelLocator = AppModelLocator.getInstance();
		
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
		 *  This property is call back function for executing some functions
		 *  if user get result's handler after call remote function from
		 *  the server.
		 *  
		 *  @default null
		 */
		private var _callBack:Function;
		
		/**
		 *  This property is prefix for locale.
		 *  
		 *  @default ""
		 */
		private var _prefix:String = "";
		
		// ================================================================= //
		//                          COMMON METHODS                           //
		// ================================================================= //
		/**
		 *  BasePopupView. Constructor.
		 */
		public function BasePopupView()
		{
			super();
			
			layout = "vertical";
			
			horizontalScrollPolicy = ScrollPolicy.OFF;
			verticalScrollPolicy = ScrollPolicy.OFF;
			
			showCloseButton = true;
			addEventListener(CloseEvent.CLOSE, close);
			addEventListener(FlexEvent.CREATION_COMPLETE, init);
			
			setDefaultStyles();
		}
		
		private function init(e:FlexEvent):void
		{
			removeEventListener(FlexEvent.CREATION_COMPLETE, init);
			
			this.x = Application.application.width / 2 - this.width / 2;
			this.y = Application.application.height / 2 - this.height / 2;
		}
		
		/**
		 *  The handler for call success function before close popup.
		 */
		public function completeCall():void
		{
			if (_callBack is Function)
			{
				_callBack();
			}
			close();
		}
		/**
		 *  The handler to close popup.
		 */
		protected function close(event:CloseEvent = null):void
		{
			removeEventListener(CloseEvent.CLOSE, close);
			
			PopUpManagerExt.removePopUp(this);
			
			dispatchEvent(new PopupEvent(PopupEvent.CLOSE));
		}
		
		// ================================================================= //
		//                        GETTERS AND SETTERS                        //
		// ================================================================= //
		/**
		 *  The call back function for executing some functions if user get
		 *  result's handler after call remote function from the server.
		 */
		public function get callBack():Function
		{
			return _callBack;
		}
		/**
		 *  @private
		 */
		public function set callBack(value:Function):void
		{
			_callBack = value;
		}
		
		[Bindable(event="prefixChanged")]
		/**
		 *  Localization prefix.
		 */
		public function get prefix():String
		{
			return _prefix;
		}
		/**
		 *  @private
		 */
		public function set prefix(value:String):void
		{
			_prefix = value;
			
			dispatchEvent(new Event("prefixChanged"));
		}
		
		// ===================================================================== //
		//                           SETUP DEFAULT STYLES                        //
		// ===================================================================== //
		private function setDefaultStyles():void
		{
			var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("BasePopupView");
			
			if (!style)
			{
				style = new CSSStyleDeclaration();
				StyleManager.setStyleDeclaration("BasePopupView", style, true);
			}
			
			if (style.defaultFactory == null)
			{
				style.defaultFactory = function():void
				{
				};
			}
		}
	}
}