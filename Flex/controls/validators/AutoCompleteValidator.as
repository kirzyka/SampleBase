package com.controls.validators
{

	import com.controls.comboBoxes.autocompleteComboBox.AutoCompleteComboBox;
	
	import flash.utils.getDefinitionByName;
	
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	import mx.validators.Validator;

	public class AutoCompleteValidator extends Validator
	{
		public function AutoCompleteValidator()
		{
			super();
			super.property = "selectedValue";
		}

		override public function set listener(value:Object):void
		{
			throw new Error("Dont set listener value");
		}


		override public function set source(value:Object):void
		{
			if (value != null)
			{
				if ((value as AutoCompleteComboBox) == null)
				{
					throw new Error("Source must be instace of AutoCompleteComboBox");
				}
				(value as AutoCompleteComboBox).addEventListener(FlexEvent.CREATION_COMPLETE,
																 evCreationComplete);
			}
			super.source = value;
		}


		private function evCreationComplete(event:FlexEvent):void
		{
			super.listener = (this.source as AutoCompleteComboBox).textInput;
		}

	}
}
