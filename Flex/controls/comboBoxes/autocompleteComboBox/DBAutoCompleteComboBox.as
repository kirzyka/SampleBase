package com.controls.comboBoxes.autocompleteComboBox
{

	import com.adobe.utils.StringUtil;
	import com.controls.Alerter;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.ICollectionView;
	import mx.collections.ListCollectionView;
	import mx.core.mx_internal;

	use namespace mx_internal;

	[Event(name="onDataReceived", type="flash.events.Event")]
	public class DBAutoCompleteComboBox extends AutoCompleteComboBox
	{
		
		public static const ON_DATA_RECEIVED:String = "onDataReceived";
		
		private var _storeSelectedItem:* = undefined;
		private var _userRequestComplete:Boolean = false;
		
		[Bindable]
		public var valueForSet:*;

		public function DBAutoCompleteComboBox()
		{
			super();
			this.dataProvider = new ListCollectionView(new ArrayList());
		}


		override protected function initializationComplete():void
		{
			super.initializationComplete();
			_inputTextChanged = false;
		}

		override protected function beforeCommitProperties():void
		{

			if (_dataProviderChanged)
			{
				_dataProviderChanged = false;
				_matchTypeChanged = false;
				
			}
			
			if (_inputTextChanged)
			{
				_inputTextChanged = false;
				_filterText = this.textInput.text;
				_storeSelectedItem = this.selectedItem;
				fillInputVO();
				this.dataProvider = null;//.removeAll();
				internalCallRequest();
			}
		}


		protected function fillInputVO():void
		{
			if (searchField && StringUtil.trim(searchField) != "")
			{
				this.inputVO[searchField] = _filterText;
			}
		}

	
		
		public function callRequest():void
		{
			_userRequestComplete = false;
			internalCallRequest();
		}

		private function internalCallRequest():void
		{
			command(inputVO, onResult, onFault);
		}

		protected function onResult(result:ArrayCollection):void
		{
			
			this.dataProvider = result;
			//_pendingSelectedItem = _storeSelectedItem;
			//if ()
			
/*			for (var i:int =0; i<dataProvider.length; i++){
				if (dataProvider.getItemAt(i)[this.valueField] == _storeSelectedItem[this.valueField]){
					this.selectedItem = dataProvider.getItemAt(i);
				}
			}
			//dataProvider.getItemIndex(_pendingSelectedItem)
*/			
		
			
			if (defaultValue && !_userRequestComplete)
			{
				selectedValue = defaultValue;
			}else{
				if (_storeSelectedItem){
					_pendingSelectedItem = findSelectedItemForValue(_storeSelectedItem[this.valueField]);
				}
			}
			_userRequestComplete = true;
			this.dispatchEvent(new Event(ON_DATA_RECEIVED));
		}


		public static function onFault(event:Event):void
		{
			Alerter.showException(event);
		}



		// -------------------------------
		//  Called service command
		// -------------------------------
		private var _command:Function = null;

		public function get command():Function
		{
			return _command;
		}

		public function set command(value:Function):void
		{
			_command = value;
		}



		// -------------------------------
		//  Input Value Object
		// -------------------------------
		private var _inputVO:Object = null;

		public function get inputVO():Object
		{
			return _inputVO;
		}

		public function set inputVO(value:Object):void
		{
			_inputVO = value;
		}


		// -------------------------------
		//   Value Field
		// -------------------------------
		private var _searchField:String;

		public function get searchField():String
		{
			return _searchField;
		}


		public function set searchField(value:String):void
		{
			_searchField = value;
			invalidateProperties();
		}


		// -------------------------------
		//   Value Field
		// -------------------------------
		private var _defaultValue:Object = null;

		public function get defaultValue():Object
		{
			return _defaultValue;
		}

		public function set defaultValue(value:Object):void
		{
			_defaultValue = value;
		}



	}
}
