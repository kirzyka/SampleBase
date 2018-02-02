package com.controls.comboBoxes.autocompleteComboBox
{

	import com.adobe.utils.StringUtil;
	import com.controls.comboBoxes.autocompleteComboBox.renderer.AutoCompleteItemRenderer;
	import com.controls.comboBoxes.autocompleteComboBox.skin.AutoCompleteSkin;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.ICollectionView;
	import mx.collections.IList;
	import mx.collections.ListCollectionView;
	import mx.core.ClassFactory;
	import mx.core.mx_internal;
	
	import spark.components.ComboBox;
	import spark.events.DropDownEvent;
	import spark.events.TextOperationEvent;
	import spark.utils.LabelUtil;


	use namespace mx_internal;

	public class AutoCompleteComboBox extends ComboBox
	{

		public static var DEFAULT_VALUE_FIELD:String = null;
		public static var DEFAULT_LABEL_FIELD:String = null;

		public static const PROMPT:String = "Type to Search";
		public static const CLICK_PROMPT:String = "Click on button for select";


		private var __inputTextChanged:Boolean = true;

		public function get _inputTextChanged():Boolean
		{
			return __inputTextChanged;
		}

		public function set _inputTextChanged(value:Boolean):void
		{
			_trace("set _inputTextChanged " + value);
			__inputTextChanged = value;
		}


		mx_internal var _dataProviderChanged:Boolean = false;
		mx_internal var _matchTypeChanged:Boolean = false;
		mx_internal var _selectedItemChanged:Boolean = false;
		mx_internal var _selectedIndexChanged:Boolean = false;
		mx_internal var _fixedValuesChanged:Boolean = false;
		mx_internal var _editableChanged:Boolean = false;
		mx_internal var _enabledChanged:Boolean = false;
		mx_internal var _filterText:String = "";

		private var _previousTextInputText:String;
		private var _inputText:String;


		private var _actualProposedSelectedIndex:Number = NO_SELECTION;


		private function get isEnteredValueField():Boolean
		{
			return (valueField != null && StringUtil.trim(valueField) != "");
		}

		public function AutoCompleteComboBox()
		{
			super();
			if (DEFAULT_VALUE_FIELD)
			{
				this.valueField = DEFAULT_VALUE_FIELD;
			}
			if (DEFAULT_LABEL_FIELD)
			{
				this.labelField = DEFAULT_LABEL_FIELD;
			}
			this.prompt = PROMPT;
			this.itemRenderer = new ClassFactory(AutoCompleteItemRenderer);
			this.labelFunction = defaultLabelFunction;
			setStyle("skinClass", AutoCompleteSkin);

		}

		override protected function initializeAccessibility():void
		{
			AutoCompleteComboBoxAccImpl.createAccessibilityImplementation(this);
		}


		override protected function partAdded(partName:String, instance:Object):void
		{
			if (instance == textInput)
			{
				textInput.widthInChars = 15;
				textInput.addEventListener(TextOperationEvent.CHANGING, textInput_changingHandler);
			}
			super.partAdded(partName, instance);
		}


		override protected function partRemoved(partName:String, instance:Object):void
		{
			if (instance == textInput)
			{
				textInput.removeEventListener(TextOperationEvent.CHANGING,
											  textInput_changingHandler);
			}
			super.partRemoved(partName, instance);
		}



		override public function set dataProvider(value:IList):void
		{
			if (this.dataProvider == value)
			{
				return;
			}
			_dataProviderChanged = true;

			super.dataProvider = (value != null) ? new ListCollectionView(value) : null;

		/*			if (value is ICollectionView)
					{
						super.dataProvider = value
					}
					else
					{
						super.dataProvider = (value != null) ? new ListCollectionView(value) : null;
					}
		*/
		}


		public function defaultDropDownLabelFunction(item:Object):String
		{
			var label:String = LabelUtil.itemToLabel(item, labelField, labelFunction);
			if (!editable)
			{
				return label;
			}
			var searchStr:String = (editable) ? this._inputText : "";
			;
			label = label.replace("<", "&lt;").replace(">", "&gt;");
			var returnStr:String = highlighMatch(label, searchStr);
			return "<div>" + returnStr + "</div>";
		}

		public static function highlighMatch(input:String, searchStr:String):String
		{
			var matchPos:int = input.toLowerCase().indexOf(searchStr.toLowerCase());
			var returnStr:String = input.substring(0, matchPos);
			var matchedPart:String = input.substr(matchPos, searchStr.length);

			if (matchPos >= 0)
			{
				returnStr += '<span textDecoration="underline" fontWeight="bold">' + matchedPart + "</span>";
				returnStr += input.substr(matchPos + searchStr.length, input.length);
			}
			else
			{
				returnStr = input;
			}
			return returnStr;
		}




		override protected function childrenCreated():void
		{
			_trace("--childrenCreated");
			super.childrenCreated();
		}


		protected function beforeCommitProperties():void
		{

			if (_dataProviderChanged || _matchTypeChanged)
			{
				_dataProviderChanged = false;
				_matchTypeChanged = false;
				if (this.dataProvider && (this.dataProvider is ICollectionView))
				{
					(super.dataProvider as ICollectionView).filterFunction = (editable) ? innerFilterFunction : null;
					if (editable)
					{
						(super.dataProvider as ICollectionView).refresh();
					}
				}
			}

			if (_inputTextChanged && (this.dataProvider is ICollectionView))
			{
				_inputTextChanged = false;
				if (editable)
				{
					_filterText = (editable) ? this.textInput.text : "";
					_pendingSelectedItem = this.selectedItem;
					
					var dp:ICollectionView = (super.dataProvider as ICollectionView);
					super.dataProvider = null;
					dp.refresh();
					super.dataProvider = dp as IList;
				}
			}
		}

		
		override protected function commitProperties():void
		{
			_trace("--commitProperties");
			if (_editableChanged || _enabledChanged)
			{
				_editableChanged = false;
				textInput.editable = editable;
				prompt = (editable) ? PROMPT : CLICK_PROMPT;
				prompt = (enabled) ? prompt : "";
			}


			beforeCommitProperties();
			_trace("1x_");
			super.commitProperties();
			_trace("1xx_");
			this._inputText = this.textInput.text;

			if (_selectedItemChanged || _selectedIndexChanged)
			{
				_selectedItemChanged = false;
				_selectedIndexChanged = false;
				this.textInput.text = LabelUtil.itemToLabel(selectedItem, labelField, labelFunction);
				_inputText = this.textInput.text;
				_inputTextChanged = true;
				commitProperties();
			}
			_trace("commitProperties - complete");
		}


		private var i:int = 0;

		protected function _trace(capt:String, key:int = 0):void
		{
			if (key == 0)
			{
				return;
			}
			trace(i + "  " + capt);
			trace("			selectedItem =" + this.selectedItem);
			trace("			_pendingSelectedItem =" + this._pendingSelectedItem);
			trace("			_selectedIndex =" + this._selectedIndex);
			trace("			selectedIndex =" + this.selectedIndex);
			trace("			userProposedSelectedIndex =" + this.userProposedSelectedIndex);
			trace("			_proposedSelectedIndex =" + this._proposedSelectedIndex);
			trace("			_actualProposedSelectedIndex =" + this._actualProposedSelectedIndex);
			trace("			userProposedSelectedIndex =" + this.userProposedSelectedIndex);
			trace("			_proposedSelectedIndex =" + this._proposedSelectedIndex);
			i++;
		}


		protected function innerFilterFunction(item:Object):Boolean
		{
			if (item == null)
			{
				return false;
			}

			var itemStr:String = LabelUtil.itemToLabel(item, labelField, labelFunction);
			if (_filterText != null && itemStr != null)
			{
				return this.matchType.matchFunction(_filterText, itemStr);
			}
			else
			{
				return false;
			}
		}

		override protected function item_mouseDownHandler(event:MouseEvent):void
		{
			_trace("--item_mouseDownHandler userProposedSelectedIndex=" + userProposedSelectedIndex);
			//this._actualProposedSelectedIndex = userProposedSelectedIndex;
			super.item_mouseDownHandler(event);
			this.textInput.text = LabelUtil.itemToLabel(selectedItem, labelField, labelFunction);
			_inputText = this.textInput.text;
		}

		override protected function dropDownController_closeHandler(event:DropDownEvent):void
		{
			_trace("--dropDownController_closeHandler userProposedSelectedIndex=" + userProposedSelectedIndex);
			_trace("--dropDownController_closeHandler");
			//this._actualProposedSelectedIndex = userProposedSelectedIndex;
			super.dropDownController_closeHandler(event);
		}

		override mx_internal function set userProposedSelectedIndex(value:Number):void
		{
			super.userProposedSelectedIndex = value;
			_actualProposedSelectedIndex = value;
		}


		override mx_internal function changeHighlightedSelection(newIndex:int,
																 scrollToTop:Boolean = false):void
		{
			super.changeHighlightedSelection(newIndex, scrollToTop);
			if (textInput)
			{
				textInput.selectRange(255, 255);
			}
		}



		/*		override protected function commitSelection(dispatchChangedEvents:Boolean=true):Boolean{
					_trace("--commitSelection");
					return super.commitSelection(dispatchChangedEvents);
				}
		*/
		override protected function initializationComplete():void
		{
			_trace("--initializationComplete");
			super.initializationComplete();
		}



		private function textInput_changingHandler(event:TextOperationEvent):void
		{
			_previousTextInputText = textInput.text;
		}


		override protected function textInput_changeHandler(event:TextOperationEvent):void
		{
			_trace("--textInput_changeHandler");


			if (!allowStartWithSpace)
			{
				textInput.text = StringUtil.ltrim(textInput.text);
			}
			if (!allowMoreThanOneSpace)
			{
				var position:int = textInput.selectionActivePosition;
				textInput.text = textInput.text.replace(new RegExp(/\s{1,}/g), " ");
				textInput.selectRange(position, position);
			}

			_actualProposedSelectedIndex = CUSTOM_SELECTED_ITEM;

			if (_previousTextInputText != textInput.text)
			{
				if (openOnInput)
				{
					if (!isDropDownOpen)
					{
						openDropDown();
					}
				}
				_selectedIndex = NO_SELECTION;
				_pendingSelectedItem = undefined;
				_inputTextChanged = true;
				_inputText = textInput.text;
				userProposedSelectedIndex = CUSTOM_SELECTED_ITEM; //??
				invalidateProperties();
			}
		}

		/*		override public function closeDropDown(commit:Boolean):void{

				}
		*/
		/*		override public function initialize():void{

				}
		*/


		override mx_internal function applySelection():void
		{
			_trace("============applySelection");

			dispatchChangeAfterSelection = true;
			if (_actualProposedSelectedIndex == CUSTOM_SELECTED_ITEM)
			{
				var itemFromInput:* = getCustomSelectedItem();
				if (itemFromInput != undefined && !fixedValues)
				{
					_pendingSelectedItem = itemFromInput;
				}
				else
				{
					setSelectedIndex(NO_SELECTION, true);
				}
			}


			if (textInput)
			{
				if (selectedItem == null)
				{
					textInput.text = "";
					_inputText = "";
				}
				textInput.selectRange(-1, -1);
			}
		}


		private function getCustomSelectedItem():*
		{
			var input:String = textInput.text;
			if (input == "")
			{
				return undefined;
			}
			else if (newItemClass != null)
			{
				return createNewItem(input)
			}
			else if (labelToItemFunction != null)
			{
				return labelToItemFunction(input);
			}
			else
			{
				return input;
			}
		}

		protected function createNewItem(input:String):*
		{
			var result:Object = new newItemClass();
			if (labelField)
			{
				result[labelField] = input;
			}
			return result;
		}


		override mx_internal function dataProviderRefreshed():void
		{
			_trace("--dataProviderRefreshed");
			super.mx_internal::dataProviderRefreshed();
			_trace("this.selectedItem =" + this.selectedItem)
		}


		override mx_internal function setSelectedIndex(value:int,
													   dispatchChangeEvent:Boolean = false,
													   changeCaret:Boolean = true):void
		{

			_trace("--setSelectedIndex " + value + " _selectedIndex " + _selectedIndex + dispatchChangeEvent);
			super.mx_internal::setSelectedIndex(value, dispatchChangeEvent, changeCaret);
			_trace("-setSelectedIndex complete!");
		}


		override mx_internal function setSelectedItem(value:*, dispatchChangeEvent:Boolean = false):void
		{
			_pendingSelectedItem = undefined;
			_trace("--setSelectedItem " + value + " : " + dispatchChangeEvent);
			var v:* = value ? value : undefined;
			_trace("		v " + value + " : " + dispatchChangeEvent);

			if (v === undefined)
			{
				setSelectedIndex(NO_SELECTION);
			}
			else
			{
				super.setSelectedItem(v, dispatchChangeEvent);
			}

			invalidateProperties();
		}


		override protected function capture_keyDownHandler(event:KeyboardEvent):void
		{
			if (isDropDownOpen)
			{
				super.capture_keyDownHandler(event);
				return;
			}

			switch (event.keyCode)
			{
				case Keyboard.HOME:
				{
					if (event.shiftKey)
					{
						textInput.selectRange(textInput.text.length, 0);
					}
					else
					{
						textInput.selectRange(0, 0);
					}
					break;
				}
				case Keyboard.END:
				{
					if (event.shiftKey)
					{
						textInput.selectRange(0, textInput.text.length);
					}
					else
					{
						textInput.selectRange(textInput.text.length, textInput.text.length);
					}
					break;
				}
				default:
				{
					super.capture_keyDownHandler(event);
					break;
				}
			}
		}



		override mx_internal function keyDownHandlerHelper(event:KeyboardEvent):void
		{

			if (event.keyCode == Keyboard.ENTER)
			{
				if (fixedValues && (_actualProposedSelectedIndex == CUSTOM_SELECTED_ITEM || _actualProposedSelectedIndex == NO_SELECTION))
				{
					return;
				}

			}
			if ((event.keyCode == Keyboard.DELETE || event.keyCode == Keyboard.BACKSPACE)
				&& !requireSelection && ( /*fixedValues || */!editable))
			{
				if (textInput.selectionAnchorPosition == textInput.text.length ||
					textInput.selectionActivePosition == textInput.text.length)
				{
					_filterText = "";
					_inputText = "";
					_inputTextChanged = true;
					selectedIndex = -1;
					userProposedSelectedIndex == NO_SELECTION;

					if (!isDropDownOpen)
					{
						openDropDown();
					}
					invalidateProperties();
					return;
				}
			}

			super.keyDownHandlerHelper(event);
		}



		protected function defaultLabelFunction(item:Object):String
		{
			var res:String = StringUtil.trim(LabelUtil.itemToLabel(item, this.labelField,
																   _internalLabelFunction));
			return res;
		}


		protected function findSelectedItemForValue(value:Object):Object
		{
			if (dataProvider == null)
			{
				return undefined;
			}
			var currValue:Object;
			for each (var currItem:Object in ListCollectionView(dataProvider).list.toArray())
			{
				currValue = (isEnteredValueField && (currItem != null)) ? currItem[valueField] : currItem;
				if (currValue == value)
				{
					return currItem;
				}
			}
			return null;
		}

		override protected function commitSelection(dispatchChangedEvents:Boolean = true):Boolean
		{
			_trace("commitSelection", 0);
			var retVal:Boolean = super.commitSelection(dispatchChangedEvents);
			_trace("commitSelection complete");
			return retVal;
		}


		override mx_internal function updateLabelDisplay(displayItem:* = undefined):void
		{
			//Artifact artf603730 : Index: some data appears in Cluster ID field when if user press up\down in Cluster Name field
			_trace("updateLabelDisplay " + displayItem, 0);
			if (userProposedSelectedIndex != ComboBox.CUSTOM_SELECTED_ITEM)
			{
				super.updateLabelDisplay(displayItem);
			}
		}


		// -------------------------------
		//   Match Type
		// -------------------------------
		private var _matchType:AutoCompleteMatchType = AutoCompleteMatchType.BEGINNING;

		public function get matchType():AutoCompleteMatchType
		{
			return _matchType;
		}

		/**
		 *  @private
		 */
		public function set matchType(value:AutoCompleteMatchType):void
		{
			_matchType = value;
			_matchTypeChanged = true;
			invalidateProperties();
		}

		// -------------------------------
		//   Selected Item
		// -------------------------------
		[Bindable("change")]
		[Bindable("valueCommit")]
		[Inspectable(category = "General", defaultValue = "null")]
		override public function get selectedItem():*
		{
			return super.selectedItem;
		}

		override public function set selectedItem(value:*):void
		{
			_selectedIndex = NO_SELECTION;
			userProposedSelectedIndex = NO_SELECTION;
			_actualProposedSelectedIndex = NO_SELECTION;
			_selectedItemChanged = true;
			super.selectedItem = value;

		}



		// -------------------------------
		//   Selected Value
		// -------------------------------
		[Bindable("change")]
		[Bindable("valueCommit")]
		[Inspectable(category = "General", defaultValue = "null")]
		public function get selectedValue():Object
		{
			var item:Object = selectedItem;
			return (isEnteredValueField && (item != null)) ? item[valueField] : item;
		}

		public function set selectedValue(value:Object):void
		{
			selectedItem = (isEnteredValueField) ? findSelectedItemForValue(value) : value;
		}

		[Bindable("change")]
		[Bindable("valueCommit")]
		public function get selectedStringValue():String
		{
			var item:Object = selectedValue;
			return selectedValue ? selectedValue.toString() : "";
		}


		// -------------------------------
		//   Selected Label - only getter
		// -------------------------------
		[Bindable("change")]
		[Bindable("valueCommit")]
		public function get selectedLabel():String
		{
			return LabelUtil.itemToLabel(selectedItem, labelField, labelFunction);
		}


		/*		public function set selectedLabel(value:String):void
				{
					throw new Error("method set Selected Label not implemented");
				}
		*/

		// -------------------------------
		//  Class of New Item
		// -------------------------------
		private var _newItemClass:Class = null;

		public function get newItemClass():Class
		{
			return _newItemClass;
		}

		public function set newItemClass(value:Class):void
		{
			_newItemClass = value;
		}



		// -------------------------------
		//  Trim spaces in label
		// -------------------------------
		private var _trimLabel:Boolean = true;

		public function get trimLabel():Boolean
		{
			return _trimLabel;
		}

		public function set trimLabel(value:Boolean):void
		{
			_trimLabel = value;
			if (_trimLabel)
			{
				this.labelFunction = this.defaultLabelFunction;
			}
		}



		// -------------------------------
		//  Return only existing values from dataprovider
		// -------------------------------
		private var _fixedValues:Boolean = true;

		public function get fixedValues():Boolean
		{
			return _fixedValues;
		}

		public function set fixedValues(value:Boolean):void
		{
			_fixedValues = value;
			_fixedValuesChanged = true;
			invalidateProperties();
		}



		// -------------------------------
		//  Label function
		// -------------------------------
		private var _internalLabelFunction:Function = null;

		override public function set labelFunction(value:Function):void
		{
			if (value != defaultLabelFunction)
			{
				_internalLabelFunction = value;
			}
		}

		override public function get labelFunction():Function
		{
			return (trimLabel) ? defaultLabelFunction : _internalLabelFunction
		}


		// -------------------------------
		//   Value Field
		// -------------------------------
		private var _valueField:String;

		public function get valueField():String
		{
			return _valueField;
		}

		/**
		 *  @private
		 */
		public function set valueField(value:String):void
		{
			_valueField = value;
			//invalidateProperties();
		}


		// -------------------------------
		//   Value Field
		// -------------------------------
		private var _editable:Boolean = true;

		public function get editable():Boolean
		{
			return _editable;
		}

		public function set editable(value:Boolean):void
		{
			_editable = value;
			_editableChanged = true;
			invalidateProperties();
		}



		// -------------------------------
		//   Selected Index
		// -------------------------------
		[Bindable("change")]
		[Bindable("valueCommit")]
		[Inspectable(category = "General", defaultValue = "null")]
		override public function get selectedIndex():int
		{
			return super.selectedIndex;
		}

		override public function set selectedIndex(value:int):void
		{
			_selectedIndexChanged = true;
			_actualProposedSelectedIndex = value;
			super.selectedIndex = value;
		}



		// -------------------------------
		//   Allows enter leader space
		// -------------------------------
		private var _allowStartWithSpace:Boolean = false;

		public function get allowStartWithSpace():Boolean
		{
			return _allowStartWithSpace;
		}

		public function set allowStartWithSpace(value:Boolean):void
		{
			_allowStartWithSpace = value;
		}


		// -------------------------------
		//   Allows enter more that one spaces between words
		// -------------------------------
		private var _allowMoreThanOneSpace:Boolean = false;

		public function get allowMoreThanOneSpace():Boolean
		{
			return _allowMoreThanOneSpace;
		}

		public function set allowMoreThanOneSpace(value:Boolean):void
		{
			_allowMoreThanOneSpace = value;
		}



		// -------------------------------
		//   Enabled
		// -------------------------------
		override public function set enabled(value:Boolean):void
		{
			_enabledChanged = true;
			super.enabled = value;
		}

		override public function get enabled():Boolean
		{
			return super.enabled;
		}



	}
}
