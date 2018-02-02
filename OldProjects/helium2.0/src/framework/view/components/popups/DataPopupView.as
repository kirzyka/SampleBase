package framework.view.components.popups
{
	import flash.events.Event;
	
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.utils.ObjectUtil;
	
	// ===================================================================== //
	//                              STYLE                                    //
	// ===================================================================== //
	/**
	 *  Name of CSS style declaration that specifies styles for the title icon
	 *  for <code>ADD</code> mode.
	 *  
	 *  @default null
	 */
	[Style(name="iconAdd", type="Class", inherit="no")]
	/**
	 *  Name of CSS style declaration that specifies styles for the title icon
	 *  for <code>EDIT</code> mode.
	 *  
	 *  @default null
	 */
	[Style(name="iconEdit", type="Class", inherit="no")]
	
	// ===================================================================== //
	//                           EXCLUDED API                                //
	// ===================================================================== //	
	[Exclude(name="title", kind="property")]
	[Exclude(name="titleIcon", kind="property")]
	
	public class DataPopupView extends BasePopupView
	{
		// ================================================================= //
		//                             VARIABLES                             //
		// ================================================================= //
		/**
		 *  If this property is <code>true</code> the mode is <code>EDIT</code>.
		 *  
		 *  @default false
		 */
		private var _isEdit:Boolean = false;
		/**
		 *  
		 */
		private var _cache:Object;
		
		private var _sAddTitle:String = "";
		private var _sEditTitle:String = "";
		
		// ================================================================= //
		//                        OVERRIDE METHODS                           //
		// ================================================================= //
		/**
		 *  @override
		 *  The <code>data</code> property lets you pass a value to the component
		 *  when you use it in an item renderer or item editor.
		 *
		 *  @default null
		 *  
		 *  @see mx.containers.TitleWindow#data
		 */
		override public function set data(value:Object):void
		{
			super.data = value;
			// set <code>EDIT</code> mode.
			_isEdit = true;
			// save object as is as now
			_cache = ObjectUtil.copy(data);
			// set icon
			setTitleIcon();
			// TODO : override for update view for edit mode.
		}
		/**
		 *  @override
		 */
		override protected function updateDisplayList(width:Number, height:Number):void
		{
			super.updateDisplayList(width, height);
			
			setTitleIcon();
		}
		
		// ================================================================= //
		//                          COMMON METHODS                           //
		// ================================================================= //
		/**
		 *  DataPopupView. Constructor.
		 */
		public function DataPopupView()
		{
			super();
		}
		
		private function setTitleIcon():void
		{
			try
			{
				if (_isEdit)
				{
					super.title = editTitle;
					super.titleIcon = Class(getStyle("iconEdit"));
				}
				else
				{
					super.title = addTitle;
					super.titleIcon = Class(getStyle("iconAdd"));
				}
			}
			catch(ex:Error)
			{
				// do nothing
			}
		}
		
		// ================================================================= //
		//                        GETTERS AND SETTERS                        //
		// ================================================================= //
		[Bindable(event="editModeChanged")]
		/**
		 *  The mode of popup. It is
		 *     <ul>
		 *        <li><code>ADD</code>;</li>
		 *        <li><code>EDIT</code>;</li>
		 *     </ul>
		 */
		public function get isEdit():Boolean
		{
			return _isEdit;
		}
		/**
		 *  @private
		 */
		public function set isEdit(value:Boolean):void
		{
			_isEdit = value;
			
			dispatchEvent(new Event("editModeChanged"));
		}
		
		[Bindable(event="addTitleChanged")]
		/**
		 *  Title by "ADD" mode.
		 */
		public function get addTitle():String
		{
			return _sAddTitle;
		}
		/**
		 *  @private
		 */
		public function set addTitle(value:String):void
		{
			_sAddTitle = value;
			// update title
			setTitleIcon();
			// update binding
			dispatchEvent(new Event("addTitleChanged"));
		}
		
		[Bindable(event="editTitleChanged")]
		/**
		 *  Title by "EDIT" mode.
		 */
		public function get editTitle():String
		{
			return _sEditTitle;
		}
		/**
		 *  @private
		 */
		public function set editTitle(value:String):void
		{
			_sEditTitle = value;
			// update title
			setTitleIcon();
			// update binding
			dispatchEvent(new Event("editTitleChanged"));
		}
		
		public function get isDirty():Boolean
		{
			if (!_isEdit) return true;
			if ((!data) || (!_cache)) return true;
			
			var classInfo1:Object = ObjectUtil.getClassInfo(data);
			var classInfo2:Object = ObjectUtil.getClassInfo(_cache);
			
			if (classInfo1["name"] != classInfo2["name"]) return true;
			
			var oCompare1:Object = {};
			var oCompare2:Object = {};
			
			var props:Array = classInfo1["properties"];
			for(var i:int = 0; i < props.length; i++)
			{
				var prop:String = (props[i] as QName).localName;
				oCompare1[prop] = data[prop];
				oCompare2[prop] = _cache[prop];
			}
			
			return Boolean(ObjectUtil.compare(oCompare1, oCompare2));
		}
		
		// ===================================================================== //
		//                           SETUP DEFAULT STYLES                        //
		// ===================================================================== //
		override public function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			
			if ((styleProp == "iconAdd") || (styleProp == "iconEdit"))
			{
				this.titleIcon = Class(getStyle(styleProp));
			}
		}
		
		private function setDefaultStyles():void
		{
			var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DataPopupView");
			
			if (!style)
			{
				style = new CSSStyleDeclaration();
				StyleManager.setStyleDeclaration("DataPopupView", style, true);
			}
			
			if (style.defaultFactory == null)
			{
				style.defaultFactory = function():void
				{
					this.iconAdd = null;
					this.iconEdit = null;
				};
			}
		}
	}
}