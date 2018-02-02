package kitaec.controls.comboboxes.autoComplete.renderers {

import kitaec.controls.comboboxes.autoComplete.AutoCompleteComboBox;

import mx.core.IDataRenderer;
	
	import spark.components.IItemRenderer;
	
	public interface IAutoCompleteRenderer extends IDataRenderer, IItemRenderer {
		
		function get autoComplete():AutoCompleteComboBox
		function set autoComplete(value:AutoCompleteComboBox):void
		
		/**
		 * This is a reference to the text that the user typed into the AutoCompleteComboBox.
		 * The typeAheadText is used for filtering the dataProvider.
		 * You'll want to reference this value to perform highlighting in your renderer.
		 */
		function get typeAheadText():String
		
		function set typeAheadText(value:String):void
	
	}
}