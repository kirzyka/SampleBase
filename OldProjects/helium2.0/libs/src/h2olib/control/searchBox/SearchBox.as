package h2olib.control.searchBox
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.TextEvent;
	
	import h2olib.control.PromptingTextInput;
	import h2olib.events.SearchBoxEvent;
	
	import mx.containers.HBox;
	import mx.controls.Image;
	import mx.events.FlexEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	// ===================================================================== //
	//                              STYLE                                    //
	// ===================================================================== //
	/**
	 *  Name of CSS style declaration that specifies styles for the color of label
	 *  for labeled text input.
	 *  
	 *  @default 0xaaaaaa
	 */
	[Style(name="labelColor", type="uint", format="Color", inherit="no")]
	/**
	 *  Name of CSS style declaration that specifies styles for the color of text
	 *  for labeled text input.
	 *  
	 *  @default 0x000000
	 */
	[Style(name="textColor", type="uint", format="Color", inherit="no")]
	/**
	 *  Name of CSS style declaration that specifies styles for the search icon.
	 *  
	 *  @default @Embed("assets/searchIcon.png")
	 */
	[Style(name="iconSearch", type="Class", inherit="no")]
	
	// ===================================================================== //
	//                              EVENTS                                   //
	// ===================================================================== //
	/**
	 *  Dispatched when the user presses the Enter key.
	 *
	 *  @eventType mx.events.FlexEvent.ENTER
	 */
	[Event(name="enter", type="mx.events.FlexEvent")]
	/**
	 *  Dispatched when the user inputs text.
	 *
	 *  @eventType mx.events.Event.CHANGE
	 */
	[Event(name="change", type="flash.events.Event")]
	/**
	 *  Dispatched when the user inputs text.
	 *
	 *  @eventType mx.events.TextEvent.TEXT_INPUT
	 */
	[Event(name="textInput", type="flash.events.TextEvent")]
	
	/**
	 *  Dispatched when the labeled input fields lost focus. If any changes are
	 *  apply to text, dispatch event.
	 *
	 *  @eventType h2olib.events.SearchBoxEvent.CHANGE_BY_FOCUS
	 */
	[Event(name="changeByFocus", type="h2olib.events.SearchBoxEvent")]
	
	// ===================================================================== //
	//                           EXCLUDED API                                //
	// ===================================================================== //	
	/**
	 *  Excluding property <code>horizontalGap</code> - the number of pixels
	 *  between children in the horizontal direction.
	 */
	[Exclude(name="horizontalGap", kind="style")]
	/**
	 *  Excluding property <code>verticalAlign</code> - vertical alignment of
	 *  children in the container.
	 */
	[Exclude(name="verticalAlign", kind="style")]
	
	public class SearchBox extends HBox
	{
		[@Embed("assets/searchIcon.png")]
		private const searchIcon:Class;
		/**
		 *  This property is the instance of labeled text input field.
		 *  
		 *  @see h2olib.control.PromptingTextInput
		 */
		protected var _textInput:PromptingTextInput;
		/**
		 *  This property is the instance of search icon.
		 */
		protected var _icon:Image;
		/**
		 *  This property is label for labeled text input field.
		 */
		protected var _label:String = "";
		/**
		 *  This property is restrict for labeled text input field.
		 */
		private var _restrict:String;
		/**
		 *  This property is max chars for view.
		 */
		private var _maxChars:int;
		/**
		 *  This property is a count of characters in text input have been
		 *  last time by intupt event.
		 *  
		 *  @default -1
		 */
		private var _prevCount:Number = -1;
		/**
		 *  SearchBox. Constructor.
		 */
		public function SearchBox()
		{
			super();
			
			setDefaultStyles();
		}
		
		// ===================================================================== //
		//                      OVERRIDE HANDLERS AND METHODS                    //
		// ===================================================================== //
		/**
		 *  @override
		 *  Create components that are children of this Container.
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			/// create search icon
			_icon = new Image();
			_icon.source = Class(getStyle("iconSearch"));
			addChild(_icon);
			/// create labeled tex input field for enter search keywords
			_textInput = new PromptingTextInput();
			_textInput.setStyle("borderStyle", "none");
			_textInput.setStyle("borderSkin", null);			
			_textInput.setStyle("focusAlpha", 0);
			_textInput.setStyle("labelColor", getStyle("labelColor"));
			_textInput.setStyle("textColor", getStyle("textColor"));
			_textInput.percentWidth = 100;
			_textInput.height = 22;
			_textInput.prompt = _label;
			_textInput.restrict = restrict;
			_textInput.maxChars = maxChars;
			_textInput.addEventListener(Event.CHANGE, handleTextChange);
			_textInput.addEventListener(FlexEvent.ENTER, handlePressEnter);
			_textInput.addEventListener(TextEvent.TEXT_INPUT, handleTextInput);
			_textInput.addEventListener(FocusEvent.FOCUS_IN, handleFocusIn);
			_textInput.addEventListener(FocusEvent.FOCUS_OUT, handleFocusOut);
			addChild(_textInput);
		}
		
		protected function handleFocusIn(event:FocusEvent):void
		{
			// save previous count of chars
			_prevCount = _textInput.text.length;
		}
		
		protected function handleFocusOut(event:FocusEvent):void
		{
			if ((_textInput.text.length != _prevCount) && (_prevCount > 0))
			{
				var e:SearchBoxEvent = new SearchBoxEvent(SearchBoxEvent.CHANGE_BY_FOCUS);
				dispatchEvent(e);
			}
		}
		
		// ===================================================================== //
		//                    COMPONENTS HANDLERS AND METHODS                    //
		// ===================================================================== //
		/**
		 *  The handler for controling when the user presses the Enter key.
 		 *  
		 *  @param event:FlexEvent
		 */
		protected function handlePressEnter(event:FlexEvent):void
		{
			// save previous count of chars
			_prevCount = _textInput.text.length;
			
			callLater(dispatchEvent, [event.clone()]);
		}
		
		/**
		 *  The handler for controling when the user input text.
 		 *  
		 *  @param event:TextEvent
		 */
		protected function handleTextInput(event:TextEvent):void
		{
			// save previous count of chars
			_prevCount = event.text.length;
			
			callLater(dispatchEvent, [event.clone()]);
		}
		
		/**
		 *  The handler for controling when the user input text.
 		 *  
		 *  @param event:Event
		 */
		protected function handleTextChange(event:Event):void
		{
			callLater(dispatchEvent, [event.clone()]);
		}
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		[Bindable(event="textChanged")]
		/**
		 *  Plain text that appears in the control.
		 *  <p>Its appearance is determined by the CSS styles of this Label control.
		 *  
		 *  @see framework.view.components.controls.PromptingTextInput#text
		 */
		public function get text():String
		{
			return (_textInput) ? _textInput.text : "";
		}
		/**
		 *  @private
		 */
		public function set text(value:String):void
		{
			if (!_textInput) return;
			// apply new text to view
			_textInput.text = value;
			// update binding by property
			dispatchEvent(new Event("textChanged"));
			// 
			var e:TextEvent = new TextEvent(TextEvent.TEXT_INPUT);
			e.text = value;
			dispatchEvent(e);
		}
		
		[Bindable(event="labelChanged")]
		/**
		 *  The label to display when the text field is empty.
		 *  
		 *  @see framework.view.components.controls.PromptingTextInput#label
		 */
		override public function get label():String
		{
			return _label;
		}
		/**
		 *  @private
		 */
		override public function set label(value:String):void
		{
			_label = value;
			
			if (!_textInput) return;
			
			_textInput.prompt = _label;
			_textInput.text = text;
			_textInput.invalidateDisplayList();
			
			dispatchEvent(new Event("labelChanged"));
		}
		
		[Bindable(event="restrictChanged")]
		/**
		 *  The restrict for labeled text input field.
		 */
		public function get restrict():String
		{
			return _restrict;
		}
		/**
		 *  @private
		 */
		public function set restrict(value:String):void
		{
			_restrict = value;
			
			if (!_textInput) return;
			_textInput.restrict = _restrict;
			
			dispatchEvent(new Event("restrictChanged"));
		}
		
		[Bindable(event="maxCharsChanged")]
		/**
		 *  The restrict for labeled text input field.
		 */
		public function get maxChars():int
		{
			return _maxChars;
		}
		/**
		 *  @private
		 */
		public function set maxChars(value:int):void
		{
			_maxChars = value;
			
			if (!_textInput) return;
			_textInput.maxChars = _maxChars;
			
			dispatchEvent(new Event("maxCharsChanged"));
		}
		
		// ===================================================================== //
		//                           SETUP DEFAULT STYLES                        //
		// ===================================================================== //
		override public function styleChanged(styleProp:String):void
		{
			super.styleChanged(styleProp);
			
			if ((_textInput) && ((styleProp == "labelColor") || (styleProp == "textColor")))
			{
				_textInput.setStyle(styleProp, getStyle(styleProp));
			}
			
			if (styleProp == "iconSearch")
				_icon.source = Class(getStyle(styleProp));
		}
		
		private function setDefaultStyles():void
		{
			var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("SearchBox");
			
			if (!style)
			{
				style = new CSSStyleDeclaration();
				StyleManager.setStyleDeclaration("SearchBox", style, true);
			}
			
			if (style.defaultFactory == null)
			{
				style.defaultFactory = function():void
				{
					this.labelColor = 0xaaaaaa;
					this.textColor = 0x000000;
					
					this.borderStyle = "solid";
					this.backgroundColor = 0xffffff;
					this.horizontalGap = 0;
					this.paddingLeft = 3;
					this.paddingRight = 3;
					this.cornerRadius = 5;
					this.verticalAlign = "middle";
					
					this.iconSearch = searchIcon;
				};
			}
		}
	}
}