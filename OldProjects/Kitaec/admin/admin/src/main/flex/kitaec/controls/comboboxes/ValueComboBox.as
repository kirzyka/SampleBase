package kitaec.controls.comboboxes {
	
	import flash.events.FocusEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.mx_internal;
	
	import spark.components.ComboBox;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	use namespace mx_internal;
	
	public class ValueComboBox extends ComboBox {
		
		public static const DEFAULT_LABEL_FIELD:String = "label";
		public static const DEFAULT_VALUE_FIELD:String = "value";
		
		private var _selectedValue:String;
		private var selectedValueChanged:Boolean;
		private var dataProviderChanged:Boolean;
		private var _editable:Boolean = true;
		
		public var valueField:String;
		
		public function ValueComboBox() {
			labelField = DEFAULT_LABEL_FIELD;
			valueField = DEFAULT_VALUE_FIELD;
			itemMatchingFunction = findMatchingItems;
			labelToItemFunction = labelToItem;
			dataProvider = new ArrayCollection();
		}
		
		public function get editable():Boolean {
			return _editable;
		}
		
		public function set editable(value:Boolean):void {
			if (_editable != value) {
				_editable = value;
				editableHandler();
			}
		}
		
		
		override protected function createChildren():void {
			super.createChildren();
			textInput.maxChars = 200;
			editableHandler();
		}
		
		protected function editableHandler():void {
			if (textInput) {
				textInput.editable = editable;
			}
		}
		
		public function get selectedValue():String {
			return _selectedValue;
		}
		
		public function set selectedValue(value:String):void {
			if (value != _selectedValue) {
				_selectedValue = value;
				selectedValueChanged = true;
				invalidateProperties();
			}
		}
		
		override protected function commitProperties():void {

			if (selectedValueChanged) {
				selectedValueChanged = false;
				findSelectedItem();
			}
			
			if (dataProviderChanged) {
				dataProviderChanged = false;
				findSelectedItem();
			}
			
			if(!selectedValueChanged && !dataProviderChanged && selectedValue && !selectedItem){
				findSelectedItem();
			}

			super.commitProperties();
		
		}
		
		protected function findSelectedItem():void {
			if (dataProvider && dataProvider.length > 0 && selectedValue) {
				for each (var item:Object in dataProvider) {
					if (item[valueField] == _selectedValue) {
						selectedItem = null;
						selectedItem = item;
						return;
					}
				}
			}
			selectedIndex = -1;
		}
		
		override public function set dataProvider(value:IList):void {
			selectedIndex = -1;
			super.dataProvider = value;
			dataProviderChanged = true;
			invalidateProperties();
		}
		
		override protected function itemSelected(index:int, selected:Boolean):void {
			super.itemSelected(index, selected);
			_selectedValue = selectedItem ? selectedItem[valueField] : null;
		}
		
		private function findMatchingItems(comboBox:ComboBox, input:String):Vector.<int> {
			var retVector:Vector.<int> = new Vector.<int>;
			return retVector;
		}
		
		private function labelToItem(label:String):Object {
			var value:Object;
			if (dataProvider && dataProvider.length > 0 && selectedValue) {
				for each (var item:Object in dataProvider) {
					if (item[labelField] == label) {
						value = item;
						break;
					}
				}
			}
			
			return value;
		}
		
		override protected function focusOutHandler(event:FocusEvent):void {
			super.focusOutHandler(event);
			if (!selectedValue) {
				textInput.text = "";
				dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
			}
		}
		
		override protected function textInput_changeHandler(event:TextOperationEvent):void {
			if (textInput.text == null || textInput.text == "") {
				super.textInput_changeHandler(event);
				selectedValue = null;
			}
		}
	}
}
